import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_scan_notifier.dart';
import '../../helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（Riverpod 2 运行期注入限制）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  bool isLockScene(int scene) => _mock.isLockScene(scene);
  @override
  TaskEither<AppException, LockEntity> addLockByScan(TTLockScanModel scan) =>
      _mock.addLockByScan(scan);
  @override
  TaskEither<AppException, Unit> renameLock(int lockId, String alias) =>
      _mock.renameLock(lockId, alias);
}

void main() {
  late MockTTLockApi ttlock;

  setUpAll(registerTtLockFallbacks);

  setUp(() {
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
  });

  tearDown(resetTtLockTestHooks);

  Future<ProviderContainer> ready({
    _MockLockDomain? domain,
    Stream<TTLockScanModel>? stream,
  }) async {
    when(
      () => ttlock.lockScanLock(),
    ).thenAnswer((_) => stream ?? const Stream.empty());
    final d = domain ?? _MockLockDomain();
    // 调用方传入 domain 时由其自行 stub isLockScene，避免 any() 覆盖具体 scene。
    if (domain == null) {
      when(() => d.isLockScene(any())).thenReturn(true);
    }
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => _FakeLockDomain(d))],
    );
    addTearDown(container.dispose);
    // 关键：先 listen 固定 autoDispose 存活，再触发 build（异步开扫）。
    container.listen(lockScanProvider, (_, _) {});
    await Future<void>.delayed(Duration.zero);
    return container;
  }

  test('扫描流 onError → error（含蓝牙未开等 guard/SDK 错误）', () async {
    when(() => ttlock.lockScanLock()).thenAnswer(
      (_) => Stream<TTLockScanModel>.error(
        TTLockException(TTLockError.bluetoothOff, 'off'),
      ),
    );
    final container = ProviderContainer(
      overrides: [
        lockDomainProvider.overrideWith(
          () => _FakeLockDomain(_MockLockDomain()),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.listen(lockScanProvider, (_, _) {});
    await Future<void>.delayed(Duration.zero);
    expect(container.read(lockScanProvider).error, isA<AppBusinessException>());
    expect(
      (container.read(lockScanProvider).error as AppBusinessException).code,
      -10,
    );
  });

  test('扫描流合并去重、RSSI 降序', () async {
    final controller = StreamController<TTLockScanModel>();
    final container = await ready(stream: controller.stream);
    final now = DateTime.now().millisecondsSinceEpoch;
    controller.add(testScan(mac: 'AA', rssi: -70, timestamp: now));
    controller.add(testScan(mac: 'BB', rssi: -40, timestamp: now));
    controller.add(testScan(mac: 'AA', rssi: -60, timestamp: now));
    await Future<void>.delayed(Duration.zero);
    final locks = container.read(lockScanProvider).locks;
    expect(locks.map((e) => e.lockMac).toList(), ['BB', 'AA']);
    await controller.close();
  });

  test('超时未再广播的锁从列表移除', () async {
    final controller = StreamController<TTLockScanModel>();
    final container = await ready(stream: controller.stream);
    final old = DateTime.now().millisecondsSinceEpoch - 10000; // >8s
    controller.add(testScan(mac: 'OLD', rssi: -30, timestamp: old));
    await Future<void>.delayed(Duration.zero);
    container.read(lockScanProvider.notifier).pruneStale();
    expect(container.read(lockScanProvider).locks, isEmpty);
    await controller.close();
  });

  test('addLock 成功写入 added', () async {
    final domain = _MockLockDomain();
    final target = testScan(
      mac: 'AA',
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    when(() => domain.isLockScene(1)).thenReturn(true);
    when(() => domain.addLockByScan(target)).thenAnswer(
      (_) => TaskEither.right(const LockEntity(lockId: 9, lockAlias: 'BT-AA')),
    );
    final container = await ready(domain: domain);
    await container.read(lockScanProvider.notifier).addLock(target);
    final s = container.read(lockScanProvider);
    expect(s.added?.lockId, 9);
    expect(s.error, isNull);
  });

  test('非门锁 scene（梯控 12）→ 不调 domain，写入 error', () async {
    final domain = _MockLockDomain();
    when(() => domain.isLockScene(12)).thenReturn(false);
    final target = testScan(
      mac: 'AA',
      scene: 12,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    final container = await ready(domain: domain);
    await container.read(lockScanProvider.notifier).addLock(target);
    verifyNever(() => domain.addLockByScan(any()));
    expect(container.read(lockScanProvider).error, isA<AppBusinessException>());
  });

  // 用 mock 强制 isLockScene=false，验证 Notifier 拒绝路径（真实 Domain 已放行 13）。
  test('isLockScene 拒绝（mock 取电 13）→ 不调 domain，写入 error', () async {
    final domain = _MockLockDomain();
    when(() => domain.isLockScene(13)).thenReturn(false);
    final target = testScan(
      mac: 'BB',
      scene: 13,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    final container = await ready(domain: domain);
    await container.read(lockScanProvider.notifier).addLock(target);
    verifyNever(() => domain.addLockByScan(any()));
    expect(container.read(lockScanProvider).error, isA<AppBusinessException>());
  });
}
