# Task 0 Spike Notes — 升级 SDK 版本与类名

> 日期：2026-11-26  
> 范围：只读。未改原生 DFU 实现。  
> 结论已回填 Spec §4.8 / §5.2 / §9。§1.2 能力表**不改**。

## 钉死值

| 分支 | podspec 行 | 对齐的锁 SDK |
|------|------------|--------------|
| main | `s.dependency 'TTLockDFU', '3.6.14'` | `TTLock` 3.6.16 |
| premise | `s.dependency 'TTLockDFUOnPremise', '2.2.6'` | `TTLockOnPremise` 2.2.6 |

两者 podspec 都声明传递依赖 `iOSDFULibrary ~> 4.14.0`（在线 example 的 `Podfile.lock` 曾解出 `iOSDFULibrary` 4.14.0 + `ZIPFoundation` 0.9.16）。实现 podspec 沿用 DFU pod 的传递依赖即可，不必再钉一份精确版。部署目标均为 iOS 12.0，与 `ttlock_flutter_ios` podspec 一致。

## 候选与取舍

`pod search`（trunk，2026-11-26）：

- `TTLockDFU`：3.7.0、3.6.14、3.6.12、3.6.8、…、3.1.9。**没有 3.6.16。**
- `TTLockDFUOnPremise`：2.2.6、2.2.4、2.2.0、2.1.4、2.1.3、2.1.2。

依据：

- `iOS_SDK_Demo` tag `3.6.16` 内的 `TTLockDFU.podspec` 仍是 `s.version = "3.6.14"`，依赖 `TTLock`（不锁版本）+ `iOSDFULibrary ~> 4.14.0`。公开头文件与 tag `3.6.14` 一致。tag `3.7.0` 把 `TTLock` 与 `TTLockDFU` 一起升到 3.7.0，头文件相对 3.6.14 只改了 `TTDeviceDFU.h` 的 version 注释。联邦插件锁 SDK 钉在 3.6.16，因此 DFU 用 **3.6.14**，不用 3.7.0。
- `TTLockOnPremise` tag `2.2.6` 与 `TTLockDFUOnPremise` 2.2.6 同仓同 tag，依赖 `TTLockOnPremise` + `iOSDFULibrary ~> 4.14.0`。旧 premise 插件（zezamii）钉 2.1.3（`iOSDFULibrary ~> 4.11.0`）；当前 `ttlock_upgrade_flutter` 的 premise 分支 podspec 是 2.2.0。对齐 2.2.6 锁 SDK，采用 **2.2.6**。
- 在线插件 `origin/main` 的 podspec 是未钉版本的 `s.dependency 'TTLockDFU'`。其 example `Podfile.lock` 解出的是当时的 `TTLockDFU` 3.6.8 + `TTLock` 3.6.8，不能当本次版本。

本地 `ttlock_upgrade_flutter` 工作区当前在 **premise** 分支（`TTLockDFUOnPremise` 2.2.0）。在线类名与调用以 `origin/main` 为准。

## 类名

模块别名只统一模块名，抹不平类名。

| 符号 | main（模块 `TTLockDFU` 3.6.14） | premise（模块 `TTLockDFUOnPremise` 2.2.6） |
|------|--------------------------------|---------------------------------------------|
| 锁 DFU 类 | `TTLockDFU` | `TTLockDFUOnPremise` |
| 网关 DFU 类 | `TTGatewayDFU` | `TTGatewayDFU`（同名，模块不同） |
| 设备 DFU 类 | `TTDeviceDFU` | `TTDeviceDFU`（有） |
| 进度枚举 | `UpgradeOpration` | 同名同值 |
| 错误枚举 | `UpgradeErrorCode` | 同名同值 |
| 网关类型 | `TTGatewayDFUTypeByNet` / `TTGatewayDFUTypeByBluetooth` | **无** 该枚举、无 `startDfuWithType:` |

头文件：`TTDFUMacros.h`、`TTLockDFU.h` / `TTLockDFUOnPremise.h`、`TTGatewayDFU.h`、`TTDeviceDFU.h`。

### 调用面（薄包装要分支的部分）

**锁**

- main `TTLockDFU`：`startDfuWithFirmwarePackage:lockData:` + `endUpgrade`。另有 `startDfuWithClientId:accessToken:lockId:lockData:`（Spec §1.3 有意不迁）。`retry` 标了 `DEPRECATED_MSG_ATTRIBUTE("SDK3.3.4")`。
- premise `TTLockDFUOnPremise`：只有 `startDfuWithFirmwarePackage:lockData:`、`retry`、`endUpgrade`。没有网络锁 DFU。

**网关**

