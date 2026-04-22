import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:bmprogresshud/progresshud.dart';

import 'key_pad/scan_key_pad_page.dart';

class LockPage extends StatefulWidget {
  const LockPage({
    super.key,
    required this.title,
    required this.lockData,
    required this.lockMac,
  });
  final String title;
  final String lockData;
  final String lockMac;
  @override
  _LockPageState createState() => _LockPageState();
}

enum Command {
  resetLock, unlock, getLockPower, resetEkey, modifyAdminPasscode,
  getLockTime, setLockTime, getLockOperateRecord,
  getLockSwitchState, customPasscode, modifyPasscode, deletePasscode,
  resetPasscode, getAllValidPasscode,
  addCard, modifyCard, deleteCard, clearCard, getAllValidCard,
  addFingerprint, modifyFingerprint, deleteFingerprint, clearFingerprint, getAllValidFingerprint,
  getLockAutomaticLockingPeriodicTime, setLockAutomaticLockingPeriodicTime,
  getLockRemoteUnlockSwitchState, setLockRemoteUnlockSwitchState,
  getLockAudioSwitchState, setLockAudioSwitchState,
  getLockSoundVolumeType, setLockSoundVolumeType,
  addPassageMode, clearAllPassageModes,
  activateLiftFloors, setLiftControlableFloors, setLiftWorkMode,
  setPowerSaverWorkMode, setPowerSaverControlableLock,
  setHotelCardSector, setHotelData,
  setLockDirectionLeft, getLockDirection,
  getLockSystemInfo, configIp, keypad, setSensitivity,
}

class _LockPageState extends State<LockPage> {
  final List<Map<String, Command>> _commandList = [
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
    {"Clear All Fingerprints": Command.clearFingerprint},
    {"Get Auto Lock Time": Command.getLockAutomaticLockingPeriodicTime},
    {"Set Auto Lock Time": Command.setLockAutomaticLockingPeriodicTime},
    {"Get Remote Unlock Switch": Command.getLockRemoteUnlockSwitchState},
    {"Set Remote Unlock Switch": Command.setLockRemoteUnlockSwitchState},
    {"Get Audio Switch": Command.getLockAudioSwitchState},
    {"Set Audio Switch": Command.setLockAudioSwitchState},
    {"Get Lock Direction": Command.getLockDirection},
    {"Set Lock Direction Left": Command.setLockDirectionLeft},
    {"Get Sound Volume": Command.getLockSoundVolumeType},
    {"Set Sound Volume": Command.setLockSoundVolumeType},
    {"Add Passage Mode": Command.addPassageMode},
    {"Clear All Passage Modes": Command.clearAllPassageModes},
    {"Activate Lift Floors": Command.activateLiftFloors},
    {"Set Lift Controlable Floors": Command.setLiftControlableFloors},
    {"Set Lift Work Mode": Command.setLiftWorkMode},
    {"Set Power Saver Work Mode": Command.setPowerSaverWorkMode},
    {"Set Power Saver Controlable": Command.setPowerSaverControlableLock},
    {"Set Hotel Card Sector": Command.setHotelCardSector},
    {"Set Hotel Data": Command.setHotelData},
    {"Get Lock System Info": Command.getLockSystemInfo},
    {"Config IP (DHCP)": Command.configIp},
    {"Keypad": Command.keypad},
    {"Set Sensitivity": Command.setSensitivity},
  ];

  String note = 'Note: Reset the lock before leaving, otherwise it cannot be initialized again';

  late String lockData;
  String? addCardNumber;
  String? addFingerprintNumber;
  BuildContext? _context;
  StreamSubscription? _progressSub;

  @override
  void initState() {
    super.initState();
    lockData = widget.lockData;
  }

  @override
  void dispose() {
    _progressSub?.cancel();
    TTLock.lock.resetLock(lockData).catchError((_) {});
    super.dispose();
  }

  void _showLoading(String text) => ProgressHud.of(_context!).showLoading(text: text);
  void _showSuccess(String text) => ProgressHud.of(_context!).showSuccessAndDismiss(text: text);
  void _showError(String text) => ProgressHud.of(_context!).showErrorAndDismiss(text: text);

  final _lock = TTLock.lock;

