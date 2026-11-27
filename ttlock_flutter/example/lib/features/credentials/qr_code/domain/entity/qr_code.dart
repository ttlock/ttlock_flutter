import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'qr_code.freezed.dart';

/// 二维码类型：1-限时、2-永久、4-循环。
enum QrCodeType {
  limited(1, '限时'),
  permanent(2, '永久'),
  cycle(4, '循环');

  const QrCodeType(this.value, this.label);

  final int value;
  final String label;

  static QrCodeType fromValue(int? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => QrCodeType.limited);
}

@freezed
abstract class QrCodeEntity with _$QrCodeEntity {
  const QrCodeEntity._();
  const factory QrCodeEntity({
    @Default(0) int qrCodeId,
    @Default(0) int lockId,
    @Default(QrCodeType.limited) QrCodeType type,
    @Default('') String qrCodeNumber,
    @Default('') String name,
    DateTime? startDate,
    DateTime? endDate,
    @Default(0) int refreshTime,
    @Default([]) List<CyclicConfig> cyclicConfig,
    DateTime? createDate,
    @Default(0) int status,
    @Default('') String creator,
    @Default('') String link,
    @Default(0) int qrCodeVersion,
    @Default('') String qrCodeContent,
  }) = _QrCodeEntity;
}
