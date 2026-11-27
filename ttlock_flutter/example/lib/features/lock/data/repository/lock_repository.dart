import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_setting_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_setting_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/lock_repository_interface.dart';

part 'lock_repository.g.dart';

@Riverpod(keepAlive: true)
class LockRepository extends _$LockRepository
    implements LockRepositoryInterface {
  late final LockDataSource _dataSource;
  late final LockSettingDataSource _setting;

  @override
  void build() {
    _dataSource = ref.watch(lockDataSourceProvider.notifier);
    _setting = ref.watch(lockSettingDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<LockEntity>> getLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => _map(
    _dataSource.list(pageNo: pageNo, pageSize: pageSize, groupId: groupId),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _map(_dataSource.detail(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<
    AppException,
    ({LockEntity lock, LockCloudSettings settings})
  >
  getLockDetailWithSettings(int lockId) => _map(
    _dataSource.detail(lockId: lockId),
    (dto) => (lock: dto.toEntity(), settings: dto.toCloudSettings()),
  );

  @override
  TaskEither<AppException, LockInitializeResult> initializeLock(
    String lockData, {
    String? lockAlias,
    int? groupId,
  }) => _map(
    _dataSource.initialize(
      lockData: lockData,
      lockAlias: lockAlias,
      groupId: groupId,
    ),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> renameLock(int lockId, String lockAlias) =>
      _dataSource.rename(lockId: lockId, lockAlias: lockAlias).map((_) => unit);

  @override
  TaskEither<AppException, Unit> deleteLock(int lockId) =>
      _dataSource.delete(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> unlock(int lockId) =>
      _dataSource.unlock(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> lock(int lockId) =>
      _dataSource.lock(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> transfer(
    List<int> lockIdList,
    String receiverUsername,
  ) => _setting
      .transfer(receiverUsername: receiverUsername, lockIdList: lockIdList)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateLockData(
    int lockId, {
    required String lockData,
  }) => _setting
      .updateLockData(lockId: lockId, lockData: lockData)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> setAutoLockTime(
    int lockId,
    int seconds, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _setting
      .setAutoLockTime(lockId: lockId, seconds: seconds, channel: channel)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateSetting(
    int lockId,
    LockSettingUpdate setting,
  ) => _setting
      .updateSetting(
        lockId: lockId,
        type: setting.type,
        value: setting.value,
        channel: setting.channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, ExtraSettingEntity> getExtraSetting(
    int lockId, {
    required int type,
  }) => _map(
    _setting.getExtraSetting(lockId: lockId, type: type),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, int> querySetting(int lockId, {required int type}) =>
      _setting.querySetting(lockId: lockId, type: type);

  @override
  TaskEither<AppException, Unit> configPassageMode(
    int lockId, {
    required int passageMode,
    int? startDate,
    int? endDate,
    int? isAllDay,
    List<int>? weekDays,
    int? autoUnlock,
    ChannelType channel = ChannelType.bleSynced,
  }) => _setting
      .configPassageMode(
        lockId: lockId,
        passageMode: passageMode,
        startDate: startDate,
        endDate: endDate,
        isAllDay: isAllDay,
        weekDays: weekDays,
        autoUnlock: autoUnlock,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, PassageModeConfigEntity> getPassageModeConfig(
    int lockId,
  ) => _map(
    _setting.getPassageModeConfig(lockId: lockId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> configWorkingMode(
    int lockId, {
    required int workingMode,
    List<WorkingModeCyclicConfigEntity>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _setting
      .configWorkingMode(
        lockId: lockId,
        workingMode: workingMode,
        cyclicConfig: cyclicConfig
            ?.map(
              (e) => WorkingModeCyclicConfigDto(
                isAllDay: e.isAllDay,
                startTime: e.startTime,
                endTime: e.endTime,
                weekDays: e.weekDays,
              ),
            )
            .toList(),
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, WorkingModeEntity> getWorkingMode(int lockId) =>
      _map(_setting.getWorkingMode(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, String> changeTimezoneRawOffset(
    int lockId,
    int timezoneRawOffset, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _map(
    _setting.changeTimezoneRawOffset(
      lockId: lockId,
      timezoneRawOffset: timezoneRawOffset,
      channel: channel,
    ),
    (dto) => dto.lockData,
  );

  @override
  TaskEither<AppException, DateTime?> updateDate(int lockId) =>
      _setting.updateDate(lockId: lockId);

  @override
  TaskEither<AppException, Unit> updateElectricQuantity(
    int lockId,
    int electricQuantity,
  ) => _setting
      .updateElectricQuantity(
        lockId: lockId,
        electricQuantity: electricQuantity,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateAccessoryElectricQuantity({
    required int type,
    required String mac,
    required int electricQuantity,
    required int updateDate,
  }) => _setting
      .updateAccessoryElectricQuantity(
        type: type,
        mac: mac,
        electricQuantity: electricQuantity,
        updateDate: updateDate,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateUnauthorizedAttemptAlert(
    int lockId, {
    ChannelType channel = ChannelType.bleSynced,
    required int flag,
    required int count,
    required int lockTime,
    int? pwd,
    int? card,
    int? fingerprint,
  }) => _setting
      .updateUnauthorizedAttemptAlert(
        lockId: lockId,
        channel: channel,
        flag: flag,
        count: count,
        lockTime: lockTime,
        pwd: pwd,
        card: card,
        fingerprint: fingerprint,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, int> queryElectricQuantity(int lockId) =>
      _setting.queryElectricQuantity(lockId: lockId);

  @override
  TaskEither<AppException, int> queryOpenState(int lockId) =>
      _setting.queryOpenState(lockId: lockId);

  @override
  TaskEither<AppException, int> queryStatus(int lockId) =>
      _setting.queryStatus(lockId: lockId);

  @override
  TaskEither<AppException, DateTime?> queryDate(int lockId) =>
      _setting.queryDate(lockId: lockId);

  @override
  TaskEither<AppException, Unit> deleteAllKey(int lockId) =>
      _setting.deleteAllKey(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> registerNb(
    int lockId, {
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  }) => _setting
      .registerNb(
        lockId: lockId,
        nbNodeId: nbNodeId,
        nbCardNumber: nbCardNumber,
        nbOperator: nbOperator,
        nbRssi: nbRssi,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, NbDeviceInfoEntity> getNbDeviceInfo(int lockId) =>
      _map(_setting.getNbDeviceInfo(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, List<NbPlatformEndpointEntity>>
  getNbPlatformIpAndPort() => _map(
    _setting.getNbPlatformIpAndPort(),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, LockUpgradeCheckEntity> upgradeCheck(int lockId) =>
      _map(_setting.upgradeCheck(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, LockUpgradeCheckEntity> upgradeRecheck(
    int lockId,
    String lockData,
  ) => _map(
    _setting.upgradeRecheck(lockId: lockId, lockData: lockData),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, LockUpgradeCheckEntity> upgradeCheckForOnPremise({
    required String secret,
    required String lockData,
    String? account,
  }) => _map(
    _setting.upgradeCheckForOnPremise(
      secret: secret,
      lockData: lockData,
      account: account,
    ),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, PageState<HotelLockEntity>> listByHotel({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  }) => _map(
    _setting.listByHotel(
      pageNo: pageNo,
      pageSize: pageSize,
      type: type,
      lockAlias: lockAlias,
      groupId: groupId,
    ),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, Unit> setHotelCardSector(
    int lockId,
    String sector,
  ) => _setting
      .setHotelCardSector(lockId: lockId, sector: sector)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> emergencyLock(int lockId, int autoLockTime) =>
      _setting
          .emergencyLock(lockId: lockId, autoLockTime: autoLockTime)
          .map((_) => unit);

  @override
  TaskEither<AppException, Unit> emergencyUnlock(int lockId) =>
      _setting.emergencyUnlock(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, LockImportDataEntity> getImportData({
    required int lockId,
    required int fromLockId,
  }) => _map(
    _setting.getImportData(lockId: lockId, fromLockId: fromLockId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> importSuccess({
    required int lockId,
    required int fromLockId,
    List<int>? keyboardPwdIdList,
    List<int>? cardIdList,
  }) => _setting
      .importSuccess(
        lockId: lockId,
        fromLockId: fromLockId,
        keyboardPwdIdList: keyboardPwdIdList,
        cardIdList: cardIdList,
      )
      .map((_) => unit);

  TaskEither<AppException, R> _map<T, R>(
    TaskEither<AppException, T> call,
    R Function(T) mapper,
  ) => TaskEither(() async {
    final result = await call.run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(mapper(dto));
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '锁数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
