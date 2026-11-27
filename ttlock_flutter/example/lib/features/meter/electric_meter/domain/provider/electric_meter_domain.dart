import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/repository/electric_meter_repository.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/repository/electric_meter_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_credentials.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_command.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_kind.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ops.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'electric_meter_domain.g.dart';

@Riverpod(keepAlive: true)
class ElectricMeterDomain extends _$ElectricMeterDomain {
  late final ElectricMeterRepositoryInterface _repo;
  late final AppConfigDomain _appConfig;

  @override
  void build() {
    _repo = ref.watch(electricMeterRepositoryProvider.notifier);
    _appConfig = ref.watch(appConfigDomainProvider.notifier);
  }

  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => _repo.list(
    pageNo: pageNo,
    pageSize: pageSize,
    groupId: groupId,
    searchStr: searchStr,
  );

  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      _repo.detail(meterId);

  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _repo.rename(meterId, name);

  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double kwh,
  }) => _repo.recharge(meterId, amount: amount, kwh: kwh);

  TaskEither<AppException, Unit> controlOnOff(
    int meterId, {
    required bool on,
  }) => _repo.controlOnOff(meterId, on: on);

  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  }) => _repo.updatePrice(meterId, price: price);

  TaskEither<AppException, Unit> updateMaxPower(
    int meterId, {
    required int maxPower,
  }) => _repo.updateMaxPower(meterId, maxPower: maxPower);

  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _repo.listRecords(meterId, dateType: dateType, dateStr: dateStr);

  TaskEither<AppException, Unit> syncState(int meterId) =>
      _repo.syncState(meterId);

  /// 添加前段：配置蓝牙指令 url（本地 SDK setter，不走 BLE）+ 建立 BLE 连接。
  ///
  /// 连接成功后交给 UI 弹窗，由用户确认设备指示灯（红灯交替闪烁）再加网。
  /// 全程不断开，[addViaBle] 与 [configureCatOne] 复用这条连接。
  TaskEither<AppException, Unit> connectMeter({
    required TTMeterScanModel scan,
  }) => TaskEither.tryCatch(() async {
    final cfg = await _runOrThrow(_credentials());
    await runBle(
      () => TTLock.electricMeter.electricMeterSetClientParam(
        cfg.url,
        cfg.clientId,
        cfg.token,
      ),
    );
    await runBle(() => TTLock.electricMeter.electricMeterConnect(scan.mac));
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 添加后段（须已 [connectMeter]）：init（SDK 内联云注册）→ 取 id → 判 Cat.1。
  /// `init.electricMeterId > 0` 直用；否则回退云 `repo.add`。
  ///
  /// `needsApn` = Cat.1 且海外站点 —— 此时需用户补 APN 后再走 [configureCatOne]。
  TaskEither<AppException, ({int meterId, bool isCatOne, bool needsApn})>
  addViaBle({
    required TTMeterScanModel scan,
    required String name,
    required MeterPayMode payMode,
    required double price,
  }) => TaskEither.tryCatch(() async {
    final site = (await _runOrThrow(_appConfig.load())).site;
    final init = await runBle(
      () => TTLock.electricMeter.electricMeterInit(
        TTElectricMeterInitParam(
          mac: scan.mac,
          name: name,
          payMode: payMode == MeterPayMode.prepaid
              ? TTMeterPayMode.prepaid
              : TTMeterPayMode.postpaid,
          price: price,
        ),
      ),
    );
    final meterId = init.electricMeterId > 0
        ? init.electricMeterId
        : await _runOrThrow(_repo.add(mac: scan.mac, name: name));
    final isCatOne = await TTLock.electricMeter.electricMeterIsSupportFunction(
      init.featureValue,
      TTElectricMeterFeature.catOne,
    );
    return (
      meterId: meterId,
      isCatOne: isCatOne,
      needsApn: isCatOne && site == AppSite.overseas,
    );
  }, ExceptionUtils.extractAppException);

  /// Cat.1（4G）表：按站点端点 configServer → 回读模块网络信息 → 上传云端。
  ///
  /// [apn] 仅海外非空，须在 configServer 之前下发。
  /// 末尾 `configCatOneInfo` 上传失败**不阻断**添加：刚配完 server 时 4G 模块
  /// 常未上线，该信息只用于后续维护。
  TaskEither<AppException, Unit> configureCatOne({
    required int meterId,
    required String mac,
    String? apn,
  }) => TaskEither.tryCatch(() async {
    if (apn != null && apn.isNotEmpty) {
      await _runBleCommand(() => TTLock.electricMeter.electricMeterConfigApn(mac, apn));
    }
    final ep = await _runOrThrow(
      _appConfig.endpointFor(DeviceServerKind.electricMeter),
    );
    await _runBleCommand(
      () => TTLock.electricMeter.electricMeterConfigServer(
        mac,
        ep.address,
        ep.portString,
      ),
    );
    final info = await runBle(
      () => TTLock.electricMeter.electricMeterGetDeviceInfo(mac),
    );
    try {
      await _runOrThrow(
        _repo.configCatOneInfo(
          meterId,
          catOneNodeId: info.catOneNodeId,
          catOneCardNumber: info.catOneCardNumber,
          catOneOperator: info.catOneOperator,
          catOneImsi: info.catOneImsi,
          catOneRssi: info.catOneRssi,
          catOneApn: apn,
        ),
      );
    } on Object catch (e, st) {
      log('electricMeter configCatOneInfo failed', error: e, stackTrace: st);
    }
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 蓝牙指令 url（站点专用域名 `cnapi/euapi.ttlock.com`，**不是云 API 基址**）
  /// + 客户端凭证。凭证缺失 → business(-32)。
  // ---- 双通道设备操作：云优先、失败回退 BLE（spec §4.1）----

  MeterBleCredentialsResolver get _credResolver =>
      ref.read(meterBleCredentialsResolverProvider.notifier);

  Future<MeterBleCredentials> _bleCredentials() async =>
      _runOrThrow(_credResolver.resolve(MeterKind.electric));

  /// 已绑定表的 BLE 通道：重设凭证后执行 [action]。
  ///
  /// **不 connect / 不 disconnect** —— 连接只在绑定时需要（见 [connectMeter]）。
  Future<T> _runBleCommand<T>(Future<T> Function() action) async {
    final creds = await _bleCredentials();
    return runMeterBleCommand<T>(
      kind: MeterKind.electric,
      credentials: creds,
      action: () => runBle(action),
    );
  }

  /// 抄表裸动作 —— [readMeter] 与 [_opUnit] 的尾巴共用，避免 `_opUnit` 自递归。
  ///
  /// 云走 `syncState`（**网关抄表**，官方文档 `syncData.md` 标题即「抄表」），
  /// BLE 走 `readData`（SDK 自动上报，不另行调云）。
  Future<void> _readMeterRaw(ElectricMeterEntity meter) => runMeterOp<void>(
    online: meter.online,
    cloud: () => _runOrThrow(_repo.syncState(meter.electricMeterId)),
    ble: () => _runBleCommand(
      () => TTLock.electricMeter.electricMeterReadData(meter.mac),
    ),
  );

  /// 附带的抄表：失败**不阻断**已生效的指令，只记日志。
  Future<void> _syncReadingBestEffort(ElectricMeterEntity meter) async {
    try {
      await _readMeterRaw(meter);
    } on Object catch (e, st) {
      log('electricMeter readMeter after op failed', error: e, stackTrace: st);
    }
  }

  /// 双通道下达模板：`runMeterOp` 决定走哪条通道，回退与错误传播由它统一处理。
  ///
  /// 成功后**再附一次同通道抄表** —— 下发指令不会带回表的最新读数（走网关的
  /// 云指令同样不会），服务端要拿到同步后的数据必须另发一次抄表。
  TaskEither<AppException, Unit> _opUnit(
    ElectricMeterEntity meter, {
    required Future<void> Function() cloud,
    required Future<void> Function() ble,
  }) => TaskEither.tryCatch(() async {
    await runMeterOp<void>(
      online: meter.online,
      cloud: cloud,
      ble: () => _runBleCommand(ble),
    );
    await _syncReadingBestEffort(meter);
    return unit;
  }, ExceptionUtils.extractAppException);

  TTMeterPayMode _ttPayMode(MeterPayMode mode) => mode == MeterPayMode.prepaid
      ? TTMeterPayMode.prepaid
      : TTMeterPayMode.postpaid;

  /// 通断电。
  TaskEither<AppException, Unit> setPowerOnOff(
    ElectricMeterEntity meter, {
    required bool on,
  }) => _opUnit(
    meter,
    cloud: () => _runOrThrow(_repo.controlOnOff(meter.electricMeterId, on: on)),
    ble: () => TTLock.electricMeter.electricMeterSetPowerOnOff(meter.mac, on),
  );

  /// 清零（清除剩余电量）。**仅预付费模式应调用**，门控由调用方负责（spec §6.2）。
  TaskEither<AppException, Unit> clearRemainder(ElectricMeterEntity meter) =>
      _opUnit(
        meter,
        cloud: () =>
            _runOrThrow(_repo.clear(electricMeterId: meter.electricMeterId)),
        ble: () =>
            TTLock.electricMeter.electricMeterClearRemainderKwh(meter.mac),
      );

  /// 计费模式切换。云走 `updatePayMode`，BLE 走 `setPayMode`。
  TaskEither<AppException, Unit> setPayMode(
    ElectricMeterEntity meter, {
    required MeterPayMode mode,
    double? price,
  }) => _opUnit(
    meter,
    cloud: () => _runOrThrow(
      _repo.updatePayMode(
        electricMeterId: meter.electricMeterId,
        payMode: mode.value,
        price: price,
      ),
    ),
    ble: () => TTLock.electricMeter.electricMeterSetPayMode(
      meter.mac,
      _ttPayMode(mode),
      price ?? 0,
    ),
  );

  /// 单独调整电价（不切模式）。BLE 无独立改价方法，用 `setPayMode` 带当前模式表达。
  ///
  /// 命名避开既有的纯云端 `updatePrice(int, {price})` —— Dart 无重载，
  /// 两者首参类型不同会冲突。
  TaskEither<AppException, Unit> setPrice(
    ElectricMeterEntity meter, {
    required double price,
  }) => _opUnit(
    meter,
    cloud: () =>
        _runOrThrow(_repo.updatePrice(meter.electricMeterId, price: price)),
    ble: () => TTLock.electricMeter.electricMeterSetPayMode(
      meter.mac,
      _ttPayMode(meter.payMode),
      price,
    ),
  );

  /// 充值。云走 `recharge`，BLE 走 `charge`（SDK 自动上报，不另行调云）。
  ///
  /// 命名避开既有的纯云端 `recharge(int, {amount, kwh})` —— Dart 无重载。
  TaskEither<AppException, Unit> rechargeMeter(
    ElectricMeterEntity meter, {
    required double amount,
    required double kwh,
  }) => _opUnit(
    meter,
    cloud: () => _runOrThrow(
      _repo.recharge(meter.electricMeterId, amount: amount, kwh: kwh),
    ),
    ble: () => TTLock.electricMeter.electricMeterCharge(meter.mac, amount, kwh),
  );

  /// 最大功率：**云收 int、BLE 收 double**，此处统一收 int 并显式转换。
  TaskEither<AppException, Unit> setMaxPower(
    ElectricMeterEntity meter, {
    required int maxPower,
  }) => _opUnit(
    meter,
    cloud: () => _runOrThrow(
      _repo.updateMaxPower(meter.electricMeterId, maxPower: maxPower),
    ),
    ble: () => TTLock.electricMeter.electricMeterSetMaxPower(
      meter.mac,
      maxPower.toDouble(),
    ),
  );

  /// 抄表。云走 `syncState`，BLE 走 `readData`（SDK 自动上报，不另行调云）。
  ///
  /// **不经 [_opUnit]** —— 否则抄表之后还要再抄一次。
  TaskEither<AppException, Unit> readMeter(ElectricMeterEntity meter) =>
      TaskEither.tryCatch(() async {
        await _readMeterRaw(meter);
        return unit;
      }, ExceptionUtils.extractAppException);

  /// 设置剩余用量（纯 BLE，无对应云端写接口）。
  TaskEither<AppException, Unit> setRemainder(
    ElectricMeterEntity meter, {
    required double remainderKwh,
  }) => TaskEither.tryCatch(() async {
    if (meter.mac.isEmpty) {
      throw AppException.business(code: -33, message: 'meter_mac_missing');
    }
    await _runBleCommand(
      () => TTLock.electricMeter.electricMeterSetRemainderKwh(meter.mac, remainderKwh),
    );
    await _syncReadingBestEffort(meter);
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 恢复出厂（纯 BLE）。
  TaskEither<AppException, Unit> resetMeter(ElectricMeterEntity meter) =>
      TaskEither.tryCatch(() async {
        if (meter.mac.isEmpty) {
          throw AppException.business(code: -33, message: 'meter_mac_missing');
        }
        await _runBleCommand(
          () => TTLock.electricMeter.electricMeterReset(meter.mac),
        );
        return unit;
      }, ExceptionUtils.extractAppException);

  /// BLE 读取特征值。
  TaskEither<AppException, String> readFeatureValue(ElectricMeterEntity meter) =>
      TaskEither.tryCatch(() async {
        if (meter.mac.isEmpty) {
          throw AppException.business(code: -33, message: 'meter_mac_missing');
        }
        return _runBleCommand(
          () => TTLock.electricMeter.electricMeterGetFeatureValue(meter.mac),
        );
      }, ExceptionUtils.extractAppException);


  /// 删除电表：**纯 BLE**（SDK 删除后自行通知服务器），不调云端接口。
  ///
  /// 电表云端本就没有 delete 端点（`electricMeter/admin/` 无该文档），
  /// 删除完全由 SDK 完成。mac 为空 → Left（BLE 删除需要 mac）。
  TaskEither<AppException, Unit> delete({required ElectricMeterEntity meter}) =>
      TaskEither.tryCatch(() async {
        if (meter.mac.isEmpty) {
          throw AppException.business(code: -33, message: 'meter_mac_missing');
        }
        await _runBleCommand(() => TTLock.electricMeter.electricMeterDelete(meter.mac));
        return unit;
      }, ExceptionUtils.extractAppException);

  /// 从设置页发起的 4G 配置：重设 BLE 凭证后执行完整链路。
  ///
  /// 添加流程里连接是长活的，[configureCatOne] 借它即可；设置页这条没有既有
  /// 连接，而设置页操作的表**已绑定**，故只需重设凭证、不必建连接（spec §6.3）。
  ///
  /// [apn] 仅海外站点非空。
  TaskEither<AppException, Unit> configureCatOneFromSettings(
    ElectricMeterEntity meter, {
    String? apn,
  }) => TaskEither.tryCatch(() async {
    await _runOrThrow(
        configureCatOne(
          meterId: meter.electricMeterId,
          mac: meter.mac,
          apn: apn,
        ),
      );
    return unit;
  }, ExceptionUtils.extractAppException);

  // ---- 读取类：不是控制指令，不走通道判定（spec §4.2）----

  TaskEither<AppException, PaginatedOperationRecords> listOperationRecords(
    int meterId, {
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _repo.listOperationRecords(
    electricMeterId: meterId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  );

  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo(int meterId) =>
      _repo.catOneInfo(electricMeterId: meterId);

  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo(int meterId) =>
      _repo.firmwareInfo(electricMeterId: meterId);

  /// `detail.featureValue` 是否支持 Cat.1（4G）。
  ///
  /// 原生侧是**纯本地位运算、不碰 BLE**（spec §5.3），故不必走 BLE 通道。
  /// 特征值来源按阶段分工：添加时用 BLE `init` 的返回值（见 [addViaBle]），
  /// 添加完成后**一律用服务端 `detail.featureValue`**。
  Future<bool> isCatOne(String featureValue) =>
      TTLock.electricMeter.electricMeterIsSupportFunction(
        featureValue,
        TTElectricMeterFeature.catOne,
      );

  /// 当前站点是否为海外 —— 决定 4G 配置是否需先下发 APN（spec §6.3）。
  ///
  /// 与 [addViaBle] 里的 `needsApn` 同源，只是那条路径在添加时判定，
  /// 这条供设置页 / 4G 网络页在添加完成后判定。
  TaskEither<AppException, bool> catOneNeedsApn() => TaskEither.tryCatch(
    () async => (await _runOrThrow(_appConfig.load())).site == AppSite.overseas,
    ExceptionUtils.extractAppException,
  );

  TaskEither<AppException, ({String url, String clientId, String token})>
  _credentials() => TaskEither.tryCatch(() async {
    final config = await _runOrThrow(_appConfig.load());
    final token = ref.read(userProvider)?.accessToken;
    if (config.clientId.isEmpty || token == null || token.isEmpty) {
      throw AppException.business(code: -32, message: 'meter_config_missing');
    }
    return (
      url: resolveMeterCommandUrl(config.site, 'electricMeter'),
      clientId: config.clientId,
      token: token,
    );
  }, ExceptionUtils.extractAppException);

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold(
      (err) => throw err,
      (value) => value,
    );
  }
}