- main `TTGatewayDFU`：`startDfuWithType:clientId:accessToken:gatewayId:gatewayMac:` 与 `startDfuWithFirmwarePackage:gatewayMac:`，以及 `endUpgrade`。
- premise `TTGatewayDFU`：只有 `startDfuWithFirmwarePackage:gatewayMac:` 与 `endUpgrade`。

**设备（本轮 premise 仍 notImplemented，见下）**

- main `TTDeviceDFU`：`startDfuWithClientId:accessToken:deviceModel:` 与 `startDfuWithFirmwarePackage:deviceModel:`。model 含 `deviceId`、`slotNumber`、`featureValue`、`lockData`，另有 `url` 属性。
- premise `TTDeviceDFU`：只有固件包 `startDfuWithFirmwarePackage:deviceModel:`。model **没有** `deviceId`，有 `slotNumber` / `featureValue` / `lockData`。没有 clientId 重载，没有 `url`。

`TTDeviceType` 两边都含 `WaterMeter` / `ElectricMeter` / `Keypad` / `HumanPresenceSensor`。`HUMAN_PRESENCE_SENSOR` 按 Spec §1.3 不迁。

## 枚举按名映射

main 3.6.14 与 premise 2.2.6 的 `TTDFUMacros.h` 文本一致。下面的整型只作备查。**禁止**把 raw 值当成 `TTUpgradeStatus` 或 `TTLockUpgradeError` 的下标（`Preparing` 从 1 起，`Success` 不是 status）。

### `UpgradeOpration` → 进度 / 阶段

| case 名 | 备查值 | 映射 |
|---------|--------|------|
| `UpgradeOprationPreparing` | 1 | `TTUpgradeStatus.preparing` |
| `UpgradeOprationUpgrading` | 2 | `TTUpgradeStatus.upgrading` |
| `UpgradeOprationRecovering` | 3 | `TTUpgradeStatus.recovering` |
| `UpgradeOprationSuccess` | 4 | `TTUpgradePhase.success`，不是 status |

### `UpgradeErrorCode` → `TTLockUpgradeError`

按 **case 名** 映射。名字不规则，不能靠去掉前缀再 camelCase 硬切。

| case 名 | 备查值 | Dart |
|---------|--------|------|
| `UpgradeErrorCodePeripheralPoweredOff` | 1 | `peripheralPoweredOff` |
| `UpgradeErrorCodeConnectTimeout` | 2 | `connectTimeout` |
| `UpgradeErrorCodeNetFail` | 3 | `netFail` |
| `UpgradeErrorNONeedUpgrade` | 4 | `noNeedUpgrade` |
| `UpgradeErrorUnknownUpgradeVersion` | 5 | `unknownUpgradeVersion` |
| `UpgradeErrorCodeEnterUpgradeState` | 6 | `enterUpgradeState` |
| `UpgradeErrorCodeUpgradeLockFail` | 7 | `upgradeLockFail` |
| `UpgradeOprationPreparingError` | 8 | `preparingError` |
| `UpgradeOprationGetSpecialValueError` | 9 | `getSpecialValueError` |
| `UpgradeErrorCodeUpgradeFail` | 10 | `upgradeFail` |
| `UpgradeOprationSetLockTimeError` | 11 | **无同名枚举**。实现不得丢弃；在补枚举之前落入 `upgradeFail` |

`TTLockUpgradeError.success` 仍只是占位，不对任何 iOS error case。

## premise Android Gateway

来源：`ttlock_flutter_android` 分支 `premise` 的 `android/libs/TTLockOnPremise.aar`（`javap`），并用 zezamii premise 插件调用核对参数顺序。

`com.ttlock.bl.sdk.gateway.api.GatewayDfuClient` 公开方法：

- `getDefault()`
- `startDfu(Context, String mac, String firmwarePackage, DfuCallback)` — **唯一** start 重载
- `retryEnterDfuModeByNet()` — 无参
- `retryEnterDfuModeByBle()` — 无参
- `abortDfu()`

没有 `startDfu(Context, clientId, accessToken, gatewayId, mac, …)`。无参 retry **不是**网络升级入口。§1.2 网关网络 DFU 维持 notImplemented。

对照：main `ttlock-release.aar` 的 `GatewayDfuClient` 多一个 `startDfu(Context, String, String, int, String, DfuCallback)`。在线插件 `origin/main` 调用为 `startDfu(context, clientId, accessToken, gatewayId, gatewayMac, callback)`。

## 锁成功后刷新 lockData

