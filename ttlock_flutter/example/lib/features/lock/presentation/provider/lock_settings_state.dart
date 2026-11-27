import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'lock_settings_state.freezed.dart';

/// 云端仅有 currentTime 时，自动闭锁 sheet 的默认上下限（秒）。
const int kDefaultAutoLockMinTime = 0;
const int kDefaultAutoLockMaxTime = 900;

/// 设置页的能力位与初值探测结果。
///
/// [supportedFunctions]：provider 逐项 `supportFunction` 得到的受支持功能位集合，
/// UI 用它判断某设置项是否展示。各开关初值优先来自云端 detail；缺项/未知再 BLE。
/// [soundVolume]：1–5（与云端/Open API 一致）。
/// [openDirection]：云端 1 左开 / 2 右开；`null` = 未知。
@freezed
abstract class LockSettingsState with _$LockSettingsState {
  const LockSettingsState._();
  const factory LockSettingsState({
    LockEntity? lock,
    @Default(<TTLockFunction>{}) Set<TTLockFunction> supportedFunctions,
    @Default(false) bool soundOn,
    @Default(false) bool privacyLockOn,
    @Default(false) bool tamperAlertOn,
    @Default(false) bool resetButtonOn,
    @Default(false) bool remoteUnlockOn,
    @Default(false) bool doubleAuthOn,
    @Default(false) bool wifiPowerSavingOn,
    AutoLockingTime? autoLockingTime,
    /// 已绑定门磁；null = 未绑定（请求失败也按未添加处理）。
    DoorSensorEntity? doorSensor,
    @Default(3) int soundVolume,
    int? openDirection,
  }) = _LockSettingsState;
}
