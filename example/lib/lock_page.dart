import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:bmprogresshud/progresshud.dart';

class LockPage extends StatefulWidget {
  LockPage(
      {Key? key,
      required this.title,
      required this.lockData,
      required this.lockMac})
      : super(key: key);
  final String title;
  final String lockData;
  final String lockMac;
  @override
  _LockPageState createState() => _LockPageState(lockData, lockMac);
}

enum Command {
  resetLock,
  unlock,
  resetEkey,
  modifyAdminPasscode,
  getLockTime,
  setLockTime,
  getLockPower,
  getLockOperateRecord,
  getLockSwitchState,
  customPasscode,
  modifyPasscode,
  deletePasscode,
  resetPasscode,
  getAllValidPasscode,
  addCard,
  modifyCard,
  deleteCard,
  clearCard,
  getAllValidCard,
  addFingerprint,
  modifyFingerprint,
  deleteFingerprint,
  clearFingerprint,
  getAllValidFingerprint,

  getLockAutomaticLockingPeriodicTime,
  setLockAutomaticLockingPeriodicTime,
  getLockRemoteUnlockSwitchState,
  setLockRemoteUnlockSwitchState,
  getLockAudioSwitchState,
  setLockAudioSwitchState,
  getLockSoundVolumeType,
  setLockSoundVolumeType,
  addPassageMode,
  clearAllPassageModes,

  activateLiftFloors,
  setLiftControlableFloors,
  setLiftWorkMode,

  setPowerSaverWorkMode,
  setPowerSaverControlableLock,

  // setDoorSensorSwitch,
  // getDoorSensorSwitch,
  // getDoorSensorState,

  setHotelCardSector,
  setHotelData,

  setLockDirectionLeft,
  getLockDirection,

  getLockSystemInfo,

  setNBServerInfo,
  getAdminPasscode,

  getPasscodeVerificationParams,
  recoveryCard,
  getLockVersion,
  scanWifi,
  configWifi,
  configServer,
  getWifiInfo,
  configIp,

  addFace,
  addFaceData,
  modifyFace,
  deleteFace,
  clearFace
}

class _LockPageState extends State<LockPage> {
  List<Map<String, Command>> _commandList = [
    {"Reset Lock": Command.resetLock},
    {"Unlock": Command.unlock},
    {"Get Power": Command.getLockPower},
    {"Get Lock Time": Command.getLockTime},
    {"Set Lock Time": Command.setLockTime},
    {"Get Lock Operate Record": Command.getLockOperateRecord},
    {"Reset EKey": Command.resetEkey},
    {"Modify Admin Passcode To 1234": Command.modifyAdminPasscode},
    {"Get Lock Switch State": Command.getLockSwitchState},
    {"Custom Passcode 6666": Command.customPasscode},
    {"Modify Passcode 6666 -> 7777": Command.modifyPasscode},
    {"Get All Passcode": Command.getAllValidPasscode},
    {"Delete Passcode 7777": Command.deletePasscode},
    {"Reset Passcode": Command.resetPasscode},
    {"Add Card": Command.addCard},
    {"Modify Card valid Date": Command.modifyCard},
    {"Get All Cards": Command.getAllValidCard},
    {"Delete Card": Command.deleteCard},
    {"Clear All Cards": Command.clearCard},
    {"Add Fingerprint": Command.addFingerprint},
    {"Modify Fingerprint": Command.modifyFingerprint},
    {"Get All Fingerprints": Command.getAllValidFingerprint},
    {"Delete Fingerprint": Command.deleteFingerprint},
    {"Cleaer All Fingerprints": Command.clearFingerprint},
    {
      "Get Lock Automatic Locking Periodic Time":
          Command.getLockAutomaticLockingPeriodicTime
    },
    {
      "Set Lock Automatic Locking Periodic Time":
          Command.setLockAutomaticLockingPeriodicTime
    },
    {
      "Get Lock Remote Unlock Switch State":
          Command.getLockRemoteUnlockSwitchState
    },
    {
      "Set Lock Remote Unlock Switch State":
          Command.setLockRemoteUnlockSwitchState
    },
    {"Get Lock Audio Switch State": Command.getLockAudioSwitchState},
    {"Set Lock Audio Switch State": Command.setLockAudioSwitchState},
    {"Get Lock Unlock Direction": Command.getLockDirection},
    {"Set Lock Unlock Direction Left": Command.setLockDirectionLeft},
    {"Get Lock Sound Volume Type": Command.getLockSoundVolumeType},
    {"Set Lock Sound Volume Type": Command.setLockSoundVolumeType},
    {"Add Passage Mode": Command.addPassageMode},
    {"Clear All Passage Mode": Command.clearAllPassageModes},
    {"Activate Lift Floors": Command.activateLiftFloors},
    {"Set Lift Controlable Floors": Command.setLiftControlableFloors},
    {"Set Lift Work Mode": Command.setLiftWorkMode},
    {"Set Power Saver Work Mode": Command.setPowerSaverWorkMode},
    {"Set Power Saver Controlable": Command.setPowerSaverControlableLock},
    // {"Set Door Sensor Switch": Command.setDoorSensorSwitch},
    // {"Get Door Sensor Switch": Command.getDoorSensorSwitch},
    // {"Get Door Sensor State": Command.getDoorSensorState},
    {"Set Hotel Card Sector": Command.setHotelCardSector},
    {"Set Hotel Data": Command.setHotelData},
    {"Get Lock System Info": Command.getLockSystemInfo},
    {"Set Nb Server Info": Command.setNBServerInfo},
    {"Get Admin Passcode": Command.getAdminPasscode},
    {"Get Passcode Verification Param": Command.getPasscodeVerificationParams},
    {"Recovery Card Data": Command.recoveryCard},
    {"Get LockVersion": Command.getLockVersion},
    {"Wifi lock scan nearby wifi": Command.scanWifi},
    {"Wifi lock config wifi": Command.configWifi},
    {"Wifi lock config server": Command.configServer},
    {"Wifi lock get wifi info": Command.getWifiInfo},
    {"Wifi lock config ip": Command.configIp},

    {"Add face": Command.addFace},
    {"Modify face": Command.modifyFace},
    {"Delete Face": Command.deleteFace},
    {"Clear Face": Command.clearFace}
  ];

