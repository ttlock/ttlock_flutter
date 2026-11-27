import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';

part 'fingerprint_detail_state.freezed.dart';

@freezed
abstract class FingerprintDetailState with _$FingerprintDetailState {
  const FingerprintDetailState._();
  const factory FingerprintDetailState({
    required FingerprintEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _FingerprintDetailState;
}