| 平台 | 采用 |
|------|------|
| iOS main / premise | `TTLock getLockSystemInfoWithLockData:`。premise 2.2.6（`ttlock_dorm_mate` Pods，`TTLockOnPremise` 2.2.6）成功块是 `TTGetLockSystemSucceedBlock` → `TTSystemInfoModel.lockData`。`getLockFeatureValueWithLockData:` 仍在，只是 2.1.3 旧插件路径 |
| Android main | `TTLockClient.getLockSystemInfo(lockData, lockMac, callback)`。main AAR 有一参和两参；在线插件用两参 |
| Android premise | `TTLockClient.getLockSystemInfo(lockData, callback)`。premise AAR 的 `TTLockClient` **没有** lockMac 重载。`LockDfuClient.getLockSystemInfo(String, String, callback)` 两边都有，但旧插件刷新不走它 |

锁包升级调用（两边旧插件一致，供后续 Android 任务）：`LockDfuClient.startDfu(context, lockData, lockMac, firmwarePackage, callback)`。

## §1.2 能力表

不改。

原生侧 premise 已经有水电表/键盘的**包升级**类（Android `DeviceDfuClient.startDfu(Context, DeviceDfuModel, String package, DfuCallback)`；iOS `TTDeviceDFU` 固件包方法）。Android 还有 clientId 重载和 `setUrl`。这与「旧 premise 插件未封装」不冲突：§1.2 的 ❌ 是产品范围，Spec 写明要另开才补。本轮仍 notImplemented，且不迁 `setUrl`。

后续若另开，注意 premise iOS model 没有 `deviceId`、没有 clientId 重载，不能照搬 main 的网络设备 DFU。

## 证据路径

- `pod search TTLockDFU` / `pod search TTLockDFUOnPremise`
- tag 头文件与 podspec：`github.com/ttlock/iOS_SDK_Demo` 3.6.14 / 3.6.16 / 3.7.0，`github.com/ttlock/TTLockOnPremise` 2.2.6
- 在线插件：`ttlock_upgrade_flutter` `origin/main` 的 podspec、`TtlockUpgradeFlutterPlugin.m`、Android 插件、`example/ios/Podfile.lock`
- premise 插件：`ttlock_opensourse_zezamii/plugins/ttlock_upgrade_flutter-premise`（podspec 2.1.3，刷新用 `getLockFeatureValueWithLockData`）
- AAR：`git show premise:android/libs/TTLockOnPremise.aar`；main `ttlock_flutter_android/android/libs/ttlock-release.aar`
- iOS 锁头：已安装的 `TTLockOnPremise` 2.2.6 `TTLock.h` / `TTSystemInfoModel.h`

## Task 1 生成物需进 premise

Pigeon 只写到当前 checkout，未切 premise：

- `ttlock_flutter_android` **main**：`android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt`
- `ttlock_flutter_ios` **main**：`ios/Classes/Messages.swift`
- 主仓 `mix`（ohos 非子模块）：`ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart`、`ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/Messages.ets`

T4/T6 做 premise 原生前，把同一份 `Messages.kt` / `Messages.swift` **整文件**合并或 cherry-pick 进 android / ios 的 **premise**。不要在 premise 上另跑一份 schema，也不要只拣升级相关 hunk。

新增 4 个 enum 后，Pigeon 把既有 data class 的 codec id 整体 +4（例如 `TTLockVersion` 166→170）。四端生成物必须成套使用；旧 Messages 与新 `messages.g.dart` 不能混用。

## T8 遗留（2026-11-26）

未当场修（均为既有缺口或本轮非目标）：

1. **iOS main 整 target 编不过**：`EnumConverter.swift:538` 无 `setOpenTypeAttributes`；`AccessoryHostApiImpl.swift:21` 无 `initializeKeyFob`。升级 5 文件单独 typecheck 通过。
2. **iOS premise 整 target 编不过**：`EnumConverter.swift` 缺 `bluetoothAdvertisingInterval` / `setOpenTypeAttributes`（`TTLockOnPremise` 2.2.6）。升级文件通过。
3. **Android premise `compileDebugKotlin` 失败**：`Remote.connectAddress`、`get/setBluetoothAdvertisingInterval` 在 `TTLockOnPremise.aar` 上不存在。升级 Kotlin 无报错。
4. **Android main example 默认找不到 AAR**：`flatDir` 解析到 `example/android/app/libs`，插件 AAR 在 `android/libs`。临时 symlink 后 `:ttlock_flutter_android:compileDebugKotlin` / `flutter build apk --debug` 通过。
5. **未做真机 DFU**（Spec §6 不做）。
6. **OHOS HAR 未用 DevEco/hvigor 编译**（无 Harmony 工具链）；源码空实现与通道已注册。
7. **全部升级提交未 push**（主仓 `mix`、android/ios `main` 与 `premise`）。
8. 既有小问题未改：网关固定回调迟到竞态（T3）；`UpgradeOprationSetLockTimeError` 落入 `upgradeFail`（T0）。
