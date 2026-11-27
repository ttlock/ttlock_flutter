import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockLockApi extends Mock implements LockApi {}

void main() {
  test('LockDto 分页解析 + toEntity', () {
    const json = {
      'list': [
        {
          'lockId': 1,
          'lockName': 'BT-1',
          'lockAlias': 'A',
          'lockMac': 'AA:BB',
          'electricQuantity': 80,
          'featureValue': 'fv',
          'hasGateway': 1,
          'lockData': 'ld',
          'groupId': 1,
          'groupName': 'g',
        },
      ],
      'pageNo': 1,
      'pageSize': 20,
      'pages': 1,
      'total': 1,
    };
    final page = OpenApiPageDto<LockDto>.fromJson(
      json,
      (j) => LockDto.fromJson(j as Map<String, dynamic>),
    );
    final lock = page.list.single.toEntity();
    expect(lock.lockId, 1);
    expect(lock.lockAlias, 'A');
    expect(lock.hasGateway, isTrue);
    expect(lock.lockData, 'ld');
  });

  test('LockDto 容错：数字字段以 String 返回', () {
    final dto = LockDto.fromJson({
      'lockId': '12',
      'electricQuantity': '80',
      'hasGateway': '1',
      'lockData': 'ld',
    });
    final lock = dto.toEntity();
    expect(lock.lockId, 12);
    expect(lock.electricQuantity, 80);
    expect(lock.hasGateway, isTrue);
  });

  test('LockDto.date 毫秒时间戳 → initDate', () {
    final dto = LockDto.fromJson({'lockId': 1, 'date': 1528878944000});
    expect(dto.initDate, DateTime.fromMillisecondsSinceEpoch(1528878944000));
    expect(dto.toEntity().initDate, dto.initDate);
  });

  test('LockInitializeDto keyId 为 String', () {
    final dto = LockInitializeDto.fromJson({
      'lockId': 123132,
      'keyId': '2342342',
    });
    final result = dto.toEntity();
    expect(result.lockId, 123132);
    expect(result.keyId, '2342342');
  });

  test('LockRepository.getLocks 经 mock Api 返回 PageState', () async {
    final api = _MockLockApi();
    when(() => api.list(pageNo: 1, pageSize: 20, groupId: null)).thenAnswer(
      (_) async => {
        'list': [
          {'lockId': 1, 'lockAlias': 'A', 'hasGateway': 0, 'lockData': 'ld'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRepositoryProvider.notifier);
    final r = await repo.getLocks(pageNo: 1, pageSize: 20).run();
    expect(r, isA<Right<AppException, PageState<LockEntity>>>());
    expect(
      r.getOrElse((_) => const PageState<LockEntity>()).data.single.lockId,
      1,
    );
  });

  test('LockRepository.getLockDetail / initializeLock 映射 Entity', () async {
    final api = _MockLockApi();
    when(
      () => api.detail(lockId: 7),
    ).thenAnswer((_) async => {'lockId': 7, 'lockAlias': 'D', 'lockData': 'x'});
    when(
      () => api.initialize(lockData: 'ld', lockAlias: 'alias', groupId: 3),
    ).thenAnswer((_) async => {'lockId': 9, 'keyId': 'k'});
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(lockRepositoryProvider.notifier);

    final detail = await repo.getLockDetail(7).run();
    expect(detail.getOrElse((_) => const LockEntity()).lockAlias, 'D');

    final init = await repo
        .initializeLock('ld', lockAlias: 'alias', groupId: 3)
        .run();
    expect(init.getOrElse((_) => const LockInitializeResult()).keyId, 'k');
  });

  test('LockDataSource.list 将裸 Map 解析为 OpenApiPageDto', () async {
    final api = _MockLockApi();
    when(() => api.list(pageNo: 1, pageSize: 20, groupId: null)).thenAnswer(
      (_) async => {
        'list': [
          {'lockId': 1, 'lockAlias': 'A', 'hasGateway': 1, 'lockData': 'ld'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockDataSourceProvider.notifier);
    final r = await ds.list(pageNo: 1, pageSize: 20).run();
    final page = r.getOrElse((_) => throw TestFailure('expected Right'));
    expect(page.list.single.lockId, 1);
    expect(page.total, 1);
  });

  test('list HTTP 200 errcode!=0 映射为 AppBusinessException', () async {
    final api = _MockLockApi();
    when(() => api.list(pageNo: 1, pageSize: 20, groupId: null)).thenAnswer(
      (_) async => {
        'errcode': 10004,
        'errmsg': 'token invalid',
        'description': '',
      },
    );
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockDataSourceProvider.notifier);
    final r = await ds.list(pageNo: 1, pageSize: 20).run();
    expect(r.isLeft(), isTrue);
    r.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10004);
    }, (_) => fail('expected Left'));
  });

  test('detail HTTP 200 errcode!=0 映射为 AppBusinessException', () async {
    final api = _MockLockApi();
    when(() => api.detail(lockId: 1)).thenAnswer(
      (_) async => {
        'errcode': -2018,
        'errmsg': 'lock not found',
        'description': '',
      },
    );
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockDataSourceProvider.notifier);
    final r = await ds.detail(lockId: 1).run();
    expect(r.isLeft(), isTrue);
    r.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -2018);
    }, (_) => fail('expected Left'));
  });

  test('initialize HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockLockApi();
    when(
      () => api.initialize(lockData: 'ld', lockAlias: 'alias', groupId: 3),
    ).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '初始化失败', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockDataSourceProvider.notifier);
    final result = await ds
        .initialize(lockData: 'ld', lockAlias: 'alias', groupId: 3)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
      expect(e.message, '初始化失败');
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockLockApi();
    when(() => api.rename(lockId: 1, lockAlias: 'B')).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(lockId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.unlock(lockId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.lock(lockId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [lockApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(lockDataSourceProvider.notifier);

    final failed = await ds.rename(lockId: 1, lockAlias: 'B').run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds.delete(lockId: 1).run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('PageState.hasMore 在 data.length < total 时为 true', () {
    const page = PageState<int>(data: [1, 2], currentPage: 1, total: 5);
    expect(page.hasMore, isTrue);
    const full = PageState<int>(data: [1, 2, 3], total: 3);
    expect(full.hasMore, isFalse);
  });

  test('ChannelType 取值对应 addType/changeType/deleteType/type', () {
    expect(ChannelType.bleSynced.value, 1);
    expect(ChannelType.gatewayWifi.value, 2);
    expect(ChannelType.nbIot.value, 3);
    expect(ChannelType.wifiPowerSaveAsync.value, 4);
    expect(ChannelType.fromValue(2), ChannelType.gatewayWifi);
    expect(ChannelType.fromValue(99), ChannelType.bleSynced);
  });

  test('json_converters 容错数字与布尔', () {
    expect(intFromDynamic('3'), 3);
    expect(intFromDynamic(3.9), 3);
    expect(intFromDynamic(null), 0);
    expect(boolFromDynamic(1), isTrue);
    expect(boolFromDynamic('0'), isFalse);
    expect(boolFromDynamic('true'), isTrue);
    expect(nullableDateTimeMsFromJson(null), isNull);
    expect(
      nullableDateTimeMsFromJson(1000),
      DateTime.fromMillisecondsSinceEpoch(1000),
    );
  });

  test('跨域共享枚举与 CyclicConfig', () {
    expect(CredentialType.fromValue(4), CredentialType.cycle);
    expect(EntityStatus.fromValue('2'), EntityStatus.expired);
    expect(MeterPayMode.fromValue(1), MeterPayMode.prepaid);
    expect(MeterOnOff.fromValue(null), MeterOnOff.unknown);
    final cyclic = CyclicConfig.fromJson({
      'weekDay': 1,
      'startTime': 480,
      'endTime': 1080,
    });
    expect(cyclic.weekDay, 1);
    expect(cyclic.startTime, 480);
  });
}
