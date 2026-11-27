import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/util/md5_utils.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/gateway_type_capabilities.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_list_notifier.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'gateway_add_notifier.g.dart';

@Riverpod()
class GatewayAddNotifier extends _$GatewayAddNotifier {
  GatewayAddNotifier({
    this.pollInterval = const Duration(seconds: 5),
    this.maxPolls = 36,
  });

  /// 云端注册确认轮询间隔（测试注入 Duration.zero）。
  final Duration pollInterval;

  /// 3 分钟窗口（36 × 5s）。
  final int maxPolls;

  /// 供 UI 复用（避免硬编码）：连接失败 / 云端未注册 / uid 缺失。
  static const connectFailedCode = -30;
  static const notConfirmedCode = -31;
  static const uidMissingCode = -33;

  StreamSubscription<TTGatewayScanModel>? _scanSub;
  StreamSubscription<GatewayWifi>? _wifiSub;
  Timer? _pollTimer;
  Completer<void>? _pollWait;
  String? _selectedMac;
  TTGatewayType? _pickedType;
  GatewayAddStep _step = const GatewayAddStep.scanning();
  var _disposed = false;

  @override
  Future<GatewayAddState> build() async {
    _disposed = false;
    _step = const GatewayAddStep.scanning();
    ref.onDispose(_cleanup);
    return const GatewayAddState();
  }

  GatewayAddState get _current => state.value ?? const GatewayAddState();

  /// 开始蓝牙扫描（dedupe by mac、跳过 DFU 设备）。
  Future<void> startScan() async {
    if (_disposed) return;
    await _stopSubs();
    _selectedMac = null;
    _pickedType = null;
    state = AsyncValue.data(
      _current.copyWith(gatewayType: null, wifiList: const [], wifiScanning: false),
    );
    _setStep(const GatewayAddStep.scanning());
    _scanSub = gateBleStream(() => TTLock.gateway.gatewayStartScan()).listen(
      (s) {
        if (s.isDfuMode) return;
        final cur = _step;
        final devices = cur is GatewayAddStepScanning
            ? Map.of(cur.devices)
            : <String, TTGatewayScanModel>{};
        devices[s.gatewayMac] = s;
        _setStep(GatewayAddStep.scanning(devices: devices));
      },
      onError: (Object e, StackTrace st) =>
          _fail(ExceptionUtils.extractAppException(e, st)),
    );
  }

  /// 选中设备 → 取消扫描 → connect →
  /// Wi-Fi 型进入 wifi 扫描；蜂窝型（G3/G4）直接进凭据表单。
  Future<void> pick(TTGatewayScanModel scan) async {
    if (_disposed || _step is! GatewayAddStepScanning) return;
    await _stopSubs();
    _selectedMac = scan.gatewayMac;
    _pickedType = scan.type;
    state = AsyncValue.data(_current.copyWith(gatewayType: scan.type));
    _setStep(GatewayAddStep.connecting(mac: scan.gatewayMac));
    final TTGatewayConnectStatus status;
    try {
      status = await runBle(() => TTLock.gateway.connect(scan.gatewayMac));
    } on Object catch (e, st) {
      _fail(ExceptionUtils.extractAppException(e, st));
      return;
    }
    if (_disposed) return;
    if (status != TTGatewayConnectStatus.success) {
      _fail(
        AppException.business(
          code: connectFailedCode,
          message: 'gateway_connect_failed',
        ),
      );
      return;
    }
    if (gatewayNeedsWifi(scan.type)) {
      _startWifiScan(scan.gatewayMac);
      _setStep(GatewayAddStep.wifi(mac: scan.gatewayMac));
    } else {
      _setStep(GatewayAddStep.credential(mac: scan.gatewayMac));
    }
  }

  /// 用户选定 WiFi → 凭据表单。
  Future<void> selectWifi(GatewayWifi wifi) async {
    final s = _step;
    if (s is! GatewayAddStepWifi) return;
    await _wifiSub?.cancel();
    _wifiSub = null;
    _step = GatewayAddStepCredential(mac: s.mac, wifi: wifi);
    state = AsyncValue.data(
      _current.copyWith(wifiScanning: false, step: _step),
    );
  }

