import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

part 'qr_code_detail_state.freezed.dart';

@freezed
abstract class QrCodeDetailState with _$QrCodeDetailState {
  const QrCodeDetailState._();
  const factory QrCodeDetailState({
    required QrCodeEntity qrCode,
    @Default(false) bool operating,
    AppException? error,
  }) = _QrCodeDetailState;
}
