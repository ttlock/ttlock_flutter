import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

part 'qr_code_list_state.freezed.dart';

@freezed
abstract class QrCodeListState with _$QrCodeListState {
  const QrCodeListState._();
  const factory QrCodeListState({
    @Default(PageState<QrCodeEntity>()) PageState<QrCodeEntity> pageState,
  }) = _QrCodeListState;
}
