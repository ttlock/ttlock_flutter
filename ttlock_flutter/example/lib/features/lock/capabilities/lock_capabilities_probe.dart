import 'package:ttlock_flutter/ttlock.dart';

/// Functions probed for UI visibility (aligned with reference app subset).
const lockCapabilityProbeList = <TTLockFunction>[
  TTLockFunction.passcode,
  TTLockFunction.managePasscode,
  TTLockFunction.icCard,
  TTLockFunction.fingerprint,
  TTLockFunction.face,
  TTLockFunction.remoteKey,
  TTLockFunction.doorSensor,
  TTLockFunction.wirelessKeypad,
  TTLockFunction.multiFunctionKeypad,
  TTLockFunction.getAdminPasscode,
  TTLockFunction.audioSwitch,
  TTLockFunction.passageMode,
  TTLockFunction.wifiLock,
  TTLockFunction.wifiLockStaticIP,
  TTLockFunction.autoLock,
  TTLockFunction.doubleAuth,
  TTLockFunction.privacyLock,
  TTLockFunction.tamperAlert,
  TTLockFunction.unlockSwitch,
  TTLockFunction.resetButton,
  TTLockFunction.passageModeAutoUnlockSetting,
  TTLockFunction.passcodeVisible,
  TTLockFunction.lockFreeze,
  TTLockFunction.wifiPowerSavingTime,
  TTLockFunction.publicMode,
  TTLockFunction.lowBatteryAutoUnlock,
  TTLockFunction.gatewayUnlock,
  TTLockFunction.soundVolumeAndLanguageSetting,
  TTLockFunction.nbIoT,
  TTLockFunction.sensitivity,
  TTLockFunction.cyclicCardOrFingerprint,
  TTLockFunction.cyclePassword,
];

Future<Set<TTLockFunction>> probeLockCapabilities(
  TTLockApi api,
  String lockData,
) async {
  final supported = <TTLockFunction>{};
  for (final f in lockCapabilityProbeList) {
    try {
      if (await api.supportFunction(f, lockData)) {
        supported.add(f);
      }
    } catch (_) {
      // Skip unsupported probe errors.
    }
  }
  return supported;
}

List<String> capabilitiesToJson(Set<TTLockFunction> set) =>
    set.map((e) => e.name).toList();
