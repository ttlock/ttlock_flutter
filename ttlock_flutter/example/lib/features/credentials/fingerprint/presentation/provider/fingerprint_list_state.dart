import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';

part 'fingerprint_list_state.freezed.dart';

@freezed
abstract class FingerprintListState with _$FingerprintListState {
  const FingerprintListState._();
  const factory FingerprintListState({
    @Default([]) List<FingerprintEntity> items,
  }) = _FingerprintListState;
}
