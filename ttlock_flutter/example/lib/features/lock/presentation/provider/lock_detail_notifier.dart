import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_detail_state.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'lock_detail_notifier.g.dart';

/// 详情 Notifier：family 第二参为路由 `$extra`（当前 lock Entity 或 null）。
/// cloud detail 不返回 lockData/groupName（lock/detail.md），以 $extra 注入为准，
/// 云端 detail 只刷新其余可变字段；不做事后 `lockData.isEmpty` 补救判断。
@Riverpod()
class LockDetailNotifier extends _$LockDetailNotifier {
  LockDomain get _domain => ref.read(lockDomainProvider.notifier);

  @override
  Future<LockDetailState> build(int lockId, LockEntity? extra) async {
    final r = await _domain.getLockDetail(lockId).run();
    final fromCloud = r.fold((err) => throw err, (lock) => lock);
    // lockData/groupName 不可从 detail 获得：以 $extra 注入为准。
    final lock = extra == null
        ? fromCloud
        : fromCloud.copyWith(
            lockData: extra.lockData,
            groupId: extra.groupId,
            groupName: extra.groupName,
          );

    Future<bool> cap(TTLockFunction f) async {
      if (lock.lockData.isEmpty) return false;
      try {
        return await runBle(
          () => TTLock.lock.supportFunction(f, lock.lockData),
        );
      } on Object {
        return false;
      }
    }

    // 密码 / 二维码按能力位探测（与卡/指纹/人脸一致；lockData 空或探测抛错 → 隐藏）。
    // 二维码入口：随机 qrCode 或自定义 customQRCode 任一支持即可。
    final caps = await Future.wait([
      cap(TTLockFunction.passcode),
      cap(TTLockFunction.qrCode),
      cap(TTLockFunction.customQRCode),
      cap(TTLockFunction.icCard),
      cap(TTLockFunction.fingerprint),
      cap(TTLockFunction.face),
      cap(TTLockFunction.palmVein),
      cap(TTLockFunction.yiNuoPhotoFace),
      cap(TTLockFunction.zhiAnPhotoFace),
      cap(TTLockFunction.zhiAnFaceFeatureSecondGeneration),
      cap(TTLockFunction.yiShengPhotoFace),
    ]);
    final showPasscode = caps[0];
    final showQrCode = caps[1] || caps[2];
    final showCard = caps[3];
    final showFingerprint = caps[4];
    final showFace = caps[5] || caps[7] || caps[8] || caps[9] || caps[10];
    final showPalmVein = caps[6];

    return LockDetailState(
      lock: lock,
      showPasscode: showPasscode,
      showCard: showCard,
      showFingerprint: showFingerprint,
      showFace: showFace,
      showPalmVein: showPalmVein,
      showQrCode: showQrCode,
    );
  }

  LockEntity get _lock => state.value!.lock!;

  bool get _canBle => _lock.lockData.isNotEmpty;

  /// 远程通道由 hasGateway 决定，不依赖 lockData。
  bool get _canOperate => _canBle || _lock.hasGateway;

  Future<void> unlock() async {
    await _operate(_domain.unlockLock);
    _domain
        .fetchOfflineRecords(_lock.lockData, type: TTOperateRecordType.latest)
        .flatMap((records) => _domain.uploadRecords(_lock.lockId, records))
        .flatMap((_) => _domain.syncLockDate(_lock))
        .run();
  }

  Future<void> lockLock() => _operate(_domain.lockLock);

  void clearError() =>
      state = AsyncValue.data(state.value!.copyWith(error: null));

  /// 设置页返回时写回本地 Entity，避免 invalidate 用过期 `$extra.lockData` 覆盖 BLE 保鲜值。
  void applyLock(LockEntity lock) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(lock: lock, error: null));
  }

  /// [action] 为 Domain 的 TaskEither，成功返回更新后的 [LockEntity]。
  Future<void> _operate(
    TaskEither<AppException, LockEntity> Function(LockEntity lock) action,
  ) async {
    if (!_canOperate) return;
    state = AsyncValue.data(
      state.value!.copyWith(operating: true, error: null),
    );
    final r = await action(
      _lock,
    ).runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = AsyncValue.data(
        state.value!.copyWith(operating: false, error: err),
      ),
      (updated) => state = AsyncValue.data(
        state.value!.copyWith(operating: false, error: null, lock: updated),
      ),
    );
  }
}
