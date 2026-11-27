import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/repository/key_repository.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';

class _MockKeyRepo extends Mock implements KeyRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeKeyRepository extends KeyRepository {
  _FakeKeyRepository(this._mock);
  final _MockKeyRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<KeyEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _mock.list(lockId, pageNo: pageNo, pageSize: pageSize);

  @override
  TaskEither<AppException, int> send(
    int lockId,
    String username, {
    String? keyName,
    DateTime? startDate,
    DateTime? endDate,
    KeyUserType? userType,
  }) => _mock.send(
    lockId,
    username,
    keyName: keyName,
    startDate: startDate,
    endDate: endDate,
    userType: userType,
  );

  @override
  TaskEither<AppException, Unit> authorize(int lockId, int keyId) =>
      _mock.authorize(lockId, keyId);
}

void main() {
  late _MockKeyRepo repo;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(KeyUserType.normal);
  });

  setUp(() {
    repo = _MockKeyRepo();
    container = ProviderContainer(
      overrides: [
        keyRepositoryProvider.overrideWith(() => _FakeKeyRepository(repo)),
      ],
    );
    addTearDown(container.dispose);
  });

  test('sendKey 空 username → Left business', () async {
    final domain = container.read(ekeyDomainProvider.notifier);
    final r = await domain.sendKey(lockId: 1, username: '  ').run();
    expect(r.getLeft().toNullable(), isA<AppBusinessException>());
    expect((r.getLeft().toNullable()! as AppBusinessException).code, -20);
    verifyNever(
      () => repo.send(
        any(),
        any(),
        keyName: any(named: 'keyName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        userType: any(named: 'userType'),
      ),
    );
  });

  test('sendKey 转发 lockId/username/keyName/period/keyRight', () async {
    when(
      () => repo.send(
        1,
        'u',
        keyName: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        userType: KeyUserType.admin,
      ),
    ).thenAnswer((_) => TaskEither.right(99));
    final domain = container.read(ekeyDomainProvider.notifier);
    final r = await domain
        .sendKey(
          lockId: 1,
          username: 'u',
          keyName: 'n',
          startDate: DateTime(2026, 1, 1),
          endDate: DateTime(2026, 12, 31),
          authorized: true,
        )
        .run();
    expect(r.getRight().toNullable(), 99);
    verify(
      () => repo.send(
        1,
        'u',
        keyName: 'n',
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2026, 12, 31),
        userType: KeyUserType.admin,
      ),
    ).called(1);
    verifyNever(() => repo.authorize(any(), any()));
  });

  test('listKeys 透传 repo.list', () async {
    when(() => repo.list(1, pageNo: 1, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(
        const PageState(data: [KeyEntity(keyId: 1)], total: 1),
      ),
    );
    final domain = container.read(ekeyDomainProvider.notifier);
    final page = (await domain.listKeys(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(page.data.single.keyId, 1);
  });
}
