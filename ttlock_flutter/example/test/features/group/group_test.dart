import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/group/data/data_source/group_api.dart';
import 'package:ttlock_flutter_demo/features/group/data/data_source/group_data_source.dart';
import 'package:ttlock_flutter_demo/features/group/data/model/group_dto.dart';
import 'package:ttlock_flutter_demo/features/group/data/repository/group_repository.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';

class _MockGroupApi extends Mock implements GroupApi {}

void main() {
  test('GroupDto list 解析：仅 groupId + name，lockNum 默认 0', () {
    final dto = GroupDto.fromJson({'groupId': 1342, 'name': '山水一栋'});
    final entity = dto.toEntity();
    expect(entity.groupId, 1342);
    expect(entity.name, '山水一栋');
    expect(entity.lockNum, 0);
  });

  test('GroupDto listWithLockNum 解析 lockNum，groupId=0 名称为空', () {
    final dto = GroupDto.fromJson({'groupId': 0, 'name': '', 'lockNum': 2});
    expect(dto.toEntity().groupId, 0);
    expect(dto.toEntity().lockNum, 2);
    expect(dto.toEntity().name, isEmpty);

    final withNum = GroupDto.fromJson({
      'groupId': '1342',
      'name': '山水一栋',
      'lockNum': '2',
    });
    expect(withNum.toEntity().groupId, 1342);
    expect(withNum.toEntity().lockNum, 2);
  });

  test('GroupRepository.list 经 mock Api 返回 List', () async {
    final api = _MockGroupApi();
    when(() => api.list(orderBy: 0)).thenAnswer(
      (_) async => {
        'list': [
          {'groupId': 1342, 'name': '山水一栋'},
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(groupRepositoryProvider.notifier);
    final r = await repo.list().run();
    expect(r, isA<Right<AppException, List<GroupEntity>>>());
    expect(r.getOrElse((_) => const []).single.groupId, 1342);
    expect(r.getOrElse((_) => const []).single.lockNum, 0);
  });

  test('GroupRepository.listWithLockNum 映射 lockNum', () async {
    final api = _MockGroupApi();
    when(() => api.listWithLockNum(keyRight: null)).thenAnswer(
      (_) async => {
        'list': [
          {'groupId': 1342, 'name': '山水一栋', 'lockNum': 2},
          {'groupId': 0, 'name': '', 'lockNum': 1},
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(groupRepositoryProvider.notifier);
    final r = await repo.listWithLockNum().run();
    final list = r.getOrElse((_) => throw TestFailure('left'));
    expect(list.first.lockNum, 2);
    expect(list.last.groupId, 0);
  });

  test('GroupRepository.add 返回 groupId', () async {
    final api = _MockGroupApi();
    when(
      () => api.add(name: '山水一栋'),
    ).thenAnswer((_) async => {'groupId': 1342});
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(groupRepositoryProvider.notifier);
    final r = await repo.add('山水一栋').run();
    expect(r.getOrElse((_) => 0), 1342);
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockGroupApi();
    when(() => api.add(name: 'dup')).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '已存在', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(groupDataSourceProvider.notifier);
    final result = await ds.add(name: 'dup').run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockGroupApi();
    when(() => api.update(groupId: 1, name: 'B')).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.delete(groupId: 1),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.setDeviceGroup(deviceType: 0, deviceId: 3442324, groupId: 1342),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(groupDataSourceProvider.notifier);

    final failed = await ds.update(groupId: 1, name: 'B').run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final deleted = await ds.delete(groupId: 1).run();
    expect(deleted.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('group/update 路径为 /v3/group/update（非 rename）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    var hitUpdate = false;
    adapter.onPost('/v3/group/update', (server) {
      server.replyCallback(200, (options) {
        hitUpdate = true;
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await GroupApi(dio).update(groupId: 1342, name: '山水居一栋');
    expect(hitUpdate, isTrue);
    expect(sent?['groupId'], 1342);
    expect(sent?['name'], '山水居一栋');
  });

  test('setDeviceGroup 携带 deviceType=0 与 deviceId=lockId', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/group/setDeviceGroup', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await GroupApi(
      dio,
    ).setDeviceGroup(deviceType: 0, deviceId: 3442324, groupId: 1342);
    expect(sent?['deviceType'], 0);
    expect(sent?['deviceId'], 3442324);
    expect(sent?['groupId'], 1342);
  });

  test('GroupRepository.rename / delete / setDeviceGroup 映射 Unit', () async {
    final api = _MockGroupApi();
    when(
      () => api.update(groupId: 1342, name: '新名'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(groupId: 1342),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.setDeviceGroup(deviceType: 0, deviceId: 9, groupId: 1342),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [groupApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(groupRepositoryProvider.notifier);

    final renamed = await repo.rename(1342, '新名').run();
    expect(renamed, isA<Right<AppException, Unit>>());

    final deleted = await repo.delete(1342).run();
    expect(deleted, isA<Right<AppException, Unit>>());

    final grouped = await repo.setDeviceGroup(9, 1342).run();
    expect(grouped, isA<Right<AppException, Unit>>());
  });
}
