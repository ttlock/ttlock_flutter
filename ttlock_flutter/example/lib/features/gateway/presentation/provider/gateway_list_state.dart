import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';

part 'gateway_list_state.freezed.dart';

@freezed
abstract class GatewayListState with _$GatewayListState {
  const GatewayListState._();
  const factory GatewayListState({
    @Default(PageState<GatewayEntity>()) PageState<GatewayEntity> pageState,
  }) = _GatewayListState;
}
