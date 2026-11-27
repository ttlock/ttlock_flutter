import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/data_source/electric_meter_api.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/data_source/electric_meter_data_source.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/model/electric_meter_dto.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/repository/electric_meter_repository.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';

class _MockElectricMeterApi extends Mock implements ElectricMeterApi {}

void main() {
  test('ElectricMeterEntityDto fromJson', () {
    final e = ElectricMeterDto.fromJson({
      'electricMeterId': 1,
      'online': 1,
      'payMode': 1,
      'price': '0.80',
      'totalKwh': '100.5',
      'maxPower': '8.8',
    }).toEntity();
    expect(e.totalKwh, '100.5');
    expect(e.payMode, MeterPayMode.prepaid);
    expect(e.maxPower, '8.8');
  });

  test('ElectricMeterRepository.list 经 mock Api 返回 PageState', () async {
    final api = _MockElectricMeterApi();
    when(
      () => api.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).thenAnswer(
      (_) async => {
        'total': 1,
        'list': [
          {
            'electricMeterId': 270,
            'online': 0,
            'payMode': 1,
            'price': '10.00',
            'totalKwh': '0.00',
          },
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(electricMeterRepositoryProvider.notifier);
    final r = await repo.list().run();
    expect(r, isA<Right<AppException, PageState<ElectricMeterEntity>>>());
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.total, 1);
    expect(page.data.single.electricMeterId, 270);
  });

  test('ElectricMeterRepository.detail 映射实体', () async {
    final api = _MockElectricMeterApi();
    when(() => api.detail(electricMeterId: 296)).thenAnswer(
      (_) async => {
        'electricMeterId': 296,
        'name': '带正式包装的电表',
        'payMode': 0,
        'totalKwh': '9.89',
        'maxPower': '255',
      },
    );
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(electricMeterRepositoryProvider.notifier);
    final r = await repo.detail(296).run();
    final entity = r.getOrElse((_) => throw TestFailure('left'));
    expect(entity.electricMeterId, 296);
    expect(entity.totalKwh, '9.89');
  });

  test('ElectricMeterDataSource.addGroup 返回 OpenApiEnvelope', () async {
    final api = _MockElectricMeterApi();
    when(
      () => api.addGroup(groupName: '分组一'),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(electricMeterDataSourceProvider.notifier);
    final r = await ds.addGroup(groupName: '分组一').run();
    expect(r, isA<Right<AppException, OpenApiEnvelope>>());
    expect(r.getOrElse((_) => throw TestFailure('left')).isOk, isTrue);
  });

  test('ElectricMeterRepository.updateMaxPower 映射 Unit', () async {
    final api = _MockElectricMeterApi();
    when(
      () => api.updateMaxPower(electricMeterId: 3001, maxPower: 100),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(electricMeterRepositoryProvider.notifier);
    final r = await repo.updateMaxPower(3001, maxPower: 100).run();
    expect(r, isA<Right<AppException, Unit>>());
  });

  test('写接口 errcode!=0 映射为 AppException', () async {
    final api = _MockElectricMeterApi();
    when(
      () => api.recharge(
        electricMeterId: 1,
        rechargeAmount: 100,
        rechargeKwh: 100,
      ),
    ).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(electricMeterDataSourceProvider.notifier);
    final result = await ds
        .recharge(electricMeterId: 1, rechargeAmount: 100, rechargeKwh: 100)
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));
  });

  test('listRecords 解析 usedKwh 字符串', () async {
    final api = _MockElectricMeterApi();
    when(
      () =>
          api.listRecords(electricMeterId: 3001, dateType: 2, dateStr: '2025'),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'dateType': 2, 'usedKwh': '0.00kWh', 'createDate': '2025-06'},
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [electricMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(electricMeterRepositoryProvider.notifier);
    final r = await repo.listRecords(3001, dateType: 2, dateStr: '2025').run();
    final list = r.getOrElse((_) => throw TestFailure('left'));
    expect(list.single.usedKwh, '0.00kWh');
  });
}
