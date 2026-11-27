import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';

part 'palm_vein_detail_state.freezed.dart';

@freezed
abstract class PalmVeinDetailState with _$PalmVeinDetailState {
  const PalmVeinDetailState._();
  const factory PalmVeinDetailState({
    required PalmVeinEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _PalmVeinDetailState;
}
