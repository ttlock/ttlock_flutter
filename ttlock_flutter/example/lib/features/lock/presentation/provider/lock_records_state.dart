import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';

part 'lock_records_state.freezed.dart';

@freezed
abstract class LockRecordsState with _$LockRecordsState {
  const LockRecordsState._();
  const factory LockRecordsState({
    @Default(PageState<LockRecordEntity>())
    PageState<LockRecordEntity> pageState,
    int? recordTypeFilter,
  }) = _LockRecordsState;
}
