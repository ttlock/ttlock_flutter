# Cross-platform API differences

[中文](./PLATFORM_API_ZH.md)

`ttlock_flutter` exposes the same Dart API on **Android / iOS / OpenHarmony (OHOS)**; this doc lists only public methods that are **unimplemented on at least one platform**. APIs not listed here are available on all three (online Android·iOS `main` as baseline).

Legend: `✅` available · `❌` unavailable · `△` limited (see notes)

Unimplemented calls usually surface as failure exceptions on Dart (`TTLockException` / `TTUpgradeNotImplementedException`, depending on the module).

## Lock `TTLock.lock`

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `verifyLock` | ✅ | ✅ | ❌ |
| `setErasePasscode` | △ | ❌ | ❌ |
| `setNBServerAddress` | ✅ | ❌ | ❌ |
| `reportLossCard` | ✅ | ✅ | ❌ |
| `addFaceUrl` | ✅ | ✅ | ❌ |
| `setAlias` | ✅ | ✅ | ❌ |
| `getAllValidQrCodes` | ✅ | ✅ | ❌ |
| `setLockWorkingTime` | ✅ | ✅ | ❌ |
| `getBluetoothAdvertisingInterval` | ✅ | ✅ | ❌ |
| `setBluetoothAdvertisingInterval` | ✅ | ✅ | ❌ |

`setErasePasscode`: available on Android when the native SDK exposes it; otherwise no-op. Unavailable on iOS / OHOS.

The following are **unavailable on all three** (native SDKs not wired) and are omitted from the table: `getPasscodeVerificationParams`.

## Wireless keypad `TTLock.remoteKeypad`

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `getStoredLocks` | ❌ | ✅ | ✅ |

## Water / electric meter

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `TTLock.waterMeter.waterMeterReset` | ✅ | ✅ | ❌ |
| `TTLock.electricMeter.electricMeterReset` | ✅ | ✅ | ❌ |

## Firmware upgrade `TTLock.upgrade`

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `upgradeLock` | ✅ | ✅ | ✅ |
| `upgradeLockByPackage` | ✅ | ✅ | ✅ |
| `upgradeGateway` | ✅ | ✅ | ✅ |
| `upgradeGatewayByPackage` | ✅ | ✅ | ❌ |
| `upgradeWaterMeter` | ✅ | ✅ | ❌ |
| `upgradeWaterMeterByPackage` | ✅ | ✅ | ❌ |
| `upgradeElectricMeter` | ✅ | ✅ | ❌ |
| `upgradeElectricMeterByPackage` | ✅ | ✅ | ❌ |
| `upgradeKeypad` | ✅ | ✅ | ❌ |
| `upgradeKeypadByPackage` | ✅ | ✅ | ❌ |

## Android / iOS on-premise packaging (`premise`)

When **`premise`** is selected via `dependency_overrides`, upgrade coverage shrinks further (independent of OHOS). Android and iOS premise native SDKs differ, so they are listed separately:

| API | `main` (online) | Android `premise` | iOS `premise` |
|-----|:---------------:|:-----------------:|:-------------:|
| `upgradeLock` | ✅ | ❌ | ❌ |
| `upgradeLockByPackage` | ✅ | ✅ | ✅ |
| `upgradeGateway` | ✅ | ❌ | ❌ |
| `upgradeGatewayByPackage` | ✅ | ✅ | ✅ |
| `upgradeWaterMeter` | ✅ | ✅ | ❌ |
| `upgradeWaterMeterByPackage` | ✅ | ✅ | ✅ |
| `upgradeElectricMeter` | ✅ | ✅ | ❌ |
| `upgradeElectricMeterByPackage` | ✅ | ✅ | ✅ |
| `upgradeKeypad` | ✅ | ✅ | ❌ |
| `upgradeKeypadByPackage` | ✅ | ✅ | ✅ |

Note: iOS premise `TTDeviceDFU` only exposes firmware-package DFU (no `clientId` network overload); Android premise `DeviceDfuClient` supports both network and package.

Other modules on `premise` match the Android / iOS columns above for the online build.
