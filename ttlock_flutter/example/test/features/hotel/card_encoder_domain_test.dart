import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/repository/card_encoder_repository.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/provider/card_encoder_domain.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/repository/card_encoder_repository_interface.dart';

class _MockCardEncoderRepo extends Mock
    implements CardEncoderRepositoryInterface {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeCardEncoderRepo extends CardEncoderRepository
    implements CardEncoderRepositoryInterface {
  _FakeCardEncoderRepo(this._mock);
  final _MockCardEncoderRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, String> getHotelInfo() => _mock.getHotelInfo();

  @override
  TaskEither<AppException, String> getIcKey() => _mock.getIcKey();
}

void main() {
  late _MockCardEncoderRepo repo;
  late ProviderContainer container;
  late CardEncoderDomain domain;

  setUp(() {
    repo = _MockCardEncoderRepo();
    container = ProviderContainer(
      overrides: [
        cardEncoderRepositoryProvider.overrideWith(
          () => _FakeCardEncoderRepo(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(cardEncoderDomainProvider.notifier);
  });

  test('getHotelInfo 成功时返回 hotelInfo 字符串', () async {
    when(
      () => repo.getHotelInfo(),
    ).thenAnswer((_) => TaskEither.right('HOTEL'));

    final r = await domain.getHotelInfo().run();

    expect(r.getOrElse((_) => ''), 'HOTEL');
  });

  test('getHotelInfo 失败时透传 Left', () async {
    when(() => repo.getHotelInfo()).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(code: -29, message: 'card_encoder_unavailable'),
      ),
    );

    final r = await domain.getHotelInfo().run();

    expect(r.isLeft(), isTrue);
    r.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -29);
    }, (_) => fail('expected Left'));
  });

  test('getIcKey 成功时返回 icKey 字符串', () async {
    when(
      () => repo.getIcKey(),
    ).thenAnswer((_) => TaskEither.right('125edbd47f6a'));

    final r = await domain.getIcKey().run();

    expect(r.getOrElse((_) => ''), '125edbd47f6a');
  });
}
