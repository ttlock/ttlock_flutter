import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

part 'hotel_lock_list_state.freezed.dart';

@freezed
abstract class HotelLockListState with _$HotelLockListState {
  const HotelLockListState._();
  const factory HotelLockListState({
    @Default(PageState<HotelLockEntity>()) PageState<HotelLockEntity> pageState,

    /// 锁类型：1-酒店锁、2-梯控、3-取电。
    ///
    /// **没有「全部」**——开放平台 `type` 不传即 1，不存在表示全部的取值。
    @Default(1) int type,

    /// 别名模糊搜索词；空串表示不筛。
    @Default('') String lockAlias,
  }) = _HotelLockListState;

  bool get isEmpty => pageState.data.isEmpty;
}
