import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool loading,
    @Default(true) bool obscurePassword,
    String? errorMessage,
  }) = _AuthState;
}
