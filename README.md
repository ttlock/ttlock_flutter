# TTLock Flutter SDK

[中文文档](./README_ZH.md)

`ttlock_flutter` is the TTLock Flutter plugin for on-premise deployments. It uses a **Federated Plugin + Pigeon** stack to expose typed `Future` / `Stream` APIs for smart locks, gateways, remote keys / keypads, door sensors, electric / water meters, and **firmware upgrade**.

> Plugin version: **0.0.3** (see `ttlock_flutter/pubspec.yaml`).  
> Use `package:ttlock_flutter/ttlock.dart` only. Legacy callback entry points (`ttlock_classic.dart`, etc.) are Deprecated.

## Features

| Module | Entry | Capabilities |
|--------|-------|--------------|
| Lock | `TTLock.lock` | Scan, init, lock/unlock, passcode / card / fingerprint / face / palm vein / QR, config, Wi-Fi lock, lift / hotel, accessory binding |
| Gateway | `TTLock.gateway` | Scan, connect, init, nearby Wi-Fi, IP / APN config |
| Remote key | `TTLock.remoteKey` | Scan, init remote |
| Remote keypad | `TTLock.remoteKeypad` | Scan, init (standard / multifunctional), enroll fingerprint / card on keypad, stored-lock management |
| Door sensor | `TTLock.doorSensor` | Standard door-sensor scan & init; standalone door-sensor scan, init & feature query |
| Electric meter | `TTLock.electricMeter` | Scan, connect, init, power on/off / balance / top-up / pay mode, Cat.1 |
| Water meter | `TTLock.waterMeter` | Scan, connect, init, valve / balance / top-up / pay mode, cumulative usage, Cat.1 |
| Firmware upgrade | `TTLock.upgrade` | Lock / gateway / water meter / electric meter / keypad: network DFU or firmware-package DFU; progress via `Stream<TTUpgradeEvent>` |

## Integration

### 1. Add dependency

The plugin is not published to pub.dev (`publish_to: none`). Add a Git dependency.

#### Online / cloud (default)

`ttlock_flutter` pulls `ttlock_flutter_android` / `ttlock_flutter_ios` without an explicit `ref` (default branch = online packaging, e.g. `ttlock-release` / CocoaPod `TTLock`).

```yaml
dependencies:
  ttlock_flutter:
    git:
      url: https://github.com/ttlock/ttlock_flutter.git
      path: ttlock_flutter
      ref: mix   # use the release branch / tag your team ships
```

#### On-premise

Keep the same `ttlock_flutter` dependency, then **override** the Android / iOS implementations to the **`premise`** branch (local AAR `TTLockOnPremise` / CocoaPod `TTLockOnPremise`):

```yaml
dependencies:
  ttlock_flutter:
    git:
      url: https://github.com/ttlock/ttlock_flutter.git
      path: ttlock_flutter
      ref: mix

dependency_overrides:
  ttlock_flutter_android:
    git:
      url: https://github.com/2000Heart/ttlock_flutter_android.git
      ref: premise
  ttlock_flutter_ios:
    git:
      url: https://github.com/2000Heart/ttlock_flutter_ios.git
      ref: premise
```

> Overrides must use the same git URLs as in `ttlock_flutter/pubspec.yaml`. After switching to `premise`, place the matching on-premise AAR (see §2.1) and re-run `pod install` on iOS.

Then:

```bash
flutter pub get
```

### 2. Android

#### 2.1 Native SDK AAR

`ttlock_flutter_android` depends on the TTLock native Android SDK **as a local AAR** (via `flatDir`), not Maven Central.

| Scenario | AAR file name | Typical source |
|----------|---------------|----------------|
| On-premise | `TTLockOnPremise.aar` | On-premise delivery package from TTLock |
| Online / cloud SDK packaging | `ttlock-release.aar` | Matching Android SDK release |

**What you need to do**

1. Confirm which AAR your plugin branch expects in `ttlock_flutter_android/android/build.gradle`, for example:
   - On-premise: `implementation(name: 'TTLockOnPremise', ext: 'aar')`
   - Online packaging: `implementation(name: 'ttlock-release', ext: 'aar')`
2. Place that AAR under the plugin path if you maintain the submodule yourself:
   - `ttlock_flutter_android/android/libs/<AAR_NAME>.aar`
3. **Also copy the same AAR into the host app** (required for many Flutter builds; `flatDir { dirs 'libs' }` is resolved against the app project):

```text
your_app/android/app/libs/TTLockOnPremise.aar
# or
your_app/android/app/libs/ttlock-release.aar
```

Create the `libs` directory if it does not exist. The file **base name** (without `.aar`) must match the `implementation(name: '...')` entry.

If Gradle fails with `Could not find :TTLockOnPremise:` or `Could not find :ttlock-release:`, the host `android/app/libs/` copy is missing or misnamed.

**Notes**

- Do not mix on-premise and online AARs in one build unless you intentionally dual-depend and understand API overlap.
- The plugin already pulls Nordic DFU (`no.nordicsemi.android:dfu`) because flatDir AARs do not bring Maven transitive deps.
- Release builds: the plugin ships `consumer-rules.pro` so R8 does not strip SDK classes; keep minify/R8 rules intact.

#### 2.2 Permissions

Declare permissions in `android/app/src/main/AndroidManifest.xml` (root `<manifest>` needs `xmlns:tools` if you use `tools:targetApi`):

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

<!-- Location is often required for BLE scan on Android 9–11; request at runtime -->
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

<uses-permission
    android:name="android.permission.BLUETOOTH"
    android:maxSdkVersion="30" />
