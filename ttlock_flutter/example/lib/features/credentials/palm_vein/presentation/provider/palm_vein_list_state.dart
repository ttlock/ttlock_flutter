import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';

part 'palm_vein_list_state.freezed.dart';

@freezed
abstract class PalmVeinListState with _$PalmVeinListState {
  const PalmVeinListState._();
  const factory PalmVeinListState({@Default([]) List<PalmVeinEntity> items}) =
      _PalmVeinListState;
}
