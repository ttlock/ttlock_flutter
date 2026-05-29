import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

Future<T?> runSettingsOperation<T>(
  BuildContext context, {
  required Future<T> Function() action,
  String? successMessage,
}) async {
  try {
    context.loaderOverlay.show();
    final result = await action();
    if (context.mounted) {
      context.loaderOverlay.hide();
      if (successMessage != null) {
        toastification.show(title: Text(successMessage));
      }
    }
    return result;
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: Text('$e'),
        type: ToastificationType.error,
      );
    }
    return null;
  }
}
