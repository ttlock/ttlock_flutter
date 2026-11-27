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
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/data_source/fingerprint_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/data_source/fingerprint_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/model/fingerprint_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/repository/fingerprint_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';

class _MockFingerprintApi extends Mock implements FingerprintApi {}

void main() {
  test('FingerprintDto fromJson(字段对齐 cloud 列表)', () {
    final e = FingerprintDto.fromJson({
      'fingerprintId': 224242,
      'lockId': 163377,
      'fingerprintNumber': '44668054142981',
      'fingerprintType': 1,
      'fingerprintName': '妈妈的指纹',
      'startDate': 1625025703000,
      'endDate': 1645025703000,
      'senderUsername': 'alexa@google.com',
    }).toEntity();
    expect(e.fingerprintNumber, '44668054142981');
    expect(e.fingerprintType, CredentialType.normal);
    expect(e.senderUsername, 'alexa@google.com');
  });

  test('FingerprintDto cyclicConfig 与 fingerprintType 循环', () {
    final dto = FingerprintDto.fromJson({
      'fingerprintType': 4,
      'cyclicConfig': [
        {'weekDay': 1, 'startTime': 480, 'endTime': 1080},
      ],
    });
    final entity = dto.toEntity();
    expect(entity.fingerprintType, CredentialType.cycle);
    expect(entity.cyclicConfig.single.startTime, 480);
  });

  test('addByGateway 路径为 /v3/fingerprint/addByGateway 且 addType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/fingerprint/addByGateway', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'fingerprintId': 224242};
      });
    }, data: Matchers.any);
    await FingerprintApi(dio).addByGateway(
      lockId: 163377,
      fingerprintData: 'fp-data-hex',
      fingerprintName: '妈妈的指纹',
    );
    expect(sent?['addType'], 2);
    expect(sent?['lockId'], 163377);
    expect(sent?['fingerprintData'], 'fp-data-hex');
  });

  test('add 携带 addType=2（gatewayWifi）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/fingerprint/add', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'fingerprintId': 1};
      });
    }, data: Matchers.any);
    await FingerprintApi(dio).add(
      lockId: 163377,
      fingerprintNumber: '44668054142981',
      addType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['addType'], 2);
    expect(sent?['fingerprintNumber'], '44668054142981');
  });

  test('delete 携带 deleteType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/fingerprint/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await FingerprintApi(dio).delete(
      lockId: 163377,
      fingerprintId: 224242,
      deleteType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['deleteType'], 2);
    expect(sent?['fingerprintId'], 224242);
  });

  test('changePeriod 携带 changeType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/fingerprint/changePeriod', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await FingerprintApi(dio).changePeriod(
      lockId: 163377,
      fingerprintId: 224242,
      startDate: 1626945087000,
      endDate: 1846945087000,
      changeType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['changeType'], 2);
    expect(sent?['startDate'], 1626945087000);
  });

  test('FingerprintRepository.list 经 mock Api 返回 List', () async {
    final api = _MockFingerprintApi();
    when(
      () => api.list(
        lockId: 163377,
        searchStr: null,
        pageNo: 1,
        pageSize: 200,
        orderBy: 1,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'fingerprintId': 224242,
            'lockId': 163377,
            'fingerprintNumber': '44668054142981',
            'fingerprintType': 1,
            'fingerprintName': '妈妈的指纹',
          },
        ],
        'pageNo': 1,
        'pageSize': 200,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [fingerprintApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(fingerprintRepositoryProvider.notifier);
    final r = await repo.list(163377).run();
    expect(r, isA<Right<AppException, List<FingerprintEntity>>>());
    final list = r.getOrElse((_) => const []);
    expect(list.single.fingerprintId, 224242);
    expect(list.single.fingerprintNumber, '44668054142981');
  });

  test('FingerprintRepository.add 返回 fingerprintId', () async {
    final api = _MockFingerprintApi();
    when(
      () => api.add(
        lockId: 163377,
        fingerprintNumber: '44668054142981',
        fingerprintType: CredentialType.normal.value,
        fingerprintName: '妈妈的指纹',
        startDate: null,
        endDate: null,
        cyclicConfig: null,
        addType: ChannelType.bleSynced.value,
      ),
    ).thenAnswer((_) async => {'fingerprintId': 224242});
    final container = ProviderContainer(
      overrides: [fingerprintApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(fingerprintRepositoryProvider.notifier);
    final r = await repo
        .add(163377, '44668054142981', fingerprintName: '妈妈的指纹')
        .run();
    expect(r.getOrElse((_) => 0), 224242);
  });

  test('FingerprintRepository.addByGateway 返回 fingerprintId', () async {
    final api = _MockFingerprintApi();
    when(
      () => api.addByGateway(
        lockId: 163377,
        fingerprintData: 'fp-data',
        fingerprintType: CredentialType.normal.value,
        fingerprintName: null,
        startDate: null,
        endDate: null,
        cyclicConfig: null,
        addType: ChannelType.gatewayWifi.value,
      ),
    ).thenAnswer((_) async => {'fingerprintId': 99});
    final container = ProviderContainer(
      overrides: [fingerprintApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(fingerprintRepositoryProvider.notifier);
    final r = await repo.addByGateway(163377, 'fp-data').run();
    expect(r.getOrElse((_) => 0), 99);
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockFingerprintApi();
    when(
      () => api.add(
        lockId: 1,
        fingerprintNumber: 'x',
        fingerprintType: CredentialType.normal.value,
        fingerprintName: null,
        startDate: null,
        endDate: null,
        cyclicConfig: null,
        addType: ChannelType.bleSynced.value,
      ),
    ).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '失败', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [fingerprintApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(fingerprintDataSourceProvider.notifier);
    final result = await ds.add(lockId: 1, fingerprintNumber: 'x').run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockFingerprintApi();
    when(
      () => api.delete(lockId: 163377, fingerprintId: 1, deleteType: 1),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.clear(lockId: 163377),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.rename(lockId: 163377, fingerprintId: 1, fingerprintName: '新名'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [fingerprintApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(fingerprintRepositoryProvider.notifier);

    final failed = await repo.delete(163377, 1).run();
    expect(failed.isLeft(), isTrue);

    final cleared = await repo.clear(163377).run();
    expect(cleared, isA<Right<AppException, Unit>>());

    final renamed = await repo.rename(163377, 1, '新名').run();
    expect(renamed, isA<Right<AppException, Unit>>());
  });
}
