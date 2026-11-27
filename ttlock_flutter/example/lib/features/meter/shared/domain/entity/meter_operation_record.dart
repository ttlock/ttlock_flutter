import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_operation_record.freezed.dart';

@freezed
abstract class MeterOperationRecordEntity with _$MeterOperationRecordEntity {
  const MeterOperationRecordEntity._();
  const factory MeterOperationRecordEntity({
    @Default(0) int id,
    @Default('') String recordType,
    @Default('') String title,
    @Default('') String content,
    @Default('') String date,
    @Default('') String headUrl,
  }) = _MeterOperationRecordEntity;

  /// `recordType == '-1'` 是列表里的日期分隔行。
  bool get isDateSeparator => recordType == '-1';
}

@freezed
abstract class PaginatedOperationRecords with _$PaginatedOperationRecords {
  const PaginatedOperationRecords._();
  const factory PaginatedOperationRecords({
    @Default(<MeterOperationRecordEntity>[])
    List<MeterOperationRecordEntity> list,
    @Default(0) int total,
    @Default(1) int pageNo,
    @Default(20) int pageSize,
  }) = _PaginatedOperationRecords;

  bool get hasMore => pageNo * pageSize < total;
}
