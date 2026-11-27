import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/data_source/gateway_api.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/data_source/gateway_data_source.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/model/gateway_dto.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/repository/gateway_repository.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';

class _MockGatewayApi extends Mock implements GatewayApi {}

void main() {
  test('GatewayDto fromJson(字段 gatewayMac/gatewayName/isOnline)', () {
    final e = GatewayDto.fromJson({
      'gatewayId': 1,
      'gatewayMac': 'AA:BB',
      'gatewayName': 'G2',
      'gatewayVersion': 2,
      'isOnline': 1,
      'lockNum': 3,
    }).toEntity();
    expect(e.gatewayMac, 'AA:BB');
    expect(e.gatewayVersion, GatewayVersion.g2);
    expect(e.isOnline, isTrue);
    expect(e.lockNum, 3);
  });

  test('GatewayVersion.fromValue 未知值回退 g2', () {
    expect(GatewayVersion.fromValue(null), GatewayVersion.g2);
    expect(GatewayVersion.fromValue(99), GatewayVersion.g2);
    expect(GatewayVersion.fromValue(4), GatewayVersion.g4);
  });

  test('GatewayRepository.list 经 mock Api 返回 PageState', () async {
    final api = _MockGatewayApi();
    when(() => api.list(pageNo: 1, pageSize: 20, orderBy: 0)).thenAnswer(
      (_) async => {
        'list': [
          {
            'gatewayId': 78979,
            'gatewayMac': 'C5:40:E0:9C:8C:C1',
            'gatewayName': '民宿网关',
            'gatewayVersion': 2,
            'isOnline': 1,
            'lockNum': 2,
          },
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(gatewayRepositoryProvider.notifier);
    final r = await repo.list().run();
    expect(r, isA<Right<AppException, dynamic>>());
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.data.single.gatewayId, 78979);
    expect(page.data.single.isOnline, isTrue);
    expect(page.total, 1);
  });

  test('GatewayRepository.detail 映射 GatewayEntity', () async {
    final api = _MockGatewayApi();
    when(() => api.detail(gatewayId: 347)).thenAnswer(
      (_) async => {
        'gatewayId': 347,
        'gatewayMac': 'DC:A4:53:85:39:74',
        'gatewayName': 'G2_743985',
        'gatewayVersion': 2,
        'networkName': 'sciener',
        'isOnline': 0,
        'lockNum': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(gatewayRepositoryProvider.notifier);
    final r = await repo.detail(347).run();
    final entity = r.getOrElse((_) => throw TestFailure('left'));
    expect(entity.gatewayId, 347);
    expect(entity.isOnline, isFalse);
  });

  test('GatewayRepository.listByLock 返回 List', () async {
    final api = _MockGatewayApi();
    when(() => api.listByLock(lockId: 163377)).thenAnswer(
      (_) async => {
        'list': [
          {
            'gatewayId': 78979,
            'gatewayMac': 'C5:40:E0:9C:8C:C1',
            'gatewayName': '民宿1-101-网关',
          },
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(gatewayRepositoryProvider.notifier);
    final r = await repo.listByLock(163377).run();
    final list = r.getOrElse((_) => throw TestFailure('left'));
    expect(list.single.gatewayName, '民宿1-101-网关');
  });

  test('GatewayRepository.rename / delete 映射 Unit', () async {
    final api = _MockGatewayApi();
    when(
      () => api.rename(gatewayId: 124242, gatewayName: '201室网关'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(gatewayId: 78979),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(gatewayRepositoryProvider.notifier);

    final renamed = await repo.rename(124242, '201室网关').run();
    expect(renamed, isA<Right<AppException, Unit>>());

    final deleted = await repo.delete(78979).run();
    expect(deleted, isA<Right<AppException, Unit>>());
  });

  test('写接口 errcode!=0 映射为 AppException', () async {
    final api = _MockGatewayApi();
    when(() => api.delete(gatewayId: 1)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(gatewayDataSourceProvider.notifier);
    final result = await ds.delete(gatewayId: 1).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));
  });

  test('rename 路径为 /v3/gateway/rename', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/gateway/rename', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await GatewayApi(dio).rename(gatewayId: 124242, gatewayName: '201室网关');
    expect(sent?['gatewayId'], 124242);
    expect(sent?['gatewayName'], '201室网关');
  });

  test('isInitSuccess 解析 gatewayId', () async {
    final api = _MockGatewayApi();
    when(
      () => api.isInitSuccess(gatewayNetMac: 'C1:30:E7:F4:97:17'),
    ).thenAnswer((_) async => {'gatewayId': 5678});
    final container = ProviderContainer(
      overrides: [gatewayApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(gatewayDataSourceProvider.notifier);
    final r = await ds.isInitSuccess(gatewayNetMac: 'C1:30:E7:F4:97:17').run();
    expect(r.getOrElse((_) => 0), 5678);
  });
}
