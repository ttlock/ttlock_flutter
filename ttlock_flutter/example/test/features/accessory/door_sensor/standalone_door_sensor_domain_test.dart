import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockRepo extends Mock implements StandaloneDoorSensorRepository {}

class _FakeRepo extends StandaloneDoorSensorRepository {
  _FakeRepo(this._mock);
  final _MockRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, int> add({
    required String name,
    required String doorSensorData,
    required String wifiName,
  }) =>
      _mock.add(name: name, doorSensorData: doorSensorData, wifiName: wifiName);

  @override
  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _mock.list(pageNo: pageNo, pageSize: pageSize, searchStr: searchStr);

  @override
  TaskEither<AppException, Unit> update(int doorSensorId, String name) =>
      _mock.update(doorSensorId, name);

  @override
  TaskEither<AppException, Unit> delete(int doorSensorId) =>
      _mock.delete(doorSensorId);

  @override
  TaskEither<AppException, Unit> configAlertFlag(
    int doorSensorId, {
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  }) => _mock.configAlertFlag(
    doorSensorId,
    notCloseAlertFlag: notCloseAlertFlag,
    notCloseAlertSecondNum: notCloseAlertSecondNum,
    longTimeNotOpenAlertFlag: longTimeNotOpenAlertFlag,
    longTimeNotOpenDayNum: longTimeNotOpenDayNum,
  );

  @override
  TaskEither<AppException, StandaloneDoorSensorAlertFlagEntity> getAlertFlag(
    int doorSensorId,
  ) => _mock.getAlertFlag(doorSensorId);

  @override
  TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> listRecord(
    int doorSensorId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _mock.listRecord(doorSensorId, pageNo: pageNo, pageSize: pageSize);

  @override
  TaskEither<AppException, Unit> configNetwork(
    int doorSensorId, {
    required String doorSensorData,
    required String wifiName,
  }) => _mock.configNetwork(
    doorSensorId,
    doorSensorData: doorSensorData,
    wifiName: wifiName,
  );

  @override
  TaskEither<AppException, Unit> addDoorSensorUser(
    int doorSensorId, {
    required String account,
    required String username,
  }) => _mock.addDoorSensorUser(
    doorSensorId,
    account: account,
    username: username,
  );

  @override
  TaskEither<AppException, Unit> deleteDoorSensorUser(
    int doorSensorId,
    int id,
  ) => _mock.deleteDoorSensorUser(doorSensorId, id);

  @override
  TaskEither<AppException, List<StandaloneDoorSensorUserEntity>>
  listDoorSensorUser(int doorSensorId, {String? searchStr}) =>
      _mock.listDoorSensorUser(doorSensorId, searchStr: searchStr);
}

class _FakeAppConfigDomain extends AppConfigDomain {
  _FakeAppConfigDomain(this._config);
  final AppConfig _config;

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.right(_config);
}

void main() {
  late _MockRepo repo;
  late MockTTDoorSensorApi doorSensorApi;
  late ProviderContainer container;
  late StandaloneDoorSensorDomain domain;

  // AppConfig(site: AppSite.cn) → resolveDeviceServerEndpoint(cn, standaloneDoorSensor)
  // → cnds.ttlock.com:5999。
  const config = AppConfig();

  final scan = TTStandaloneDoorSensorScanModel(name: 'S', mac: 'AA', rssi: -50);

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
    registerFallbackValue(
      TTStandaloneDoorSensorInitParams(
        mac: '',
        doorSensorName: '',
        wifiName: '',
        wifiPassword: '',
        serverAddress: '',
        portNumber: 0,
      ),
    );
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockRepo();
    doorSensorApi = MockTTDoorSensorApi();
    installMockAccessoryApis(doorSensorApi: doorSensorApi);
    container = ProviderContainer(
      overrides: [
        standaloneDoorSensorRepositoryProvider.overrideWith(
          () => _FakeRepo(repo),
        ),
        appConfigDomainProvider.overrideWith(
          () => _FakeAppConfigDomain(config),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(standaloneDoorSensorDomainProvider.notifier);
  });

  group('addViaBle', () {
    test('init returns doorSensorData → cloud add', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorInit(
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer(
        (_) async => TTStandaloneDoorSensorInfo(doorSensorData: 'DATA'),
      );
      when(
        () => repo.add(name: '门磁', doorSensorData: 'DATA', wifiName: 'Home'),
      ).thenAnswer((_) => TaskEither.right(7));

      final r = await domain
          .addViaBle(
            scan: scan,
            name: '门磁',
            wifiName: 'Home',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.getOrElse((_) => throw TestFailure('left')), 7);
      final captured = verify(
        () => doorSensorApi.standaloneDoorSensorInit(
          captureAny(),
          timeout: any(named: 'timeout'),
        ),
      ).captured;
      final params = captured.single as TTStandaloneDoorSensorInitParams;
      expect(params.serverAddress, 'cnds.ttlock.com');
      expect(params.portNumber, 5999);
      verify(
        () => repo.add(name: '门磁', doorSensorData: 'DATA', wifiName: 'Home'),
      ).called(1);
    });

    test('init throws → Left, no cloud add', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorInit(
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenThrow(AppException.business(code: -1, message: 'ble'));

      final r = await domain
          .addViaBle(
            scan: scan,
            name: '门磁',
            wifiName: 'Home',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.isLeft(), isTrue);
      verifyNever(
        () => repo.add(
          name: any(named: 'name'),
          doorSensorData: any(named: 'doorSensorData'),
          wifiName: any(named: 'wifiName'),
        ),
      );
    });

    test('doorSensorData empty → business(-34)', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorInit(
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) async => TTStandaloneDoorSensorInfo(doorSensorData: ''));

      final r = await domain
          .addViaBle(
            scan: scan,
            name: '门磁',
            wifiName: 'Home',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, -34);
      verifyNever(
        () => repo.add(
          name: any(named: 'name'),
          doorSensorData: any(named: 'doorSensorData'),
          wifiName: any(named: 'wifiName'),
        ),
      );
    });

    test('appConfig load fails → Left, no cloud add', () async {
      final failing = ProviderContainer(
        overrides: [
          standaloneDoorSensorRepositoryProvider.overrideWith(
            () => _FakeRepo(repo),
          ),
          appConfigDomainProvider.overrideWith(() => _FailingAppConfigDomain()),
        ],
      );
      addTearDown(failing.dispose);
      final failingDomain = failing.read(
        standaloneDoorSensorDomainProvider.notifier,
      );

      final r = await failingDomain
          .addViaBle(
            scan: scan,
            name: '门磁',
            wifiName: 'Home',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.isLeft(), isTrue);
      verifyNever(
        () => repo.add(
          name: any(named: 'name'),
          doorSensorData: any(named: 'doorSensorData'),
          wifiName: any(named: 'wifiName'),
        ),
      );
    });
  });

