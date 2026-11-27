import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/data_source/palm_vein_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/data_source/palm_vein_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/model/palm_vein_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/repository/palm_vein_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';

class _MockPalmVeinApi extends Mock implements PalmVeinApi {}

void main() {
  test('PalmVeinDto fromJson(字段名 id/name/number)', () {
    final e = PalmVeinDto.fromJson({
      'id': 1,
      'name': '右手',
      'number': 'PV001',
      'status': '1',
      'type': 4,
    }).toEntity();
    expect(e.id, 1);
    expect(e.name, '右手');
    expect(e.number, 'PV001');
    expect(e.status, EntityStatus.normal);
    expect(e.type, CredentialType.cycle);
  });

  test('PalmVeinDto cyclicConfig 与 type 循环', () {
    final entity = PalmVeinDto.fromJson({
      'id': 1,
      'number': 'PV1',
      'type': 4,
      'cyclicConfig': [
        {'weekDay': 2, 'startTime': 480, 'endTime': 1080},
      ],
    }).toEntity();
    expect(entity.type, CredentialType.cycle);
    expect(entity.cyclicConfig.single.startTime, 480);
  });

  test('PalmVeinDto 容错：number 为 int、status 为 int', () {
    final dto = PalmVeinDto.fromJson({
      'id': '34242',
      'number': 50432139657219,
      'status': 1,
      'type': '1',
      'startDate': 1625025703000,
      'endDate': 1665025703000,
      'createDate': 1625025703000,
      'nickname': '二房东',
      'cyclicConfig': [
        {'weekDay': 1, 'startTime': 480, 'endTime': 1080},
      ],
    });
    final entity = dto.toEntity();
    expect(entity.id, 34242);
    expect(entity.number, '50432139657219');
    expect(entity.status, EntityStatus.normal);
    expect(entity.type, CredentialType.normal);
    expect(entity.nickname, '二房东');
    expect(entity.cyclicConfig.single.weekDay, 1);
    expect(
      entity.startDate,
      DateTime.fromMillisecondsSinceEpoch(1625025703000),
    );
  });

  test('OpenApiPageDto<PalmVeinDto> 分页解析', () {
    final page = OpenApiPageDto<PalmVeinDto>.fromJson({
      'list': [
        {
          'id': 34242,
          'name': '小明',
          'number': '50432139657219',
          'status': 1,
          'type': 1,
        },
      ],
      'pageNo': 1,
      'pageSize': 10,
      'pages': 1,
      'total': 1,
    }, (j) => PalmVeinDto.fromJson(j as Map<String, dynamic>));
    expect(page.total, 1);
    expect(page.list.single.toEntity().name, '小明');
  });

  test('PalmVeinRepository.list 经 mock Api 返回 List', () async {
    final api = _MockPalmVeinApi();
    when(
      () => api.list(lockId: 3466252, pageNo: 1, pageSize: 20, searchStr: null),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'id': 34242, 'name': '小明', 'number': 'PV001', 'status': '1'},
        ],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 1,
        'total': 1,
      },
    );
    final container = ProviderContainer(
      overrides: [palmVeinApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(palmVeinRepositoryProvider.notifier);
    final r = await repo.list(3466252).run();
    expect(r, isA<Right<AppException, List<PalmVeinEntity>>>());
    expect(r.getOrElse((_) => const []).single.id, 34242);
  });

  test('PalmVeinRepository.add 返回 id', () async {
    final api = _MockPalmVeinApi();
    when(
      () => api.add(
        lockId: 3466252,
        number: '50432139657219',
        name: '右手',
        startDate: 1000,
        endDate: 2000,
        type: 4,
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).thenAnswer((_) async => {'id': 66325});
    final container = ProviderContainer(
      overrides: [palmVeinApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(palmVeinRepositoryProvider.notifier);
    final r = await repo
        .add(
          3466252,
          '50432139657219',
          name: '右手',
          startDate: 1000,
          endDate: 2000,
          type: CredentialType.cycle,
        )
        .run();
    expect(r.getOrElse((_) => 0), 66325);
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockPalmVeinApi();
    when(
      () => api.add(
        lockId: any(named: 'lockId'),
        number: any(named: 'number'),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '失败', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [palmVeinApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(palmVeinDataSourceProvider.notifier);
    final result = await ds
        .add(lockId: 1, number: 'n', startDate: 0, endDate: 0)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockPalmVeinApi();
    when(() => api.delete(id: 6332, type: 2)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    when(
      () => api.clear(lockId: 3466252),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.rename(id: 6332, name: '新名'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [palmVeinApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(palmVeinDataSourceProvider.notifier);

    final failed = await ds
        .delete(id: 6332, channel: ChannelType.gatewayWifi)
        .run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));

    final cleared = await ds.clear(lockId: 3466252).run();
    expect(cleared.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('palmVein/delete 路径携带 type 字段（非 deleteType）', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/palmVein/delete', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await PalmVeinApi(dio).delete(id: 6332, type: 2);
    expect(sent?['id'], 6332);
    expect(sent?['type'], 2);
    expect(sent?.containsKey('deleteType'), isFalse);
  });

  test('palmVein/changePeriod 路径携带 type 通道字段', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/palmVein/changePeriod', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await PalmVeinApi(dio).changePeriod(
      id: 66252,
      startDate: 1755134678245,
      endDate: 1855134678245,
      type: 4,
    );
    expect(sent?['id'], 66252);
    expect(sent?['type'], 4);
    expect(sent?.containsKey('changeType'), isFalse);
  });

  test(
    'PalmVeinRepository changePeriod / delete / clear / rename 映射 Unit',
    () async {
      final api = _MockPalmVeinApi();
      when(
        () => api.changePeriod(
          id: 66252,
          startDate: 1000,
          endDate: 2000,
          type: 1,
          cyclicConfig: any(named: 'cyclicConfig'),
        ),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.delete(id: 6332, type: null),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.clear(lockId: 3466252),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.rename(id: 6332, name: '新名'),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      final container = ProviderContainer(
        overrides: [palmVeinApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      final repo = container.read(palmVeinRepositoryProvider.notifier);

      final changed = await repo
          .changePeriod(
            66252,
            startDate: 1000,
            endDate: 2000,
            channel: ChannelType.bleSynced,
          )
          .run();
      expect(changed, isA<Right<AppException, Unit>>());

      final deleted = await repo.delete(6332).run();
      expect(deleted, isA<Right<AppException, Unit>>());

      final cleared = await repo.clear(3466252).run();
      expect(cleared, isA<Right<AppException, Unit>>());

      final renamed = await repo.rename(6332, '新名').run();
      expect(renamed, isA<Right<AppException, Unit>>());
    },
  );
}
