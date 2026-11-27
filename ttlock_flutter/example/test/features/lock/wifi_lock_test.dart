import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/wifi_lock_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/wifi_lock_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/wifi_lock_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/wifi_lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';

class _MockWifiLockApi extends Mock implements WifiLockApi {}

void main() {
  test('WifiLockDto detail 解析 + toEntity', () {
    final dto = WifiLockDto.fromJson({
      'networkName': '民宿1-101-WIFI',
      'wifiMac': 'AA:AA:AA:AA:AA:AA',
      'rssiGrade': 3,
      'isOnline': true,
      'powerSavingMode': 2,
      'ip': '192.168.1.10',
      'subnetMask': '255.255.255.0',
      'defaultGateway': '192.168.1.1',
    });
    final entity = dto.toEntity();
    expect(entity.networkName, '民宿1-101-WIFI');
    expect(entity.wifiMac, 'AA:AA:AA:AA:AA:AA');
    expect(entity.rssiGrade, 3);
    expect(entity.isOnline, isTrue);
    expect(entity.powerSavingMode, 2);
    expect(entity.ip, '192.168.1.10');
  });

  test('WifiLockDto 容错：isOnline 为 1/0', () {
    expect(WifiLockDto.fromJson({'isOnline': 1}).toEntity().isOnline, isTrue);
    expect(WifiLockDto.fromJson({'isOnline': 0}).toEntity().isOnline, isFalse);
  });

  test('WifiLockRepository.detail 经 mock Api 返回 Entity', () async {
    final api = _MockWifiLockApi();
    when(() => api.detail(lockId: 163377)).thenAnswer(
      (_) async => {
        'networkName': '民宿1-101-WIFI',
        'wifiMac': 'AA:AA:AA:AA:AA:AA',
        'rssiGrade': 3,
        'isOnline': 1,
        'powerSavingMode': 2,
      },
    );
    final container = ProviderContainer(
      overrides: [wifiLockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(wifiLockRepositoryProvider.notifier);
    final result = await repo.detail(163377).run();
    expect(result, isA<Right<AppException, WifiLockEntity>>());
    final entity = result.getOrElse((_) => throw TestFailure('left'));
    expect(entity.networkName, '民宿1-101-WIFI');
    expect(entity.isOnline, isTrue);
  });

  test('detail errcode=-3034 映射为 AppException', () async {
    final api = _MockWifiLockApi();
    when(() => api.detail(lockId: 1)).thenAnswer(
      (_) async => {'errcode': -3034, 'errmsg': '未配置网络', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [wifiLockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(wifiLockDataSourceProvider.notifier);
    final result = await ds.detail(lockId: 1).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -3034);
    }, (_) => fail('expected Left'));
  });

  test('WifiLockRepository.updateNetwork 映射 Unit 并传 networkName', () async {
    final api = _MockWifiLockApi();
    when(
      () => api.updateNetwork(lockId: 163377, networkName: 'MyWifi'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [wifiLockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(wifiLockRepositoryProvider.notifier);
    final result = await repo
        .updateNetwork(163377, networkName: 'MyWifi')
        .run();
    expect(result, isA<Right<AppException, Unit>>());
    verify(
      () => api.updateNetwork(lockId: 163377, networkName: 'MyWifi'),
    ).called(1);
  });

  test('WifiLockRepository.updateNetwork 透传 IP / DNS 字段', () async {
    final api = _MockWifiLockApi();
    when(
      () => api.updateNetwork(
        lockId: 163377,
        networkName: 'Office',
        wifiMac: 'AA:BB:CC:DD:EE:FF',
        rssi: 3,
        useStaticIp: true,
        ip: '192.168.1.50',
        subnetMask: '255.255.255.0',
        defaultGateway: '192.168.1.1',
        preferredDns: '8.8.8.8',
        alternateDns: '8.8.4.4',
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [wifiLockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(wifiLockRepositoryProvider.notifier);

    final result = await repo
        .updateNetwork(
          163377,
          networkName: 'Office',
          wifiMac: 'AA:BB:CC:DD:EE:FF',
          rssi: 3,
          useStaticIp: true,
          ip: '192.168.1.50',
          subnetMask: '255.255.255.0',
          defaultGateway: '192.168.1.1',
          preferredDns: '8.8.8.8',
          alternateDns: '8.8.4.4',
        )
        .run();

    expect(result.isRight(), isTrue);
    verify(
      () => api.updateNetwork(
        lockId: 163377,
        networkName: 'Office',
        wifiMac: 'AA:BB:CC:DD:EE:FF',
        rssi: 3,
        useStaticIp: true,
        ip: '192.168.1.50',
        subnetMask: '255.255.255.0',
        defaultGateway: '192.168.1.1',
        preferredDns: '8.8.8.8',
        alternateDns: '8.8.4.4',
      ),
    ).called(1);
  });

  test('WifiLockDto.toEntity 映射 preferredDns / alternateDns', () {
    final entity = const WifiLockDto(
      preferredDns: '8.8.8.8',
      alternateDns: '8.8.4.4',
    ).toEntity();
    expect(entity.preferredDns, '8.8.8.8');
    expect(entity.alternateDns, '8.8.4.4');
  });

  test('updateNetwork errcode!=0 映射为 AppException', () async {
    final api = _MockWifiLockApi();
    when(
      () =>
          api.updateNetwork(lockId: 1, networkName: any(named: 'networkName')),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    final container = ProviderContainer(
      overrides: [wifiLockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(wifiLockDataSourceProvider.notifier);
    final result = await ds.updateNetwork(lockId: 1, networkName: 'x').run();
    expect(result.isLeft(), isTrue);
  });

  test('wifiLock/detail HTTP POST 路径', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    var hit = false;
    adapter.onPost('/v3/wifiLock/detail', (server) {
      server.replyCallback(200, (options) {
        hit = true;
        sent = Map<String, dynamic>.from(options.data as Map);
        return {
          'networkName': 'test',
          'wifiMac': 'AA:BB',
          'rssiGrade': 2,
          'isOnline': 1,
          'powerSavingMode': 1,
        };
      });
    }, data: Matchers.any);
    await WifiLockApi(dio).detail(lockId: 163377);
    expect(hit, isTrue);
    expect(sent?['lockId'], 163377);
  });
}
