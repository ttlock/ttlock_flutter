import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/data_source/water_meter_api.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/data_source/water_meter_data_source.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/model/water_meter_dto.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/repository/water_meter_repository.dart';

class _MockWaterMeterApi extends Mock implements WaterMeterApi {}

void main() {
  test('WaterMeterEntityDto fromJson(totalM3/price 为 String)', () {
    final e = WaterMeterDto.fromJson({
      'waterMeterId': 1,
      'online': 1,
      'onOff': 1,
      'payMode': 1,
      'price': '3.50',
      'totalM3': '12.5',
      'remainderM3': '7.5',
    }).toEntity();
    expect(e.waterMeterId, 1);
    expect(e.payMode, MeterPayMode.prepaid);
    expect(e.price, '3.50');
    expect(e.onOff, MeterOnOff.on);
    expect(e.online, isTrue);
    expect(e.totalM3, '12.5');
    expect(e.remainderM3, '7.5');
  });

  test('WaterMeterRepository.list 经 mock Api 返回 PageState', () async {
    final api = _MockWaterMeterApi();
    when(
      () => api.list(pageNo: 1, pageSize: 20, groupId: null, searchStr: null),
    ).thenAnswer(
      (_) async => {
        'total': 1,
        'list': [
          {
            'waterMeterId': 270,
            'online': 0,
            'onOff': 1,
            'payMode': 1,
            'price': '10.00',
            'name': 'EM2_005012',
            'number': 'EM2_005012',
            'totalM3': '0.00',
            'remainderM3': '0.00',
          },
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [waterMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(waterMeterRepositoryProvider.notifier);
    final r = await repo.list(pageNo: 1, pageSize: 20).run();
    expect(r.isRight(), isTrue);
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.total, 1);
    expect(page.data.single.waterMeterId, 270);
    expect(page.data.single.payMode, MeterPayMode.prepaid);
  });

  test('WaterMeterRepository.detail 映射实体', () async {
    final api = _MockWaterMeterApi();
    when(() => api.detail(waterMeterId: 296)).thenAnswer(
      (_) async => {
        'waterMeterId': 296,
        'name': '带正式包装的水表',
        'number': 'EM2_410100',
        'payMode': 0,
        'online': 0,
        'onOff': 1,
        'totalM3': '9.89',
        'remainderM3': '10.00',
        'price': '1.00',
      },
    );
    final container = ProviderContainer(
      overrides: [waterMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(waterMeterRepositoryProvider.notifier);
    final r = await repo.detail(296).run();
    final entity = r.getOrElse((_) => throw TestFailure('left'));
    expect(entity.waterMeterId, 296);
    expect(entity.payMode, MeterPayMode.energy);
    expect(entity.totalM3, '9.89');
  });

  test(
    'WaterMeterRepository.rename / recharge / controlOnOff / syncState 写接口',
    () async {
      final api = _MockWaterMeterApi();
      when(
        () => api.rename(waterMeterId: 1, name: '新名'),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () =>
            api.recharge(waterMeterId: 1, rechargeAmount: 100, rechargeM3: 50),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.controlOnOff(waterMeterId: 1, onOff: 1),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.syncState(waterMeterId: 1),
      ).thenAnswer((_) async => const OpenApiEnvelope());
      when(
        () => api.updatePrice(waterMeterId: 1, price: 1.5),
      ).thenAnswer((_) async => const OpenApiEnvelope());

      final container = ProviderContainer(
        overrides: [waterMeterApiProvider.overrideWithValue(api)],
      );
      addTearDown(container.dispose);
      final repo = container.read(waterMeterRepositoryProvider.notifier);

      expect((await repo.rename(1, '新名').run()).isRight(), isTrue);
      expect(
        (await repo.recharge(1, amount: 100, m3: 50).run()).isRight(),
        isTrue,
      );
      expect((await repo.controlOnOff(1, on: true).run()).isRight(), isTrue);
      expect((await repo.syncState(1).run()).isRight(), isTrue);
      expect((await repo.updatePrice(1, price: 1.5).run()).isRight(), isTrue);
    },
  );

  test('WaterMeterRepository.listRecords 解析用水记录', () async {
    final api = _MockWaterMeterApi();
    when(
      () => api.listRecords(waterMeterId: 1, dateType: 2, dateStr: '2025'),
    ).thenAnswer(
      (_) async => {
        'list': [
          {'dateType': 2, 'usedM3': '0.00', 'createDate': '2025-06'},
        ],
      },
    );
    final container = ProviderContainer(
      overrides: [waterMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(waterMeterRepositoryProvider.notifier);
    final r = await repo.listRecords(1, dateType: 2, dateStr: '2025').run();
    final list = r.getOrElse((_) => throw TestFailure('left'));
    expect(list.single.usedM3, '0.00');
    expect(list.single.createDate, '2025-06');
  });

  test('写接口 errcode!=0 映射为 AppException', () async {
    final api = _MockWaterMeterApi();
    when(() => api.syncState(waterMeterId: 1)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 10007, errmsg: '失败'),
    );
    final container = ProviderContainer(
      overrides: [waterMeterApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(waterMeterDataSourceProvider.notifier);
    final result = await ds.syncState(waterMeterId: 1).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });
}
