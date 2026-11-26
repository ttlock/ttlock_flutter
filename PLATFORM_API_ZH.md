# SDK 三端 API 差异

[English](./PLATFORM_API.md)

`ttlock_flutter` 在 **Android / iOS / OpenHarmony（OHOS）** 上对外 Dart API 一致；本文只列出**至少一端未实现**的公开方法。未出现在下表中的公开 API，默认三端均可用（以在线版 Android·iOS `main` 为准）。

图例：`✅` 可用 · `❌` 不可用 · `△` 受限（见备注）

未实现时，Dart 侧通常收到失败异常（如 `TTLockException` / `TTUpgradeNotImplementedException` 等，视模块而定）。

## 锁 `TTLock.lock`

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

`setErasePasscode`：Android 在原生 SDK 提供对应方法时可用，否则不生效；iOS / OHOS 不可用。

以下方法**三端均不可用**（当前原生 SDK 未接通），故不列入差异表：`getPasscodeVerificationParams`。

## 无线键盘 `TTLock.remoteKeypad`

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `getStoredLocks` | ❌ | ✅ | ✅ |

## 水表 / 电表

| API | Android | iOS | OHOS |
|-----|:-------:|:---:|:----:|
| `TTLock.waterMeter.waterMeterReset` | ✅ | ✅ | ❌ |
| `TTLock.electricMeter.electricMeterReset` | ✅ | ✅ | ❌ |

## 固件升级 `TTLock.upgrade`

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

## Android / iOS 本地化打包（`premise`）

通过 `dependency_overrides` 使用 `premise` 分支时，升级能力额外收缩（与 OHOS 无关）。Android / iOS premise 原生 SDK 能力不完全一致，故分列：

| API | `main`（在线） | Android `premise` | iOS `premise` |
|-----|:--------------:|:-----------------:|:-------------:|
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

说明：iOS premise 的 `TTDeviceDFU` 仅有`ByPackage`（无 `clientId` 版）；Android premise `DeviceDfuClient` 网络与包均可用。

其余模块在 `premise` 上的可用性与对应平台的在线实现一致（上表 Android / iOS 列）。