  void _click(Command command, BuildContext context) async {
    _showLoading('');
    int startDate = DateTime.now().millisecondsSinceEpoch;
    int endDate = startDate + 3600 * 24 * 30 * 1000;

    try {
      switch (command) {
        case Command.resetLock:
          await _lock.resetLock(lockData);
          Navigator.of(context).popUntil((route) => route.isFirst);
          return;

        case Command.unlock:
          final r = await _lock.controlLock(lockData, TTControlAction.unlock);
          _showSuccess("Unlock Success lockTime:${r.lockTime} battery:${r.electricQuantity} uniqueId:${r.uniqueId}");
          break;

        case Command.getLockPower:
          final power = await _lock.getLockPower(lockData);
          _showSuccess("Power: $power");
          break;

        case Command.getLockTime:
          final t = await _lock.getLockTime(lockData);
          _showSuccess("Time: $t");
          break;

        case Command.setLockTime:
          await _lock.setLockTime(DateTime.now().millisecondsSinceEpoch, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockOperateRecord:
          final record = await _lock.getLockOperateRecord(TTOperateRecordType.latest, lockData);
          _showSuccess("Record: $record");
          break;

        case Command.resetEkey:
          await _lock.resetEkey(lockData);
          _showSuccess("Success");
          break;

        case Command.modifyAdminPasscode:
          await _lock.modifyAdminPasscode('1234', lockData);
          _showSuccess("Success");
          break;

        case Command.getLockSwitchState:
          final state = await _lock.getLockSwitchState(lockData);
          _showSuccess(state.toString());
          break;

        case Command.customPasscode:
          final support = await _lock.supportFunction(TTLockFunction.managePasscode, lockData);
          if (!support) { _showError("Not supported"); return; }
          await _lock.createCustomPasscode("6666", startDate, endDate, lockData);
          _showSuccess("Success");
          break;

        case Command.modifyPasscode:
          final support = await _lock.supportFunction(TTLockFunction.managePasscode, lockData);
          if (!support) { _showError("Not supported"); return; }
          await _lock.modifyPasscode("6666", "7777", startDate, endDate, lockData);
          _showSuccess("Success");
          break;

        case Command.deletePasscode:
          final support = await _lock.supportFunction(TTLockFunction.managePasscode, lockData);
          if (!support) { _showError("Not supported"); return; }
          await _lock.deletePasscode("7777", lockData);
          _showSuccess("Success");
          break;

        case Command.resetPasscode:
          await _lock.resetPasscode(lockData);
          _showSuccess("Success");
          break;

        case Command.getAllValidPasscode:
          final list = await _lock.getAllValidPasscodes(lockData);
          _showSuccess(list.map((e) => '{keyboardPwd: ${e.keyboardPwd} newKeyboardPwd: ${e.newKeyboardPwd} startDate: ${e.startDate} endDate: ${e.endDate} keyboardPwdType: ${e.keyboardPwdType} cycleType: ${e.cycleType}}').join('\n'));
          break;

        case Command.addCard:
          _progressSub?.cancel();
          _progressSub = _lock.lockAddCard(lockData).listen(
            (event) {
              if (event.isProgress) {
                _showLoading('Waiting for card...');
              } else {
                addCardNumber = event.cardNumber;
                _showSuccess("cardNumber: ${event.cardNumber}");
              }
            },
            onError: (e) => _showError(e.toString()),
          );
          return;

        case Command.modifyCard:
          if (addCardNumber == null) { _showError("Please add a card first"); return; }
          await _lock.modifyCardValidityPeriod(addCardNumber!, null, startDate, endDate, lockData);
          _showSuccess("Success");
          break;

        case Command.deleteCard:
          if (addCardNumber == null) { _showError("Please add a card first"); return; }
          await _lock.deleteCard(addCardNumber!, lockData);
          _showSuccess("Success");
          break;

        case Command.clearCard:
          await _lock.clearAllCards(lockData);
          _showSuccess("Success");
          break;

        case Command.getAllValidCard:
          final list = await _lock.getAllValidCards(lockData);
          _showSuccess(list.map((e) => '{cardNumber: ${e.cardNumber} startDate: ${e.startDate} endDate: ${e.endDate}}').join('\n'));
          break;

        case Command.addFingerprint:
          _progressSub?.cancel();
          _progressSub = _lock.lockAddFingerprint(lockData).listen(
            (event) {
              if (event.isProgress) {
                _showLoading("${event.currentCount} / ${event.totalCount}");
              } else {
                addFingerprintNumber = event.fingerprintNumber;
                _showSuccess("fingerprintNumber: ${event.fingerprintNumber}");
              }
            },
            onError: (e) => _showError(e.toString()),
          );
          return;

        case Command.modifyFingerprint:
          if (addFingerprintNumber == null) { _showError("Please add fingerprint first"); return; }
          await _lock.modifyFingerprintValidityPeriod(addFingerprintNumber!, null, startDate, endDate, lockData);
          _showSuccess("Success");
          break;

        case Command.deleteFingerprint:
          if (addFingerprintNumber == null) { _showError("Please add fingerprint first"); return; }
          await _lock.deleteFingerprint(addFingerprintNumber!, lockData);
          _showSuccess("Success");
          break;

        case Command.clearFingerprint:
          await _lock.clearAllFingerprints(lockData);
          _showSuccess("Success");
          break;

        case Command.getAllValidFingerprint:
          final list = await _lock.getAllValidFingerprints(lockData);
          _showSuccess(list.map((e) => '{fingerprintNumber: ${e.fingerprintNumber} startDate: ${e.startDate} endDate: ${e.endDate}}').join('\n'));
          break;

        case Command.getLockAutomaticLockingPeriodicTime:
          final t = await _lock.getAutoLockingPeriodicTime(lockData);
          _showSuccess("current:${t.currentTime} min:${t.minTime} max:${t.maxTime}");
          break;

        case Command.setLockAutomaticLockingPeriodicTime:
          await _lock.setAutoLockingPeriodicTime(8, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockRemoteUnlockSwitchState:
          final isOn = await _lock.getRemoteUnlockSwitchState(lockData);
          _showSuccess("SwitchOn: $isOn");
          break;

        case Command.setLockRemoteUnlockSwitchState:
          await _lock.setRemoteUnlockSwitchState(true, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockAudioSwitchState:
          final isOn = await _lock.getLockConfig(TTLockConfig.audio, lockData);
          _showSuccess("SwitchOn: $isOn");
          break;

        case Command.setLockAudioSwitchState:
          await _lock.setLockConfig(TTLockConfig.audio, true, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockDirection:
          final dir = await _lock.getLockDirection(lockData);
          _showSuccess("direction: $dir");
          break;

        case Command.setLockDirectionLeft:
          await _lock.setLockDirection(TTLockDirection.left, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockSoundVolumeType:
          final vol = await _lock.getSoundVolume(lockData);
          _showSuccess("volume: $vol");
          break;

        case Command.setLockSoundVolumeType:
          await _lock.setSoundVolume(TTSoundVolumeType.fourthLevel, lockData);
          _showSuccess("Success");
          break;

        case Command.addPassageMode:
          await _lock.addPassageMode(TTPassageModeType.weekly, [1, 2], null, 8 * 60, 17 * 60, lockData);
          _showSuccess("Success");
          break;

        case Command.clearAllPassageModes:
          await _lock.clearAllPassageModes(lockData);
          _showSuccess("Success");
          break;

        case Command.activateLiftFloors:
          final r = await _lock.activateLift("1,2,3", lockData);
          _showSuccess("Lift activated lockTime:${r.lockTime} battery:${r.electricQuantity}");
          break;

        case Command.setLiftControlableFloors:
          await _lock.setLiftControlable("3", lockData);
          _showSuccess("Success");
          break;

        case Command.setLiftWorkMode:
          await _lock.setLiftWorkMode(TTLiftWorkActivateType.allFloors, lockData);
          _showSuccess("Success");
          break;

        case Command.setPowerSaverWorkMode:
          await _lock.setPowerSaverWorkMode(TTPowerSaverWorkType.allCards, lockData);
          _showSuccess("Success");
          break;

        case Command.setPowerSaverControlableLock:
          await _lock.setPowerSaverControlableLock(widget.lockMac, lockData);
          _showSuccess("Success");
          break;

        case Command.setHotelCardSector:
          await _lock.setHotelCardSector("1,4", lockData);
          _showSuccess("Success");
          break;

        case Command.setHotelData:
          await _lock.setHotel("", 0, 0, lockData);
          _showSuccess("Success");
          break;

        case Command.getLockSystemInfo:
          final info = await _lock.getLockSystemInfo(lockData);
          _showSuccess("model: ${info.modelNum}");
          break;

        case Command.configIp:
          final ipSetting = TTIpSetting(type: TTIpSettingType.dhcp.index);
          await _lock.configIp(ipSetting, lockData);
          _showSuccess("Config IP success");
          break;

        case Command.keypad:
          _showSuccess("keypad");
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ScanKeyPadPage(lockData: lockData, lockMac: widget.lockMac);
          }));
          break;

        case Command.setSensitivity:
          final support = await _lock.supportFunction(TTLockFunction.sensitivity, lockData);
          if (!support) { _showError("Not supported"); return; }
          await _lock.setSensitivity(TTSensitivityValue.off, lockData);
          _showSuccess("Success");
          break;
      }
    } on TTLockException catch (e) {
      _showError('${e.code}: ${e.message}');
    } on TTGatewayException catch (e) {
      _showError('${e.code}: ${e.message}');
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lock')),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              _context = context;
              return ListView.separated(
                  separatorBuilder: (_, __) => Divider(height: 2, color: Colors.green),
                  itemCount: _commandList.length,
                  itemBuilder: (context, index) {
                    final map = _commandList[index];
                    return ListTile(
                      title: Text(map.keys.first),
                      subtitle: Text(index == 0 ? note : ''),
                      onTap: () => _click(map.values.first, context),
                    );
                  });
            }),
          ),
        )));
  }
}
