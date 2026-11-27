import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_record_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/wifi_lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';

import '../../helpers/mock_tt_lock_api.dart';

class _MockLockRepo extends Mock implements LockRepository {}

class _MockLockRecordRepo extends Mock implements LockRecordRepository {}

class _MockWifiRepo extends Mock implements WifiLockRepository {}

class _MockTtlock extends Mock implements TTLockApi {}

/// AppConfig 仓储 Fake：class Provider 必须可构造子类；站点固定 AppSite.cn，
/// WiFi 锁端点解析为 `cnwifilock.ttlock.com:4999`。
/// `build()` 置空即可——`_loader` / `_storage` 只被 `load()` / `save()` 读取，
/// 两者均被覆盖。
class _FakeAppConfigRepository extends AppConfigRepository {
  @override
  void build() {}

  @override
  TaskEither<AppException, AppConfig> load() =>
      TaskEither.right(const AppConfig(site: AppSite.cn));

  @override
  TaskEither<AppException, void> save(AppConfig config) =>
      TaskEither.right(null);
}

/// class 型 Provider 的 override 必须用可构造子类（详见文末「测试 Fake 约定」）：
/// Fake 继承生成基类、`build()` 置空，测试用到的方法转发给内嵌 Mock。
class _FakeLockRepository extends LockRepository {
  _FakeLockRepository(this._mock);
  final _MockLockRepo _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, LockInitializeResult> initializeLock(
    String lockData, {
    String? lockAlias,
    int? groupId,
  }) => _mock.initializeLock(lockData, lockAlias: lockAlias, groupId: groupId);
  @override
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _mock.getLockDetail(lockId);
  @override
  TaskEither<AppException, PageState<LockEntity>> getLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => _mock.getLocks(pageNo: pageNo, pageSize: pageSize, groupId: groupId);
  @override
  TaskEither<AppException, Unit> unlock(int lockId) => _mock.unlock(lockId);
  @override
  TaskEither<AppException, Unit> lock(int lockId) => _mock.lock(lockId);
  @override
  TaskEither<AppException, Unit> updateLockData(
    int lockId, {
    required String lockData,
  }) => _mock.updateLockData(lockId, lockData: lockData);
  @override
  TaskEither<AppException, Unit> updateElectricQuantity(
    int lockId,
    int electricQuantity,
  ) => _mock.updateElectricQuantity(lockId, electricQuantity);
  @override
  TaskEither<AppException, Unit> setAutoLockTime(
    int lockId,
    int seconds, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.setAutoLockTime(lockId, seconds, channel: channel);
  @override
  TaskEither<AppException, Unit> updateSetting(
    int lockId,
    LockSettingUpdate setting,
  ) => _mock.updateSetting(lockId, setting);
  @override
  TaskEither<AppException, Unit> renameLock(int lockId, String lockAlias) =>
      _mock.renameLock(lockId, lockAlias);
  @override
  TaskEither<AppException, Unit> deleteLock(int lockId) =>
      _mock.deleteLock(lockId);
  @override
  TaskEither<AppException, Unit> transfer(
    List<int> lockIdList,
    String receiverUsername,
  ) => _mock.transfer(lockIdList, receiverUsername);
  @override
  TaskEither<AppException, PassageModeConfigEntity> getPassageModeConfig(
    int lockId,
  ) => _mock.getPassageModeConfig(lockId);
  @override
  TaskEither<AppException, Unit> configPassageMode(
    int lockId, {
    required int passageMode,
    int? startDate,
    int? endDate,
    int? isAllDay,
    List<int>? weekDays,
    int? autoUnlock,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.configPassageMode(
    lockId,
    passageMode: passageMode,
    startDate: startDate,
    endDate: endDate,
    isAllDay: isAllDay,
    weekDays: weekDays,
    autoUnlock: autoUnlock,
    channel: channel,
  );
  @override
  TaskEither<AppException, ExtraSettingEntity> getExtraSetting(
    int lockId, {
    required int type,
  }) => _mock.getExtraSetting(lockId, type: type);
  @override
  TaskEither<AppException, Unit> updateUnauthorizedAttemptAlert(
    int lockId, {
    ChannelType channel = ChannelType.bleSynced,
    required int flag,
    required int count,
    required int lockTime,
    int? pwd,
    int? card,
    int? fingerprint,
  }) => _mock.updateUnauthorizedAttemptAlert(
    lockId,
    channel: channel,
    flag: flag,
    count: count,
    lockTime: lockTime,
    pwd: pwd,
    card: card,
    fingerprint: fingerprint,
  );
  @override
  TaskEither<AppException, WorkingModeEntity> getWorkingMode(int lockId) =>
      _mock.getWorkingMode(lockId);
  @override
  TaskEither<AppException, Unit> configWorkingMode(
    int lockId, {
    required int workingMode,
    List<WorkingModeCyclicConfigEntity>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.configWorkingMode(
    lockId,
    workingMode: workingMode,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );
  @override
  TaskEither<AppException, DateTime?> updateDate(int lockId) =>
      _mock.updateDate(lockId);
  @override
  TaskEither<AppException, LockUpgradeCheckEntity> upgradeCheck(int lockId) =>
      _mock.upgradeCheck(lockId);
  @override
  TaskEither<AppException, Unit> registerNb(
    int lockId, {
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  }) => _mock.registerNb(
    lockId,
    nbNodeId: nbNodeId,
    nbCardNumber: nbCardNumber,
    nbOperator: nbOperator,
    nbRssi: nbRssi,
  );
}

class _FakeLockRecordRepository extends LockRecordRepository {
  _FakeLockRecordRepository(this._mock);
  final _MockLockRecordRepo _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<LockRecordEntity>> getRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
    int? uid,
    int? recordType,
    String? searchStr,
  }) => _mock.getRecords(
    lockId,
    pageNo: pageNo,
    pageSize: pageSize,
    startDate: startDate,
    endDate: endDate,
    uid: uid,
    recordType: recordType,
    searchStr: searchStr,
  );
  @override
  TaskEither<AppException, Unit> delete(
    int lockId, {
    required List<int> recordIdList,
  }) => _mock.delete(lockId, recordIdList: recordIdList);
  @override
  TaskEither<AppException, Unit> clear(int lockId) => _mock.clear(lockId);
  @override
  TaskEither<AppException, Unit> upload(
    int lockId, {
    required String records,
  }) => _mock.upload(lockId, records: records);
}

class _FakeWifiLockRepository extends WifiLockRepository {
  _FakeWifiLockRepository(this._mock);
  final _MockWifiRepo _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, WifiLockEntity> detail(int lockId) =>
      _mock.detail(lockId);
  @override
  TaskEither<AppException, Unit> updateNetwork(
    int lockId, {
    String? networkName,
    String? wifiMac,
    int? rssi,
    bool? useStaticIp,
    String? ip,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
  }) => _mock.updateNetwork(
    lockId,
    networkName: networkName,
    wifiMac: wifiMac,
    rssi: rssi,
    useStaticIp: useStaticIp,
    ip: ip,
    subnetMask: subnetMask,
    defaultGateway: defaultGateway,
    preferredDns: preferredDns,
    alternateDns: alternateDns,
  );
}

void main() {
  late _MockLockRepo repo;
  late _MockLockRecordRepo recordRepo;
  late _MockWifiRepo wifiRepo;
  late _MockTtlock ttlock;
  late ProviderContainer container;

  LockEntity lock({bool hasGateway = false, String lockData = 'ld'}) =>
      LockEntity(
        lockId: 1,
        lockName: 'BT-1',
        lockAlias: 'A',
        lockMac: 'AA:BB',
        hasGateway: hasGateway,
        lockData: lockData,
      );

  TTLockScanModel scan({bool isInited = false, int scene = 1}) =>
      testScan(mac: 'AA:BB', isInited: isInited, scene: scene);

  ProviderContainer makeContainer() => ProviderContainer(
    overrides: [
      lockRepositoryProvider.overrideWith(() => _FakeLockRepository(repo)),
      lockRecordRepositoryProvider.overrideWith(
        () => _FakeLockRecordRepository(recordRepo),
      ),
      wifiLockRepositoryProvider.overrideWith(
        () => _FakeWifiLockRepository(wifiRepo),
      ),
      appConfigRepositoryProvider.overrideWith(_FakeAppConfigRepository.new),
    ],
  );

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(
      const LockSettingUpdate(
        type: 1,
        value: 1,
        channel: ChannelType.bleSynced,
      ),
    );
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(Duration.zero);
    // TTIpSettingType.staticIp == 0（枚举顺序见 pin 版 messages.g.dart）
    registerFallbackValue(TTIpSetting(type: 0));
  });

  setUp(() {
    repo = _MockLockRepo();
    recordRepo = _MockLockRecordRepo();
    wifiRepo = _MockWifiRepo();
    ttlock = _MockTtlock();
    TTLock.setImplementations(lockApi: ttlock);
    container = makeContainer();
    addTearDown(container.dispose);
  });

  tearDown(() {
    BleGuard.reset();
    TTLock.configurePigeon();
  });

  test('addLockByScan：BLE initLock → cloud initialize → 返回 Entity', () async {
    when(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => 'newLD');
    when(
      () => repo.initializeLock(
        any(),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) =>
          TaskEither.right(const LockInitializeResult(lockId: 9, keyId: 'k')),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.addLockByScan(scan()).run();
    expect(r.isRight(), isTrue);
    expect(r.getRight().toNullable()!.lockId, 9);
    verify(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).called(1);
    verifyNever(
      () => repo.updateLockData(any(), lockData: any(named: 'lockData')),
    );
  });

  test('addLockByScan：云端失败 → BLE resetLock 回滚 → Left', () async {
    when(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => 'newLD');
    when(
      () => repo.initializeLock(
        any(),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) =>
          TaskEither.left(AppException.business(code: 10007, message: 'fail')),
    );
    when(
      () => ttlock.resetLock(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.addLockByScan(scan()).run();
    expect(r.isLeft(), isTrue);
    verify(
      () => ttlock.resetLock(any(), timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('addLockByScan：已初始化锁直接 Left', () async {
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.addLockByScan(scan(isInited: true, scene: 0)).run();
    expect(r.isLeft(), isTrue);
    verifyNever(() => ttlock.initLock(any(), timeout: any(named: 'timeout')));
  });

  test('addLockByScan：scene 12（梯控）已放行，走 init 加锁', () async {
    when(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => 'liftLD');
    when(
      () => repo.initializeLock(
        any(),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) =>
          TaskEither.right(const LockInitializeResult(lockId: 21, keyId: 'k')),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.addLockByScan(scan(scene: 12)).run();
    expect(r.isRight(), isTrue);
    expect(r.getRight().toNullable()!.lockId, 21);
    verify(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('addLockByScan：scene 13（取电开关）放行，走普通加锁', () async {
    when(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => 'powerLD');
    when(
      () => repo.initializeLock(
        any(),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) =>
          TaskEither.right(const LockInitializeResult(lockId: 31, keyId: 'k')),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.addLockByScan(scan(scene: 13)).run();
    expect(r.isRight(), isTrue);
    expect(r.getRight().toNullable()!.lockId, 31);
    verify(
      () => ttlock.initLock(any(), timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('unlockLock：有网关 → 优先云端；云端失败 → BLE 回退 + 返回更新后 Entity', () async {
    when(() => repo.unlock(1)).thenAnswer(
      (_) =>
          TaskEither.left(AppException.business(code: 1, message: 'offline')),
    );
    when(() => ttlock.controlLock('ld', TTControlAction.unlock)).thenAnswer(
      (_) async => ControlLockResult(
        lockTime: 1,
        electricQuantity: 70,
        uniqueId: 1,
        lockData: 'ld2',
      ),
    );
    when(
      () => repo.updateLockData(1, lockData: 'ld2'),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => repo.updateElectricQuantity(1, 70),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.unlockLock(lock(hasGateway: true)).run();
    expect(r.isRight(), isTrue);
    expect(r.getRight().toNullable()!.lockData, 'ld2');
    expect(r.getRight().toNullable()!.electricQuantity, 70);
    verify(() => ttlock.controlLock('ld', TTControlAction.unlock)).called(1);
    verify(() => repo.updateLockData(1, lockData: 'ld2')).called(1);
  });

  test(
    'unlockLock：无网关 → BLE controlLock；无新 lockData 不调 updateLockData，仍回写电量并返回更新后 Entity',
    () async {
      when(() => ttlock.controlLock('ld', TTControlAction.unlock)).thenAnswer(
        (_) async =>
            ControlLockResult(lockTime: 1, electricQuantity: 70, uniqueId: 1),
      );
      when(
        () => repo.updateElectricQuantity(1, 70),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.unlockLock(lock()).run();
      expect(r.isRight(), isTrue);
      expect(r.getRight().toNullable()!.lockData, 'ld');
      expect(r.getRight().toNullable()!.electricQuantity, 70);
      verify(() => ttlock.controlLock('ld', TTControlAction.unlock)).called(1);
      verifyNever(
        () => repo.updateLockData(any(), lockData: any(named: 'lockData')),
      );
      verify(() => repo.updateElectricQuantity(1, 70)).called(1);
      verifyNever(() => repo.unlock(any()));
    },
  );

  test('unlockLock：有网关远程成功 → 不走 BLE，不调 bleSynced', () async {
    when(() => repo.unlock(1)).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.unlockLock(lock(hasGateway: true)).run();
    expect(r.isRight(), isTrue);
    expect(r.getRight().toNullable()!.lockData, 'ld');
    verifyNever(() => ttlock.controlLock(any(), any()));
    verifyNever(
      () => repo.updateLockData(any(), lockData: any(named: 'lockData')),
    );
  });

  test('lockLock：无网关 BLE 关锁并保鲜 lockData', () async {
    when(() => ttlock.controlLock('ld', TTControlAction.lock)).thenAnswer(
      (_) async => ControlLockResult(
        lockTime: 2,
        electricQuantity: 60,
        uniqueId: 2,
        lockData: 'ld3',
      ),
    );
    when(
      () => repo.updateLockData(1, lockData: 'ld3'),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => repo.updateElectricQuantity(1, 60),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.lockLock(lock()).run();
    expect(r.getRight().toNullable()!.lockData, 'ld3');
    expect(r.getRight().toNullable()!.electricQuantity, 60);
    verify(() => ttlock.controlLock('ld', TTControlAction.lock)).called(1);
    verifyNever(() => repo.lock(any()));
  });

  test('listLocks 透传分页', () async {
    when(
      () => repo.getLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(data: [LockEntity(lockId: 1)], total: 1),
      ),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final page = await domain.listLocks().run();
    expect(page.getRight().toNullable()!.data.single.lockId, 1);
  });

  test('getLockDetail 透传', () async {
    when(
      () => repo.getLockDetail(1),
    ).thenAnswer((_) => TaskEither.right(lock()));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.getLockDetail(1).run();
    expect(r.getRight().toNullable()!.lockId, 1);
  });

  test('syncLockData / renameLock / transferLock 透传云端', () async {
    when(
      () => repo.updateLockData(1, lockData: 'ld9'),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => repo.renameLock(1, '新名'),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => repo.transfer([1], 'bob'),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    expect((await domain.syncLockData(1, 'ld9').run()).isRight(), isTrue);
    expect((await domain.renameLock(1, '新名').run()).isRight(), isTrue);
    expect((await domain.transferLock([1], 'bob').run()).isRight(), isTrue);
  });

  test('deleteLockFlow：BLE reset 成功 → 云端 delete', () async {
    when(() => ttlock.resetLock('ld')).thenAnswer((_) async {});
    when(() => repo.deleteLock(1)).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.deleteLockFlow(lock()).run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.resetLock('ld')).called(1);
    verify(() => repo.deleteLock(1)).called(1);
  });

  test('deleteLockFlow：reseted 视为已重置 → 继续云端 delete', () async {
    when(() => ttlock.resetLock('ld')).thenThrow(
      AppException.firmware(
        message: 'reseted',
        error: TTLockException(TTLockError.reseted, 'already reset'),
      ),
    );
    when(() => repo.deleteLock(1)).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.deleteLockFlow(lock()).run();
    expect(r.isRight(), isTrue);
    verify(() => repo.deleteLock(1)).called(1);
  });

  test('deleteLockFlow：其它 reset 失败 → 不删云端', () async {
    when(() => ttlock.resetLock('ld')).thenThrow(
      AppException.firmware(
        message: 'fail',
        error: TTLockException(TTLockError.noPermisstion, 'no perm'),
      ),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.deleteLockFlow(lock()).run();
    expect(r.isLeft(), isTrue);
    verifyNever(() => repo.deleteLock(any()));
  });

  test('isLockScene：放行 12（梯控）与 13（取电），其余门锁 scene 亦允许', () {
    final domain = container.read(lockDomainProvider.notifier);
    expect(domain.isLockScene(1), isTrue);
    expect(domain.isLockScene(11), isTrue);
    expect(domain.isLockScene(12), isTrue);
    expect(domain.isLockScene(13), isTrue);
    expect(domain.isLockScene(17), isTrue);
  });

  test('refreshSystemInfo：新 lockData → 保鲜 + 电量回写 + 返回系统信息', () async {
    when(() => ttlock.getLockSystemInfo('ld')).thenAnswer(
      (_) async => TTLockSystemModel(
        electricQuantity: 55,
        lockData: 'ld3',
        modelNum: 'M1',
        hardwareRevision: 'H1',
        firmwareRevision: 'F1',
      ),
    );
    when(
      () => repo.updateLockData(1, lockData: 'ld3'),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => repo.updateElectricQuantity(1, 55),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final updated = await domain.refreshSystemInfo(lock()).run();
    final info = updated.getRight().toNullable()!;
    expect(info.lock.electricQuantity, 55);
    expect(info.lock.lockData, 'ld3');
    expect(info.modelNum, 'M1');
    expect(info.hardwareRevision, 'H1');
    expect(info.firmwareRevision, 'F1');
    verify(() => repo.updateLockData(1, lockData: 'ld3')).called(1);
    verify(() => repo.updateElectricQuantity(1, 55)).called(1);
  });

  test('refreshBattery：BLE 电量回写并返回更新后 Entity', () async {
    when(() => ttlock.getLockPower('ld')).thenAnswer((_) async => 40);
    when(
      () => repo.updateElectricQuantity(1, 40),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.refreshBattery(lock()).run();
    expect(r.getRight().toNullable()!.electricQuantity, 40);
    expect(r.getRight().toNullable()!.lockData, 'ld');
  });

  test(
    'setSound：无网关 → BLE setLockConfig + cloud updateSetting(type=6)',
    () async {
      when(
        () => ttlock.setLockConfig(TTLockConfig.audio, true, 'ld'),
      ).thenAnswer((_) async {});
      when(
        () => repo.updateSetting(1, any()),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.setSound(lock(), on: true).run();
      expect(r.isRight(), isTrue);
      verify(
        () => ttlock.setLockConfig(TTLockConfig.audio, true, 'ld'),
      ).called(1);
      final setting =
          verify(() => repo.updateSetting(1, captureAny())).captured.single
              as LockSettingUpdate;
      expect(setting.type, 6);
      expect(setting.value, 1);
      expect(setting.channel, ChannelType.bleSynced);
    },
  );

  test('setSoundVolume 关闭：BLE off + type6=2', () async {
    when(
      () => ttlock.setSoundVolume(TTSoundVolumeType.off, any()),
    ).thenAnswer((_) async {});
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setSoundVolume(lock(), on: false).run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.setSoundVolume(TTSoundVolumeType.off, 'ld')).called(1);
    final u =
        verify(() => repo.updateSetting(1, captureAny())).captured.single
            as LockSettingUpdate;
    expect(u.type, 6);
    expect(u.value, 2);
  });

  test('setSoundVolume 开档3：BLE thirdLevel + type6=1 再 type8=3', () async {
    when(
      () => ttlock.setSoundVolume(TTSoundVolumeType.thirdLevel, any()),
    ).thenAnswer((_) async {});
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setSoundVolume(lock(), on: true, level: 3).run();
    expect(r.isRight(), isTrue);
    final list = verify(
      () => repo.updateSetting(1, captureAny()),
    ).captured.cast<LockSettingUpdate>();
    expect(list.map((e) => (e.type, e.value)), [(6, 1), (8, 3)]);
  });

  test('setSound：有网关远程失败 → BLE 回退 + bleSynced', () async {
    when(
      () => ttlock.setLockConfig(TTLockConfig.audio, true, 'ld'),
    ).thenAnswer((_) async {});
    when(() => repo.updateSetting(1, any())).thenAnswer((invocation) {
      final setting = invocation.positionalArguments[1] as LockSettingUpdate;
      if (setting.channel == ChannelType.bleSynced) {
        return TaskEither.right(unit);
      }
      return TaskEither.left(
        AppException.business(code: 1, message: 'offline'),
      );
    });
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setSound(lock(hasGateway: true), on: true).run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setLockConfig(TTLockConfig.audio, true, 'ld'),
    ).called(1);
    final settings = verify(
      () => repo.updateSetting(1, captureAny()),
    ).captured.cast<LockSettingUpdate>();
    expect(settings.first.channel, ChannelType.gatewayWifi);
    expect(settings.last.channel, ChannelType.bleSynced);
  });

  test('setAutoLockTime：无网关 → BLE + bleSynced', () async {
    when(
      () => ttlock.setAutoLockingPeriodicTime(10, 'ld'),
    ).thenAnswer((_) async {});
    when(
      () => repo.setAutoLockTime(1, 10, channel: ChannelType.bleSynced),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setAutoLockTime(lock(), 10).run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.setAutoLockingPeriodicTime(10, 'ld')).called(1);
    verifyNever(
      () =>
          repo.setAutoLockTime(any(), any(), channel: ChannelType.gatewayWifi),
    );
  });

  test('setAutoLockTime：有网关远程成功 → 不走 BLE', () async {
    when(
      () => repo.setAutoLockTime(1, 8, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setAutoLockTime(lock(hasGateway: true), 8).run();
    expect(r.isRight(), isTrue);
    verifyNever(() => ttlock.setAutoLockingPeriodicTime(any(), any()));
  });

  test(
    'getAutoLockTime / getPassageMode / checkUpgrade / registerNb 透传',
    () async {
      when(() => ttlock.getAutoLockingPeriodicTime('ld')).thenAnswer(
        (_) async => AutoLockingTime(currentTime: 5, minTime: 1, maxTime: 60),
      );
      when(
        () => repo.getPassageModeConfig(1),
      ).thenAnswer((_) => TaskEither.right(const PassageModeConfigEntity()));
      when(
        () => repo.upgradeCheck(1),
      ).thenAnswer((_) => TaskEither.right(const LockUpgradeCheckEntity()));
      when(
        () => repo.registerNb(
          1,
          nbNodeId: 'n',
          nbCardNumber: 'c',
          nbOperator: 'op',
          nbRssi: 1,
        ),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      expect(
        (await domain.getAutoLockTime('ld').run())
            .getRight()
            .toNullable()!
            .currentTime,
        5,
      );
      expect((await domain.getPassageMode(1).run()).isRight(), isTrue);
      expect((await domain.checkUpgrade(1).run()).isRight(), isTrue);
      expect(
        (await domain
                .registerNb(
                  1,
                  nbNodeId: 'n',
                  nbCardNumber: 'c',
                  nbOperator: 'op',
                  nbRssi: 1,
                )
                .run())
            .isRight(),
        isTrue,
      );
    },
  );

  test('setPassageMode 开启自定义时段：clear 后 add，分钟透传', () async {
    when(() => ttlock.clearAllPassageModes(any())).thenAnswer((_) async {});
    when(
      () => ttlock.addPassageMode(any(), any(), any(), any(), any(), any()),
    ).thenAnswer((_) async {});
    when(
      () => ttlock.setLockConfig(
        TTLockConfig.passageModeAutoUnlock,
        any(),
        any(),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.configPassageMode(
        any(),
        passageMode: any(named: 'passageMode'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        isAllDay: any(named: 'isAllDay'),
        weekDays: any(named: 'weekDays'),
        autoUnlock: any(named: 'autoUnlock'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));

    const cfg = PassageModeConfigEntity(
      passageMode: 1,
      isAllDay: 2,
      startDate: 480,
      endDate: 1080,
      weekDays: [1, 2, 3],
      autoUnlock: 2,
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setPassageMode(lock(), cfg).run();
    expect(r.isRight(), isTrue);
    verifyInOrder([
      () => ttlock.clearAllPassageModes('ld'),
      () => ttlock.addPassageMode(any(), any(), any(), any(), any(), any()),
    ]);
    verify(
      () =>
          ttlock.setLockConfig(TTLockConfig.passageModeAutoUnlock, false, 'ld'),
    ).called(1);
  });

  test(
    'setPassageMode：无网关 on → BLE clear + addPassageMode + bleSynced',
    () async {
      when(() => ttlock.clearAllPassageModes('ld')).thenAnswer((_) async {});
      when(
        () => ttlock.addPassageMode(any(), any(), any(), any(), any(), any()),
      ).thenAnswer((_) async {});
      when(
        () => ttlock.setLockConfig(
          TTLockConfig.passageModeAutoUnlock,
          any(),
          any(),
        ),
      ).thenAnswer((_) async {});
      when(
        () => repo.configPassageMode(
          1,
          passageMode: 1,
          startDate: 0,
          endDate: 0,
          isAllDay: 1,
          weekDays: const [],
          autoUnlock: 2,
          channel: ChannelType.bleSynced,
        ),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain
          .setPassageMode(
            lock(),
            const PassageModeConfigEntity(passageMode: 1, isAllDay: 1),
          )
          .run();
      expect(r.isRight(), isTrue);
      verifyInOrder([
        () => ttlock.clearAllPassageModes('ld'),
        () => ttlock.addPassageMode(any(), any(), any(), any(), any(), any()),
      ]);
    },
  );

  test('setPassageMode：有网关远程失败 → BLE clear + bleSynced', () async {
    when(
      () => repo.configPassageMode(
        1,
        passageMode: any(named: 'passageMode'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        isAllDay: any(named: 'isAllDay'),
        weekDays: any(named: 'weekDays'),
        autoUnlock: any(named: 'autoUnlock'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) =>
          TaskEither.left(AppException.business(code: 1, message: 'offline')),
    );
    when(() => ttlock.clearAllPassageModes('ld')).thenAnswer((_) async {});
    when(
      () => repo.configPassageMode(
        1,
        passageMode: 2,
        startDate: 0,
        endDate: 0,
        isAllDay: 2,
        weekDays: const [],
        autoUnlock: 2,
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setPassageMode(
          lock(hasGateway: true),
          const PassageModeConfigEntity(passageMode: 2, isAllDay: 2),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.clearAllPassageModes('ld')).called(1);
    verifyNever(
      () => ttlock.addPassageMode(any(), any(), any(), any(), any(), any()),
    );
  });

  test('syncLockDate：BLE setLockTime 必做；无网关不调云端 updateDate', () async {
    when(() => ttlock.setLockTime(any(), 'ld')).thenAnswer((_) async {});
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.syncLockDate(lock()).run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.setLockTime(any(), 'ld')).called(1);
    verifyNever(() => repo.updateDate(any()));
  });

  test('syncLockDate：有网关时云端 updateDate 失败不致命', () async {
    when(() => ttlock.setLockTime(any(), 'ld')).thenAnswer((_) async {});
    when(() => repo.updateDate(1)).thenAnswer(
      (_) =>
          TaskEither.left(AppException.business(code: 1, message: 'offline')),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.syncLockDate(lock(hasGateway: true)).run();
    expect(r.isRight(), isTrue);
    verify(() => repo.updateDate(1)).called(1);
  });

  test('listRecords 透传分页与 recordType', () async {
    when(
      () => recordRepo.getRecords(1, pageNo: 1, pageSize: 20, recordType: 4),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockRecordEntity>(
          data: [LockRecordEntity(recordId: 9, lockId: 1)],
          total: 1,
        ),
      ),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final page = await domain.listRecords(1, recordType: 4).run();
    expect(page.getRight().toNullable()!.data.single.recordId, 9);
  });

  test('deleteRecords / clearRecords / uploadRecords 透传云端', () async {
    when(
      () => recordRepo.delete(1, recordIdList: [2, 3]),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(() => recordRepo.clear(1)).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => recordRepo.upload(1, records: 'json'),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    expect((await domain.deleteRecords(1, [2, 3]).run()).isRight(), isTrue);
    expect((await domain.clearRecords(1).run()).isRight(), isTrue);
    expect((await domain.uploadRecords(1, 'json').run()).isRight(), isTrue);
  });

  test('fetchOfflineRecords：BLE getLockOperateRecord(total=true)', () async {
    when(
      () => ttlock.getLockOperateRecord(TTOperateRecordType.total, 'ld'),
    ).thenAnswer((_) async => '[{"id":1}]');
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.fetchOfflineRecords('ld').run();
    expect(r.getRight().toNullable(), '[{"id":1}]');
  });

  test(
    'setOpenDirection：无网关 → BLE setLockDirection + updateSetting(type=7) bleSynced',
    () async {
      when(
        () => ttlock.setLockDirection(TTLockDirection.right, any()),
      ).thenAnswer((_) async {});
      when(
        () => repo.updateSetting(1, any()),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain
          .setOpenDirection(lock(), TTLockDirection.right)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => ttlock.setLockDirection(TTLockDirection.right, 'ld'),
      ).called(1);
      final captured =
          verify(() => repo.updateSetting(1, captureAny())).captured.single
              as LockSettingUpdate;
      expect(captured.type, 7);
      expect(captured.value, 2);
      expect(captured.channel, ChannelType.bleSynced);
    },
  );

  test('setOpenDirection：有网关远程成功 → 不调 BLE', () async {
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setOpenDirection(lock(hasGateway: true), TTLockDirection.left)
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(() => ttlock.setLockDirection(any(), any()));
  });

  test(
    'setPrivacyLock：无网关 → BLE privacyLock + updateSetting(type=2) bleSynced',
    () async {
      when(
        () => ttlock.setLockConfig(TTLockConfig.privacyLock, true, any()),
      ).thenAnswer((_) async {});
      when(
        () => repo.updateSetting(1, any()),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.setPrivacyLock(lock(), on: true).run();
      expect(r.isRight(), isTrue);
      verify(
        () => ttlock.setLockConfig(TTLockConfig.privacyLock, true, 'ld'),
      ).called(1);
      final captured =
          verify(() => repo.updateSetting(1, captureAny())).captured.single
              as LockSettingUpdate;
      expect(captured.type, 2);
      expect(captured.value, 1);
      expect(captured.channel, ChannelType.bleSynced);
    },
  );

  test('setPrivacyLock：有网关远程成功 → 不调 BLE', () async {
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setPrivacyLock(lock(hasGateway: true), on: false)
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(() => ttlock.setLockConfig(any(), any(), any()));
  });

  test(
    'setRemoteUnlock：BLE 返回新 lockData → updateLockData → 新 Entity',
    () async {
      when(
        () => ttlock.setRemoteUnlockSwitchState(true, any()),
      ).thenAnswer((_) async => 'ld-new');
      when(
        () => repo.updateLockData(1, lockData: 'ld-new'),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.setRemoteUnlock(lock(), on: true).run();
      expect(r.getRight().toNullable()?.lockData, 'ld-new');
      verify(() => repo.updateLockData(1, lockData: 'ld-new')).called(1);
      verifyNever(() => repo.updateSetting(any(), any()));
    },
  );

  test('setDoubleAuth：仅 setLockConfig，不 updateLockData', () async {
    when(
      () => ttlock.setLockConfig(TTLockConfig.doubleAuth, true, any()),
    ).thenAnswer((_) async {});
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setDoubleAuth(lock(), on: true).run();
    expect(r.isRight(), isTrue);
    verifyNever(
      () => repo.updateLockData(any(), lockData: any(named: 'lockData')),
    );
    verifyNever(() => repo.updateSetting(any(), any()));
  });

  test(
    'setWifiPowerSaving：无网关 → BLE wifiLockPowerSavingMode + updateSetting(type=10) bleSynced',
    () async {
      when(
        () => ttlock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          true,
          any(),
        ),
      ).thenAnswer((_) async {});
      when(
        () => repo.updateSetting(1, any()),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.setWifiPowerSaving(lock(), on: true).run();
      expect(r.isRight(), isTrue);
      verify(
        () => ttlock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          true,
          'ld',
        ),
      ).called(1);
      final captured =
          verify(() => repo.updateSetting(1, captureAny())).captured.single
              as LockSettingUpdate;
      expect(captured.type, 10);
      expect(captured.value, 1);
      expect(captured.channel, ChannelType.bleSynced);
    },
  );

  test('setWifiPowerSaving：有网关仍走 BLE + bleSynced，不调 gatewayWifi', () async {
    when(
      () => ttlock.setLockConfig(
        TTLockConfig.wifiLockPowerSavingMode,
        false,
        any(),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setWifiPowerSaving(lock(hasGateway: true), on: false)
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setLockConfig(
        TTLockConfig.wifiLockPowerSavingMode,
        false,
        'ld',
      ),
    ).called(1);
    final captured = verify(() => repo.updateSetting(1, captureAny())).captured;
    expect(captured, hasLength(1));
    final setting = captured.single as LockSettingUpdate;
    expect(setting.type, 10);
    expect(setting.value, 2);
    expect(setting.channel, ChannelType.bleSynced);
    expect(setting.channel, isNot(ChannelType.gatewayWifi));
  });

  test(
    'setDoorNotClosedAlert：无网关 → BLE setDoorSensorAlertTime + updateSetting(type=11) bleSynced',
    () async {
      when(
        () => ttlock.setDoorSensorAlertTime(30, any()),
      ).thenAnswer((_) async {});
      when(
        () => repo.updateSetting(1, any()),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain.setDoorNotClosedAlert(lock(), 30).run();
      expect(r.isRight(), isTrue);
      verify(() => ttlock.setDoorSensorAlertTime(30, 'ld')).called(1);
      final captured =
          verify(() => repo.updateSetting(1, captureAny())).captured.single
              as LockSettingUpdate;
      expect(captured.type, 11);
      expect(captured.value, 30);
      expect(captured.channel, ChannelType.bleSynced);
    },
  );

  test('setDoorNotClosedAlert：有网关远程成功 → 不调 BLE', () async {
    when(
      () => repo.updateSetting(1, any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setDoorNotClosedAlert(lock(hasGateway: true), 15)
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(() => ttlock.setDoorSensorAlertTime(any(), any()));
    final captured =
        verify(() => repo.updateSetting(1, captureAny())).captured.single
            as LockSettingUpdate;
    expect(captured.type, 11);
    expect(captured.value, 15);
    expect(captured.channel, ChannelType.gatewayWifi);
  });

  test('setDoorNotClosedAlert：有网关远程失败 → BLE + bleSynced', () async {
    when(
      () => ttlock.setDoorSensorAlertTime(0, any()),
    ).thenAnswer((_) async {});
    when(() => repo.updateSetting(1, any())).thenAnswer((invocation) {
      final setting = invocation.positionalArguments[1] as LockSettingUpdate;
      if (setting.channel == ChannelType.bleSynced) {
        return TaskEither.right(unit);
      }
      return TaskEither.left(
        AppException.business(code: 1, message: 'offline'),
      );
    });
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setDoorNotClosedAlert(lock(hasGateway: true), 0)
        .run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.setDoorSensorAlertTime(0, 'ld')).called(1);
    final settings = verify(
      () => repo.updateSetting(1, captureAny()),
    ).captured.cast<LockSettingUpdate>();
    expect(settings.first.channel, ChannelType.gatewayWifi);
    expect(settings.first.type, 11);
    expect(settings.first.value, 0);
    expect(settings.last.channel, ChannelType.bleSynced);
    expect(settings.last.type, 11);
    expect(settings.last.value, 0);
  });

  test('getWorkingMode 透传 repo.getWorkingMode', () async {
    when(() => repo.getWorkingMode(1)).thenAnswer(
      (_) => TaskEither.right(const WorkingModeEntity(workingMode: 2)),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.getWorkingMode(1).run();
    expect(r.getRight().toNullable()!.workingMode, 2);
    verify(() => repo.getWorkingMode(1)).called(1);
  });

  test('setWorkingMode：有网关远程成功 → channel=gatewayWifi，不调 BLE', () async {
    when(
      () => repo.configWorkingMode(
        any(),
        workingMode: any(named: 'workingMode'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setWorkingMode(
          lock(hasGateway: true),
          const WorkingModeEntity(workingMode: 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => repo.configWorkingMode(
        1,
        workingMode: 1,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).called(1);
    verifyNever(
      () => repo.configWorkingMode(
        any(),
        workingMode: any(named: 'workingMode'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    );
  });

  test('setWorkingMode：无网关 + 自定义 cyclic → 业务失败，不调 repo / BLE', () async {
    const custom = WorkingModeEntity(
      workingMode: 3,
      cyclicConfig: [
        WorkingModeCyclicConfigEntity(
          isAllDay: 2,
          startTime: 480,
          endTime: 1080,
          weekDays: [1, 2, 3],
        ),
      ],
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.setWorkingMode(lock(), custom).run();
    expect(r.isLeft(), isTrue);
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err as AppBusinessException).code, -3);
    verifyNever(
      () => repo.configWorkingMode(
        any(),
        workingMode: any(named: 'workingMode'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('setWorkingMode：无网关 + 全天工作 → 业务失败（远程-only，不编造 BLE 映射）', () async {
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setWorkingMode(lock(), const WorkingModeEntity(workingMode: 1))
        .run();
    expect(r.isLeft(), isTrue);
    expect(r.getLeft().toNullable(), isA<AppBusinessException>());
    verifyNever(
      () => repo.configWorkingMode(
        any(),
        workingMode: any(named: 'workingMode'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('getUnauthorizedAttempt 透传 repo.getExtraSetting(type=0)', () async {
    when(() => repo.getExtraSetting(1, type: 0)).thenAnswer(
      (_) => TaskEither.right(
        const ExtraSettingEntity(flag: 1, count: 5, lockTime: 60),
      ),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.getUnauthorizedAttempt(1).run();
    expect(r.getRight().toNullable()!.count, 5);
    verify(() => repo.getExtraSetting(1, type: 0)).called(1);
  });

  test(
    'setUnauthorizedAttempt：有网关远程成功 → channel=gatewayWifi，不调 bleSynced',
    () async {
      when(
        () => repo.updateUnauthorizedAttemptAlert(
          any(),
          channel: any(named: 'channel'),
          flag: any(named: 'flag'),
          count: any(named: 'count'),
          lockTime: any(named: 'lockTime'),
          pwd: any(named: 'pwd'),
          card: any(named: 'card'),
          fingerprint: any(named: 'fingerprint'),
        ),
      ).thenAnswer((_) => TaskEither.right(unit));
      final domain = container.read(lockDomainProvider.notifier);
      const extra = ExtraSettingEntity(
        flag: 1,
        count: 5,
        lockTime: 60,
        pwd: 1,
        card: 0,
        fingerprint: 1,
      );
      final r = await domain
          .setUnauthorizedAttempt(lock(hasGateway: true), extra)
          .run();
      expect(r.isRight(), isTrue);
      verify(
        () => repo.updateUnauthorizedAttemptAlert(
          1,
          channel: ChannelType.gatewayWifi,
          flag: 1,
          count: 5,
          lockTime: 60,
          pwd: 1,
          card: 0,
          fingerprint: 1,
        ),
      ).called(1);
      verifyNever(
        () => repo.updateUnauthorizedAttemptAlert(
          any(),
          channel: ChannelType.bleSynced,
          flag: any(named: 'flag'),
          count: any(named: 'count'),
          lockTime: any(named: 'lockTime'),
          pwd: any(named: 'pwd'),
          card: any(named: 'card'),
          fingerprint: any(named: 'fingerprint'),
        ),
      );
    },
  );

  test('setUnauthorizedAttempt：无网关 → 业务失败 code=-4，不调 repo', () async {
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .setUnauthorizedAttempt(
          lock(),
          const ExtraSettingEntity(flag: 1, count: 5, lockTime: 60),
        )
        .run();
    expect(r.isLeft(), isTrue);
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err as AppBusinessException).code, -4);
    expect(err.code, isNot(-3));
    verifyNever(
      () => repo.updateUnauthorizedAttemptAlert(
        any(),
        channel: any(named: 'channel'),
        flag: any(named: 'flag'),
        count: any(named: 'count'),
        lockTime: any(named: 'lockTime'),
        pwd: any(named: 'pwd'),
        card: any(named: 'card'),
        fingerprint: any(named: 'fingerprint'),
      ),
    );
  });

  test('getWifiInfo 透传 wifi repo detail', () async {
    when(() => wifiRepo.detail(1)).thenAnswer(
      (_) => TaskEither.right(
        const WifiLockEntity(networkName: 'home', rssiGrade: 2),
      ),
    );
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain.getWifiInfo(1).run();
    expect(r.getRight().toNullable()!.networkName, 'home');
  });

  // ---- configureWifiNetwork（WiFi 锁配网）----

  /// `updateNetwork` 全字段匹配器调用：供 stubConfigureWifi 打桩使用
  /// （mocktail 要求 named 实参键集完全一致）。
  TaskEither<AppException, Unit> updateNetworkCall() => wifiRepo.updateNetwork(
    1,
    networkName: any(named: 'networkName'),
    wifiMac: any(named: 'wifiMac'),
    rssi: any(named: 'rssi'),
    useStaticIp: any(named: 'useStaticIp'),
    ip: any(named: 'ip'),
    subnetMask: any(named: 'subnetMask'),
    defaultGateway: any(named: 'defaultGateway'),
    preferredDns: any(named: 'preferredDns'),
    alternateDns: any(named: 'alternateDns'),
  );

  /// 配网链路必过的 BLE + 云端 stub：configWifi / configServer / getWifiInfo /
  /// updateNetwork。站点固定 cn → `cnwifilock.ttlock.com:4999`。
  void stubConfigureWifi(
    LockEntity l, {
    String wifiName = 'Office',
    String wifiPassword = 'pw123456',
  }) {
    when(
      () => ttlock.configWifi(wifiName, wifiPassword, l.lockMac, l.lockData),
    ).thenAnswer((_) async {});
    when(
      () => ttlock.configServer('cnwifilock.ttlock.com', '4999', l.lockData),
    ).thenAnswer((_) async {});
    when(() => ttlock.getWifiInfo(l.lockData)).thenAnswer(
      (_) async => TTWifiInfoModel(wifiMac: 'WIFI:MAC', wifiRssi: -45),
    );
    when(updateNetworkCall).thenAnswer((_) => TaskEither.right(unit));
  }

  test(
    'configureWifiNetwork：configWifi → configServer(站点端点) → getWifiInfo → updateNetwork',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
          )
          .run();

      expect(r.isRight(), isTrue);
      // 顺序断言 + 云端同步载荷：wifiMac 透传；rssi -45 → 3 档；
      // 未填高级设置全为 null。
      verifyInOrder([
        () => ttlock.configWifi('Office', 'pw123456', l.lockMac, l.lockData),
        () => ttlock.configServer('cnwifilock.ttlock.com', '4999', l.lockData),
        () => ttlock.getWifiInfo(l.lockData),
        () => wifiRepo.updateNetwork(
          1,
          networkName: 'Office',
          wifiMac: 'WIFI:MAC',
          rssi: 3,
          useStaticIp: false,
          ip: null,
          subnetMask: null,
          defaultGateway: null,
          preferredDns: null,
          alternateDns: null,
        ),
      ]);
    },
  );

  test(
    'configureWifiNetwork：wifiRssi → rssiGrade（-127→0；≥-50→3；≥-70→2；否则 1）',
    () async {
      final l = lock();
      for (final rssi in [-127, -50, -70, -71]) {
        stubConfigureWifi(l);
        when(() => ttlock.getWifiInfo(l.lockData)).thenAnswer(
          (_) async => TTWifiInfoModel(wifiMac: 'WIFI:MAC', wifiRssi: rssi),
        );
        final domain = container.read(lockDomainProvider.notifier);
        final r = await domain
            .configureWifiNetwork(
              lock: l,
              wifiName: 'Office',
              wifiPassword: 'pw123456',
            )
            .run();
        expect(r.isRight(), isTrue);
      }

      final captured = verify(
        () => wifiRepo.updateNetwork(
          1,
          networkName: any(named: 'networkName'),
          wifiMac: any(named: 'wifiMac'),
          rssi: captureAny(named: 'rssi'),
          useStaticIp: any(named: 'useStaticIp'),
          ip: any(named: 'ip'),
          subnetMask: any(named: 'subnetMask'),
          defaultGateway: any(named: 'defaultGateway'),
          preferredDns: any(named: 'preferredDns'),
          alternateDns: any(named: 'alternateDns'),
        ),
      ).captured;
      expect(captured, [0, 3, 2, 1]);
    },
  );

  test('configureWifiNetwork：高级设置全空 → 不调用 configIp', () async {
    final l = lock();
    stubConfigureWifi(l);
    final domain = container.read(lockDomainProvider.notifier);
    await domain
        .configureWifiNetwork(
          lock: l,
          wifiName: 'Office',
          wifiPassword: 'pw123456',
        )
        .run();

    verifyNever(() => ttlock.configIp(any(), any()));
  });

  test(
    'configureWifiNetwork：传 staticIp → configIp 的 type 为 staticIp.index（0）',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      when(() => ttlock.configIp(any(), l.lockData)).thenAnswer((_) async {});
      final domain = container.read(lockDomainProvider.notifier);
      await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
            staticIp: '192.168.1.50',
            subnetMask: '255.255.255.0',
            defaultGateway: '192.168.1.1',
            preferredDns: '8.8.8.8',
            alternateDns: '8.8.4.4',
          )
          .run();

      final setting =
          verify(() => ttlock.configIp(captureAny(), any())).captured.single
              as TTIpSetting;
      // TTIpSettingType.staticIp == 0（枚举顺序见 pin 版 messages.g.dart）；
      // 用字面量而非 .index，避免实现与断言同源、枚举顺序反转时假绿。
      expect(setting.type, 0);
      expect(setting.ipAddress, '192.168.1.50');
      expect(setting.subnetMask, '255.255.255.0');
      expect(setting.router, '192.168.1.1');
      expect(setting.preferredDns, '8.8.8.8');
      expect(setting.alternateDns, '8.8.4.4');
    },
  );

  test(
    'configureWifiNetwork：仅传 DNS 不传 IP → configIp 的 type 为 dhcp.index（1）',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      when(() => ttlock.configIp(any(), l.lockData)).thenAnswer((_) async {});
      final domain = container.read(lockDomainProvider.notifier);
      await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
            preferredDns: '8.8.8.8',
          )
          .run();

      final setting =
          verify(() => ttlock.configIp(captureAny(), any())).captured.single
              as TTIpSetting;
      // TTIpSettingType.dhcp == 1（同 src 上方说明）。
      expect(setting.type, 1);
      expect(setting.ipAddress, isNull);
      expect(setting.preferredDns, '8.8.8.8');
    },
  );

  test(
    'configureWifiNetwork：填充静态 IP → 云端 updateNetwork 收到 useStaticIp=true 与各字段',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      when(() => ttlock.configIp(any(), l.lockData)).thenAnswer((_) async {});
      final domain = container.read(lockDomainProvider.notifier);
      final r = await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
            staticIp: '192.168.1.50',
            subnetMask: '255.255.255.0',
            defaultGateway: '192.168.1.1',
            preferredDns: '8.8.8.8',
            alternateDns: '8.8.4.4',
          )
          .run();

      expect(r.isRight(), isTrue);
      // 静态 IP 回显后必须写入 useStaticIp=true，且字段随 payload 一并上云。
      verify(
        () => wifiRepo.updateNetwork(
          1,
          networkName: 'Office',
          wifiMac: 'WIFI:MAC',
          rssi: 3,
          useStaticIp: true,
          ip: '192.168.1.50',
          subnetMask: '255.255.255.0',
          defaultGateway: '192.168.1.1',
          preferredDns: '8.8.8.8',
          alternateDns: '8.8.4.4',
        ),
      ).called(1);
    },
  );

  test(
    'configureWifiNetwork：powerSavingModeOn 为 null → 不调用 setLockConfig',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      final domain = container.read(lockDomainProvider.notifier);
      await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
          )
          .run();

      verifyNever(
        () => ttlock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          any(),
          any(),
        ),
      );
    },
  );

  test(
    'configureWifiNetwork：powerSavingModeOn 为 true → setLockConfig(config, true, lockData)',
    () async {
      final l = lock();
      stubConfigureWifi(l);
      when(
        () => ttlock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          true,
          l.lockData,
        ),
      ).thenAnswer((_) async {});
      final domain = container.read(lockDomainProvider.notifier);
      await domain
          .configureWifiNetwork(
            lock: l,
            wifiName: 'Office',
            wifiPassword: 'pw123456',
            powerSavingModeOn: true,
          )
          .run();

      verify(
        () => ttlock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          true,
          l.lockData,
        ),
      ).called(1);
    },
  );

  test('configureWifiNetwork：configServer 失败 → Left（后续步骤不下发）', () async {
    final l = lock();
    stubConfigureWifi(l);
    when(
      () => ttlock.configServer('cnwifilock.ttlock.com', '4999', l.lockData),
    ).thenThrow(AppException.firmware(message: 'ble fail'));
    final domain = container.read(lockDomainProvider.notifier);
    final r = await domain
        .configureWifiNetwork(
          lock: l,
          wifiName: 'Office',
          wifiPassword: 'pw123456',
        )
        .run();

    expect(r.isLeft(), isTrue);
    verifyNever(() => ttlock.getWifiInfo(any()));
    verifyNever(
      () => wifiRepo.updateNetwork(
        any(),
        networkName: any(named: 'networkName'),
        wifiMac: any(named: 'wifiMac'),
        rssi: any(named: 'rssi'),
        useStaticIp: any(named: 'useStaticIp'),
        ip: any(named: 'ip'),
        subnetMask: any(named: 'subnetMask'),
        defaultGateway: any(named: 'defaultGateway'),
        preferredDns: any(named: 'preferredDns'),
        alternateDns: any(named: 'alternateDns'),
      ),
    );
  });
}