  /// 凭据提交 → init（MD5 登录密码）→ disconnect → 轮询云端确认。
  /// [gatewayName] 由 UI 保证非空（必填，空则提交按钮置灰）。
  Future<void> submit({
    required String gatewayName,
    required String wifiPassword,
    required String loginPassword,
    bool useStaticIp = false,
    String? staticIp,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
    String? apn,
  }) async {
    if (_disposed) return;
    final s = _step;
    if (s is! GatewayAddStepCredential) return;

    // uid 门控：无有效 uid 禁止 init（设备会注册到无效账户且 confirm 永远查不到）。
    final uid = ref.read(userProvider)?.uid ?? 0;
    if (uid <= 0) {
      _fail(
        AppException.business(
          code: uidMissingCode,
          message: 'user_uid_missing',
        ),
      );
      return;
    }
    final type = _pickedType;
    if (type == null) {
      _fail(
        AppException.business(
          code: connectFailedCode,
          message: 'gateway_type_missing',
        ),
      );
      return;
    }

    // 端点来自当前站点（Task 1 表）；失败沿既有 _fail 路径中止。
    final epEither = await ref
        .read(appConfigDomainProvider.notifier)
        .endpointFor(DeviceServerKind.gateway)
        .run();
    if (_disposed) return;
    final ep = epEither.fold<DeviceServerEndpoint?>((err) {
      _fail(err);
      return null;
    }, (value) => value);
    if (ep == null) return;

    // 与 init 同源：空格裁掉后再下发，轮询确认时要用同一个值。
    final customName = gatewayName.trim();

    final needsWifi = gatewayNeedsWifi(type);
    final needsApn = gatewayNeedsApn(type);
    _setStep(GatewayAddStep.initializing(mac: s.mac, wifi: s.wifi));
    final GatewayDeviceInfo device;
    try {
      device = await runBle(
        () => TTLock.gateway.init(
          TTGatewayInitParams(
            type: type,
            ttlockUid: uid,
            gatewayName: customName,
            wifi: needsWifi ? s.wifi?.name : null,
            wifiPassword: needsWifi ? wifiPassword : null,
            // Task 0 结论：与登录同款 MD5。
            ttlockLoginPassword: md5Of(loginPassword),
            serverIp: ep.address,
            serverPort: ep.portString,
          ),
        ),
      );
    } on Object catch (e, st) {
      _fail(ExceptionUtils.extractAppException(e, st));
      return;
    }
    if (_disposed) return;

    // 可选静态 IP（G2/G3/G5/G6）/ APN（仅 G4）：须在仍连接时下发。
    if (gatewaySupportsStaticIp(type) &&
        useStaticIp &&
        staticIp != null &&
        staticIp.trim().isNotEmpty) {
      try {
        await runBle(
          () => TTLock.gateway.configIp(
            s.mac,
            TTIpSetting(
              type: TTIpSettingType.staticIp.index,
              ipAddress: staticIp.trim(),
              subnetMask: subnetMask?.trim(),
              router: defaultGateway?.trim(),
              preferredDns: preferredDns?.trim(),
              alternateDns: alternateDns?.trim(),
            ),
          ),
        );
      } on Object catch (e, st) {
        _fail(ExceptionUtils.extractAppException(e, st));
        return;
      }
    }
    final trimmedApn = apn?.trim();
    if (needsApn && trimmedApn != null && trimmedApn.isNotEmpty) {
      try {
        await runBle(() => TTLock.gateway.configApn(s.mac, trimmedApn));
      } on Object catch (e, st) {
        _fail(ExceptionUtils.extractAppException(e, st));
        return;
      }
    }
    if (_disposed) return;

    // 断开为尽力而为：BLE 断开失败也不应把成功的 init 变成向导失败。
    try {
      await runBle(() => TTLock.gateway.disconnect(s.mac));
    } on Object catch (e, st) {
      log('disconnectGateway failed (gateway add)', error: e, stackTrace: st);
    }
    if (_disposed) return;

    _setStep(GatewayAddStep.confirming(networkMac: device.networkMac));
    // 文档：APP SDK 初始化网关时若未以 gatewayNetMac 作为网关名称，
    // isInitSuccess 的 gatewayNetMac 需传「添加网关时自定义的网关名称」。
    // 本向导始终用用户填写的名称，故这里传 customName（名称即 mac 时二者等价）。
    await _pollConfirm(customName);
  }

