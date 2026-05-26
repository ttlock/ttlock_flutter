import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock_state.freezed.dart';

@freezed
abstract class LockState with _$LockState {
  const factory LockState({
    String? lockData,
    String? lockMac,
    String? lockName,
    @Default(false) bool isConnected,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('') String lastResult,
  }) = _LockState;
}
