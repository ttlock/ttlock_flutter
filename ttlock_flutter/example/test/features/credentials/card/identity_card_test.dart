import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/data_source/identity_card_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/data_source/identity_card_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/model/identity_card_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/repository/identity_card_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';

class _MockIdentityCardApi extends Mock implements IdentityCardApi {}

void main() {
  test('IdentityCardDto fromJson + toEntity', () {
    final e = IdentityCardDto.fromJson({
      'cardId': 1,
      'cardNumber': 'FF0000AA',
      'cardName': '门禁卡',
      'cardType': 4,
    }).toEntity();
    expect(e.cardNumber, 'FF0000AA');
    expect(e.cardType, CredentialType.cycle);
    expect(e.cardName, '门禁卡');
  });

  test('IdentityCardDto cyclicConfig 解析', () {
    final dto = IdentityCardDto.fromJson({
      'cardId': 1,
      'cyclicConfig': [
        {'weekDay': 1, 'startTime': 480, 'endTime': 1080},
      ],
    });
    final entity = dto.toEntity();
    expect(entity.cyclicConfig, hasLength(1));
    expect(entity.cyclicConfig.first.weekDay, 1);
    expect(entity.cyclicConfig.first.startTime, 480);
    expect(entity.cyclicConfig.first.endTime, 1080);
  });

  test('IdentityCardDto 容错：数字字段以 String 返回', () {
    final dto = IdentityCardDto.fromJson({
      'cardId': '124242',
      'lockId': '163377',
      'cardNumber': '1723612378',
      'cardType': '1',
      'startDate': '1625025703000',
    });
    final entity = dto.toEntity();
    expect(entity.cardId, 124242);
    expect(entity.lockId, 163377);
    expect(entity.cardType, CredentialType.normal);
    expect(
      entity.startDate,
      DateTime.fromMillisecondsSinceEpoch(1625025703000),
    );
  });

  test('IdentityCardRepository.list 经 mock Api 返回 List', () async {
    final api = _MockIdentityCardApi();
    when(
      () => api.list(
        lockId: 163377,
        searchStr: null,
        pageNo: 1,
        pageSize: 200,
        orderBy: 0,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'cardId': 124242,
            'lockId': 163377,
            'cardNumber': '1723612378',
            'cardName': '妈妈的卡',
            'cardType': 1,
          },
        ],
        'pageNo': 1,
        'pageSize': 200,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [identityCardApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(identityCardRepositoryProvider.notifier);
    final r = await repo.list(163377).run();
    expect(r, isA<Right<AppException, List<IdentityCardEntity>>>());
    final list = r.getOrElse((_) => const []);
    expect(list.single.cardId, 124242);
    expect(list.single.cardNumber, '1723612378');
  });

  test('IdentityCardRepository.add 返回 cardId', () async {
    final api = _MockIdentityCardApi();
    when(
      () => api.add(
        lockId: 163377,
        cardNumber: '3661413478',
        cardName: '妈妈的卡',
        startDate: 0,
        endDate: 0,
        cardType: null,
        cyclicConfig: null,
        addType: 1,
      ),
    ).thenAnswer((_) async => {'cardId': 124242});
    final container = ProviderContainer(
      overrides: [identityCardApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(identityCardRepositoryProvider.notifier);
    final r = await repo
        .add(
          163377,
          '3661413478',
          cardName: '妈妈的卡',
          channel: ChannelType.bleSynced,
        )
        .run();
    expect(r.getOrElse((_) => 0), 124242);
  });

  test('add HTTP errcode!=0 映射为 AppException', () async {
    final api = _MockIdentityCardApi();
    when(
      () => api.add(
        lockId: 1,
        cardNumber: 'x',
        cardName: null,
        startDate: 0,
        endDate: 0,
        cardType: null,
        cyclicConfig: null,
        addType: 1,
      ),
    ).thenAnswer(
      (_) async => {'errcode': -4056, 'errmsg': '空间已满', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [identityCardApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(identityCardDataSourceProvider.notifier);
    final result = await ds
        .add(lockId: 1, cardNumber: 'x', startDate: 0, endDate: 0)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -4056);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockIdentityCardApi();
    when(
      () => api.delete(lockId: 163377, cardId: 124242, deleteType: 2),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.clear(lockId: 163377),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.rename(lockId: 163377, cardId: 124242, cardName: '新名'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [identityCardApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(identityCardDataSourceProvider.notifier);

    final failed = await ds
        .delete(
          lockId: 163377,
          cardId: 124242,
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final cleared = await ds.clear(lockId: 163377).run();
    expect(cleared.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('add 经网关走 addForReversedCardNumber 且 addType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    var hitReversed = false;
    adapter.onPost('/v3/identityCard/addForReversedCardNumber', (server) {
      server.replyCallback(200, (options) {
        hitReversed = true;
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'cardId': 124242};
      });
    }, data: Matchers.any);
    await IdentityCardApi(dio).addForReversedCardNumber(
      lockId: 163377,
      cardNumber: '3661413478',
      startDate: 0,
      endDate: 0,
      addType: 2,
    );
    expect(hitReversed, isTrue);
    expect(sent?['lockId'], 163377);
    expect(sent?['cardNumber'], '3661413478');
    expect(sent?['addType'], 2);
  });

  test('changePeriod 携带 changeType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/identityCard/changePeriod', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await IdentityCardApi(dio).changePeriod(
      lockId: 24451,
      cardId: 124242,
      startDate: 1626945087000,
      endDate: 1846945087000,
      changeType: 2,
    );
    expect(sent?['lockId'], 24451);
    expect(sent?['cardId'], 124242);
    expect(sent?['changeType'], 2);
    expect(sent?['startDate'], 1626945087000);
  });

  test('delete 携带 deleteType=1（BLE 同步）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/identityCard/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await IdentityCardApi(
      dio,
    ).delete(lockId: 163377, cardId: 124242, deleteType: 1);
    expect(sent?['cardId'], 124242);
    expect(sent?['deleteType'], 1);
  });

  test(
    'IdentityCardRepository changePeriod / delete / clear / rename 映射 Unit',
    () async {
      final api = _MockIdentityCardApi();
      when(
        () => api.changePeriod(
          lockId: 163377,
          cardId: 124242,
          startDate: 1626945087000,
          endDate: 1846945087000,
          cyclicConfig: null,
          changeType: 1,
        ),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.delete(lockId: 163377, cardId: 124242, deleteType: 1),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.clear(lockId: 163377),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.rename(lockId: 163377, cardId: 124242, cardName: '新名'),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      final container = ProviderContainer(
        overrides: [identityCardApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      final repo = container.read(identityCardRepositoryProvider.notifier);

      final changed = await repo
          .changePeriod(
            163377,
            124242,
            startDate: DateTime.fromMillisecondsSinceEpoch(1626945087000),
            endDate: DateTime.fromMillisecondsSinceEpoch(1846945087000),
          )
          .run();
      expect(changed, isA<Right<AppException, Unit>>());

      final deleted = await repo.delete(163377, 124242).run();
      expect(deleted, isA<Right<AppException, Unit>>());

      final cleared = await repo.clear(163377).run();
      expect(cleared, isA<Right<AppException, Unit>>());

      final renamed = await repo.rename(163377, 124242, '新名').run();
      expect(renamed, isA<Right<AppException, Unit>>());
    },
  );

  test('DataSource.add 网关通道调用 addForReversedCardNumber', () async {
    final api = _MockIdentityCardApi();
    when(
      () => api.addForReversedCardNumber(
        lockId: 163377,
        cardNumber: '3661413478',
        cardName: null,
        startDate: 0,
        endDate: 0,
        cardType: null,
        cyclicConfig: null,
        addType: 2,
      ),
    ).thenAnswer((_) async => {'cardId': 99});
    final container = ProviderContainer(
      overrides: [identityCardApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(identityCardDataSourceProvider.notifier);
    final r = await ds
        .add(
          lockId: 163377,
          cardNumber: '3661413478',
          startDate: 0,
          endDate: 0,
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(r.getOrElse((_) => 0), 99);
    verifyNever(
      () => api.add(
        lockId: any(named: 'lockId'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cardType: any(named: 'cardType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        addType: any(named: 'addType'),
      ),
    );
  });
}
