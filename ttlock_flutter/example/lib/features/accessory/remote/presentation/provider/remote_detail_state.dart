import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';

part 'remote_detail_state.freezed.dart';

@freezed
abstract class RemoteDetailState with _$RemoteDetailState {
  const RemoteDetailState._();
  const factory RemoteDetailState({
    required RemoteEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _RemoteDetailState;
}
