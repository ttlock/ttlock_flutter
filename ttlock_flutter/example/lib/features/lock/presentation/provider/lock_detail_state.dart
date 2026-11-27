import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'lock_detail_state.freezed.dart';

@freezed
abstract class LockDetailState with _$LockDetailState {
  const LockDetailState._();
  const factory LockDetailState({
    LockEntity? lock,
    @Default(false) bool operating,
    AppException? error,
    @Default(false) bool showPasscode,
    @Default(false) bool showCard,
    @Default(false) bool showFingerprint,
    @Default(false) bool showFace,
    @Default(false) bool showPalmVein,
    @Default(true) bool showQrCode,
  }) = _LockDetailState;
}
