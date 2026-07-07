import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_display.dart';
import 'loading_overlay.dart';

class AsyncValueView {
  const AsyncValueView._();

  static Widget loading({String? message}) =>
      LoadingOverlay(message: message);

  static Widget error({
    required String message,
    String? errorCode,
    VoidCallback? onRetry,
  }) =>
      ErrorDisplay(
        message: message,
        errorCode: errorCode,
        onRetry: onRetry,
      );

  static Widget when<T>({
    required AsyncValue<T> value,
    required Widget Function(T data) data,
    String? loadingMessage,
    void Function(Object error, StackTrace stackTrace)? onRetry,
  }) {
    return value.when(
      loading: () => loading(message: loadingMessage),
      error: (e, st) => error(
        message: '$e',
        onRetry: onRetry == null ? null : () => onRetry(e, st),
      ),
      data: data,
    );
  }
}
