enum ScanMode { main, accessory }

enum DeviceType {
  lock,
  gateway,
  doorSensor,
  standaloneDoorSensor,
  remoteKey,
  keypad,
  waterMeter,
  electricMeter,
}

class ScanConfig {
  final ScanMode mode;
  final DeviceType? deviceType;
  final String? lockData;
  final String? lockMac;

  const ScanConfig({
    this.mode = ScanMode.main,
    this.deviceType,
    this.lockData,
    this.lockMac,
  });

  factory ScanConfig.main() => const ScanConfig(mode: ScanMode.main);

  factory ScanConfig.accessory({
    required DeviceType deviceType,
    required String lockData,
    required String lockMac,
  }) =>
      ScanConfig(
        mode: ScanMode.accessory,
        deviceType: deviceType,
        lockData: lockData,
        lockMac: lockMac,
      );

  factory ScanConfig.fromQuery({
    String? type,
    String? lockData,
    String? lockMac,
  }) {
    if (type != null && lockData != null && lockMac != null) {
      return ScanConfig.accessory(
        deviceType: DeviceType.values.firstWhere(
          (t) => t.name == type,
          orElse: () => DeviceType.doorSensor,
        ),
        lockData: lockData,
        lockMac: lockMac,
      );
    }
    if (type != null) {
      return ScanConfig(
        mode: ScanMode.main,
        deviceType: DeviceType.values.firstWhere(
          (t) => t.name == type,
          orElse: () => DeviceType.lock,
        ),
      );
    }
    return ScanConfig.main();
  }

  bool get isAccessory => mode == ScanMode.accessory;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanConfig &&
          mode == other.mode &&
          deviceType == other.deviceType &&
          lockData == other.lockData &&
          lockMac == other.lockMac;

  @override
  int get hashCode => Object.hash(mode, deviceType, lockData, lockMac);
}
