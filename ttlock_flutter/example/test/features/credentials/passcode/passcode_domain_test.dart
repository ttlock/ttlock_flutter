import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/repository/keyboard_pwd_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockKeyboardPwdRepo extends Mock implements KeyboardPwdRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeKeyboardPwdRepository extends KeyboardPwdRepository {
  _FakeKeyboardPwdRepository(this._mock);
  final _MockKeyboardPwdRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    String? searchStr,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _mock.list(
    lockId,
    searchStr: searchStr,
    pageNo: pageNo,
    pageSize: pageSize,
    orderBy: orderBy,
  );

  @override
  TaskEither<AppException, int> add(
    int lockId, {
    required String keyboardPwd,
    String? keyboardPwdName,
    KeyboardPwdType keyboardPwdType = KeyboardPwdType.limited,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.add(
    lockId,
    keyboardPwd: keyboardPwd,
    keyboardPwdName: keyboardPwdName,
    keyboardPwdType: keyboardPwdType,
    startDate: startDate,
    endDate: endDate,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> change(
    int lockId,
    int keyboardPwdId, {
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? startDate,
    DateTime? endDate,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.change(
    lockId,
    keyboardPwdId,
    keyboardPwdName: keyboardPwdName,
    newKeyboardPwd: newKeyboardPwd,
    startDate: startDate,
    endDate: endDate,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int keyboardPwdId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.delete(lockId, keyboardPwdId, channel: channel);

  @override
  TaskEither<AppException, KeyboardPwdEntity> getRandom(
    int lockId, {
    required KeyboardPwdType keyboardPwdType,
    String? keyboardPwdName,
    required DateTime startDate,
    DateTime? endDate,
  }) => _mock.getRandom(
    lockId,
    keyboardPwdType: keyboardPwdType,
    keyboardPwdName: keyboardPwdName,
    startDate: startDate,
    endDate: endDate,
  );
}

void main() {
  late _MockKeyboardPwdRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late PasscodeDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(KeyboardPwdType.limited);
    registerFallbackValue(ChannelType.gatewayWifi);
    registerFallbackValue(const LockEntity());
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockKeyboardPwdRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer(
      overrides: [
        keyboardPwdRepositoryProvider.overrideWith(
          () => _FakeKeyboardPwdRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(passcodeDomainProvider.notifier);
  });

  test('addCustom：有网关时只调 repo addType=2，不碰 BLE', () async {
    when(
      () => repo.add(
        1,
        keyboardPwd: '123456',
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: KeyboardPwdType.limited,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    final r = await domain
        .addCustom(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          keyboardPwd: '123456',
          type: KeyboardPwdType.limited,
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.getRight().toNullable(), 8);
    verifyNever(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('addCustom：网关失败且有 lockData → BLE 再 bleSynced', () async {
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.gatewayWifi,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.bleSynced,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((_) => TaskEither.right(9));
    final r = await domain
        .addCustom(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          keyboardPwd: '123456',
          type: KeyboardPwdType.limited,
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.getRight().toNullable(), 9);
    verify(
      () => ttlock.createCustomPasscode('123456', any(), any(), 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('getRandom 不调用 BLE', () async {
    when(
      () => repo.getRandom(
        1,
        keyboardPwdType: KeyboardPwdType.once,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        keyboardPwdName: any(named: 'keyboardPwdName'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(const KeyboardPwdEntity(keyboardPwd: '111111')),
    );
    await domain
        .getRandom(
          lockId: 1,
          type: KeyboardPwdType.once,
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 1, 2),
        )
        .run();
    verifyNever(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('getRandom 循环类型转发 keyboardPwdType=5 且带起止', () async {
    when(
      () => repo.getRandom(
        1,
        keyboardPwdType: KeyboardPwdType.cyclicWeekend,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        keyboardPwdName: any(named: 'keyboardPwdName'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(const KeyboardPwdEntity(keyboardPwd: '222222')),
    );
    await domain
        .getRandom(
          lockId: 1,
          type: KeyboardPwdType.cyclicWeekend,
          start: DateTime(2026, 1, 3, 8),
          end: DateTime(2026, 1, 3, 17),
        )
        .run();
    verify(
      () => repo.getRandom(
        1,
        keyboardPwdType: KeyboardPwdType.cyclicWeekend,
        startDate: DateTime(2026, 1, 3, 8),
        endDate: DateTime(2026, 1, 3, 17),
        keyboardPwdName: any(named: 'keyboardPwdName'),
      ),
    ).called(1);
  });

  test('addCustom：非法密码不发请求', () async {
    final r = await domain
        .addCustom(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          keyboardPwd: '12',
          type: KeyboardPwdType.permanent,
        )
        .run();
    expect(r.getLeft().toNullable(), isA<AppBusinessException>());
    verifyNever(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('addCustom：永久 BLE 传 startDate=0,endDate=0', () async {
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.gatewayWifi,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.bleSynced,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((_) => TaskEither.right(1));
    await domain
        .addCustom(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          keyboardPwd: '123456',
          type: KeyboardPwdType.permanent,
        )
        .run();
    verify(
      () => ttlock.createCustomPasscode('123456', 0, 0, 'ld', timeout: any(named: 'timeout')),
    ).called(1);
    verify(
      () => repo.add(
        1,
        keyboardPwd: '123456',
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: KeyboardPwdType.permanent,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });

  test('addCustom：无网关且 lockData 空 → ble_unreachable，不碰 BLE', () async {
    final r = await domain
        .addCustom(
          lock: const LockEntity(lockId: 1),
          keyboardPwd: '123456',
          type: KeyboardPwdType.permanent,
        )
        .run();
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err! as AppBusinessException).code, -21);
    verifyNever(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('addCustom：BLE 成功但 bleSynced 失败 → 整单 Left，不回滚', () async {
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.gatewayWifi,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.createCustomPasscode(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        keyboardPwd: any(named: 'keyboardPwd'),
        channel: ChannelType.bleSynced,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        keyboardPwdType: any(named: 'keyboardPwdType'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('sync'), message: 'sync'),
      ),
    );
    final r = await domain
        .addCustom(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          keyboardPwd: '123456',
          type: KeyboardPwdType.permanent,
        )
        .run();
    expect(r.isLeft(), isTrue);
    verify(
      () => ttlock.createCustomPasscode('123456', 0, 0, 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('list 透传 repo.list', () async {
    when(
      () => repo.list(
        1,
        searchStr: any(named: 'searchStr'),
        pageNo: 1,
        pageSize: 20,
        orderBy: 1,
      ),
    ).thenAnswer(
      (_) => TaskEither.right(const [
        KeyboardPwdEntity(keyboardPwdId: 1, keyboardPwd: '111111'),
      ]),
    );
    final items = (await domain.list(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(items.single.keyboardPwdId, 1);
  });

  test('delete：有网关时只调 repo channel=gatewayWifi，不碰 BLE', () async {
    when(
      () => repo.delete(1, 7, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
        )
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(() => ttlock.deletePasscode(any(), any(), timeout: any(named: 'timeout')));
  });

  test('delete：网关失败且有 lockData → BLE 再 bleSynced', () async {
    when(
      () => repo.delete(any(), any(), channel: ChannelType.gatewayWifi),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(() => ttlock.deletePasscode(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async {});
    when(
      () => repo.delete(any(), any(), channel: ChannelType.bleSynced),
    ).thenAnswer((_) => TaskEither.right(unit));
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(() => ttlock.deletePasscode('123456', 'ld', timeout: any(named: 'timeout'))).called(1);
  });

  test('change：有网关时只调 repo channel=gatewayWifi，不碰 BLE', () async {
    when(
      () => repo.change(
        1,
        7,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .change(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
          keyboardPwdName: 'n',
        )
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(
      () => ttlock.modifyPasscode(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('change：非法 newKeyboardPwd 不发请求', () async {
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .change(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
          newKeyboardPwd: '12',
        )
        .run();
    expect(r.getLeft().toNullable(), isA<AppBusinessException>());
    expect(
      (r.getLeft().toNullable()! as AppBusinessException).message,
      'invalid_passcode',
    );
    verifyNever(
      () => repo.change(
        any(),
        any(),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: any(named: 'channel'),
      ),
    );
    verifyNever(
      () => ttlock.modifyPasscode(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('change：网关失败且改密 → modifyPasscode 再 bleSynced', () async {
    when(
      () => repo.change(
        any(),
        any(),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.modifyPasscode(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.change(
        any(),
        any(),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .change(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
          newKeyboardPwd: '654321',
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyPasscode('123456', '654321', any(), any(), 'ld', timeout: any(named: 'timeout')),
    ).called(1);
    verify(
      () => repo.change(
        1,
        7,
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: '654321',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });

  test('change：仅改名 → verifyNever modifyPasscode（needsBle=false）', () async {
    when(
      () => repo.change(
        any(),
        any(),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => repo.change(
        any(),
        any(),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const pwd = KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456');
    final r = await domain
        .change(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          pwd: pwd,
          keyboardPwdName: 'renamed',
        )
        .run();
    expect(r.isRight(), isTrue);
    verifyNever(
      () => ttlock.modifyPasscode(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
    verify(
      () => repo.change(
        1,
        7,
        keyboardPwdName: 'renamed',
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });
}
