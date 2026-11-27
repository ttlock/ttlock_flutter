import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/auth/presentation/provider/auth_state.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_service.dart';

part 'auth_notifier.g.dart';

@Riverpod()
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState();

  void setUsername(String v) =>
      state = state.copyWith(username: v, errorMessage: null);

  void setPassword(String v) =>
      state = state.copyWith(password: v, errorMessage: null);

  void toggleObscurePassword() =>
      state = state.copyWith(obscurePassword: !state.obscurePassword);

  Future<void> login() async {
    state = state.copyWith(loading: true, errorMessage: null);
    final r = await ref
        .read(userServiceProvider.notifier)
        .login(state.username, state.password)
        .run();
    state = r.fold(
      (e) => state.copyWith(
        loading: false,
        errorMessage: getUserFriendlyMessage(e, ref.read(l10nProvider)),
      ),
      (_) => state.copyWith(loading: false),
    );
  }

  Future<void> register() async {
    state = state.copyWith(loading: true, errorMessage: null);
    final r = await ref
        .read(userServiceProvider.notifier)
        .register(state.username, state.password)
        .run();
    state = r.fold(
      (e) => state.copyWith(
        loading: false,
        errorMessage: getUserFriendlyMessage(e, ref.read(l10nProvider)),
      ),
      (_) => state.copyWith(loading: false),
    );
  }
}
