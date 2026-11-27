import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/data_source/wireless_keypad_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/data_source/wireless_keypad_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/model/wireless_keypad_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/repository/wireless_keypad_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';

class _MockWirelessKeypadApi extends Mock implements WirelessKeypadApi {}

ProviderContainer _containerWithApi(WirelessKeypadApi api) => ProviderContainer(
  overrides: [wirelessKeypadApiProvider.overrideWithValue(api)],
);

void main() {
  test(
    'WirelessKeypadEntityDto fromJson(字段 wirelessKeypadNumber/Name/Mac)',
    () {
      final e = WirelessKeypadDto.fromJson({
        'wirelessKeypadId': 1,
        'wirelessKeypadNumber': 'KP001',
        'wirelessKeypadName': '门口键盘',
        'wirelessKeypadMac': 'AA:BB',
        'electricQuantity': 90,
      }).toEntity();
      expect(e.wirelessKeypadName, '门口键盘');
      expect(e.wirelessKeypadNumber, 'KP001');
      expect(e.wirelessKeypadMac, 'AA:BB');
      expect(e.electricQuantity, 90);
    },
  );

  test('DTO 解析云端槽位四字段', () {
    final e = WirelessKeypadDto.fromJson({
      'wirelessKeypadId': 4242,
      'wirelessKeypadNumber': '1723612378',
      'wirelessKeypadName': '大门锁的多功能键盘',
      'wirelessKeypadMac': '33:33:33:33:33:33',
      'electricQuantity': 85,
      'hasSlot': 1,
      'slotNumber': 2,
      'slotLimit': 3,
      'featureValue': '8001',
    }).toEntity();

    expect(e.isMultifunctionalKeypad, isTrue);
    expect(e.slotNumber, 2);
    expect(e.slotLimit, 3);
    expect(e.featureValue, '8001');
    expect(e.hasAssignedSlot, isTrue);
  });

  test('hasSlot 缺失(0) 与 =2 都视为普通键盘', () {
    WirelessKeypadEntity parse(Map<String, dynamic> extra) =>
        WirelessKeypadDto.fromJson({
          'wirelessKeypadId': 1,
          'wirelessKeypadMac': 'AA:BB',
          ...extra,
        }).toEntity();

    // 键缺失 → intFromDynamic(null) == 0
    expect(parse(const {}).isMultifunctionalKeypad, isFalse);
    expect(parse(const {'hasSlot': 2}).isMultifunctionalKeypad, isFalse);
    expect(parse(const {'hasSlot': 1}).isMultifunctionalKeypad, isTrue);
    // 缺失字段的实体不带槽位
    expect(parse(const {}).hasAssignedSlot, isFalse);
  });

  test('hasSlot=1 但 slotNumber 缺失 → hasAssignedSlot 为 false', () {
    final e = WirelessKeypadDto.fromJson({
      'wirelessKeypadId': 1,
      'wirelessKeypadMac': 'AA:BB',
      'hasSlot': 1,
    }).toEntity();
    expect(e.isMultifunctionalKeypad, isTrue);
    expect(e.slotNumber, 0);
    expect(e.hasAssignedSlot, isFalse);
  });

  test('WirelessKeypadRepository.listByLock 经 mock Api 返回 List', () async {
    final api = _MockWirelessKeypadApi();
    when(() => api.listByLock(lockId: 1719, hasSlot: null)).thenAnswer(
      (_) async => {
        'list': [
          {
            'wirelessKeypadId': 4242,
            'wirelessKeypadNumber': '1723612378',
            'wirelessKeypadName': '大门锁的无线键盘',
            'wirelessKeypadMac': '33:33:33:33:33:33',
            'electricQuantity': 85,
          },
        ],
      },
    );
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final repo = container.read(wirelessKeypadRepositoryProvider.notifier);
    final r = await repo.listByLock(1719).run();
    expect(r, isA<Right<AppException, List<WirelessKeypadEntity>>>());
    final list = r.getOrElse((_) => const []);
    expect(list.single.wirelessKeypadId, 4242);
    expect(list.single.wirelessKeypadName, '大门锁的无线键盘');
  });

  test('WirelessKeypadRepository.add 返回 wirelessKeypadId', () async {
    final api = _MockWirelessKeypadApi();
    when(
      () => api.add(
        lockId: 163377,
        wirelessKeypadNumber: '3661413478',
        wirelessKeypadName: '大门锁的无线键盘',
        wirelessKeypadMac: '33:33:33:33:33:33',
        wirelessKeypadFeatureValue: '8001',
        electricQuantity: null,
        hasSlot: null,
        slotNumber: null,
        slotLimit: null,
        modelNum: null,
        hardwareRevision: null,
        firmwareRevision: null,
      ),
    ).thenAnswer((_) async => {'wirelessKeypadId': 4242});
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final repo = container.read(wirelessKeypadRepositoryProvider.notifier);
    final r = await repo
        .add(
          163377,
          '33:33:33:33:33:33',
          wirelessKeypadName: '大门锁的无线键盘',
          wirelessKeypadNumber: '3661413478',
          wirelessKeypadFeatureValue: '8001',
        )
        .run();
    expect(r.getOrElse((_) => 0), 4242);
  });

  test('repository add rejects empty number/name/featureValue', () async {
    final api = _MockWirelessKeypadApi();
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final repo = container.read(wirelessKeypadRepositoryProvider.notifier);

    Future<void> expectReject({
      required String name,
      required String number,
      required String featureValue,
    }) async {
      final r = await repo
          .add(
            1,
            'AA:BB',
            wirelessKeypadName: name,
            wirelessKeypadNumber: number,
            wirelessKeypadFeatureValue: featureValue,
          )
          .run();
      expect(r.isLeft(), isTrue);
      verifyNever(
        () => api.add(
          lockId: any(named: 'lockId'),
          wirelessKeypadNumber: any(named: 'wirelessKeypadNumber'),
          wirelessKeypadName: any(named: 'wirelessKeypadName'),
          wirelessKeypadMac: any(named: 'wirelessKeypadMac'),
          wirelessKeypadFeatureValue: any(named: 'wirelessKeypadFeatureValue'),
          electricQuantity: any(named: 'electricQuantity'),
          hasSlot: any(named: 'hasSlot'),
          slotNumber: any(named: 'slotNumber'),
          slotLimit: any(named: 'slotLimit'),
          modelNum: any(named: 'modelNum'),
          hardwareRevision: any(named: 'hardwareRevision'),
          firmwareRevision: any(named: 'firmwareRevision'),
        ),
      );
    }

    await expectReject(name: '', number: 'n', featureValue: 'fv');
    await expectReject(name: 'n', number: '', featureValue: 'fv');
    await expectReject(name: 'n', number: 'n', featureValue: '');
  });

  test('WirelessKeypadRepository.rename / delete 映射 Unit', () async {
    final api = _MockWirelessKeypadApi();
    when(
      () => api.rename(
        wirelessKeypadId: 4242,
        wirelessKeypadName: '新名',
        slotNumber: null,
      ),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    when(
      () => api.delete(wirelessKeypadId: 4242, slotNumber: null),
    ).thenAnswer((_) async => const OpenApiEnvelope());
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final repo = container.read(wirelessKeypadRepositoryProvider.notifier);

    final renamed = await repo.rename(4242, '新名').run();
    expect(renamed, isA<Right<AppException, Unit>>());

    final deleted = await repo.delete(4242).run();
    expect(deleted, isA<Right<AppException, Unit>>());
  });

  test('写接口 OpenApiEnvelope：errcode!=0 映射为 AppException', () async {
    final api = _MockWirelessKeypadApi();
    when(() => api.delete(wirelessKeypadId: 1, slotNumber: null)).thenAnswer(
      (_) async => const OpenApiEnvelope(errcode: 1, errmsg: 'fail'),
    );
    final container = ProviderContainer(
      overrides: [wirelessKeypadApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(wirelessKeypadDataSourceProvider.notifier);

    final failed = await ds.delete(wirelessKeypadId: 1, slotNumber: null).run();
    expect(failed.isLeft(), isTrue);
    failed.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 1);
    }, (_) => fail('expected Left'));
  });

  test('add HTTP 200 errcode!=0 映射为 AppException', () async {
    final api = _MockWirelessKeypadApi();
    when(
      () => api.add(
        lockId: any(named: 'lockId'),
        wirelessKeypadNumber: any(named: 'wirelessKeypadNumber'),
        wirelessKeypadName: any(named: 'wirelessKeypadName'),
        wirelessKeypadMac: any(named: 'wirelessKeypadMac'),
        wirelessKeypadFeatureValue: any(named: 'wirelessKeypadFeatureValue'),
        electricQuantity: any(named: 'electricQuantity'),
        hasSlot: any(named: 'hasSlot'),
        slotNumber: any(named: 'slotNumber'),
        slotLimit: any(named: 'slotLimit'),
        modelNum: any(named: 'modelNum'),
        hardwareRevision: any(named: 'hardwareRevision'),
        firmwareRevision: any(named: 'firmwareRevision'),
      ),
    ).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '已存在', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [wirelessKeypadApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(wirelessKeypadDataSourceProvider.notifier);
    final result = await ds
        .add(
          lockId: 1,
          wirelessKeypadNumber: 'n',
          wirelessKeypadName: 'name',
          wirelessKeypadMac: 'mac',
          wirelessKeypadFeatureValue: 'fv',
        )
        .run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });

  test('DataSource.listSlots 解析槽位列表（含未绑定槽位）', () async {
    final api = _MockWirelessKeypadApi();
    when(() => api.listSlot(wirelessKeypadId: 4242)).thenAnswer(
      (_) async => {
        'list': [
          {'slotNumber': 1, 'lockAlias': '大门锁'},
          {'slotNumber': 2, 'lockAlias': ''},
        ],
      },
    );
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final ds = container.read(wirelessKeypadDataSourceProvider.notifier);

    final r = await ds.listSlots(4242).run();
    final slots = r.getOrElse((_) => const <KeypadSlot>[]);
    expect(slots.length, 2);
    expect(slots[0].isBound, isTrue);
    expect(slots[1].isBound, isFalse);
    expect(slots[1].slotNumber, 2);
  });

  test('DataSource.listSlots 的 list 非 List → 空列表', () async {
    final api = _MockWirelessKeypadApi();
    when(
      () => api.listSlot(wirelessKeypadId: 4242),
    ).thenAnswer((_) async => {'list': 'oops'});
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final ds = container.read(wirelessKeypadDataSourceProvider.notifier);

    final r = await ds.listSlots(4242).run();
    expect(r.getOrElse((_) => const <KeypadSlot>[]), isEmpty);
  });

  test('Repository.checkUpgrade 把 needUpgrade=1 映射为 true', () async {
    final api = _MockWirelessKeypadApi();
    when(
      () => api.upgradeCheck(wirelessKeypadId: 4242, slotNumber: 1),
    ).thenAnswer(
      (_) async => {
        'needUpgrade': 1,
        'firmwareInfo': {'modelNum': 'SN843'},
        'firmwarePackage': 'AAAA',
        'version': '7.0.03.250725',
      },
    );
    final container = _containerWithApi(api);
    addTearDown(container.dispose);
    final repo = container.read(wirelessKeypadRepositoryProvider.notifier);

    final r = await repo
        .checkUpgrade(wirelessKeypadId: 4242, slotNumber: 1)
        .run();
    final up = r.getOrElse((_) => const WirelessKeypadUpgradeCheck());
    expect(up.needUpgrade, isTrue);
    expect(up.version, '7.0.03.250725');
  });
}
