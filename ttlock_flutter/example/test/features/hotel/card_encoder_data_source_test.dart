import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_api.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_data_source.dart';

class _MockCardEncoderApi extends Mock implements CardEncoderApi {}

/// 断言 Left 的业务码与文案，避免只判 `isLeft()` 时换任何错误都能过。
void _expectLeft(
  Either<AppException, String> r, {
  required int code,
  String? message,
}) {
  expect(r.isLeft(), isTrue);
  r.fold((e) {
    expect(e, isA<AppBusinessException>());
    expect((e as AppBusinessException).code, code);
    if (message != null) expect(e.message, message);
  }, (_) => fail('expected Left'));
}

void main() {
  late _MockCardEncoderApi api;
  late ProviderContainer container;
  late CardEncoderDataSource dataSource;

  setUp(() {
    api = _MockCardEncoderApi();
    container = ProviderContainer(
      overrides: [cardEncoderApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    dataSource = container.read(cardEncoderDataSourceProvider.notifier);
  });

  group('getHotelInfo', () {
    test('errcode 0 → Right(hotelInfo)', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 0, 'hotelInfo': 'HOTEL'});

      final r = await dataSource.getHotelInfo().run();

      expect(r.getOrElse((_) => ''), 'HOTEL');
    });

    test('errcode 30008 → Left(30008)，message 为服务端 errmsg 而非 -29', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 30008, 'errmsg': 'cross site'});

      final r = await dataSource.getHotelInfo().run();

      // 守卫存在的意义：跨站点业务错误不得被解析成空串、进而洗成 -29。
      _expectLeft(r, code: 30008, message: 'cross site');
    });

    test('errcode 非 0 且 errmsg 为空 → 回落 description', () async {
      when(() => api.getHotelInfo()).thenAnswer(
        (_) async => {'errcode': 30008, 'errmsg': '', 'description': 'desc'},
      );

      final r = await dataSource.getHotelInfo().run();

      _expectLeft(r, code: 30008, message: 'desc');
    });

    test('errcode 0 但缺少 hotelInfo 字段 → Right(空串)（空值语义归 Repository）', () async {
      when(() => api.getHotelInfo()).thenAnswer((_) async => {'errcode': 0});

      final r = await dataSource.getHotelInfo().run();

      expect(r.getOrElse((_) => 'x'), '');
    });

    test('errcode 0 → toEntity 两侧 trim', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 0, 'hotelInfo': '  HOTEL  '});

      final r = await dataSource.getHotelInfo().run();

      expect(r.getOrElse((_) => ''), 'HOTEL');
    });

    test('errcode 0 但 hotelInfo 全空白 → Right(空串)（trim 后为空）', () async {
      when(
        () => api.getHotelInfo(),
      ).thenAnswer((_) async => {'errcode': 0, 'hotelInfo': '   '});

      final r = await dataSource.getHotelInfo().run();

      expect(r.getOrElse((_) => 'x'), '');
    });
  });

  group('getIcKey', () {
    test('errcode 0 → Right(icKey)', () async {
      when(
        () => api.getIcKey(),
      ).thenAnswer((_) async => {'errcode': 0, 'icKey': '125edbd47f6a'});

      final r = await dataSource.getIcKey().run();

      expect(r.getOrElse((_) => ''), '125edbd47f6a');
    });

    test('errcode 30008 → Left(30008)，message 为服务端 errmsg 而非 -29', () async {
      when(
        () => api.getIcKey(),
      ).thenAnswer((_) async => {'errcode': 30008, 'errmsg': 'cross site'});

      final r = await dataSource.getIcKey().run();

      _expectLeft(r, code: 30008, message: 'cross site');
    });

    test('errcode 0 → toEntity trim', () async {
      when(
        () => api.getIcKey(),
      ).thenAnswer((_) async => {'errcode': 0, 'icKey': '  125edbd47f6a\n'});

      final r = await dataSource.getIcKey().run();

      expect(r.getOrElse((_) => ''), '125edbd47f6a');
    });

    test('errcode 0 但 icKey 全空白 → Right(空串)', () async {
      when(
        () => api.getIcKey(),
      ).thenAnswer((_) async => {'errcode': 0, 'icKey': '  '});

      final r = await dataSource.getIcKey().run();

      expect(r.getOrElse((_) => 'x'), '');
    });
  });
}
