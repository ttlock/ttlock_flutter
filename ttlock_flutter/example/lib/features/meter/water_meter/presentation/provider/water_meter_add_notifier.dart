import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_list_notifier.dart';

part 'water_meter_add_notifier.g.dart';

@Riverpod()
class WaterMeterAddNotifier extends _$WaterMeterAddNotifier {
  StreamSubscription<TTMeterScanModel>? _scanSub;
  var _disposed = false;

  /// 表单草稿：表单在扫描之前填写，选中设备时才用于 init。
  ///
  /// 名称不进草稿（需求 1 去掉了名称输入，改用扫描到的设备名）；
  /// `price` 仅预付费有意义 —— [beginAdd] 已按模式归一化。
  ({MeterPayMode payMode, double price})? _draft;

  @override
  Future<WaterMeterAddState> build() async {
    _disposed = false;
    ref.onDispose(_cleanup);
    return const WaterMeterAddState();
  }

  WaterMeterAddStep get _step =>
      state.value?.step ?? const WaterMeterAddStep.form();

  /// 表单提交：暂存（计费模式 + 单价）→ 开始扫描。
  ///
  /// [price] 仅预付费由用户填写；计能模式一律归一化为 `0`（该模式没有单价
  /// 概念，表单也不显示单价输入）。
  Future<void> beginAdd({
    required MeterPayMode payMode,
    required double price,
  }) async {
    _draft = (
      payMode: payMode,
      price: payMode == MeterPayMode.prepaid ? price : 0,
    );
    await startScan();
  }

  /// 开始蓝牙扫描水表（按 mac 去重）。
  Future<void> startScan() async {
    if (_disposed) return;
    await _stopSubs();
    _setStep(const WaterMeterAddStep.scanning());
    _scanSub =
        gateBleStream(
          () => TTLock.waterMeter.accessoryWaterMeterStartScan(),
        ).listen(
          (s) {
            final cur = _step;
            final devices = cur is WaterMeterAddStepScanning
                ? Map.of(cur.devices)
                : <String, TTMeterScanModel>{};
            devices[s.mac] = s;
            _setStep(WaterMeterAddStep.scanning(devices: devices));
          },
          onError: (Object e, StackTrace st) =>
              _fail(ExceptionUtils.extractAppException(e, st)),
        );
  }

  /// 选中设备 → setClientParam + connect → 进入等待用户确认的步骤。
  ///
  /// 弹窗由 UI 发起（类型化路由），确认走 [confirmConnected]、取消走
  /// [cancelConnection]。
  Future<void> connect(TTMeterScanModel scan) async {
    if (_disposed || _step is! WaterMeterAddStepScanning) return;
    await _stopSubs();
    _setStep(WaterMeterAddStep.connecting(scan: scan));
    final r = await ref
        .read(waterMeterDomainProvider.notifier)
        .connectMeter(scan: scan)
        .run();
    if (_disposed) return;
    r.fold(
      _fail,
      (_) => _setStep(WaterMeterAddStep.confirmConnection(scan: scan)),
    );
  }

  /// 用户在弹窗点「确认」→ init 入网 + Cat.1 判定。
  ///
  /// 名称一律用 `scan.name`（表单已无名称输入）；`price` 取表单草稿
  /// （预付费必填、计能模式归一化为 0）。
  Future<void> confirmConnected() async {
    if (_disposed) return;
    final s = _step;
    if (s is! WaterMeterAddStepConfirmConnection) return;
    final draft = _draft;
    if (draft == null) {
      // 理论不可达：待确认步骤只能经由表单（beginAdd）后的扫描进入。
      _fail(AppException.business(code: -34, message: 'meter_draft_missing'));
      return;
    }
    _setStep(WaterMeterAddStep.submitting(scan: s.scan));
    final r = await ref
        .read(waterMeterDomainProvider.notifier)
        .addViaBle(
          scan: s.scan,
          name: s.scan.name,
          payMode: draft.payMode,
          price: draft.price,
        )
        .run();
    if (_disposed) return;
    r.fold(_fail, (outcome) {
      _setStep(
        WaterMeterAddStep.success(
          scan: s.scan,
          meterId: outcome.meterId,
          isCatOne: outcome.isCatOne,
          needsApn: outcome.needsApn,
        ),
      );
    });
  }

