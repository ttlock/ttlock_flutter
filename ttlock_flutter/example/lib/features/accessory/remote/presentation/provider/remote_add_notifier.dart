import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/provider/remote_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/util/ttlock_extensions.dart';

part 'remote_add_notifier.g.dart';

@Riverpod()
class RemoteAddNotifier extends _$RemoteAddNotifier {
  late LockEntity _lock;
  var _cancelled = false;
  StreamSubscription<TTRemoteAccessoryScanModel>? _scanSub;

  @override
  RemoteAddState build(LockEntity lock) {
    _lock = lock;
    _cancelled = false;
    ref.onDispose(() {
      _cancelled = true;
      unawaited(_scanSub?.cancel());
      _scanSub = null;
    });
    return const RemoteAddState();
  }

  void setKind(CredentialValidityKind kind) {
    if (kind == CredentialValidityKind.permanent) {
      state = state.copyWith(kind: kind);
      return;
    }
    final now = DateTime.now();
    state = state.copyWith(
      kind: kind,
      startDate: state.startDate ?? now,
      endDate: state.endDate ?? now.add(const Duration(days: 7)),
    );
  }

  void setStartDate(DateTime value) => state = state.copyWith(startDate: value);

  void setEndDate(DateTime value) => state = state.copyWith(endDate: value);

  void setSchedule(CyclicSchedule? value) =>
      state = state.copyWith(schedule: value);

  void clearError() => state = state.copyWith(error: null);

  void selectScanned(TTRemoteAccessoryScanModel scan) {
    state = state.copyWith(selectedMac: scan.mac, error: null);
  }

  Future<void> startScan() async {
    await _scanSub?.cancel();
    _scanSub = null;
    state = state.copyWith(scanning: true, scanned: const [], error: null);
    _scanSub =
        gateBleStream(
          () => TTLock.remoteKey.accessoryStartScanRemoteKey(),
        ).listen(
          (scan) {
            if (_cancelled) return;
            final byMac = {for (final s in state.scanned) s.mac: s};
            byMac[scan.mac] = scan;
            final merged = byMac.values.toList()
              ..sort((a, b) => b.rssi.compareTo(a.rssi));
            state = state.copyWith(scanned: merged);
          },
          onError: (Object e, StackTrace st) {
            if (_cancelled) return;
            state = state.copyWith(
              scanning: false,
              error: ExceptionUtils.extractAppException(e, st),
            );
          },
          onDone: () {
            if (_cancelled) return;
            state = state.copyWith(scanning: false);
          },
        );
  }

  Future<void> stopScan() async {
    await _scanSub?.cancel();
    _scanSub = null;
    if (!_cancelled) state = state.copyWith(scanning: false);
  }

  Future<bool> submit({required String mac, String? name}) async {
    final trimmedMac = mac.trim();
    if (trimmedMac.isEmpty) {
      state = state.copyWith(
        error: AppException.business(code: -25, message: 'remote_mac_required'),
      );
      return false;
    }
    if (_lock.lockData.isEmpty) {
      state = state.copyWith(
        error: AppException.business(code: -21, message: 'ble_unreachable'),
      );
      return false;
    }
    if (state.kind == CredentialValidityKind.cyclic &&
        (state.schedule == null || !state.schedule!.isValid)) {
      state = state.copyWith(
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }
    late final ResolvedValidity resolved;
    try {
      resolved = resolveValidity(
        kind: state.kind,
        start: state.startDate,
        end: state.endDate,
        schedule: state.schedule,
      );
    } on ArgumentError {
      state = state.copyWith(
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }
    _cancelled = false;
    await stopScan();
    state = state.copyWith(submitting: true, error: null);
    final domain = ref.read(remoteDomainProvider.notifier);
    final startMs = resolved.start?.millisecondsSinceEpoch ?? 0;
    final endMs = resolved.end?.millisecondsSinceEpoch ?? 0;
    try {
      final matched = state.scanned.where((s) => s.mac == trimmedMac);
      final connectAddress =
          matched.isEmpty ? null : matched.first.connectAddress;
      final scannedName = matched.isEmpty ? null : matched.first.name;
      final init = await runBle(
        () => TTLock.remoteKey.initRemoteKey(
          trimmedMac,
          _lock.lockData,
          connectAddress: connectAddress,
        ),
      );
      if (_cancelled) return false;

      final ble = await domain
          .addViaBle(
            lockData: _lock.lockData,
            remoteKeyMac: trimmedMac,
            startMs: startMs,
            endMs: endMs,
            cycleList: resolved.cycleList,
          )
          .run();
      if (_cancelled) return false;
      final bleOk = ble.fold((err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      }, (_) => true);
      if (!bleOk) return false;
      final cloud = await domain
          .confirmAdd(
            lockId: _lock.lockId,
            mac: trimmedMac,
            name: (name == null || name.trim().isEmpty)
                ? scannedName
                : name.trim(),
            kind: state.kind,
            start: state.startDate,
            end: state.endDate,
            schedule: state.schedule,
            electricQuantity: init.electricQuantity ?? 0,
            firmwareInfo: init.firmwareInfoJson,
            number: scannedName,
          )
          .run();
      if (_cancelled) return false;
      return cloud.fold(
        (err) {
          state = state.copyWith(submitting: false, error: err);
          return false;
        },
        (_) {
          state = state.copyWith(submitting: false);
          return true;
        },
      );
    } on Object catch (e, st) {
      if (_cancelled) return false;
      state = state.copyWith(
        submitting: false,
        error: ExceptionUtils.extractAppException(e, st),
      );
      return false;
    }
  }
}
