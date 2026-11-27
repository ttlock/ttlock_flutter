import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'lock_scan_state.freezed.dart';

@freezed
abstract class LockScanState with _$LockScanState {
  const LockScanState._();
  const factory LockScanState({
    @Default(false) bool scanning,
    @Default([]) List<TTLockScanModel> locks,
    TTLockScanModel? adding,
    LockEntity? added,
    AppException? error,
  }) = _LockScanState;
}
