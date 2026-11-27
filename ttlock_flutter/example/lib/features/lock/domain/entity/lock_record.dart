import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock_record.freezed.dart';

@freezed
abstract class LockRecordEntity with _$LockRecordEntity {
  const LockRecordEntity._();
  const factory LockRecordEntity({
    @Default(0) int recordId,
    @Default(0) int lockId,
    @Default(0) int recordTypeFromLock,
    @Default(0) int recordType,
    @Default(false) bool success,
    @Default('') String username,
    @Default('') String keyboardPwd,
    DateTime? lockDate,
    DateTime? serverDate,
    @Default(0) int subRecordType,
  }) = _LockRecordEntity;
}
