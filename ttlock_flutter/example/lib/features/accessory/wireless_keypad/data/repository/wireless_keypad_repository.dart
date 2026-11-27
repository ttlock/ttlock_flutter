import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/data_source/wireless_keypad_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/repository/wireless_keypad_repository_interface.dart';

part 'wireless_keypad_repository.g.dart';

/// 键盘的槽位 / 类型 / 特征值全部来自云端 `listByLock`，
/// **本地不再缓存任何 meta**（云端是权威源）。
@Riverpod(keepAlive: true)
class WirelessKeypadRepository extends _$WirelessKeypadRepository
    implements WirelessKeypadRepositoryInterface {
  late final WirelessKeypadDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(wirelessKeypadDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<WirelessKeypadEntity>> listByLock(
    int lockId, {
    int? hasSlot,
  }) => _map(
    _dataSource.listByLock(lockId: lockId, hasSlot: hasSlot),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    required String wirelessKeypadName,
    required String wirelessKeypadNumber,
    required String wirelessKeypadFeatureValue,
    int? electricQuantity,
    int? hasSlot,
    int? slotNumber,
    int? slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  }) {
    final name = wirelessKeypadName.trim();
    final number = wirelessKeypadNumber.trim();
    final feature = wirelessKeypadFeatureValue.trim();
    if (name.isEmpty || number.isEmpty || feature.isEmpty) {
      return TaskEither.left(
        const AppException.business(
          code: -1,
          message: 'wireless_keypad_add_fields_required',
        ),
      );
    }
    return _dataSource.add(
      lockId: lockId,
      wirelessKeypadNumber: number,
      wirelessKeypadName: name,
      wirelessKeypadMac: mac,
      wirelessKeypadFeatureValue: feature,
      electricQuantity: electricQuantity,
      hasSlot: hasSlot,
      slotNumber: slotNumber,
      slotLimit: slotLimit,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
    );
  }

  @override
  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId) =>
      _dataSource.listSlots(wirelessKeypadId);

  @override
  TaskEither<AppException, Unit> delete(
    int wirelessKeypadId, {
    int? slotNumber,
  }) => _dataSource
      .delete(wirelessKeypadId: wirelessKeypadId, slotNumber: slotNumber)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(
    int wirelessKeypadId,
    String name, {
    int? slotNumber,
  }) => _dataSource
      .rename(
        wirelessKeypadId: wirelessKeypadId,
        wirelessKeypadName: name,
        slotNumber: slotNumber,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, WirelessKeypadUpgradeCheck> checkUpgrade({
    required int wirelessKeypadId,
    required int slotNumber,
  }) => _map(
    _dataSource.upgradeCheck(
      wirelessKeypadId: wirelessKeypadId,
      slotNumber: slotNumber,
    ),
    (dto) => WirelessKeypadUpgradeCheck(
      needUpgrade: dto.needsUpgrade,
      version: dto.version,
    ),
  );

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
            message: '无线键盘数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
