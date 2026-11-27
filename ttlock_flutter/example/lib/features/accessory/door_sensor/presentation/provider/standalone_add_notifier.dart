import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_add_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_notifier.dart';

part 'standalone_add_notifier.g.dart';

@Riverpod()
class StandaloneDoorSensorAddNotifier
    extends _$StandaloneDoorSensorAddNotifier {
  StreamSubscription<TTStandaloneDoorSensorScanModel>? _scanSub;
  TTStandaloneDoorSensorScanModel? _pickedScan;
  StandaloneDoorSensorAddStep _step =
      const StandaloneDoorSensorAddStep.scanning();
  var _disposed = false;

  @override
  Future<StandaloneDoorSensorAddState> build() async {
    _disposed = false;
    _pickedScan = null;
    _step = const StandaloneDoorSensorAddStep.scanning();
    ref.onDispose(_cleanup);
    return const StandaloneDoorSensorAddState();
  }

  /// 开始蓝牙扫描（按 mac 去重、rssi 仅用于 UI 排序显示）。
  Future<void> startScan() async {
    if (_disposed) return;
    await _scanSub?.cancel();
    _scanSub = null;
    _pickedScan = null;
    _setStep(const StandaloneDoorSensorAddStep.scanning());
    _scanSub =
        gateBleStream(
          () => TTLock.doorSensor.accessoryStandaloneDoorSensorStartScan(),
        ).listen(
          (s) {
            final cur = _step;
            final devices = cur is StandaloneAddStepScanning
                ? Map.of(cur.devices)
                : <String, TTStandaloneDoorSensorScanModel>{};
            devices[s.mac] = s;
            _setStep(StandaloneDoorSensorAddStep.scanning(devices: devices));
          },
          onError: (Object e, StackTrace st) =>
              _fail(ExceptionUtils.extractAppException(e, st)),
        );
  }

  /// 选中设备 → 取消扫描 → 进入凭据表单。存 `_pickedScan`（而非从 step.devices 查）
  /// 保证 `submit` 拿到用户选中的同一对象。
  Future<void> pick(TTStandaloneDoorSensorScanModel scan) async {
    if (_disposed || _step is! StandaloneAddStepScanning) return;
    await _scanSub?.cancel();
    _scanSub = null;
    _pickedScan = scan;
    _setStep(StandaloneDoorSensorAddStep.credential(mac: scan.mac));
  }

  /// 凭据提交 → Domain `addViaBle`（BLE init + 云 add）。
  Future<void> submit({
    required String name,
    required String wifiName,
    required String wifiPassword,
  }) async {
    final s = _step;
    final scan = _pickedScan;
    if (s is! StandaloneAddStepCredential || scan == null) return;
    _setStep(StandaloneDoorSensorAddStep.initializing(mac: scan.mac));
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .addViaBle(
          scan: scan,
          name: name,
          wifiName: wifiName,
          wifiPassword: wifiPassword,
        )
        .run();
    if (_disposed) return;
    r.fold((err) => _fail(err), (id) {
      // 成功后 invalidate 列表：列表 Content 用 AutomaticKeepAliveClientMixin 保活，
      // provider 不被 dispose，需主动刷新才能出现新增设备（与 gateway_add 成功语义一致）。
      ref.invalidate(standaloneDoorSensorListProvider);
      _setStep(StandaloneDoorSensorAddStep.done(doorSensorId: id));
    });
  }

  /// 失败后重试：回到扫描步骤重新开扫。
  Future<void> restart() => startScan();

  void _setStep(StandaloneDoorSensorAddStep step) {
    if (_disposed) return;
    _step = step;
    state = AsyncValue.data(StandaloneDoorSensorAddState(step: step));
  }

  void _fail(AppException error) {
    if (!_disposed) _setStep(StandaloneDoorSensorAddStep.failure(error: error));
  }

  void _cleanup() {
    _disposed = true;
    _scanSub?.cancel();
    _scanSub = null;
  }
}
