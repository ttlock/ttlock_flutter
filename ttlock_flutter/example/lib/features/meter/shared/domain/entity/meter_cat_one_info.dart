import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_cat_one_info.freezed.dart';

@freezed
abstract class MeterCatOneInfoEntity with _$MeterCatOneInfoEntity {
  const MeterCatOneInfoEntity._();
  const factory MeterCatOneInfoEntity({
    @Default(0) int rssiGrade,
    @Default('') String catOneNodeId,
    @Default('') String catOneCardNumber,
    @Default('') String catOneOperator,
    @Default('') String catOneImsi,
    @Default('') String catOneApn,
    @Default(false) bool overseaCard,
  }) = _MeterCatOneInfoEntity;

  /// 字段全空 ⇒ 视为「未配置成功」（spec §6.3 的首选判据）。
  bool get isEmpty =>
      catOneNodeId.isEmpty &&
      catOneCardNumber.isEmpty &&
      catOneOperator.isEmpty &&
      catOneImsi.isEmpty &&
      catOneApn.isEmpty;
}