  String note =
      'Note: You need to reset the lock befor pop current page,otherwise the lock will can\'t be initialized again';

  String lockData = '';
  String lockMac = '';
  String? addCardNumber;
  String? addFingerprintNumber;
  String? addFaceNumber;
  BuildContext? _context;

  _LockPageState(String lockData, String lockMac) {
    super.initState();
    this.lockData = lockData;
    this.lockMac = lockMac;
  }

  void _showLoading(String text) {
    ProgressHud.of(_context!)!.showLoading(text: text);
  }

  void _showSuccessAndDismiss(String text) {
    ProgressHud.of(_context!)!.showSuccessAndDismiss(text: text);
  }

  void _showErrorAndDismiss(TTLockError errorCode, String errorMsg) {
    ProgressHud.of(_context!)!.showErrorAndDismiss(
        text: 'errorCode:$errorCode errorMessage:$errorMsg');
  }

  @override
  void dispose() {
    //You need to reset lock, otherwise the lock will can't be initialized again
    TTLock.resetLock(lockData, () {}, (errorCode, errorMsg) {});
    super.dispose();
  }

  void _click(Command command, BuildContext context) async {
    _showLoading('');
    int startDate = DateTime.now().millisecondsSinceEpoch;
    int endDate = startDate + 3600 * 24 * 30 * 1000;

    switch (command) {
      case Command.resetLock:
        TTLock.resetLock(lockData, () {
          print("Reset lock success");
          Navigator.popAndPushNamed(context, '/');
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.unlock:
        //Note: the lockData is not contain userId and valid date.
        //If you want to get lockData contain userId and valid date please get lockData from api https://open.ttlock.com/doc/api/v3/key/list
        TTLock.controlLock(lockData, TTControlAction.unlock,
            (lockTime, electricQuantity, uniqueId, lockData) {
          _showSuccessAndDismiss(
              "Unlock Success lockTime:$lockTime electricQuantity:$electricQuantity uniqueId:$uniqueId");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getLockPower:
        TTLock.getLockPower(lockData, (electricQuantity) {
          _showSuccessAndDismiss("The power: $electricQuantity ");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getLockTime:
        TTLock.getLockTime(lockData, (lockTimestamp) {
          _showSuccessAndDismiss("Time: $lockTimestamp ");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setLockTime:
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        TTLock.setLockTime(timestamp, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockOperateRecord:
        TTLock.getLockOperateRecord(TTOperateRecordType.latest, lockData,
            (operateRecord) {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.resetEkey:
        TTLock.resetEkey(lockData, (lockData) {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.modifyAdminPasscode:
        TTLock.modifyAdminPasscode('1234', lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockSwitchState:
        TTLock.getLockSwitchState(lockData, (state) {
          _showSuccessAndDismiss(state.toString());
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.customPasscode:
        TTLock.supportFunction(TTLockFuction.managePasscode, lockData,
            (isSupport) {
          // not support
          if (!isSupport) {
            _showErrorAndDismiss(
                TTLockError.fail, "not support custom passcode");
            return;
          }

          TTLock.createCustomPasscode("6666", startDate, endDate, lockData, () {
            _showSuccessAndDismiss("Success");
          }, (errorCode, errorMsg) {
            _showErrorAndDismiss(errorCode, errorMsg);
          });
        });

        break;

      case Command.modifyPasscode:
        TTLock.supportFunction(TTLockFuction.managePasscode, lockData,
            (isSupport) {
          // not support
          if (!isSupport) {
            _showErrorAndDismiss(
                TTLockError.fail, "Not support modify passcode");
            return;
          }
          TTLock.modifyPasscode("6666", "7777", startDate, endDate, lockData,
              () {
            _showSuccessAndDismiss("Success");
          }, (errorCode, errorMsg) {
            _showErrorAndDismiss(errorCode, errorMsg);
          });
        });

        break;
      case Command.deletePasscode:
        TTLock.supportFunction(TTLockFuction.managePasscode, lockData,
            (isSupport) {
          if (isSupport) {
            TTLock.deletePasscode("7777", lockData, () {
              _showSuccessAndDismiss("Success");
            }, (errorCode, errorMsg) {
              _showErrorAndDismiss(errorCode, errorMsg);
            });
          } else {
            _showErrorAndDismiss(
                TTLockError.fail, 'Not support delete passcode');
          }
        });
        break;

      case Command.resetPasscode:
        TTLock.resetPasscode(lockData, (lockData) {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.addCard:
        TTLock.addCard(null, startDate, endDate, lockData, () {
          _showLoading('Waiting for add card ...');
        }, (cardNumber) {
          addCardNumber = cardNumber;
          _showSuccessAndDismiss("cardNumber: $cardNumber");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.modifyCard:
        if (addCardNumber == null) {
          _showErrorAndDismiss(
              TTLockError.cardNotExist, 'please add an ic card first');
          return;
        }
        TTLock.modifyCardValidityPeriod(
            addCardNumber!, null, startDate, endDate, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.deleteCard:
        if (addCardNumber == null) {
          _showErrorAndDismiss(
              TTLockError.cardNotExist, 'please add an ic card first');
          return;
        }
        TTLock.deleteCard(addCardNumber!, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.clearCard:
        TTLock.clearAllCards(lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.addFingerprint:
        TTLock.addFingerprint(null, startDate, endDate, lockData,
            (currentCount, totalCount) {
          _showLoading("currentCount:$currentCount  totalCount:$totalCount");
        }, (fingerprintNumber) {
          this.addFingerprintNumber = fingerprintNumber;
          _showSuccessAndDismiss("fingerprintNumber: $fingerprintNumber");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.modifyFingerprint:
        if (addFingerprintNumber == null) {
          _showErrorAndDismiss(
              TTLockError.fingerprintNotExist, 'please add fingerprint first');
          return;
        }
        TTLock.modifyFingerprintValidityPeriod(
            addFingerprintNumber!, null, startDate, endDate, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.deleteFingerprint:
        if (addFingerprintNumber == null) {
          _showErrorAndDismiss(
              TTLockError.fingerprintNotExist, 'please add fingerprint first');
          return;
        }
        TTLock.deleteFingerprint(addFingerprintNumber!, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.clearFingerprint:
        TTLock.clearAllFingerprints(lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockAutomaticLockingPeriodicTime:
        TTLock.getLockAutomaticLockingPeriodicTime(lockData,
            (currentTime, minTime, maxTime) {
          _showSuccessAndDismiss(
              "currentTime:$currentTime minTime:$minTime maxTime:$maxTime");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setLockAutomaticLockingPeriodicTime:
        TTLock.setLockAutomaticLockingPeriodicTime(8, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockRemoteUnlockSwitchState:
        TTLock.getLockRemoteUnlockSwitchState(lockData, (isOn) {
          _showSuccessAndDismiss("SwitchOn: $isOn");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setLockRemoteUnlockSwitchState:
        TTLock.setLockRemoteUnlockSwitchState(true, lockData, (lockData) {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockAudioSwitchState:
        TTLock.getLockConfig(TTLockConfig.audio, lockData, (isOn) {
          _showSuccessAndDismiss("SwitchOn: $isOn");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setLockAudioSwitchState:
        TTLock.setLockConfig(TTLockConfig.audio, true, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockDirection:
        TTLock.getLockDirection(lockData, (direction) {
          _showSuccessAndDismiss("direction: $direction");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setLockDirectionLeft:
        TTLock.setLockDirection(TTLockDirection.left, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });

        break;

      case Command.setLockSoundVolumeType:
        TTLock.setLockSoundWithSoundVolume(
            TTSoundVolumeType.fouthLevel, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.getLockSoundVolumeType:
        TTLock.getLockSoundWithSoundVolume(lockData, (ttLocksoundVolumeType) {
          _showSuccessAndDismiss("sound volume type: $ttLocksoundVolumeType");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.addPassageMode:
        int startTime = 8 * 60; //8:00 am
        int endTime = 17 * 60; //17:00 pm
        List<int> weekly = [1, 2]; // [Monday，Tuesday]

        TTLock.addPassageMode(TTPassageModeType.weekly, weekly, null, startTime,
            endTime, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.clearAllPassageModes:
        TTLock.clearAllPassageModes(lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.activateLiftFloors:
        TTLock.activateLift("1,2,3", lockData,
            (lockTime, electricQuantity, uniqueId) {
          _showSuccessAndDismiss(
              "Active lift florrs success lockTime:$lockTime electricQuantity:$electricQuantity uniqueId:$uniqueId");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setLiftControlableFloors:
        TTLock.setLiftControlable("3", lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setLiftWorkMode:
        TTLock.setLiftWorkMode(TTLiftWorkActivateType.allFloors, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setPowerSaverWorkMode:
        TTLock.setPowerSaverWorkMode(TTPowerSaverWorkType.allCards, lockData,
            () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setPowerSaverControlableLock:
        TTLock.setPowerSaverControlableLock(this.lockMac, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      // case Command.setDoorSensorSwitch:
      //   TTLock.setDoorSensorLockingSwitchState(true, lockData, () {
      //     _showSuccessAndDismiss("Success");
      //   }, (errorCode, errorMsg) {
      //     _showErrorAndDismiss(errorCode, errorMsg);
      //   });
      //   break;
      // case Command.getDoorSensorSwitch:
      //   TTLock.getDoorSensorLockingSwitchState(lockData, (isOn) {
      //     _showSuccessAndDismiss(isOn.toString());
      //   }, (errorCode, errorMsg) {
      //     _showErrorAndDismiss(errorCode, errorMsg);
      //   });
      //   break;
      // case Command.getDoorSensorState:
      //   TTLock.getDoorSensorState(lockData, (isOn) {
      //     _showSuccessAndDismiss(isOn.toString());
      //   }, (errorCode, errorMsg) {
      //     _showErrorAndDismiss(errorCode, errorMsg);
      //   });
      //   break;
      case Command.setHotelCardSector:
        TTLock.setHotelCardSector("1,4", lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setHotelData:
        String hotelData = "";
        int building = 0;
        int floor = 0;
        TTLock.setHotel(hotelData, building, floor, lockData, () {
          _showSuccessAndDismiss("Success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getAllValidPasscode:
        TTLock.getAllValidPasscode(lockData, (passcodeList) {
          _showSuccessAndDismiss(passcodeList.toString());
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getAllValidCard:
        TTLock.getAllValidCards(lockData, (cardList) {
          _showSuccessAndDismiss(cardList.toString());
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getAllValidFingerprint:
        TTLock.getAllValidFingerprints(lockData, (fingerprintList) {
          _showSuccessAndDismiss(fingerprintList.toString());
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getLockSystemInfo:
        TTLock.getLockSystemInfo(lockData, (lockSystemInfoModel) {
          _showSuccessAndDismiss(lockSystemInfoModel.modelNum!);
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setNBServerInfo:
        String port = "5683";
        String ip = "117.60.157.137";
        TTLock.setLockNbAddress(ip, port, lockData, (electricQuantity) {
          _showSuccessAndDismiss("electricQuantity: $electricQuantity");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getAdminPasscode:
        TTLock.getAdminPasscode(lockData, (adminPasscode) {
          _showSuccessAndDismiss("AdminPasscode: $adminPasscode");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getPasscodeVerificationParams:
        TTLock.getPasscodeVerificationParams(lockData, (lockData) {
          _showSuccessAndDismiss("Get Passcode Verification Params success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.recoveryCard:
        String cardNumber = "123458970";
        int startDate = DateTime.now().millisecondsSinceEpoch;
        int endDate =
            DateTime.now().millisecondsSinceEpoch + 24 * 60 * 60 * 1000;
        TTLock.recoverCard(cardNumber, startDate, endDate, lockData, () {
          _showSuccessAndDismiss("success:$cardNumber");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getLockVersion:
        TTLock.getLockVersion(lockMac, (lockVersion) {
          _showSuccessAndDismiss("Get LockVersion success:$lockVersion");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.scanWifi:
        TTLock.scanWifi(lockData, (finished, wifiList) {
          _showSuccessAndDismiss("scan wifi");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.configWifi:
        TTLock.configWifi("sciener", "sciener.com", lockData, () {
          _showSuccessAndDismiss("Config wifi success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.configServer:
        TTLock.configServer("wifilock.ttlock.com", "4999", lockData, () {
          _showSuccessAndDismiss("Config server success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.getWifiInfo:
        TTLock.getWifiInfo(lockData, (wifiInfo) {
          _showSuccessAndDismiss(wifiInfo.toString());
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.configIp:
        Map paramMap = Map();
        paramMap["type"] = TTIpSettingType.DHCP.index;
        //for static ip setting
        // paramMap["type"] = TTIpSettingType.STATIC_IP.index;
        // paramMap["ipAddress"] = "192.168.1.100";
        // paramMap["subnetMask"] = "255.255.255.0";
        // paramMap["router"] = "192.168.1.1";
        // paramMap["preferredDns"] = "xxx.xxx.xxx.xxx";
        // paramMap["alternateDns"] = "xxx.xxx.xxx.xxx";

        TTLock.configIp(paramMap, lockData, () {
          _showSuccessAndDismiss("config ip success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.addFace:
        TTLock.addFace(null, startDate, endDate, lockData,
            (state, faceErrorCode) {
          _showSuccessAndDismiss(
              "add face progress state :" + state.toString());
        }, (faceNumber) {
          addFaceNumber = faceNumber;
          _showSuccessAndDismiss("add face success :" + faceNumber);
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.modifyFace:
        if (addFaceNumber == null) {
          _showErrorAndDismiss(TTLockError.fail, 'please add face first');
          return;
        }
        TTLock.modifyFace(null, startDate, endDate, addFaceNumber!, lockData,
            () {
          _showSuccessAndDismiss("modify face success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.deleteFace:
        if (addFaceNumber == null) {
          _showErrorAndDismiss(TTLockError.fail, 'please add face first');
          return;
        }
        TTLock.deleteFace(addFaceNumber!, lockData, () {
          addFaceNumber = null;
          _showSuccessAndDismiss("delete face success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.clearFace:
        TTLock.clearFace(lockData, () {
          _showSuccessAndDismiss("clear face success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      default:
    }
  }

  Widget getListView() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2, color: Colors.green);
        },
        itemCount: _commandList.length,
        itemBuilder: (context, index) {
          Map<String, Command> map = _commandList[index];
          String title = '${map.keys.first}';
          String subtitle = index == 0 ? note : '';
          return ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            onTap: () {
              _click(map.values.first, context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lock'),
        ),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              _context = context;
              return getListView();
            }),
          ),
        )));
  }
}