<uses-permission
    android:name="android.permission.BLUETOOTH_ADMIN"
    android:maxSdkVersion="30" />

<!-- Android 12+ -->
<uses-permission
    android:name="android.permission.BLUETOOTH_SCAN"
    android:usesPermissionFlags="neverForLocation"
    tools:targetApi="s" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
```

Request `BLUETOOTH_SCAN` / `BLUETOOTH_CONNECT` (and location where required) **before** scan / connect. Add `CAMERA` if you use face enrollment.

Suggested `minSdk`: **26+**.

### 3. iOS

Add usage descriptions in `ios/Runner/Info.plist`:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Bluetooth is required to connect smart locks and gateways</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>Bluetooth is required to connect smart locks and gateways</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location permission is required to scan nearby Bluetooth devices</string>
```

Add camera / photo library keys if you enroll faces. The system prompts on first Bluetooth use.

### 4. OpenHarmony (OHOS)

Declare permissions in the entry module `module.json5` `requestPermissions` (align with your product copy / `string` resources):

```json5
"requestPermissions": [
  { "name": "ohos.permission.INTERNET" },
  { "name": "ohos.permission.GET_NETWORK_INFO" },
  { "name": "ohos.permission.GET_WIFI_INFO" },
  { "name": "ohos.permission.USE_BLUETOOTH" },
  { "name": "ohos.permission.DISCOVER_BLUETOOTH" },
  {
    "name": "ohos.permission.ACCESS_BLUETOOTH",
    "reason": "$string:bluetooth_reason",
    "usedScene": { "abilities": ["EntryAbility"], "when": "inuse" }
  },
  {
    "name": "ohos.permission.APPROXIMATELY_LOCATION",
    "reason": "$string:location_reason",
    "usedScene": { "abilities": ["EntryAbility"], "when": "inuse" }
  },
  {
    "name": "ohos.permission.LOCATION",
    "reason": "$string:location_reason",
    "usedScene": { "abilities": ["EntryAbility"], "when": "inuse" }
  }
]
```

`ACCESS_BLUETOOTH` / location are **user_grant** — request them at runtime before BLE work. Add `ohos.permission.CAMERA` when using face features.

### 5. Import

```dart
import 'package:ttlock_flutter/ttlock.dart';
```

Native BLE setup runs when the plugin registers; you do **not** need legacy `prepareBTService`-style calls. Ensure permissions (and optionally Bluetooth power) before scanning or operating devices. You can wrap checks with `TTLock.setBleGuard(...)`.

## Minimal example

```dart
import 'package:ttlock_flutter/ttlock.dart';

Future<void> unlock(String lockData) async {
  try {
    final result = await TTLock.lock.controlLock(
      lockData,
      TTControlAction.unlock,
    );
    print('Unlocked, battery: ${result.electricQuantity}');
  } on TTLockException catch (e) {
    print('Failed: ${e.code} ${e.message}');
  }
}
```

## Firmware upgrade

Entry: `TTLock.upgrade` (`TTUpgradeApi`). All upgrade APIs return `Stream<TTUpgradeEvent>` (progress / success). Failures throw `TTUpgradeException` (`TTLockUpgradeError`); unsupported platforms throw `TTUpgradeNotImplementedException`.

| Method | Notes |
|--------|--------|
| `upgradeLock` | Lock network DFU; success may include refreshed `lockData` |
| `upgradeLockByPackage` | Lock firmware-package DFU; success may include refreshed `lockData` |
| `upgradeGateway` | Gateway network DFU; Android: re-subscribe the same `gatewayMac` to retry by `TTDfuType` |
| `upgradeGatewayByPackage` | Gateway firmware-package DFU |
| `upgradeWaterMeter` / `upgradeElectricMeter` | Meter network DFU |
| `upgradeWaterMeterByPackage` / `upgradeElectricMeterByPackage` | Meter package DFU — call `waterMeterSetClientParam` / `electricMeterSetClientParam` first |
| `upgradeKeypad` / `upgradeKeypadByPackage` | Keypad network / package DFU; `lockData` / `slotNumber` / `featureValue` optional |

Cancel the subscription (`StreamSubscription.cancel`) to abort. Platform / on-premise availability: [PLATFORM_API.md](./PLATFORM_API.md).

```dart
final sub = TTLock.upgrade.upgradeLockByPackage(
  lockMac: lockMac,
  lockData: lockData,
  firmwarePackage: firmwarePackage,
).listen(
  (event) {
    if (event.phase == TTUpgradePhase.progress) {
      print('progress: ${event.progress}% (${event.status})');
    } else if (event.phase == TTUpgradePhase.success) {
      print('done, lockData: ${event.lockData}');
    }
  },
  onError: (e) {
    if (e is TTUpgradeException) {
      print('upgrade failed: ${e.code} ${e.message}');
    }
  },
);
// Abort: await sub.cancel();
```

## Platform support

| Platform | Status |
|----------|--------|
| Android | Supported (`ttlock_flutter_android`) |
| iOS | Supported (`ttlock_flutter_ios`) |
| OHOS | Supported (`ttlock_flutter_ohos`) |

## Documentation

- Platform API differences (unavailable APIs only): [PLATFORM_API.md](./PLATFORM_API.md)
- Integration details (BleGuard, timeouts), conventions, error codes, models, API reference, and scenario guides: see the open-platform **Flutter SDK** docs.

## Resources

- Plugin repo: <https://github.com/ttlock/ttlock_flutter>
- Cloud REST APIs: open-platform `cloud/` docs (lock init / lockData updates must pair with BLE operations)
