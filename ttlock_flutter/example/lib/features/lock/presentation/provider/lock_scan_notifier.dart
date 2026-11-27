import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_scan_state.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'lock_scan_notifier.g.dart';

@Riverpod()
class LockScanNotifier extends _$LockScanNotifier {
  static const _staleMs = 8000;

  StreamSubscription<TTLockScanModel>? _sub;
  Timer? _pruneTimer;
  var _disposed = false;

  @override
  LockScanState build() {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      _sub?.cancel();
      _pruneTimer?.cancel();
    });
    Future.microtask(_startScan);
    return const LockScanState();
  }

  Future<void> _startScan() async {
    if (_disposed) return;
    _pruneTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => pruneStale(),
    );
    state = state.copyWith(scanning: true, error: null);
    _sub = gateBleStream(() => TTLock.lock.lockScanLock()).listen(
      (scan) => state = state.copyWith(
        scanning: true,
        error: null,
        locks: _merge(state.locks, scan),
      ),
      onError: (Object e, StackTrace st) => state = state.copyWith(
        scanning: false,
        error: ExceptionUtils.extractAppException(e, st),
      ),
    );
  }

  void stopScan() {
    _sub?.cancel();
    _sub = null;
    _pruneTimer?.cancel();
    _pruneTimer = null;
    state = state.copyWith(scanning: false);
  }

  /// 移除超过 [_staleMs] 未再广播的设备（用 scan.timestamp，毫秒）。
  void pruneStale() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final kept = state.locks
        .where((s) => now - s.timestamp <= _staleMs)
        .toList();
    if (kept.length != state.locks.length) {
      state = state.copyWith(locks: kept);
    }
  }

  Future<void> addLock(TTLockScanModel scan) async {
    final domain = ref.read(lockDomainProvider.notifier);
    if (!domain.isLockScene(scan.lockVersion.scene)) {
      state = state.copyWith(
        adding: null,
        error: AppException.business(
          code: -2,
          message: 'unsupported_lock_scene',
        ),
      );
      return;
    }
    state = state.copyWith(adding: scan, error: null);
    final r = await domain.addLockByScan(scan).run();
    if (_disposed) return;
    r.fold((err) => state = state.copyWith(adding: null, error: err), (lock) {
      stopScan();
      state = state.copyWith(adding: null, added: lock);
    });
  }

  void clearError() => state = state.copyWith(error: null);

  /// 按 lockMac 去重：取更强 RSSI，但**始终用最新广播刷新 timestamp**。
  List<TTLockScanModel> _merge(
    List<TTLockScanModel> list,
    TTLockScanModel scan,
  ) {
    final byMac = <String, TTLockScanModel>{};
    for (final s in list) {
      byMac[s.lockMac] = s;
    }
    final prev = byMac[scan.lockMac];
    if (prev == null || scan.rssi >= prev.rssi) {
      byMac[scan.lockMac] = scan;
    } else {
      byMac[scan.lockMac] = TTLockScanModel(
        lockName: prev.lockName,
        lockMac: prev.lockMac,
        isInited: scan.isInited,
        isAllowUnlock: scan.isAllowUnlock,
        electricQuantity: scan.electricQuantity,
        lockVersion: scan.lockVersion,
        lockSwitchState: scan.lockSwitchState,
        rssi: prev.rssi,
        oneMeterRssi: prev.oneMeterRssi,
        timestamp: scan.timestamp,
      );
    }
    final merged = byMac.values.toList()
      ..sort((a, b) => b.rssi.compareTo(a.rssi));
    return merged;
  }
}
