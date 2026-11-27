import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/power_switch/domain/provider/power_switch_domain.dart';

import '../../helpers/mock_tt_lock_api.dart';

void main() {
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late PowerSwitchDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer();
    addTearDown(container.dispose);
    domain = container.read(powerSwitchDomainProvider.notifier);
  });

  test('setWorkMode：BLE 成功', () async {
    when(
      () => ttlock.setPowerSaverWorkMode(
        TTPowerSaverWorkType.allCards,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    final r = await domain
        .setWorkMode(type: TTPowerSaverWorkType.allCards, lockData: 'ld')
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setPowerSaverWorkMode(
        TTPowerSaverWorkType.allCards,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });

  test('setWorkMode：lockData 空 → Left(-21)', () async {
    final r = await domain
        .setWorkMode(type: TTPowerSaverWorkType.hotelCard, lockData: '')
        .run();
    expect(r.isLeft(), isTrue);
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err as AppBusinessException).code, -21);
  });

  test('setControlableLock：BLE 传 lockMac', () async {
    when(
      () => ttlock.setPowerSaverControlableLock(
        'AA:BB:CC',
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    final r = await domain
        .setControlableLock(lockMac: 'AA:BB:CC', lockData: 'ld')
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setPowerSaverControlableLock(
        'AA:BB:CC',
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });

  test('setControlableLock：lockData 空 → Left(-21)', () async {
    final r = await domain
        .setControlableLock(lockMac: 'AA:BB:CC', lockData: '')
        .run();
    expect(r.isLeft(), isTrue);
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err as AppBusinessException).code, -21);
  });

  test('setControlableLock：lockMac 空 → Left', () async {
    final r = await domain
        .setControlableLock(lockMac: '', lockData: 'ld')
        .run();
    expect(r.isLeft(), isTrue);
  });
}