  /// 失败后重试：回到扫描步骤重新开扫。
  Future<void> restart() => startScan();

  /// 固定次数轮询：不看返回的错误类型，只以「取到 gatewayId」判定成功；
  /// 窗口内任何 Left（未注册 / 网络 / http / 其他业务）都继续下一轮，
  /// 走满 [maxPolls] 次仍无结果则以「未注册」收尾。
  ///
  /// [confirmKey] 为 isInitSuccess 的 `gatewayNetMac`：本向导传自定义网关名称。
  Future<void> _pollConfirm(String confirmKey) async {
    final domain = ref.read(gatewayDomainProvider.notifier);
    for (var polled = 0; polled < maxPolls; polled++) {
      final r = await domain.confirmInit(confirmKey).run();
      if (_disposed) return;
      // domain 仅在 gatewayId > 0 时返回 Right，故 Left 一律折成 0 继续轮询。
      final gatewayId = r.fold((_) => 0, (id) => id);
      if (gatewayId > 0) {
        _setStep(GatewayAddStep.done(gatewayId: gatewayId));
        ref.invalidate(gatewayListProvider);
        return;
      }
      await _waitForNextPoll();
      if (_disposed) return;
    }
    _fail(
      AppException.business(
        code: notConfirmedCode,
        message: 'gateway_init_not_confirmed',
      ),
    );
  }

  Future<void> _waitForNextPoll() async {
    final wait = Completer<void>();
    _pollWait = wait;
    _pollTimer = Timer(pollInterval, wait.complete);
    await wait.future;
  }

  void _startWifiScan(String mac) {
    state = AsyncValue.data(
      _current.copyWith(wifiList: const [], wifiScanning: true),
    );
    _wifiSub =
        gateBleStream(
              () => TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: mac),
            )
            .expand((TTWifiScanResult r) sync* {
              for (final w in r.wifiList) {
                final name = w.ssid ?? w.wifiName ?? w.name ?? '';
                if (name.isNotEmpty) yield (name: name, rssi: w.wifiRssi);
              }
            })
            .listen(
              (w) {
                final list = _current.wifiList;
                if (list.any((e) => e.name == w.name)) return;
                state = AsyncValue.data(
                  _current.copyWith(wifiList: [...list, w]),
                );
              },
              onError: (Object e, StackTrace st) =>
                  _fail(ExceptionUtils.extractAppException(e, st)),
              onDone: () => state = AsyncValue.data(
                _current.copyWith(wifiScanning: false),
              ),
            );
  }

  void _setStep(GatewayAddStep step) {
    if (_disposed) return;
    _step = step;
    state = AsyncValue.data(_current.copyWith(step: step));
  }

  void _fail(AppException error) {
    if (_disposed) return;
    _setStep(GatewayAddStep.failure(error: error));
  }

  Future<void> _stopSubs() async {
    await _scanSub?.cancel();
    _scanSub = null;
    await _wifiSub?.cancel();
    _wifiSub = null;
  }

  /// 资源清理：取消 Timer/订阅；connecting/initializing 时对已选 mac 兜底断开
  /// （在途 initGateway 无法中断，由其闭包自然收尾）。
  void _cleanup() {
    _disposed = true;
    unawaited(_scanSub?.cancel());
    unawaited(_wifiSub?.cancel());
    _scanSub = null;
    _wifiSub = null;
    _pollTimer?.cancel();
    _pollTimer = null;
    final wait = _pollWait;
    if (wait != null && !wait.isCompleted) wait.complete();

    final mac = _selectedMac;
    final step = _step;
    if (mac != null &&
        (step is GatewayAddStepConnecting ||
            step is GatewayAddStepInitializing)) {
      unawaited(runBle(() => TTLock.gateway.disconnect(mac)));
    }
  }
}
