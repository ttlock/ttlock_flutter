import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/data_source/remote_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/data_source/remote_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/model/remote_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/repository/remote_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';

class _MockRemoteApi extends Mock implements RemoteApi {}

void main() {
  test('RemoteEntityDto fromJson', () {
    final e = RemoteDto.fromJson({
      'remoteId': 1,
      'mac': 'AA:BB',
      'name': '遥控1',
      'type': 1,
      'status': '1',
    }).toEntity();
    expect(e.name, '遥控1');
    expect(e.type, CredentialType.normal);
    expect(e.status, EntityStatus.normal);
    expect(e.mac, 'AA:BB');
  });

  test('RemoteDto 解析 status 数字与 userid 别名', () {
    final dto = RemoteDto.fromJson({
      'remoteId': '4242',
      'name': '大门锁的遥控',
      'mac': '33:33:33:33:33:33',
      'electricQuantity': '85',
      'type': 4,
      'status': 2,
      'nickname': '张三',
      'userid': 'zhangsan@gmail.com',
      'startDate': 1625025703000,
      'endDate': 1645025703000,
      'createDate': 1625025703000,
      'cyclicConfig': [
        {'startTime': 480, 'endTime': 1080, 'weekDay': 1},
      ],
    });
    final entity = dto.toEntity();
    expect(entity.remoteId, 4242);
    expect(entity.status, EntityStatus.expired);
    expect(entity.type, CredentialType.cycle);
    expect(entity.userId, 'zhangsan@gmail.com');
    expect(entity.cyclicConfig.single.weekDay, 1);
    expect(entity.startDate?.millisecondsSinceEpoch, 1625025703000);
  });

  test('RemoteRepository.listByLock 经 mock Api 返回 List', () async {
    final api = _MockRemoteApi();
    when(() => api.listByLock(lockId: 1719, orderBy: 0)).thenAnswer(
      (_) async => {
        'list': [
          {
            'remoteId': 4242,
            'name': '大门锁的遥控',
            'mac': '33:33:33:33:33:33',
            'type': 1,
            'status': '1',
          },
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [remoteApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(remoteRepositoryProvider.notifier);
    final r = await repo.listByLock(1719).run();
    expect(r, isA<Right<AppException, List<RemoteEntity>>>());
    expect(r.getOrElse((_) => const []).single.remoteId, 4242);
  });

  test('RemoteRepository.add 返回 remoteId', () async {
    final api = _MockRemoteApi();
    when(
      () => api.add(
        lockId: 163377,
        number: any(named: 'number'),
        mac: '33:33:33:33:33:33',
        name: '大门锁遥控',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).thenAnswer((_) async => {'remoteId': 4242});
    final container = ProviderContainer(
      overrides: [remoteApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(remoteRepositoryProvider.notifier);
    final r = await repo.add(163377, '33:33:33:33:33:33', name: '大门锁遥控').run();
    expect(r.getOrElse((_) => 0), 4242);
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockRemoteApi();
    when(
      () => api.add(
        lockId: any(named: 'lockId'),
        number: any(named: 'number'),
        mac: any(named: 'mac'),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '已存在', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [remoteApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(remoteDataSourceProvider.notifier);
    final result = await ds.add(lockId: 1, mac: 'AA:BB', name: 'dup').run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockRemoteApi();
    when(
      () => api.update(
        remoteId: 4242,
        name: '遥控器2',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        type: any(named: 'type'),
      ),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(remoteId: 4242),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [remoteApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(remoteDataSourceProvider.notifier);

    final failed = await ds.update(remoteId: 4242, name: '遥控器2').run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds.delete(remoteId: 4242).run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('remote/update 路径为 /v3/remote/update', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    var hitUpdate = false;
    adapter.onPost('/v3/remote/update', (server) {
      server.replyCallback(200, (options) {
        hitUpdate = true;
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await RemoteApi(dio).update(remoteId: 4242, name: '遥控器2');
    expect(hitUpdate, isTrue);
    expect(sent?['remoteId'], 4242);
    expect(sent?['name'], '遥控器2');
  });

  test('RemoteRepository.rename / delete 映射 Unit', () async {
    final api = _MockRemoteApi();
    when(
      () => api.update(
        remoteId: 4242,
        name: '新名',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        type: any(named: 'type'),
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(remoteId: 4242),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [remoteApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(remoteRepositoryProvider.notifier);

    final renamed = await repo.rename(4242, '新名').run();
    expect(renamed, isA<Right<AppException, Unit>>());

    final deleted = await repo.delete(4242).run();
    expect(deleted, isA<Right<AppException, Unit>>());
  });
}
