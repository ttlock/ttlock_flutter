import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

abstract class LockRepositoryInterface {
  TaskEither<AppException, PageState<LockEntity>> getLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  });

  TaskEither<AppException, LockEntity> getLockDetail(int lockId);

  /// 一次 detail 请求同时拿到基础 Entity 与云端设置快照。
  TaskEither<
    AppException,
    ({LockEntity lock, LockCloudSettings settings})
  >
  getLockDetailWithSettings(int lockId);

  TaskEither<AppException, LockInitializeResult> initializeLock(
    String lockData, {
    String? lockAlias,
    int? groupId,
  });

  TaskEither<AppException, Unit> renameLock(int lockId, String lockAlias);

  TaskEither<AppException, Unit> deleteLock(int lockId);

  TaskEither<AppException, Unit> unlock(int lockId);

  TaskEither<AppException, Unit> lock(int lockId);

  TaskEither<AppException, Unit> transfer(
    List<int> lockIdList,
    String receiverUsername,
  );

  TaskEither<AppException, Unit> updateLockData(
    int lockId, {
    required String lockData,
  });

  TaskEither<AppException, Unit> setAutoLockTime(
    int lockId,
    int seconds, {
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> updateSetting(
    int lockId,
    LockSettingUpdate setting,
  );

  TaskEither<AppException, ExtraSettingEntity> getExtraSetting(
    int lockId, {
    required int type,
  });

  TaskEither<AppException, int> querySetting(int lockId, {required int type});

  TaskEither<AppException, Unit> configPassageMode(
    int lockId, {
    required int passageMode,
    int? startDate,
    int? endDate,
    int? isAllDay,
    List<int>? weekDays,
    int? autoUnlock,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, PassageModeConfigEntity> getPassageModeConfig(
    int lockId,
  );

  TaskEither<AppException, Unit> configWorkingMode(
    int lockId, {
    required int workingMode,
    List<WorkingModeCyclicConfigEntity>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, WorkingModeEntity> getWorkingMode(int lockId);

  TaskEither<AppException, String> changeTimezoneRawOffset(
    int lockId,
    int timezoneRawOffset, {
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, DateTime?> updateDate(int lockId);

  TaskEither<AppException, Unit> updateElectricQuantity(
    int lockId,
    int electricQuantity,
  );

  TaskEither<AppException, Unit> updateAccessoryElectricQuantity({
    required int type,
    required String mac,
    required int electricQuantity,
    required int updateDate,
  });

  TaskEither<AppException, Unit> updateUnauthorizedAttemptAlert(
    int lockId, {
    ChannelType channel = ChannelType.bleSynced,
    required int flag,
    required int count,
    required int lockTime,
    int? pwd,
    int? card,
    int? fingerprint,
  });

  TaskEither<AppException, int> queryElectricQuantity(int lockId);

  TaskEither<AppException, int> queryOpenState(int lockId);

  TaskEither<AppException, int> queryStatus(int lockId);

  TaskEither<AppException, DateTime?> queryDate(int lockId);

  TaskEither<AppException, Unit> deleteAllKey(int lockId);

  TaskEither<AppException, Unit> registerNb(
    int lockId, {
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  });

  TaskEither<AppException, NbDeviceInfoEntity> getNbDeviceInfo(int lockId);

  TaskEither<AppException, List<NbPlatformEndpointEntity>>
  getNbPlatformIpAndPort();

  TaskEither<AppException, LockUpgradeCheckEntity> upgradeCheck(int lockId);

  TaskEither<AppException, LockUpgradeCheckEntity> upgradeRecheck(
    int lockId,
    String lockData,
  );

  TaskEither<AppException, LockUpgradeCheckEntity> upgradeCheckForOnPremise({
    required String secret,
    required String lockData,
    String? account,
  });

  TaskEither<AppException, PageState<HotelLockEntity>> listByHotel({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  });

  TaskEither<AppException, Unit> setHotelCardSector(int lockId, String sector);

  TaskEither<AppException, Unit> emergencyLock(int lockId, int autoLockTime);

  TaskEither<AppException, Unit> emergencyUnlock(int lockId);

  TaskEither<AppException, LockImportDataEntity> getImportData({
    required int lockId,
    required int fromLockId,
  });

  TaskEither<AppException, Unit> importSuccess({
    required int lockId,
    required int fromLockId,
    List<int>? keyboardPwdIdList,
    List<int>? cardIdList,
  });
}
