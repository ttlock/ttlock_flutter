import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';

part 'remote_list_state.freezed.dart';

@freezed
abstract class RemoteListState with _$RemoteListState {
  const RemoteListState._();
  const factory RemoteListState({@Default([]) List<RemoteEntity> items}) =
      _RemoteListState;
}
