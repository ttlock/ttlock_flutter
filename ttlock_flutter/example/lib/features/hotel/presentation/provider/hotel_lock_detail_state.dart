import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

part 'hotel_lock_detail_state.freezed.dart';

/// 详情页入参（作为 family 参数）。
///
/// 相等性**只看 [HotelLockEntity.lockId]**：`state.lock` 更新后 sheet 仍会带着
/// 新实体进来，若按整份 entity 判等，会落到另一个 family 实例，详情页就收不到更新。
class HotelLockDetailArgs {
  const HotelLockDetailArgs({required this.lock});

  /// 首次 `build` 的种子；之后以 `state.lock` 为准。
  final HotelLockEntity lock;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelLockDetailArgs && other.lock.lockId == lock.lockId;

  @override
  int get hashCode => lock.lockId.hashCode;
}

@freezed
abstract class HotelLockDetailState with _$HotelLockDetailState {
  const HotelLockDetailState._();
  const factory HotelLockDetailState({
    HotelLockEntity? lock,
    @Default(false) bool submitting,

    /// 普通错误（BLE 失败、hotelInfo 不可用等）；`cloudPending` 时不置此字段。
    AppException? error,

    /// BLE 已成功、云端未同步。此时 [pendingSector] 必有值。
    @Default(false) bool cloudPending,
    String? pendingSector,

    @Default(false) bool icKeyLoading,
    String? icKey,
    AppException? icKeyError,
  }) = _HotelLockDetailState;
}