  /// 用户在弹窗取消（或直接关闭）→ 回到扫描步骤继续挑设备；草稿保留。
  Future<void> cancelConnection() async {
    if (_disposed) return;
    if (_step is! WaterMeterAddStepConfirmConnection) return;
    await startScan();
  }

  /// 失败后重试：回扫描重新开扫。
  ///
  /// 表尚未注册，重扫是唯一有意义的重试 —— spec 迁移表里「已拿到 meterId →
  /// 回 success」那条边在 §6.5 的「configure 失败也按成功结束」之下不可达，
  /// 故不实现（见计划「与 spec 的偏差清单」）。
  Future<void> restart() => startScan();

  /// 成功页「完成」：改名（非必填）→ Cat.1 时配服务器 → done。
  ///
  /// 改名失败**不阻断** `configureCatOne`（spec §6.5），只经一次性通道提示。
  /// [apn] 仅 `needsApn` 为真时非空。
  Future<void> finishSuccess({required String name, String? apn}) async {
    if (_disposed) return;
    final s = _step;
    if (s is! WaterMeterAddStepSuccess) return;

    final trimmed = name.trim();
    if (trimmed.isNotEmpty) {
      final r = await ref
          .read(waterMeterDomainProvider.notifier)
          .rename(s.meterId, trimmed)
          .run();
      if (_disposed) return;
      r.fold(
        (err) => ref.read(waterMeterAddErrorProvider.notifier).setError(err),
        (_) {},
      );
    }
    if (!s.isCatOne) {
      _done(s.meterId);
      return;
    }
    // 输入边界校验：空白 APN 一律当作「没填」，不把空白串写进设备。
    final trimmedApn = apn?.trim();
    await _configure(
      scan: s.scan,
      meterId: s.meterId,
      apn: (trimmedApn == null || trimmedApn.isEmpty) ? null : trimmedApn,
    );
  }

  /// 成功页的「返回」：结束流程且视为添加成功，但不改名、不配 4G。
  ///
  /// spec §6.5 行为 1 —— `init` 成功时表已在云端注册，往回退到扫描会留下
  /// 一个已注册却没走完的残局，故成功页不提供「回扫描」。
  void skipSuccess() {
    if (_disposed) return;
    final s = _step;
    if (s is! WaterMeterAddStepSuccess) return;
    _done(s.meterId);
  }

  /// Cat.1（4G）：下发 APN（仅海外）+ 服务器端点。
  ///
  /// **成败都落到 `done`** —— 失败视为添加成功 + 提示去「4G 网络」页重试
  /// （spec §6.5、§9 风险 10）。
  Future<void> _configure({
    required TTMeterScanModel scan,
    required int meterId,
    String? apn,
  }) async {
    _setStep(WaterMeterAddStep.configuring(scan: scan, meterId: meterId));
    final r = await ref
        .read(waterMeterDomainProvider.notifier)
        .configureCatOne(meterId: meterId, mac: scan.mac, apn: apn)
        .run();
    if (_disposed) return;
    r.fold((_) => _done(meterId, catOneFailed: true), (_) => _done(meterId));
  }

  void _done(int meterId, {bool catOneFailed = false}) {
    _setStep(
      WaterMeterAddStep.done(meterId: meterId, catOneFailed: catOneFailed),
    );
    ref.invalidate(waterMeterListProvider);
  }

  void _setStep(WaterMeterAddStep step) {
    if (_disposed) return;
    state = AsyncValue.data(
      (state.value ?? const WaterMeterAddState()).copyWith(step: step),
    );
  }

  void _fail(AppException error) {
    if (_disposed) return;
    _setStep(WaterMeterAddStep.failure(error: error));
  }

  Future<void> _stopSubs() async {
    await _scanSub?.cancel();
    _scanSub = null;
  }

  void _cleanup() {
    _disposed = true;
    unawaited(_scanSub?.cancel());
    _scanSub = null;
  }
}

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。
@riverpod
class WaterMeterAddError extends _$WaterMeterAddError {
  @override
  AppException? build() => null;

  void clear() => state = null;
  void setError(AppException err) => state = err;
}
