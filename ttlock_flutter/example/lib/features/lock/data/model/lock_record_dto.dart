// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';

part 'lock_record_dto.freezed.dart';
part 'lock_record_dto.g.dart';

@freezed
abstract class LockRecordDto with _$LockRecordDto {
  const LockRecordDto._();
  const factory LockRecordDto({
    @JsonKey(name: 'recordId', fromJson: intFromDynamic)
    @Default(0)
    int recordId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)
    @Default(0)
    int recordTypeFromLock,
    @JsonKey(name: 'recordType', fromJson: intFromDynamic)
    @Default(0)
    int recordType,
    @JsonKey(name: 'success', fromJson: boolFromDynamic)
    @Default(false)
    bool success,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'keyboardPwd') @Default('') String keyboardPwd,
    @JsonKey(
      name: 'lockDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? lockDate,
    @JsonKey(
      name: 'serverDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? serverDate,
    @JsonKey(name: 'subRecordType', fromJson: intFromDynamic)
    @Default(0)
    int subRecordType,
  }) = _LockRecordDto;

  factory LockRecordDto.fromJson(Map<String, dynamic> json) =>
      _$LockRecordDtoFromJson(json);

  LockRecordEntity toEntity() => LockRecordEntity(
    recordId: recordId,
    lockId: lockId,
    recordTypeFromLock: recordTypeFromLock,
    recordType: recordType,
    success: success,
    username: username,
    keyboardPwd: keyboardPwd,
    lockDate: lockDate,
    serverDate: serverDate,
    subRecordType: subRecordType,
  );
}
