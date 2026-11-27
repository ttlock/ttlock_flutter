import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/grouping/hotel_lock_grouping.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

HotelLockEntity lock({
  required int lockId,
  String alias = '',
  String buildingName = '',
  int buildingNumber = 0,
  String floorName = '',
  int floorNumber = 0,
}) => HotelLockEntity(
  lockId: lockId,
  lockAlias: alias,
  buildingName: buildingName,
  buildingNumber: buildingNumber,
  floorName: floorName,
  floorNumber: floorNumber,
);

void main() {
  const unassigned = '未分配';

  test('buildingKeyOf：优先名称，其次编号，都没有则空串', () {
    expect(buildingKeyOf(lock(lockId: 1, buildingName: 'A栋')), 'A栋');
    expect(buildingKeyOf(lock(lockId: 1, buildingNumber: 3)), '3栋');
    expect(buildingKeyOf(lock(lockId: 1)), '');
  });

  test('floorKeyOf：优先名称，其次编号，都没有则空串', () {
    expect(floorKeyOf(lock(lockId: 1, floorName: '二楼')), '二楼');
    expect(floorKeyOf(lock(lockId: 1, floorNumber: 2)), '2楼');
    expect(floorKeyOf(lock(lockId: 1)), '');
  });

  test('同楼栋同楼层归为一组，标题用「楼栋 · 楼层」', () {
    final groups = groupHotelLocks([
      lock(lockId: 1, alias: '101', buildingName: 'A栋', floorName: '1楼'),
      lock(lockId: 2, alias: '102', buildingName: 'A栋', floorName: '1楼'),
      lock(lockId: 3, alias: '201', buildingName: 'A栋', floorName: '2楼'),
    ], unassigned);

    expect(groups.length, 2);
    expect(groups.first.title, 'A栋 · 1楼');
    expect(groups.first.locks.length, 2);
    expect(groups.last.title, 'A栋 · 2楼');
  });

  test('楼栋楼层皆缺 → 归入「未分配」且恒置末', () {
    final groups = groupHotelLocks([
      lock(lockId: 1, alias: 'x'),
      lock(lockId: 2, alias: 'y', buildingNumber: 1, floorNumber: 1),
    ], unassigned);

    expect(groups.last.title, unassigned);
    expect(groups.last.locks.single.lockId, 1);
  });

  test('组间按楼栋/楼层编号升序', () {
    final groups = groupHotelLocks([
      lock(lockId: 1, buildingNumber: 10, floorNumber: 1),
      lock(lockId: 2, buildingNumber: 2, floorNumber: 3),
      lock(lockId: 3, buildingNumber: 2, floorNumber: 1),
    ], unassigned);

    expect(groups.map((g) => g.title).toList(), [
      '2栋 · 1楼',
      '2栋 · 3楼',
      '10栋 · 1楼',
    ]);
  });

  test('组内按 lockAlias 升序，空别名置末', () {
    final groups = groupHotelLocks([
      lock(lockId: 1, alias: 'b', buildingNumber: 1, floorNumber: 1),
      lock(lockId: 2, alias: '', buildingNumber: 1, floorNumber: 1),
      lock(lockId: 3, alias: 'a', buildingNumber: 1, floorNumber: 1),
    ], unassigned);

    expect(groups.single.locks.map((l) => l.lockId).toList(), [3, 1, 2]);
  });

  test('空列表 → 无分组', () {
    expect(groupHotelLocks(const [], unassigned), isEmpty);
  });
}
