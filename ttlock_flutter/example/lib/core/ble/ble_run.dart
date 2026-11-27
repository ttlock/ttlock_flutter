import 'dart:async';

import 'package:ttlock_flutter_demo/core/ble/ble_exception_mapper.dart';

Future<T> runBle<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } catch (e, st) {
    throw BleExceptionMapper.mapToAppException(e, st);
  }
}

Stream<T> gateBleStream<T>(
  Stream<T> Function() create, {
  bool broadcast = true,
}) {
  final controller =
      broadcast ? StreamController<T>.broadcast() : StreamController<T>();
  var started = false;
  StreamSubscription<T>? sub;
  controller.onListen = () {
    if (started) return;
    started = true;
    try {
      sub = create().listen(
        controller.add,
        onError: (Object e, StackTrace st) {
          controller.addError(BleExceptionMapper.mapToAppException(e, st), st);
        },
        onDone: controller.close,
      );
    } catch (e, st) {
      controller.addError(BleExceptionMapper.mapToAppException(e, st), st);
    }
  };
  controller.onCancel = () {
    sub?.cancel();
    sub = null;
  };
  return controller.stream;
}
