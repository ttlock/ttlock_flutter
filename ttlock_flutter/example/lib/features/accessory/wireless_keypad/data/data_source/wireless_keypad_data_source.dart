import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/data_source/wireless_keypad_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/model/wireless_keypad_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';

part 'wireless_keypad_data_source.g.dart';

@Riverpod(keepAlive: true)
WirelessKeypadApi wirelessKeypadApi(Ref ref) =>
    WirelessKeypadApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class WirelessKeypadDataSource extends _$WirelessKeypadDataSource {
  late final WirelessKeypadApi _api;

  @override
  void build() {
    _api = ref.watch(wirelessKeypadApiProvider);
  }

  TaskEither<AppException, int> add({
    required int lockId,
    required String wirelessKeypadNumber,
    required String wirelessKeypadName,
    required String wirelessKeypadMac,
    required String wirelessKeypadFeatureValue,
    int? electricQuantity,
    int? hasSlot,
    int? slotNumber,
    int? slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      wirelessKeypadNumber: wirelessKeypadNumber,
      wirelessKeypadName: wirelessKeypadName,
      wirelessKeypadMac: wirelessKeypadMac,
      wirelessKeypadFeatureValue: wirelessKeypadFeatureValue,
      electricQuantity: electricQuantity,
      hasSlot: hasSlot,
      slotNumber: slotNumber,
      slotLimit: slotLimit,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
    ),
    (json) => intFromDynamic(json['wirelessKeypadId']),
  );

  TaskEither<AppException, List<WirelessKeypadDto>> listByLock({
    required int lockId,
    int? hasSlot,
  }) => _parse(
    () => _api.listByLock(lockId: lockId, hasSlot: hasSlot),
    _wirelessKeypadListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int wirelessKeypadId,
    int? slotNumber,
  }) => _write(
    () =>
        _api.delete(wirelessKeypadId: wirelessKeypadId, slotNumber: slotNumber),
  );

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int wirelessKeypadId,
    required String wirelessKeypadName,
    int? slotNumber,
  }) => _write(
    () => _api.rename(
      wirelessKeypadId: wirelessKeypadId,
      wirelessKeypadName: wirelessKeypadName,
      slotNumber: slotNumber,
    ),
  );

  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId) =>
      _parse(
        () => _api.listSlot(wirelessKeypadId: wirelessKeypadId),
        _keypadSlotListFromJson,
      );

  TaskEither<AppException, WirelessKeypadUpgradeCheckDto> upgradeCheck({
    required int wirelessKeypadId,
    required int slotNumber,
  }) => _parse(
    () => _api.upgradeCheck(
      wirelessKeypadId: wirelessKeypadId,
      slotNumber: slotNumber,
    ),
    WirelessKeypadUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> upgradeSuccess({
    required int wirelessKeypadId,
    required int slotNumber,
    String? featureValue,
  }) => _write(
    () => _api.upgradeSuccess(
      wirelessKeypadId: wirelessKeypadId,
      slotNumber: slotNumber,
      featureValue: featureValue,
    ),
  );

  List<WirelessKeypadDto> _wirelessKeypadListFromJson(
    Map<String, dynamic> json,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) =>
              WirelessKeypadDto.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  List<KeypadSlot> _keypadSlotListFromJson(Map<String, dynamic> json) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map((e) => KeypadSlotDto.fromJson(Map<String, dynamic>.from(e as Map)))
        .map((dto) => dto.toEntity())
        .toList();
  }

  TaskEither<AppException, OpenApiEnvelope> _write(
    Future<OpenApiEnvelope> Function() call,
  ) => TaskEither.tryCatch(() async {
    final envelope = await call();
    if (!envelope.isOk) {
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return envelope;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, T> _parse<T>(
    Future<dynamic> Function() call,
    T Function(Map<String, dynamic> json) mapper,
  ) => TaskEither.tryCatch(() async {
    final raw = await call();
    final json = Map<String, dynamic>.from(raw as Map);
    final errcode = json['errcode'];
    if (errcode is int && errcode != 0) {
      final envelope = OpenApiEnvelope.fromJson(json);
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return mapper(json);
  }, ExceptionUtils.extractAppException);
}
