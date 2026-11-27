import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/auth/presentation/provider/auth_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final usernameController = useTextEditingController(text: state.username);
    final passwordController = useTextEditingController(text: state.password);

    useEffect(() {
      if (usernameController.text != state.username) {
        usernameController.text = state.username;
      }
      if (passwordController.text != state.password) {
        passwordController.text = state.password;
      }
      return null;
    }, [state.username, state.password]);

    Future<void> onSubmit() async {
      await notifier.register();
      if (!context.mounted) return;
      if (ref.read(authProvider).errorMessage == null) {
        if (context.canPop()) {
          context.pop();
        } else {
          const LoginRoute().go(context);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.register)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: usernameController,
                  enabled: !state.loading,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: l10n.username,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  onChanged: notifier.setUsername,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  enabled: !state.loading,
                  obscureText: state.obscurePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: notifier.toggleObscurePassword,
                      icon: Icon(
                        state.obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                  onChanged: notifier.setPassword,
                  onSubmitted: (_) => onSubmit(),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                ),
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    state.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: state.loading ? null : onSubmit,
                    child: state.loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.register),
                  ),
                ),
                TextButton(
                  onPressed: state.loading
                      ? null
                      : () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            const LoginRoute().go(context);
                          }
                        },
                  child: Text(l10n.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