  group('BLE reads', () {
    test('readFeatureValue passes mac through to BLE', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorReadFeatureValue(
          'AA',
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) async => 'FV');

      final r = await domain.readFeatureValue('AA').run();

      expect(r.getOrElse((_) => throw TestFailure('left')), 'FV');
      verify(
        () => doorSensorApi.standaloneDoorSensorReadFeatureValue(
          'AA',
          timeout: any(named: 'timeout'),
        ),
      ).called(1);
    });

    test(
      'isSupportFunction passes featureValue and function through to BLE',
      () async {
        when(
          () => doorSensorApi.standaloneDoorSensorIsSupportFunction(
            'FV',
            TTStandaloneDoorSensorFeature.authCode,
            timeout: any(named: 'timeout'),
          ),
        ).thenAnswer((_) async => true);

        final r = await domain
            .isSupportFunction('FV', TTStandaloneDoorSensorFeature.authCode)
            .run();

        expect(r.getOrElse((_) => throw TestFailure('left')), isTrue);
        verify(
          () => doorSensorApi.standaloneDoorSensorIsSupportFunction(
            'FV',
            TTStandaloneDoorSensorFeature.authCode,
            timeout: any(named: 'timeout'),
          ),
        ).called(1);
      },
    );
  });

  group('cloud passthrough', () {
    test('list forwards repo PageState', () async {
      when(
        () => repo.list(pageNo: 1, pageSize: 20, searchStr: null),
      ).thenAnswer(
        (_) => TaskEither.right(
          const PageState<StandaloneDoorSensorEntity>(
            data: [StandaloneDoorSensorEntity(doorSensorId: 1)],
            currentPage: 1,
            pageSize: 20,
            total: 42,
          ),
        ),
      );

      final r = await domain.list().run();
      final page = r.getOrElse((_) => throw TestFailure('left'));

      expect(page.data, hasLength(1));
      expect(page.data.first.doorSensorId, 1);
      expect(page.currentPage, 1);
      expect(page.pageSize, 20);
      expect(page.total, 42);
      verify(
        () => repo.list(pageNo: 1, pageSize: 20, searchStr: null),
      ).called(1);
    });

    test('rename forwards to repo.update', () async {
      when(
        () => repo.update(3, '新名'),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain.rename(3, '新名').run();

      expect(r.isRight(), isTrue);
      verify(() => repo.update(3, '新名')).called(1);
    });

    test('delete forwards to repo', () async {
      when(() => repo.delete(3)).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain.delete(3).run();

      expect(r.isRight(), isTrue);
      verify(() => repo.delete(3)).called(1);
    });

    test('configAlertFlag forwards to repo', () async {
      when(
        () => repo.configAlertFlag(
          3,
          notCloseAlertFlag: 1,
          notCloseAlertSecondNum: 30,
          longTimeNotOpenAlertFlag: 0,
          longTimeNotOpenDayNum: null,
        ),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain
          .configAlertFlag(
            3,
            notCloseAlertFlag: 1,
            notCloseAlertSecondNum: 30,
            longTimeNotOpenAlertFlag: 0,
          )
          .run();

      expect(r.isRight(), isTrue);
      verify(
        () => repo.configAlertFlag(
          3,
          notCloseAlertFlag: 1,
          notCloseAlertSecondNum: 30,
          longTimeNotOpenAlertFlag: 0,
          longTimeNotOpenDayNum: null,
        ),
      ).called(1);
    });

    test('getAlertFlag forwards to repo', () async {
      when(() => repo.getAlertFlag(3)).thenAnswer(
        (_) => TaskEither.right(
          const StandaloneDoorSensorAlertFlagEntity(notCloseAlertFlag: 1),
        ),
      );

      final r = await domain.getAlertFlag(3).run();

      expect(
        r.getOrElse((_) => throw TestFailure('left')).notCloseAlertFlag,
        1,
      );
      verify(() => repo.getAlertFlag(3)).called(1);
    });

    test('listRecord forwards to repo', () async {
      when(() => repo.listRecord(3, pageNo: 1, pageSize: 20)).thenAnswer(
        (_) => TaskEither.right(const <StandaloneDoorSensorRecordEntity>[]),
      );

      final r = await domain.listRecord(3).run();

      expect(r.getOrElse((_) => throw TestFailure('left')), isEmpty);
      verify(() => repo.listRecord(3, pageNo: 1, pageSize: 20)).called(1);
    });

    test('reconfigWifiViaBle: init → cloud configNetwork', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorInit(
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer(
        (_) async => TTStandaloneDoorSensorInfo(doorSensorData: 'DATA'),
      );
      when(
        () => repo.configNetwork(
          9,
          doorSensorData: 'DATA',
          wifiName: 'NewWifi',
        ),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain
          .reconfigWifiViaBle(
            item: const StandaloneDoorSensorEntity(
              name: '门磁',
              mac: 'AA',
              doorSensorId: 9,
            ),
            wifiName: 'NewWifi',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.isRight(), isTrue);
      final captured = verify(
        () => doorSensorApi.standaloneDoorSensorInit(
          captureAny(),
          timeout: any(named: 'timeout'),
        ),
      ).captured;
      final params = captured.single as TTStandaloneDoorSensorInitParams;
      expect(params.mac, 'AA');
      expect(params.doorSensorName, '门磁');
      expect(params.wifiName, 'NewWifi');
      expect(params.wifiPassword, 'pwd');
      expect(params.serverAddress, 'cnds.ttlock.com');
      expect(params.portNumber, 5999);
      verify(
        () => repo.configNetwork(
          9,
          doorSensorData: 'DATA',
          wifiName: 'NewWifi',
        ),
      ).called(1);
    });

    test('reconfigWifiViaBle: empty doorSensorData → business(-34)', () async {
      when(
        () => doorSensorApi.standaloneDoorSensorInit(
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer(
        (_) async => TTStandaloneDoorSensorInfo(doorSensorData: ''),
      );

      final r = await domain
          .reconfigWifiViaBle(
            item: const StandaloneDoorSensorEntity(
              name: '门磁',
              mac: 'AA',
              doorSensorId: 9,
            ),
            wifiName: 'NewWifi',
            wifiPassword: 'pwd',
          )
          .run();

      expect(r.isLeft(), isTrue);
      expect((r.getLeft().toNullable()! as AppBusinessException).code, -34);
      verifyNever(
        () => repo.configNetwork(
          any(),
          doorSensorData: any(named: 'doorSensorData'),
          wifiName: any(named: 'wifiName'),
        ),
      );
    });

    test('addDoorSensorUser forwards to repo', () async {
      when(
        () => repo.addDoorSensorUser(
          3,
          account: 'a@email.com',
          username: 'u',
        ),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain
          .addDoorSensorUser(3, account: 'a@email.com', username: 'u')
          .run();

      expect(r.isRight(), isTrue);
      verify(
        () => repo.addDoorSensorUser(
          3,
          account: 'a@email.com',
          username: 'u',
        ),
      ).called(1);
    });

    test('deleteDoorSensorUser forwards to repo', () async {
      when(
        () => repo.deleteDoorSensorUser(3, 7),
      ).thenAnswer((_) => TaskEither.right(unit));

      final r = await domain.deleteDoorSensorUser(3, 7).run();

      expect(r.isRight(), isTrue);
      verify(() => repo.deleteDoorSensorUser(3, 7)).called(1);
    });

    test('listDoorSensorUser forwards to repo', () async {
      when(() => repo.listDoorSensorUser(3, searchStr: null)).thenAnswer(
        (_) => TaskEither.right(const <StandaloneDoorSensorUserEntity>[]),
      );

      final r = await domain.listDoorSensorUser(3).run();

      expect(r.getOrElse((_) => throw TestFailure('left')), isEmpty);
      verify(() => repo.listDoorSensorUser(3, searchStr: null)).called(1);
    });
  });
}

class _FailingAppConfigDomain extends AppConfigDomain {
  @override
  TaskEither<AppException, AppConfig> load() =>
      TaskEither.left(AppException.business(code: -1, message: 'config'));
}
