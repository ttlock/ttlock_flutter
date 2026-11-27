import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/lift/data/repository/lift_repository.dart';
import 'package:ttlock_flutter_demo/features/lift/domain/repository/lift_repository_interface.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'lift_domain.g.dart';

/// 梯控编排：楼层激活（远程优先 + BLE 回退）、工作模式 / 关联楼层（BLE 单轨）。
///
/// [activateFloors] 返回值语义：
/// - [None]：云成功，或 BLE 回退但 lockData 未变/为空（无需保鲜）。
/// - [Some]：BLE 回退且带回新 lockData，交由 Notifier 调 `LockDomain.syncLockData` 保鲜。
///
/// [setWorkMode] / [setControlableFloors] 无云端接口，仅 BLE；`lockData` 空 → -21。
@Riverpod(keepAlive: true)
class LiftDomain extends _$LiftDomain {
  late final LiftRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(liftRepositoryProvider.notifier);
  }

  /// 云端成功 → None；BLE 回退且返回新 lockData → Some(newLockData)。
  TaskEither<AppException, Option<String>> activateFloors({
    required int lockId,
    required List<int> floors,
    String lockData = '',
  }) => TaskEither.tryCatch(() async {
    final floorStrs = floors.map((f) => f.toString()).toList();
    try {
      await _runOrThrow(_repo.activateFloors(lockId, floorStrs)); // 远程优先
      return const Option.none();
    } on AppException {
      if (lockData.isEmpty) rethrow; // 无近场能力 → Left
      // BLE floors 为逗号串 "1,2,3"（Task 0 确认；非 "[1,2,3]"）
      final result = await runBle(
        () => TTLock.lock.activateLift(floorStrs.join(','), lockData),
      );
      final nd = result.lockData;
      if (nd == null || nd.isEmpty || nd == lockData) {
        return const Option.none();
      }
      return Option.of(nd); // 交由 Notifier 调 LockDomain.syncLockData
    }
  }, ExceptionUtils.extractAppException);

  /// 设置梯控工作模式（BLE 单轨）。
  ///
  /// [TTLiftWorkActivateType.allFloors]：刷卡可控制全部关联楼层；
  /// [TTLiftWorkActivateType.specificFloors]：刷卡控制卡内数据对应楼层。
  TaskEither<AppException, Unit> setWorkMode({
    required TTLiftWorkActivateType type,
    required String lockData,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await runBle(() => TTLock.lock.setLiftWorkMode(type, lockData));
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 设置梯控关联楼层（BLE 单轨；`floors` 序列化为 `"1,2,3"`）。
  ///
  /// 空列表由 UI 拦截；此处仍拒绝，避免对设备下发空串。
  TaskEither<AppException, Unit> setControlableFloors({
    required List<int> floors,
    required String lockData,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    if (floors.isEmpty) {
      throw AppException.business(code: -100, message: 'lift_floors_empty');
    }
    await runBle(
      () => TTLock.lock.setLiftControlable(
        floors.map((f) => f.toString()).join(','),
        lockData,
      ),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((l) => throw l, (r) => r);
  }
}
