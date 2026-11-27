import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

part 'hotel_locks_for_power_switch.g.dart';

/// 取电「关联门锁」候选：酒店锁列表（`listByHotel type=1`）。
///
/// 与酒店列表页的 [hotelLockListNotifierProvider] 隔离，避免改动对方筛选状态。
@riverpod
Future<List<HotelLockEntity>> hotelLocksForPowerSwitch(
  Ref ref,
) async {
  final r = await ref
      .read(lockDomainProvider.notifier)
      .listHotelLocks(pageNo: 1, pageSize: 100, type: 1)
      .run();
  return r.fold((err) => throw err, (page) => page.data);
}
