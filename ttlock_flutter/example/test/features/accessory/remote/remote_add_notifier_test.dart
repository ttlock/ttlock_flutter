import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/repository/remote_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockRemoteRepo extends Mock implements RemoteRepository {}

class _FakeRemoteRepository extends RemoteRepository {
  _FakeRemoteRepository(this._mock);
  final _MockRemoteRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<RemoteEntity>> listByLock(int lockId) =>
      _mock.listByLock(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    int electricQuantity = 100,
    String? firmwareInfo,
    String? number,
  }) => _mock.add(
    lockId,
    mac,
    name: name,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    electricQuantity: electricQuantity,
    firmwareInfo: firmwareInfo,
    number: number,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int remoteId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.changePeriod(
    remoteId,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(int remoteId) => _mock.delete(remoteId);

  @override
  TaskEither<AppException, Unit> rename(int remoteId, String name) =>
      _mock.rename(remoteId, name);
}

void main() {
  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(DateTime(2026));
  });

  tearDown(resetTtLockTestHooks);

  test('showCyclic 始终为 true，无需能力探测', () {
    final ttlock = MockTTLockApi();
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final n = container.read(
      remoteAddProvider(const LockEntity(lockId: 1, lockData: 'ld')).notifier,
    );
    expect(n.state.showCyclic, isTrue);
    expect(n.state.kind, CredentialValidityKind.permanent);
    verifyNever(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('startScan 合并扫描结果；submit 先 initRemoteKey 再 addViaBle', () async {
    final lockApi = MockTTLockApi();
    final remoteKeyApi = MockTTRemoteKeyApi();
    final repo = _MockRemoteRepo();
    final controller = StreamController<TTRemoteAccessoryScanModel>();
    when(
      () => remoteKeyApi.accessoryStartScanRemoteKey(),
    ).thenAnswer((_) => controller.stream);
    when(
      () => remoteKeyApi.initRemoteKey(
        'AA:01',
        'ld',
        connectAddress: any(named: 'connectAddress'),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer(
      (_) async => testSystemModel(
        electricQuantity: 77,
        modelNum: 'R1',
        hardwareRevision: 'H',
        firmwareRevision: 'F',
      ),
    );
    when(
      () => lockApi.addRemoteKey(
        'AA:01',
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        any(),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        number: any(named: 'number'),
      ),
    ).thenAnswer((_) => TaskEither.right(99));

    installMockAccessoryApis(lockApi: lockApi, remoteKeyApi: remoteKeyApi);

    final lock = const LockEntity(lockId: 1, lockData: 'ld');
    final container = ProviderContainer(
      overrides: [
        remoteRepositoryProvider.overrideWith(
          () => _FakeRemoteRepository(repo),
        ),
      ],
    );
    addTearDown(() async {
      await controller.close();
      container.dispose();
    });
    container.listen(remoteAddProvider(lock), (_, _) {});

    final n = container.read(remoteAddProvider(lock).notifier);
    await n.startScan();
    controller.add(testAccessoryScan(name: 'RK', mac: 'AA:01', rssi: -40));
    await Future<void>.delayed(Duration.zero);
    expect(n.state.scanned.single.mac, 'AA:01');
    n.selectScanned(n.state.scanned.single);

    final ok = await n.submit(mac: 'AA:01', name: '遥控1');
    expect(ok, isTrue);
    verify(
      () => remoteKeyApi.initRemoteKey(
        'AA:01',
        'ld',
        connectAddress: any(named: 'connectAddress'),
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verify(
      () => lockApi.addRemoteKey(
        'AA:01',
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });
}
