import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/repository/door_sensor_repository_interface.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';

part 'standalone_door_sensor_domain.g.dart';

@Riverpod(keepAlive: true)
class StandaloneDoorSensorDomain extends _$StandaloneDoorSensorDomain {
  late final StandaloneDoorSensorRepositoryInterface _repo;
  late final AppConfigDomain _appConfig;

  @override
  void build() {
    _repo = ref.watch(standaloneDoorSensorRepositoryProvider.notifier);
    _appConfig = ref.watch(appConfigDomainProvider.notifier);
  }

  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _repo.list(pageNo: pageNo, pageSize: pageSize, searchStr: searchStr);

  TaskEither<AppException, Unit> rename(int doorSensorId, String name) =>
      _repo.update(doorSensorId, name);

  TaskEither<AppException, Unit> delete(int doorSensorId) =>
      _repo.delete(doorSensorId);

  TaskEither<AppException, Unit> configAlertFlag(
    int doorSensorId, {
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  }) => _repo.configAlertFlag(
    doorSensorId,
    notCloseAlertFlag: notCloseAlertFlag,
    notCloseAlertSecondNum: notCloseAlertSecondNum,
    longTimeNotOpenAlertFlag: longTimeNotOpenAlertFlag,
    longTimeNotOpenDayNum: longTimeNotOpenDayNum,
  );

  TaskEither<AppException, StandaloneDoorSensorAlertFlagEntity> getAlertFlag(
    int doorSensorId,
  ) => _repo.getAlertFlag(doorSensorId);

  TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> listRecord(
    int doorSensorId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _repo.listRecord(doorSensorId, pageNo: pageNo, pageSize: pageSize);

  TaskEither<AppException, Unit> addDoorSensorUser(
    int doorSensorId, {
    required String account,
    required String username,
  }) => _repo.addDoorSensorUser(
    doorSensorId,
    account: account,
    username: username,
  );

  TaskEither<AppException, Unit> deleteDoorSensorUser(
    int doorSensorId,
    int id,
  ) => _repo.deleteDoorSensorUser(doorSensorId, id);

  TaskEither<AppException, List<StandaloneDoorSensorUserEntity>>
  listDoorSensorUser(int doorSensorId, {String? searchStr}) =>
      _repo.listDoorSensorUser(doorSensorId, searchStr: searchStr);

  /// BLE 配网：init（server/port 来自 AppConfig）→ 云 add。
  /// `doorSensorData` 为空 → business(-34)。云 add 恒调（Task 0：原生 init 无内联注册）。
  TaskEither<AppException, int> addViaBle({
    required TTStandaloneDoorSensorScanModel scan,
    required String name,
    required String wifiName,
    required String wifiPassword,
  }) => TaskEither.tryCatch(() async {
    final (server, port) = await _runOrThrow(_serverConfig());
    final info = await runBle(
      () => TTLock.doorSensor.standaloneDoorSensorInit(
        TTStandaloneDoorSensorInitParams(
          mac: scan.mac,
          doorSensorName: name,
          wifiName: wifiName,
          wifiPassword: wifiPassword,
          serverAddress: server,
          portNumber: port,
        ),
      ),
    );
    final data = info.doorSensorData;
    if (data == null || data.isEmpty) {
      throw AppException.business(
        code: -34,
        message: 'door_sensor_data_missing',
      );
    }
    return _runOrThrow(
      _repo.add(name: name, doorSensorData: data, wifiName: wifiName),
    );
  }, ExceptionUtils.extractAppException);

  /// WiFi 重配：原 mac/name + 新 wifi 再 init → 云 `configNetwork(doorSensorData, wifiName)`。
  /// 不扫；调用方须先提示用户重新通电。`doorSensorData` 空 → business(-34)。
  TaskEither<AppException, Unit> reconfigWifiViaBle({
    required StandaloneDoorSensorEntity item,
    required String wifiName,
    required String wifiPassword,
  }) => TaskEither.tryCatch(() async {
    final (server, port) = await _runOrThrow(_serverConfig());
    final info = await runBle(
      () => TTLock.doorSensor.standaloneDoorSensorInit(
        TTStandaloneDoorSensorInitParams(
          mac: item.mac,
          doorSensorName: item.name,
          wifiName: wifiName,
          wifiPassword: wifiPassword,
          serverAddress: server,
          portNumber: port,
        ),
      ),
    );
    final data = info.doorSensorData;
    if (data == null || data.isEmpty) {
      throw AppException.business(
        code: -34,
        message: 'door_sensor_data_missing',
      );
    }
    await _runOrThrow(
      _repo.configNetwork(
        item.doorSensorId,
        doorSensorData: data,
        wifiName: wifiName,
      ),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 读设备能力位（K）；仅供 detail 显隐判断。
  TaskEither<AppException, String> readFeatureValue(String mac) =>
      TaskEither.tryCatch(
        () => runBle(
          () => TTLock.doorSensor.standaloneDoorSensorReadFeatureValue(mac),
        ),
        ExceptionUtils.extractAppException,
      );

  TaskEither<AppException, bool> isSupportFunction(
    String featureValue,
    TTStandaloneDoorSensorFeature function,
  ) => TaskEither.tryCatch(
    () => runBle(
      () => TTLock.doorSensor.standaloneDoorSensorIsSupportFunction(
        featureValue,
        function,
      ),
    ),
    ExceptionUtils.extractAppException,
  );

  /// 服务器端点来自站点表：`resolveDeviceServerEndpoint(AppSite.cn/overseas, ...)`
  /// → cnds.ttlock.com:5999 / euds.ttlock.com:5999（无 scheme、无路径）。
  TaskEither<AppException, (String, int)> _serverConfig() => _appConfig
      .endpointFor(DeviceServerKind.standaloneDoorSensor)
      .map((ep) => (ep.address, ep.port));

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((err) => throw err, (value) => value);
  }
}
