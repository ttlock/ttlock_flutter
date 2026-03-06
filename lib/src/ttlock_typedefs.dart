import 'package:ttlock_premise_flutter/src/ttlock_enums.dart';
import 'package:ttlock_premise_flutter/src/ttlock_scan_models.dart';

typedef TTSuccessCallback = void Function();
typedef TTFailedCallback = void Function(
    TTLockError errorCode, String errorMsg);
typedef TTLockScanCallback = void Function(TTLockScanModel scanModel);
typedef TTBluetoothStateCallback = void Function(TTBluetoothState state);
typedef TTBluetoothScanStateCallback = void Function(bool isScanning);
typedef TTLockDataCallback = void Function(String lockData);
typedef TTControlLockCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);
typedef TTGetAdminPasscodeCallback = void Function(String adminPasscode);
typedef TTGetLockElectricQuantityCallback = void Function(int electricQuantity);
typedef TTGetLockOperateRecordCallback = void Function(String records);
typedef TTGetLockSpecialValueCallback = void Function(int specialValue);
typedef TTGetLockTimeCallback = void Function(int timestamp);
typedef TTGetLockSystemCallback = void Function(
    TTLockSystemModel lockSystemModel);

typedef TTGetLockPasscodeDataCallback = void Function(String passcodeData);
typedef TTGetLockAutomaticLockingPeriodicTimeCallback = void Function(
    int currentTime, int minTime, int maxTime);
typedef TTGetAllPasscodeCallback = void Function(List passcodeList);

typedef TTAddCardProgressCallback = void Function();
typedef TTCardNumberCallback = void Function(String cardNumber);
typedef TTGetAllCardsCallback = void Function(List cardList);

typedef TTAddFingerprintProgressCallback = void Function(
    int currentCount, int totalCount);
typedef TTAddFingerprintCallback = void Function(String fingerprintNumber);
typedef TTGetAllFingerprintsCallback = void Function(List fingerprintList);
typedef TTGetSwitchStateCallback = void Function(bool isOn);
typedef TTGetLockStatusCallback = void Function(TTLockSwitchState state);
typedef TTGetLockDirectionCallback = void Function(TTLockDirection direction);

typedef TTGatewayFailedCallback = void Function(
    TTGatewayError errorCode, String errorMsg);
typedef TTGatewayScanCallback = void Function(TTGatewayScanModel scanModel);
typedef TTGatewayConnectCallback = void Function(TTGatewayConnectStatus status);
typedef TTGatewayDisconnectCallback = void Function();
typedef TTGatewayGetAroundWifiCallback = void Function(
    bool finished, List wifiList);
typedef TTGatewayInitCallback = void Function(Map map);
typedef TTFunctionSupportCallback = void Function(bool isSupport);

typedef TTLiftCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);

typedef TTGetNbAwakeModesCallback = void Function(List<TTNbAwakeMode> list);
typedef TTGetNbAwakeTimesCallback = void Function(
    List<TTNbAwakeTimeModel> list);

typedef TTGetLockVersionCallback = void Function(String lockVersion);

typedef TTWifiLockScanWifiCallback = void Function(
    bool finished, List wifiList);

typedef TTWifiLockGetWifiInfoCallback = void Function(TTWifiInfoModel wifiInfo);

typedef TTCameraLockConfigWifiCallback = void Function(String serialNumber, String wifiName);

typedef TTGetLockSoundWithSoundVolumeCallback = void Function(
    TTSoundVolumeType ttLocksoundVolumeType);

typedef TTRemoteFailedCallback = void Function(
    TTRemoteAccessoryError errorCode, String errorMsg);
typedef TTRemoteAccessoryScanCallback = void Function(
    TTRemoteAccessoryScanModel scanModel);

typedef TTGetLockAccessoryElectricQuantity = void Function(
    int electricQuantity, int updateDate);

typedef TTRemoteKeypadSuccessCallback = void Function();

typedef TTRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity, String wirelessKeypadFeatureValue);

typedef TTMultifunctionalRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity,
    String wirelessKeypadFeatureValue,
    int slotNumber,
    int slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision);

typedef TTRemoteKeypadGetStoredLockSuccessCallback = void Function(
    List lockMacs);

typedef TTRemoteKeypadFailedCallback = void Function(
    TTRemoteKeyPadAccessoryError errorCode, String errorMsg);

typedef TTAddFaceProgressCallback = void Function(
    TTFaceState state, TTFaceErrorCode faceErrorCode);

typedef TTAddFaceSuccessCallback = void Function(String faceNumber);
