import 'package:freezed_annotation/freezed_annotation.dart';

part 'mine_state.freezed.dart';

@freezed
abstract class MineState with _$MineState {
  const MineState._();
  const factory MineState({
    @Default('') String userName,
    @Default('') String siteLabel,
    @Default('') String version,
  }) = _MineState;
}
