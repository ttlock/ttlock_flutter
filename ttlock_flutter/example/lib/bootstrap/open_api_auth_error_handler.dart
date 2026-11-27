import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

/// Composition-root handler wired in [main] via [openApiErrorHandlerProvider].
///
/// Clears the session on Open Platform auth-expiry codes so GoRouter
/// `refreshListenable` can redirect to login.
void openApiAuthErrorHandler(int code, String message, Ref ref) {
  if (code == 10004 || code == 401) {
    unawaited(ref.read(userProvider.notifier).logout());
  }
}
