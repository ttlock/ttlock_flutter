import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

part 'ekey_list_state.freezed.dart';

@freezed
abstract class EkeyListState with _$EkeyListState {
  const EkeyListState._();
  const factory EkeyListState({
    @Default(PageState<KeyEntity>()) PageState<KeyEntity> pageState,
  }) = _EkeyListState;
}
