import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_api.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_data_source.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/repository/card_encoder_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';

class _MockCardEncoderApi extends Mock implements CardEncoderApi {}

/// class 型 Provider 的 override 必须用可构造子类；这里用来隔离 DataSource，
/// 直接钉住 Repository 的空值裁决。
class _FakeCardEncoderDataSource extends CardEncoderDataSource {
  _FakeCardEncoderDataSource({required this.hotelInfo, required this.icKey});

  final TaskEither<AppException, String> hotelInfo;
  final TaskEither<AppException, String> icKey;

  @override
  void build() {}

  @override
  TaskEither<AppException, String> getHotelInfo() => hotelInfo;

  @override
  TaskEither<AppException, String> getIcKey() => icKey;
}

/// 断言 Left 的业务码，避免只判 `isLeft()` 时换任何错误都能过。
void _expectLeftCode(Either<AppException, String> r, int code) {
  expect(r.isLeft(), isTrue);
  r.fold((e) {
    expect(e, isA<AppBusinessException>());
    expect((e as AppBusinessException).code, code);
  }, (_) => fail('expected Left'));
}

void main() {
  group('CardEncoderRepository._nonEmpty（DataSource 用 fake 隔离）', () {
    late CardEncoderRepository repo;

    void useDataSource({
      required TaskEither<AppException, String> hotelInfo,
      required TaskEither<AppException, String> icKey,
    }) {
      final container = ProviderContainer(
        overrides: [
          cardEncoderDataSourceProvider.overrideWith(
            () =>
                _FakeCardEncoderDataSource(hotelInfo: hotelInfo, icKey: icKey),
          ),
        ],
      );
      addTearDown(container.dispose);
      repo = container.read(cardEncoderRepositoryProvider.notifier);
    }

    test('getHotelInfo：空串 → Left(-29)', () async {
      useDataSource(
        hotelInfo: TaskEither.right(''),
        icKey: TaskEither.right('k'),
      );

      final r = await repo.getHotelInfo().run();

      _expectLeftCode(r, kCardEncoderUnavailableCode);
    });

    test('getIcKey：空串 → Left(-29)', () async {
      useDataSource(
        hotelInfo: TaskEither.right('h'),
        icKey: TaskEither.right(''),
      );

      final r = await repo.getIcKey().run();

      _expectLeftCode(r, kCardEncoderUnavailableCode);
    });

    test('getHotelInfo：非空 → Right 原样透传', () async {
      useDataSource(
        hotelInfo: TaskEither.right('HOTEL'),
        icKey: TaskEither.right('k'),
      );

      final r = await repo.getHotelInfo().run();

      expect(r.getOrElse((_) => ''), 'HOTEL');
    });

    test('getIcKey：非空 → Right 原样透传', () async {
      useDataSource(
        hotelInfo: TaskEither.right('h'),
        icKey: TaskEither.right('125edbd47f6a'),
      );

      final r = await repo.getIcKey().run();

      expect(r.getOrElse((_) => ''), '125edbd47f6a');
    });

    test('getHotelInfo：DataSource 的 Left 原样透传，不被重写成 -29', () async {
      useDataSource(
        hotelInfo: TaskEither.left(
          AppException.business(code: 30008, message: 'cross site'),
        ),
        icKey: TaskEither.right('k'),
      );

      final r = await repo.getHotelInfo().run();

      _expectLeftCode(r, 30008);
    });
  });

  group('Api → DataSource → Repository 全链路', () {
    late _MockCardEncoderApi api;
    late CardEncoderRepository repo;

    setUp(() {
      api = _MockCardEncoderApi();
      final container = ProviderContainer(
        overrides: [cardEncoderApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      repo = container.read(cardEncoderRepositoryProvider.notifier);
    });

    test('getHotelInfo：服务端纯空白 → DTO trim 成空串 → Left(-29)', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 0, 'hotelInfo': '   '});

      final r = await repo.getHotelInfo().run();

      _expectLeftCode(r, kCardEncoderUnavailableCode);
    });

    test('getIcKey：服务端纯空白 → DTO trim 成空串 → Left(-29)', () async {
      when(
        () => api.getIcKey(),
      ).thenAnswer((_) async => {'errcode': 0, 'icKey': ' \n '});

      final r = await repo.getIcKey().run();

      _expectLeftCode(r, kCardEncoderUnavailableCode);
    });

    test('getHotelInfo：errcode 30008 一路到 Repository 仍是 30008 而非 -29', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 30008, 'errmsg': 'cross site'});

      final r = await repo.getHotelInfo().run();

      // 若 _parse 丢掉 errcode，这里会退化成空串 → -29，真实原因被掩盖。
      _expectLeftCode(r, 30008);
    });

    test('getHotelInfo：正常响应 → Right', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 0, 'hotelInfo': 'HOTEL'});

      final r = await repo.getHotelInfo().run();

      expect(r.getOrElse((_) => ''), 'HOTEL');
    });
  });
}
