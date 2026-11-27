import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_add_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_notifier.dart';
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

TTStandaloneDoorSensorScanModel _scan(String mac, {int rssi = -50}) =>
    TTStandaloneDoorSensorScanModel(name: 'S', mac: mac, rssi: rssi);

void main() {
  late _MockRepo repo;
  late MockTTDoorSensorApi doorSensorApi;
  late ProviderContainer container;
  late StandaloneDoorSensorAddNotifier notifier;

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
    notifier = container.read(standaloneDoorSensorAddProvider.notifier);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(standaloneDoorSensorAddProvider, (_, _) {});

    // 默认扫描流为空，避免 startScan 在未 stubbed 时抛 MissingStubError。
    when(
      () => doorSensorApi.accessoryStandaloneDoorSensorStartScan(),
    ).thenAnswer((_) => const Stream<TTStandaloneDoorSensorScanModel>.empty());
  });

  test('pick→submit链：init→云add→done', () async {
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

    await notifier.startScan();
    await notifier.pick(scan);
    await notifier.submit(name: '门磁', wifiName: 'Home', wifiPassword: 'pwd');

    final step = notifier.state.value!.step;
    expect(step, isA<StandaloneAddStepDone>());
    expect((step as StandaloneAddStepDone).doorSensorId, 7);
    verify(
      () => doorSensorApi.standaloneDoorSensorInit(
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verify(
      () => repo.add(name: '门磁', doorSensorData: 'DATA', wifiName: 'Home'),
    ).called(1);
  });

  test('成功后 invalidate 列表（重建触发再拉取）', () async {
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
    when(
      () => repo.list(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        searchStr: any(named: 'searchStr'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        PageState<StandaloneDoorSensorEntity>(
          data: const [],
          currentPage: 1,
          total: 0,
        ),
      ),
    );

    // 模拟列表页面 watch：保持 list provider 存活，invalidate 才会触发重建。
    container.listen(standaloneDoorSensorListProvider, (_, _) {});
    await container.read(standaloneDoorSensorListProvider.future);

    await notifier.startScan();
    await notifier.pick(scan);
    await notifier.submit(name: '门磁', wifiName: 'Home', wifiPassword: 'pwd');

    expect(notifier.state.value!.step, isA<StandaloneAddStepDone>());
    await pumpEventQueue();
    // 首次 listen 构建 + invalidate 后重建 → list 被调用 2 次。
    verify(
      () => repo.list(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        searchStr: any(named: 'searchStr'),
      ),
    ).called(2);
  });

  test('init抛错 → failure，不发起云add', () async {
    when(
      () => doorSensorApi.standaloneDoorSensorInit(
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenThrow(AppException.business(code: -1, message: 'ble'));

    await notifier.startScan();
    await notifier.pick(scan);
    await notifier.submit(name: '门磁', wifiName: 'Home', wifiPassword: 'pwd');

    final step = notifier.state.value!.step;
    expect(step, isA<StandaloneAddStepFailure>());
    verifyNever(
      () => repo.add(
        name: any(named: 'name'),
        doorSensorData: any(named: 'doorSensorData'),
        wifiName: any(named: 'wifiName'),
      ),
    );
  });

  test('startScan 收集设备（按 mac 去重）', () async {
    final controller = StreamController<TTStandaloneDoorSensorScanModel>();
    when(
      () => doorSensorApi.accessoryStandaloneDoorSensorStartScan(),
    ).thenAnswer((_) => controller.stream);

    await notifier.startScan();
    controller.add(_scan('AA:1'));
    controller.add(_scan('AA:2', rssi: -40));
    controller.add(_scan('AA:1'));
    await controller.close();
    await pumpEventQueue();

    final step = notifier.state.value!.step;
    expect(step, isA<StandaloneAddStepScanning>());
    expect(((step as StandaloneAddStepScanning).devices).keys, [
      'AA:1',
      'AA:2',
    ]);
  });
}
