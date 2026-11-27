import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'lock_list_state.freezed.dart';

@freezed
abstract class LockListState with _$LockListState {
  const LockListState._();
  const factory LockListState({
    @Default(PageState<LockEntity>()) PageState<LockEntity> pageState,
  }) = _LockListState;
}
