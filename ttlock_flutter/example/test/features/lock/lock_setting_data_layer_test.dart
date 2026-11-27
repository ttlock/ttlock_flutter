import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_setting_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_setting_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_setting_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

class _MockLockSettingApi extends Mock implements LockSettingApi {}

void main() {
  test('setAutoLockTime 携带 type=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lock/setAutoLockTime', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    final api = LockSettingApi(dio);
    await api.setAutoLockTime(
      lockId: 1,
      seconds: 30,
      type: ChannelType.gatewayWifi.value,
    );
    expect(sent?['type'], 2);
    expect(sent?['lockId'], 1);
    expect(sent?['seconds'], 30);
  });

  test('updateSetting 携带 changeType=2', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lock/updateSetting', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await LockSettingApi(dio).updateSetting(
      lockId: 1,
      type: 3,
      value: 1,
      changeType: ChannelType.gatewayWifi.value,
    );
    expect(sent?['changeType'], 2);
    expect(sent?['type'], 3);
    expect(sent?['value'], 1);
  });

  test('updateLockData 携带 lockData（非凭证列表）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lock/updateLockData', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await LockSettingApi(dio).updateLockData(lockId: 9, lockData: 'ld-sync');
    expect(sent?['lockId'], 9);
    expect(sent?['lockData'], 'ld-sync');
  });

  test('transfer 将 lockIdList 编码为 JSON 数组字符串', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lock/transfer', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await LockSettingApi(
      dio,
    ).transfer(receiverUsername: 'a@b.com', lockIdList: '[1234,3332]');
    expect(sent?['receiverUsername'], 'a@b.com');
    expect(sent?['lockIdList'], '[1234,3332]');
  });

  test('ExtraSettingDto 解析未授权报警字段', () {
    final dto = ExtraSettingDto.fromJson({
      'unauthorizedAttemptAlertFlag': 1,
      'unauthorizedAttemptAlertCount': 5,
      'unauthorizedAttemptAlertLockTime': 60,
      'unauthorizedAttemptAlertPwd': 1,
      'unauthorizedAttemptAlertCard': 0,
      'unauthorizedAttemptAlertFingerprint': 1,
    });
    final entity = dto.toEntity();
    expect(entity.flag, 1);
    expect(entity.count, 5);
    expect(entity.lockTime, 60);
    expect(entity.pwd, 1);
    expect(entity.card, 0);
    expect(entity.fingerprint, 1);
  });

  test('PassageModeConfigDto / WorkingModeDto 解析', () {
    final passage = PassageModeConfigDto.fromJson({
      'passageMode': 1,
      'startDate': 480,
      'endDate': 1080,
      'isAllDay': 2,
      'weekDays': [1, 2, 3],
      'autoUnlock': 1,
    });
    expect(passage.toEntity().weekDays, [1, 2, 3]);
    expect(passage.toEntity().startDate, 480);

    final working = WorkingModeDto.fromJson({
      'workingMode': 3,
      'cyclicConfig': [
        {
          'isAllDay': 2,
          'startTime': 480,
          'endTime': 1080,
          'weekDays': [1, 2],
        },
      ],
    });
    expect(working.toEntity().workingMode, 3);
    expect(working.toEntity().cyclicConfig.single.startTime, 480);

    final workingFromString = WorkingModeDto.fromJson({
      'workingMode': '3',
      'cyclicConfig':
          '[{"isAllDay":2,"startTime":480,"endTime":1080,"weekDays":[1,2]}]',
    });
    expect(workingFromString.workingMode, 3);
    expect(workingFromString.cyclicConfig, hasLength(1));
  });

  test('LockUpgradeCheckDto 解析嵌套 firmwareInfo', () {
    final dto = LockUpgradeCheckDto.fromJson({
      'needUpgrade': 1,
      'firmwareInfo': {
        'modelNum': 'SN242',
        'hardwareRevision': '1.1',
        'firmwareRevision': '5.1.0',
      },
      'firmwarePackage': 'pkg',
      'version': '5.3.3',
    });
    final entity = dto.toEntity();
    expect(entity.needUpgrade, 1);
    expect(entity.firmwareInfo?.modelNum, 'SN242');
    expect(entity.version, '5.3.3');
  });

  test('HotelLockDto 兼容 buildNumber / buildingNumber', () {
    final fromExample = HotelLockDto.fromJson({
      'lockId': 532323,
      'lockAlias': '大门锁',
      'sector': '1,2,3',
      'buildNumber': 1,
      'floorNumber': 2,
      'buildingName': 'A',
      'floorName': '2F',
      'hasGateway': 1,
      'lockData': 'ld',
    });
    expect(fromExample.toEntity().buildingNumber, 1);
    expect(fromExample.toEntity().sector, '1,2,3');

    final fromTable = HotelLockDto.fromJson({
      'lockId': 1,
      'buildingNumber': 9,
      'floorNumber': 3,
    });
    expect(fromTable.buildingNumber, 9);
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockLockSettingApi();
    when(() => api.setAutoLockTime(lockId: 1, seconds: 30, type: 2)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.registerNb(
        lockId: 1,
        nbNodeId: 'n',
        nbCardNumber: 'c',
        nbOperator: '46011',
        nbRssi: 12,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [lockSettingApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockSettingDataSourceProvider.notifier);

    final failed = await ds
        .setAutoLockTime(
          lockId: 1,
          seconds: 30,
          channel: ChannelType.gatewayWifi,
        )
        .run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final ok = await ds
        .registerNb(
          lockId: 1,
          nbNodeId: 'n',
          nbCardNumber: 'c',
          nbOperator: '46011',
          nbRssi: 12,
        )
        .run();
    expect(ok.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('upgradeCheck HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockLockSettingApi();
    when(() => api.upgradeCheck(lockId: 1)).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '检测失败', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [lockSettingApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockSettingDataSourceProvider.notifier);
    final result = await ds.upgradeCheck(lockId: 1).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('LockSettingDataSource.upgradeCheck 解析成功体', () async {
    final api = _MockLockSettingApi();
    when(() => api.upgradeCheck(lockId: 1)).thenAnswer(
      (_) async => {
        'needUpgrade': 0,
        'firmwareInfo': {'modelNum': 'M'},
        'firmwarePackage': '',
        'version': '1.0',
      },
    );
    final container = ProviderContainer(
      overrides: [lockSettingApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockSettingDataSourceProvider.notifier);
    final r = await ds.upgradeCheck(lockId: 1).run();
    expect(r.getOrElse((_) => throw TestFailure('left')).needUpgrade, 0);
  });

  test('LockRepository.setAutoLockTime / updateSetting / registerNb', () async {
    final api = _MockLockSettingApi();
    when(
      () => api.setAutoLockTime(lockId: 1, seconds: 30, type: 2),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.updateSetting(lockId: 1, type: 3, value: 1, changeType: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.registerNb(
        lockId: 1,
        nbNodeId: 'n',
        nbCardNumber: 'c',
        nbOperator: '46011',
        nbRssi: 12,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(() => api.upgradeCheck(lockId: 1)).thenAnswer(
      (_) async => {'needUpgrade': 1, 'firmwarePackage': '', 'version': '5.3'},
    );
    final container = ProviderContainer(
      overrides: [lockSettingApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRepositoryProvider.notifier);

    final auto = await repo
        .setAutoLockTime(1, 30, channel: ChannelType.gatewayWifi)
        .run();
    expect(auto, isA<Right<AppException, Unit>>());

    final updated = await repo
        .updateSetting(1, const LockSettingUpdate(type: 3, value: 1))
        .run();
    expect(updated, isA<Right<AppException, Unit>>());

    final nb = await repo
        .registerNb(
          1,
          nbNodeId: 'n',
          nbCardNumber: 'c',
          nbOperator: '46011',
          nbRssi: 12,
        )
        .run();
    expect(nb, isA<Right<AppException, Unit>>());

    final upgrade = await repo.upgradeCheck(1).run();
    expect(
      upgrade.getOrElse((_) => const LockUpgradeCheckEntity()).needUpgrade,
      1,
    );
  });

  test('LockRepository.listByHotel 映射 PageState', () async {
    final api = _MockLockSettingApi();
    when(
      () => api.listByHotel(
        pageNo: 1,
        pageSize: 20,
        type: 1,
        lockAlias: null,
        groupId: null,
      ),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'lockId': 7, 'lockAlias': 'H', 'sector': '1,2'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [lockSettingApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRepositoryProvider.notifier);
    final r = await repo.listByHotel(pageNo: 1, pageSize: 20, type: 1).run();
    expect(r, isA<Right<AppException, PageState<HotelLockEntity>>>());
    expect(
      r.getOrElse((_) => const PageState<HotelLockEntity>()).data.single.lockId,
      7,
    );
  });
}
