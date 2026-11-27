import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

/// 酒店锁的一个展示分组（楼栋 + 楼层）。
class HotelLockGroup {
  const HotelLockGroup({
    required this.key,
    required this.title,
    required this.locks,
  });

  /// `'$buildingKey|$floorKey'`；「未分配」组的 key 为 `'|'`。
  final String key;
  final String title;
  final List<HotelLockEntity> locks;
}

/// 楼栋键：名称优先，其次编号，都没有则为空串。
///
/// 字段是 `@Default(0)` / `@Default('')` 而非 null，故用 `> 0` / `isNotEmpty` 判定，
/// **不要**写成 `!= null`。
String buildingKeyOf(HotelLockEntity e) => e.buildingName.isNotEmpty
    ? e.buildingName
    : e.buildingNumber > 0
    ? '${e.buildingNumber}栋'
    : '';

/// 楼层键：名称优先，其次编号，都没有则为空串。
String floorKeyOf(HotelLockEntity e) => e.floorName.isNotEmpty
    ? e.floorName
    : e.floorNumber > 0
    ? '${e.floorNumber}楼'
    : '';

/// 按「楼栋 → 楼层」两级分组；组间按编号升序、「未分配」恒置末，组内按别名升序。
///
/// **只作用于传入的当前页数据**——不跨页合并同组，避免翻页后已渲染的组顺序跳变。
/// [unassignedLabel] 由调用方传 l10n 文案，本函数不依赖 l10n。
List<HotelLockGroup> groupHotelLocks(
  List<HotelLockEntity> locks,
  String unassignedLabel,
) {
  if (locks.isEmpty) return const [];

  final buckets = <String, List<HotelLockEntity>>{};
  for (final e in locks) {
    final key = '${buildingKeyOf(e)}|${floorKeyOf(e)}';
    buckets.putIfAbsent(key, () => []).add(e);
  }

  final groups = buckets.entries.map((entry) {
    final sorted = [...entry.value]
      ..sort((a, b) {
        if (a.lockAlias.isEmpty != b.lockAlias.isEmpty) {
          return a.lockAlias.isEmpty ? 1 : -1; // 空别名置末
        }
        return a.lockAlias.compareTo(b.lockAlias);
      });
    final sample = entry.value.first;
    return HotelLockGroup(
      key: entry.key,
      title: _titleOf(sample, unassignedLabel),
      locks: sorted,
    );
  }).toList();

  groups.sort((a, b) {
    final aUn = a.key == '|';
    final bUn = b.key == '|';
    if (aUn != bUn) return aUn ? 1 : -1; // 未分配恒置末
    if (aUn) return 0;

    final aBuilding = a.locks.first.buildingNumber;
    final bBuilding = b.locks.first.buildingNumber;
    if (aBuilding != bBuilding) {
      if (aBuilding <= 0 != bBuilding <= 0) return aBuilding <= 0 ? 1 : -1;
      return aBuilding.compareTo(bBuilding);
    }
    final aFloor = a.locks.first.floorNumber;
    final bFloor = b.locks.first.floorNumber;
    if (aFloor <= 0 != bFloor <= 0) return aFloor <= 0 ? 1 : -1;
    return aFloor.compareTo(bFloor);
  });

  return groups;
}

String _titleOf(HotelLockEntity e, String unassignedLabel) {
  final building = buildingKeyOf(e);
  final floor = floorKeyOf(e);
  if (building.isEmpty && floor.isEmpty) return unassignedLabel;
  if (floor.isEmpty) return building;
  if (building.isEmpty) return floor;
  return '$building · $floor';
}
