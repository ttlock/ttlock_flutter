import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/lift/domain/provider/lift_domain.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

part 'lift_notifier.g.dart';

/// 梯控页面状态机：楼层激活、工作模式、关联楼层。
///
/// 激活结果映射：BLE 回退带回新 lockData → [LiftActivateOutcome.bleFallback]
/// （此时已调 `LockDomain.syncLockData` 保鲜）；云成功 / 无需保鲜 →
/// [LiftActivateOutcome.succeeded]；失败 → [LiftState.error]。
///
/// 工作模式 / 关联楼层为 BLE 写配置，成功 → [LiftState.configOutcome]。
@Riverpod()
class LiftNotifier extends _$LiftNotifier {
  @override
  LiftState build() => const LiftState();

  void toggleFloor(int floor) {
    final sel = Set<int>.of(state.selectedFloors);
    if (!sel.add(floor)) sel.remove(floor);
    state = state.copyWith(
      selectedFloors: sel,
      error: null,
      outcome: null,
      configOutcome: null,
    );
  }

  void clearError() => state = state.copyWith(error: null);

  void clearOutcome() => state = state.copyWith(outcome: null);

  void clearConfigOutcome() => state = state.copyWith(configOutcome: null);

  Future<void> activate({
    required int lockId,
    required List<int> floors,
    required String lockData,
  }) async {
    if (floors.isEmpty || state.operating) return;
    state = state.copyWith(
      operating: true,
      error: null,
      outcome: null,
      configOutcome: null,
    );
    final r = await ref
        .read(liftDomainProvider.notifier)
        .activateFloors(lockId: lockId, floors: floors, lockData: lockData)
        .run();
    if (r.isLeft()) {
      state = state.copyWith(operating: false, error: r.getLeft().toNullable());
      return;
    }
    final nd = r.getRight().toNullable()?.toNullable();
    if (nd != null && nd.isNotEmpty) {
      // BLE 回退带回新 lockData → 保鲜（spec §3.2）；保鲜失败不得伪装成刷新成功。
      final sync = await ref
          .read(lockDomainProvider.notifier)
          .syncLockData(lockId, nd)
          .run();
      sync.fold(
        (_) => state = state.copyWith(
          operating: false,
          outcome: LiftActivateOutcome.bleActivatedSyncFailed,
        ),
        (_) => state = state.copyWith(
          operating: false,
          outcome: LiftActivateOutcome.bleFallback,
        ),
      );
    } else {
      state = state.copyWith(
        operating: false,
        outcome: LiftActivateOutcome.succeeded,
      );
    }
  }

  Future<void> setWorkMode({
    required TTLiftWorkActivateType type,
    required String lockData,
  }) async {
    if (state.operating) return;
    state = state.copyWith(
      operating: true,
      error: null,
      outcome: null,
      configOutcome: null,
    );
    final r = await ref
        .read(liftDomainProvider.notifier)
        .setWorkMode(type: type, lockData: lockData)
        .run();
    state = r.fold(
      (err) => state.copyWith(operating: false, error: err),
      (_) => state.copyWith(
        operating: false,
        configOutcome: LiftConfigOutcome.workModeSaved,
      ),
    );
  }

  Future<void> setControlableFloors({
    required List<int> floors,
    required String lockData,
  }) async {
    if (floors.isEmpty || state.operating) return;
    state = state.copyWith(
      operating: true,
      error: null,
      outcome: null,
      configOutcome: null,
    );
    final r = await ref
        .read(liftDomainProvider.notifier)
        .setControlableFloors(floors: floors, lockData: lockData)
        .run();
    state = r.fold(
      (err) => state.copyWith(operating: false, error: err),
      (_) => state.copyWith(
        operating: false,
        configOutcome: LiftConfigOutcome.controlableFloorsSaved,
      ),
    );
  }
}
