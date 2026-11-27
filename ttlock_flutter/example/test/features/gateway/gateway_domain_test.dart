import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/repository/gateway_repository.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/repository/gateway_repository_interface.dart';

class _MockGatewayRepo extends Mock implements GatewayRepositoryInterface {}

class _FakeGatewayRepoProvider extends GatewayRepository
    implements GatewayRepositoryInterface {
  _FakeGatewayRepoProvider(this._mock);
  final _MockGatewayRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 0,
  }) => _mock.list(pageNo: pageNo, pageSize: pageSize, orderBy: orderBy);

  @override
  TaskEither<AppException, GatewayEntity> detail(int gatewayId) =>
      _mock.detail(gatewayId);

  @override
  TaskEither<AppException, Unit> rename(int gatewayId, String name) =>
      _mock.rename(gatewayId, name);

  @override
  TaskEither<AppException, Unit> delete(int gatewayId) =>
      _mock.delete(gatewayId);

  @override
  TaskEither<AppException, List<GatewayEntity>> listByLock(int lockId) =>
      _mock.listByLock(lockId);

  @override
  TaskEither<AppException, int> confirmInitSuccess(String gatewayNetMac) =>
      _mock.confirmInitSuccess(gatewayNetMac);
}

void main() {
  late _MockGatewayRepo repo;
  late ProviderContainer container;
  late GatewayDomain domain;

  setUp(() {
    repo = _MockGatewayRepo();
    container = ProviderContainer(
      overrides: [
        gatewayRepositoryProvider.overrideWith(
          () => _FakeGatewayRepoProvider(repo),
        ),
      ],
    );
    domain = container.read(gatewayDomainProvider.notifier);
  });

  tearDown(() => container.dispose());

  test('confirmInit gatewayId<=0 → Left(business)', () async {
    when(
      () => repo.confirmInitSuccess('NET:01'),
    ).thenAnswer((_) => TaskEither.right(0));
    final r = await domain.confirmInit('NET:01').run();
    expect(r.isLeft(), isTrue);
    r.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -31);
      expect(e.message, 'gateway_init_not_confirmed');
    }, (_) => fail('expected Left'));
  });

  test('confirmInit gatewayId>0 → Right(id)', () async {
    when(
      () => repo.confirmInitSuccess('NET:01'),
    ).thenAnswer((_) => TaskEither.right(42));
    final r = await domain.confirmInit('NET:01').run();
    expect(r.getRight().toNullable(), 42);
  });

  test('confirmInit 透传 repo 异常（errcode!=0 时为 Left）', () async {
    when(() => repo.confirmInitSuccess('NET:02')).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 1, message: 'fail')),
    );
    final r = await domain.confirmInit('NET:02').run();
    expect(r.isLeft(), isTrue);
  });
}
