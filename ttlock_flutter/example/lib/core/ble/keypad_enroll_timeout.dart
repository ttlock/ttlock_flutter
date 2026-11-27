import 'dart:async';

import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart' show TTMultifunctionalKeypadError;
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

/// 键盘录入超时（卡 / 指纹共用）。
///
/// 在 `lib/core/locale/app_message_mapper.dart` 有登记（`-28 => l10n.enrollTimeout`）。
const int kKeypadEnrollTimeoutCode = -28;

/// 把原生键盘录入超时转成可展示的业务码。
///
/// **必须在 `gateBleStream` 之前套用**：原生超时时抛
/// [TTMultifunctionalKeypadException]（`TTMultifunctionalKeypadError.timeout`），
/// 若不在此转成业务码，经 `BleExceptionMapper` 会落到 `AppFirmwareException`，
/// UI 无法对应 `enrollTimeout` 文案。
///
/// 转出的 [AppException] 会被 `BleExceptionMapper.mapToAppException` 首行的
/// `if (error is AppException) return error;` 原样放行，不会被二次包装。
Stream<T> mapKeypadEnrollTimeout<T>(Stream<T> source) => source.transform(
  StreamTransformer<T, T>.fromHandlers(
    handleError: (Object e, StackTrace st, EventSink<T> sink) {
      if (e is TTMultifunctionalKeypadException &&
          e.code == TTMultifunctionalKeypadError.timeout) {
        sink.addError(
          AppException.business(
            code: kKeypadEnrollTimeoutCode,
            message: 'enroll_timeout',
          ),
          st,
        );
        return;
      }
      sink.addError(e, st);
    },
  ),
);
