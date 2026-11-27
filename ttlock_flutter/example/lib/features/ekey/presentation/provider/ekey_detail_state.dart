import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

part 'ekey_detail_state.freezed.dart';

@freezed
abstract class EkeyDetailState with _$EkeyDetailState {
  const EkeyDetailState._();
  const factory EkeyDetailState({
    required KeyEntity key,
    String? unlockLink,
    @Default(false) bool operating,
    AppException? error,
  }) = _EkeyDetailState;
}
