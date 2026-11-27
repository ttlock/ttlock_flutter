import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/lift/data/data_source/lift_api.dart';
import 'package:ttlock_flutter_demo/features/lift/data/data_source/lift_data_source.dart';
import 'package:ttlock_flutter_demo/features/lift/data/model/lift_dto.dart';
import 'package:ttlock_flutter_demo/features/lift/data/repository/lift_repository.dart';

class _MockLiftApi extends Mock implements LiftApi {}

void main() {
  test('LiftDto.encodeFloorList 序列化为 JSON 数组字符串', () {
    expect(LiftDto.encodeFloorList(['1', '2', '3']), '["1","2","3"]');
  });

  test('LiftRepository.activateFloors 映射 Unit', () async {
    final api = _MockLiftApi();
    when(
      () => api.activateFloors(lockId: 163377, floorList: '["1","2","3"]'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [liftApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(liftRepositoryProvider.notifier);
    final result = await repo.activateFloors(163377, ['1', '2', '3']).run();
    expect(result, isA<Right<AppException, Unit>>());
  });

  test('activateFloors errcode!=0 映射为 AppException', () async {
    final api = _MockLiftApi();
    when(
      () => api.activateFloors(lockId: 1, floorList: any(named: 'floorList')),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: -1, errmsg: 'fail'),
    );
    final container = ProviderContainer(
      overrides: [liftApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(liftDataSourceProvider.notifier);
    final result = await ds.activateFloors(lockId: 1, floors: ['1']).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, -1);
    }, (_) => fail('expected Left'));
  });

  test('activateFloors HTTP 路径与 floorList 参数', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'));
    final adapter = DioAdapter(dio: dio);
    Map<String, dynamic>? sent;
    adapter.onPost('/v3/lift/activateFloors', (server) {
      server.replyCallback(200, (options) {
        sent = Map<String, dynamic>.from(options.data as Map);
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await LiftApi(dio).activateFloors(lockId: 163377, floorList: '[1,2,3]');
    expect(sent?['lockId'], 163377);
    expect(sent?['floorList'], '[1,2,3]');
  });
}
