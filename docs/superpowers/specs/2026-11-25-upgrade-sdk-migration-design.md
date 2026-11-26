# 升级 SDK 迁入 ttlock_flutter 设计 Spec

> 日期：2026-11-25（修订：2026-11-26，吸收设计审查 Critical / Important）  
> 仓库：`ttlock_flutter`（主仓 `mix` + 子模块 `ttlock_flutter_android` / `ttlock_flutter_ios` 的 `main` 与 `premise`）  
> 源仓库：在线 `ttlock_upgrade_flutter`；本地化对照 `ttlock_opensourse_zezamii/plugins/ttlock_upgrade_flutter-premise`  
> 状态：**待实现**（Task 0 spike 已于 2026-11-26 完成；DFU 版本见 §5.2，类名/枚举/premise Gateway 见 spike-notes）  
> 已确认：API 形态 = Pigeon Future/Stream；其它设备**按设备拆方法**；结构 = 独立 `TTUpgradeHostApi`；example 本轮不改；**main / premise 能力表拆分（非同一代码路径）**

## 1. 目标与范围

### 1.1 目标

将独立插件 `ttlock_upgrade_flutter`（及 premise 对照）的固件升级（DFU）能力迁入联邦插件 `ttlock_flutter`，与现有 `TTLock.lock` / `gateway` 等入口风格一致。在线与本地化**共用 Dart API 表面**，但原生能力按分支裁剪（见 §1.2）。

### 1.2 范围（已确认）— main / premise 能力表

| 能力 | main（在线） | premise（本地化） |
|------|--------------|-------------------|
| `upgradeLock` / `stopUpgradeLock`（固件包） | ✅ | ✅ |
| `upgradeGateway`（网络 DFU：clientId/token/gatewayId + **同 MAC 重试**） | ✅ | ❌ → `unsupported` / `notImplemented` |
| `upgradeGatewayByPackage` / `stopUpgradeGateway` | ✅ | ✅ |
| `upgradeWaterMeter*` / `stopUpgradeWaterMeter` | ✅ | ❌ → `unsupported`（旧 premise 插件无此 API；AAR/Pod 若后续确认可用可另开） |
| `upgradeElectricMeter*` / `stopUpgradeElectricMeter` | ✅ | ❌ → 同上 |
| `upgradeKeypad*` / `stopUpgradeKeypad` | ✅ | ❌ → 同上 |

依据：

- 旧 premise Dart 仅有锁包升级 + 网关**包**升级（无 dfuType/clientId，无水电表/键盘）
- `TTLockOnPremise.aar` 的 `GatewayDfuClient` **无** `startDfu(Context, clientId, token, gatewayId, mac, …)` 网络重载，只有包升级重载
- iOS 本地化 DFU Pod 为 **`TTLockDFUOnPremise`**（不是 `TTLockDFUPremise`）；类名亦为 `TTLockDFUOnPremise`，与 main 的 `TTLockDFU` **不同**，module-alias 无法抹平类名

其它约定：

| 项 | 内容 |
|----|------|
| Dart API | `TTLock.upgrade`（`TTUpgradeApi`），Pigeon Future/Stream；premise 未实现方法在原生返回 notImplemented，Dart 映射为明确异常 |
| Android AAR | **文件名不变**：main=`ttlock-release`，premise=`TTLockOnPremise`；premise **须补** nordic `dfu:2.5.0` + 与 main 同版本 okhttp（flatDir 无传递依赖） |
| iOS | main=`TTLockDFU`；premise=`TTLockDFUOnPremise`；module-alias + **少量分支薄包装**（见 §5.2） |
| OHOS | 同步 Pigeon 与注册，**空实现**（对齐现网 `makeNotImplementedError`） |
| 分支 | 主仓改 `mix`；android/ios 子模块改 `main` **与** `premise` |

### 1.3 非目标

- 不改 example demo / 不接升级演示页
- 不同步开放平台 `flutterSDK` 文档（另开）
- 不保留 `ttlock_upgrade_flutter` MethodChannel 旧回调兼容层
- 不删除 / 不归档独立仓库 `ttlock_upgrade_flutter`
- 鸿蒙不做真实 DFU
- 本轮不做真机 DFU 全量回归
- **有意不迁** main AAR 另有的锁「网络 DFU」重载（旧公开插件亦无）；`DeviceType.HUMAN_PRESENCE_SENSOR` 不迁
- `TTGatewayHostApi.enterUpgradeMode` 仅「进入升级模式」，**不是**本 Spec 的固件 DFU；二者并列时勿接错

### 1.4 `firmwarePackage` 语义

不透明字符串（通常为服务端下发的 Base64 包内容），**不是**本地文件路径。

## 2. 现状勘察

| 层 | 状态 |
|----|------|
| `ttlock_upgrade_flutter`（main） | MethodChannel + EventChannel；锁/网关网络+包/其它设备；Android `LockDfuClient`/`GatewayDfuClient`/`DeviceDfuClient`；iOS `TTLockDFU`/`TTGatewayDFU`/`TTDeviceDFU` |
| `ttlock_upgrade_flutter-premise` | 仅锁包 + 网关包；iOS Pod `TTLockDFUOnPremise` 2.1.3；Android 显式 `dfu:2.5.0` |
| `ttlock_flutter` Dart | `TTLock.*` + Pigeon；**无** upgrade 入口 |
| `platform_interface` | 三 HostApi + 单一 `@EventChannelApi`；仅有网关 `enterUpgradeMode` |
| Android main | 已有 `dfu:2.5.0` + okhttp 3.12.10 + ProGuard keep |
| Android premise | 仅 `TTLockOnPremise.aar`，**缺** dfu/okhttp |
| iOS | `TTLock` / `TTLockOnPremise` + `TTLockSDK` alias；**未**依赖 DFU Pod |
| OHOS | `makeNotImplementedError` → code=`TTLockError.FAIL` 数字串，message=`notImplemented` |

## 3. 架构

```
Dart: TTLock.upgrade (TTUpgradeApi)
        ↓ Pigeon
platform_interface:
  TTUpgradeHostApi（set*Param / stop*）
  TTEventChannelApi 新增 upgrade* 流
        ↓
Android: UpgradeApi.kt
  main → 全量 DFU API
  premise → 仅锁包 + 网关包；其余 Host/Stream → notImplemented
  AAR 不变；premise 补 dfu + okhttp
iOS:
  main → TTLockDFU + alias TTLockDFUSDK=TTLockDFU
  premise → TTLockDFUOnPremise + alias + 薄包装统一调用面
  UpgradeHostApiImpl + StreamHandlers
OHOS: UpgradeHostApiImpl 空实现（makeNotImplementedError）
```

原则：

- 独立 `TTUpgradeHostApi`，不并入 Lock/Gateway/Accessory
- 进度走 EventChannel Stream；**生命周期对齐扫描类**（`onListen` 才 start，`onCancel` 必 abort），**不对齐** addCard（addCard 的 onCancel 为空）
- 同一时刻只允许一路升级（见 §4.6 互斥）

## 4. Dart API 与事件模型

### 4.1 入口

- 文件：`ttlock_flutter/lib/src/tt_upgrade_api.dart`
- `TTLock.upgrade` 懒加载；`configurePigeon` / `setImplementations` / `_clearCachedApis` 同步纳入
- `ttlock.dart` export 升级 API 与错误类型；`hide` 列表须增加 `TTUpgradeHostApi`

### 4.2 对外方法

| 方法 | 返回 | main | premise | 对应旧 API |
|------|------|------|---------|------------|
| `upgradeLock({lockMac, lockData, firmwarePackage})` | `Stream<TTUpgradeEvent>` | ✅ | ✅ | `startUpgradeLock` |
| `stopUpgradeLock()` | `Future<void>` | ✅ | ✅ | `stopUpgradeLock` |
| `upgradeGateway({dfuType, clientId, accessToken, gatewayId, gatewayMac})` | `Stream<TTUpgradeEvent>` | ✅（含同 MAC 重试，§4.7） | ❌ | `startUpgradeGateway` |
| `upgradeGatewayByPackage({firmwarePackage, gatewayMac})` | `Stream<TTUpgradeEvent>` | ✅ | ✅ | `startUpgradeGatewayByFirmwarePackage`（premise 旧 API 名 `startUpgradeGateway`） |
| `stopUpgradeGateway()` | `Future<void>` | ✅ | ✅ | `stopUpgradeGateway` |
| `upgradeWaterMeter({clientId, accessToken, deviceId, deviceMac})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | `startUpgradeOtherDevice` WATER_METER |
| `upgradeWaterMeterByPackage({deviceId, deviceMac, firmwarePackage})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | WithPackage WATER_METER |
| `stopUpgradeWaterMeter()` | `Future<void>` | ✅ | ❌ | `stopUpgradeOtherDevice` |
| `upgradeElectricMeter({clientId, accessToken, deviceId, deviceMac})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | ELECTRIC_METER |
| `upgradeElectricMeterByPackage({deviceId, deviceMac, firmwarePackage})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | WithPackage ELECTRIC_METER |
| `stopUpgradeElectricMeter()` | `Future<void>` | ✅ | ❌ | stop other |
| `upgradeKeypad({clientId, accessToken, deviceId, deviceMac, lockData?, slotNumber?, featureValue?})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | KEYPAD |
| `upgradeKeypadByPackage({deviceId, deviceMac, firmwarePackage, lockData?, slotNumber?, featureValue?})` | `Stream<TTUpgradeEvent>` | ✅ | ❌ | WithPackage KEYPAD |
| `stopUpgradeKeypad()` | `Future<void>` | ✅ | ❌ | stop other |

说明：

- **不再**对外暴露合并的 `upgradeOtherDevice` / `deviceType`
- 水表 / 电表不含 `lockData` / `slotNumber` / `featureValue`；键盘保留这三项可选（缺省：空串 / 0）
- 三个设备 `stop*` 原生可落到同一 `DeviceDfu` abort，但 **不得** abort 锁或网关 DFU（`LockDfuClient` / `GatewayDfuClient` 独立）
- 水表 / 电表包升级：调用方须已对对应表计调用过 `waterMeterSetClientParam` / `electricMeterSetClientParam`（与联邦表计 API 一致）；Spec 在文档注释中写明前置条件。旧插件注释提过但未强制调用
- 参数对外用 camelCase（`lockMac`）；Android 刷新 lockData 仍需 mac

### 4.3 事件与枚举（Pigeon）

```dart
enum TTUpgradeStatus { preparing, upgrading, recovering }

enum TTUpgradePhase { progress, success }

enum TTDfuType { net, bluetooth }

enum TTLockUpgradeError {
  success, // 占位，对齐旧 ordinal；业务失败不用
  peripheralPoweredOff,
  connectTimeout,
  netFail,
  noNeedUpgrade,
  unknownUpgradeVersion,
  enterUpgradeState,
  upgradeLockFail,
  preparingError,
  getSpecialValueError,
  upgradeFail,
}

class TTUpgradeEvent {
  TTUpgradePhase phase;
  TTUpgradeStatus? status;
  int? progress;   // 0–100
  String? lockData; // 仅锁升级 success 时有值
}
```

- 进度 `status` **按名**映射 preparing/upgrading/recovering；Android 旧实现 `onStatusChanged` 为空，实际多只发 `upgrading` + percent
- 禁止把 iOS `UpgradeOpration` raw 值当 `TTUpgradeStatus` 下标（头文件 ordinal 未在仓库核实；实现按名称/文档映射）

### 4.4 Pigeon 约定

1. `@HostApi() TTUpgradeHostApi`：各 `setUpgrade*Param` + 各 `stopUpgrade*`
2. 并入唯一 `@EventChannelApi() TTEventChannelApi` 的升级流方法（与 §4.2 Stream 一一对应）
3. 重新生成 Dart / Kotlin / Swift / ArkTS Messages，并提交到 **android/ios 的 main 与 premise** 以及 ohos
4. 参数槽：对齐现网 `EventContextStore`（iOS/OHOS）与 `LockStreamParams` 类仓库（Android）— 新增 Upgrade 专用 param 槽，勿与 lock addCard 槽混用
5. Dart 封装链路：
   - `runBleGate(TTBleOperation.deviceOperation)`
   - `set*Param`（可走短超时，对齐 `runLockApi`）
   - 订阅 Stream；**流本身不加** `TTLockTimeouts` 默认 45s（DFU 可持续数分钟）
   - `mapUpgradeStreamErrors`：须先识别 OHOS/`notImplemented`/`unsupported`，再解析业务 `TTLockUpgradeError`；禁止数字码误落入 `success`
6. 注册点：
   - Android：`TtlockFlutterPlugin.initModules` → `UpgradeApi` + StreamHandlers
   - iOS：`TtlockFlutterPlugin.register`
   - OHOS：`TtlockFlutterOhosPlugin.onAttachedToEngine` + `EventStreamHandlers.register`

### 4.5 错误类型

- `lib/errors/tt_upgrade_exception.dart`：`TTUpgradeException extends TTException`，字段 `TTLockUpgradeError code`
- 另：`notImplemented` / 平台未支持 → 使用现有约定（与 OHOS `makeNotImplementedError` 对齐：message 含 `notImplemented`，或独立 code 字符串由 `mapUpgradeStreamErrors` 特例处理），**不**伪装成 `upgradeFail`
- Android 业务错误：旧实现多折叠为 `upgradeFail`（锁刷新失败用 `getSpecialValueError`）；本迁保持该行为，可选后续再细映射 `DfuErrorCode`
- iOS：`UpgradeErrorCode` **按名**映射到 `TTLockUpgradeError`，不依赖未核实的 ordinal

### 4.6 生命周期与互斥（对齐 scan，非 addCard）

| 事件 | 行为 |
|------|------|
| Stream `onListen` | 读取已 set 的 param，调用原生 `startDfu` |
| Stream `onCancel`（含 Dart `subscription.cancel`） | 调用对应 `abortDfu` / `endUpgrade` |
| 显式 `stop*()` | 完成 Future（void）；若仍有监听中的同路 Stream → `endOfStream`（不 error）；并 abort 原生 |
| 成功 / 业务失败 | 推送 success 事件或 `addError` 后 **`endOfStream`**；避免结束后 cancel 再 abort |
| 第二路升级 `onListen`（任一路已在进行） | 立即失败：`TTUpgradeException(upgradeFail, 'upgrade already in progress')`（或专用 busy）；**不**静默 abort 第一路 |
| `stopUpgradeWaterMeter` 等 | 只 abort DeviceDfu；不影响 Lock/Gateway DFU |

说明：旧插件 EventChannel `onCancel` **不停** DFU；新行为是有意修复。

### 4.7 网关网络 DFU 与同 MAC 重试（仅 main）

对齐 Android 旧逻辑（`TtlockUpgradeFlutterPlugin.startUpgradeGateway`）：

1. 维护原生侧 `cacheGatewayMac`
2. **首次**（mac ≠ cache）：`GatewayDfuClient.startDfu(context, clientId, token, gatewayId, mac, …)` — **忽略** `dfuType`；成功后清空 cache
3. **同 mac 再次** `onListen`（视为重试）：按 `dfuType` 调用 `retryEnterDfuModeByNet` / `retryEnterDfuModeByBle`
4. iOS main：每次 `startDfuWithType:dfuType`（与旧 iOS 一致；无独立 cache 重试 API 时保持每次带 type）
5. Dart 文档写明：Android 上「同 gatewayMac 再次订阅 = 重试」；换 mac 或成功后 cache 清空则重新走首次

不另增 `retryUpgradeGateway` API（避免双入口）；行为写进 `upgradeGateway` 文档与原生实现。

### 4.8 锁升级成功后刷新 `lockData`

| 平台 | 行为 |
|------|------|
| Android main | 成功后 **延时 3s** 再 `TTLockClient.getLockSystemInfo(lockData, lockMac, callback)`（两参重载存在）；成功事件带新 `lockData`；失败 → `getSpecialValueError` |
| Android premise | 同样延时 3s。`TTLockClient.getLockSystemInfo` **只有** `(lockData, callback)`，无 lockMac 重载；按旧 premise 插件走这一参。失败 → `getSpecialValueError` |
| iOS main | `getLockSystemInfoWithLockData`；旧插件失败仍当成功回旧 lockData — **本迁改为**：刷新失败 → `getSpecialValueError`（与 Android 对齐） |
| iOS premise | **`getLockSystemInfoWithLockData`**（`TTLockOnPremise` 2.2.6 已有，成功块取 `TTSystemInfoModel.lockData`）。旧 2.1.3 插件的 `getLockFeatureValueWithLockData` 仍存在，本迁不用 |

## 5. 原生落地

### 5.1 Android（main + premise）

- 新增 `UpgradeApi.kt`（对齐 `LockApi.kt`）+ Upgrade StreamHandlers
- 业务从旧 `TtlockUpgradeFlutterPlugin.java` 迁入并按 §1.2 裁剪
- **main**：全量；保留 `cacheGatewayMac` 重试
- **premise**：仅实现锁包 + 网关包；其余 Host 方法 / Stream `onListen` → notImplemented；**禁止**假设与 main 同一调用路径
- AAR 文件名不变
- **premise `build.gradle` 必须增加**：
  - `api 'no.nordicsemi.android:dfu:2.5.0'`（或 `implementation`，与 main 一致优先 `api`）
  - `implementation 'com.squareup.okhttp3:okhttp:3.12.10'`（与 main 对齐，勿升到 4.x）
- 沿用 main 的 `consumer-rules.pro` DFU keep（premise 同步规则）
- 不在 Upgrade 路径再次 `prepareBTService`（插件 init 已做）

### 5.2 iOS（main + premise）

**podspec**

| 分支 | DFU dependency | `OTHER_SWIFT_FLAGS`（叠加现有 TTLockSDK alias） |
|------|----------------|--------------------------------------------------|
| main | `s.dependency 'TTLockDFU', '3.6.14'`（与 `TTLock` 3.6.16 同仓 tag 内的 DFU 版本；传递 `iOSDFULibrary ~> 4.14.0`。trunk 另有 3.7.0，对的是 `TTLock` 3.7.0，不采用） | `-module-alias TTLockDFUSDK=TTLockDFU` |
| premise | `s.dependency 'TTLockDFUOnPremise', '2.2.6'`（与 `TTLockOnPremise` 2.2.6 同 tag；传递 `iOSDFULibrary ~> 4.14.0`。旧插件 2.1.3 只作对照） | `-module-alias TTLockDFUSDK=TTLockDFUOnPremise` |

**类名与薄包装（Critical）**

- module-alias **只**统一模块名 `TTLockDFUSDK`，**不能**把 `TTLockDFUOnPremise` 类变成 `TTLockDFU`
- 允许少量分支文件，例如：
  - `UpgradeDfuFacade.swift`：main 调 `TTLockDFU` / `TTGatewayDFU` / `TTDeviceDFU`；premise 调 `TTLockDFUOnPremise` / 对应 Gateway/Device 类（以头文件为准）
  - 或 `typealias` / `#if` 无法跨 Pod 时用两套薄文件、共享 `UpgradeHostApiImpl` 业务编排
- §8 检查项改为：「业务编排源码尽量共用；**DFU 类型入口允许分支包装**，差异不限于 podspec」

**其它**

- `UpgradeHostApiImpl.swift` + StreamHandler；`onCancel` → `endUpgrade`
- 锁成功刷新见 §4.8
- 优先纯 Swift

### 5.3 OHOS

- 同步 `Messages.ets`
- `UpgradeHostApiImpl.ets`：全部走 `makeNotImplementedError(operation)`（与 Lock/Accessory 一致）
- 9 条升级 Stream 进入 `EventStreamHandlers.register()`，`onListen` 即 error + 结束
- Dart `mapUpgradeStreamErrors` 识别该形态，不映射为 `TTLockUpgradeError.success`

### 5.4 注册清单

| 平台 | 动作 |
|------|------|
| Android | `initModules`：`TTUpgradeHostApi.setUp` + upgrade StreamHandlers；premise 同步生成物 |
| iOS | `TtlockFlutterPlugin.register`；main+premise 均提交 |
| OHOS | `onAttachedToEngine` + EventStreamHandlers |

## 6. 验证

| 级别 | 内容 |
|------|------|
| 必做 | Task 0 spike 结论写入计划/本 Spec 风险表（Pod 版本、类名、premise Gateway API） |
| 必做 | `fvm flutter pub get`；主包 / platform_interface analyze 无新增 error |
| 必做 | Pigeon 生成物提交；android/ios **main+premise** + ohos Messages 一致 |
| 建议 | Android 有对应 AAR 时编译通过（main 与 premise 各一次） |
| 建议 | iOS podspec + alias + 薄包装可 `pod install`（私有源可用时） |
| 不做 | example UI；真机全量 DFU 回归 |

## 7. 交付物清单

1. 本文 Spec  
2. `ttlock_flutter_platform_interface`：Pigeon + 生成代码  
3. `ttlock_flutter`：`TTUpgradeApi`、`TTLock.upgrade`、错误映射、export、`hide TTUpgradeHostApi`  
4. `ttlock_flutter_android`：**main + premise**（含 premise dfu/okhttp）  
5. `ttlock_flutter_ios`：**main + premise**（`TTLockDFU` / `TTLockDFUOnPremise` + 薄包装）  
6. `ttlock_flutter_ohos`：空实现 + 生成代码  
7. writing-plans：**Task 0 = spike**，其后才是实现任务

## 8. 项目规范检查项（本迁移）

- [ ] 升级入口仅通过 `TTLock.upgrade`，无旧 MethodChannel 公共 API
- [ ] 进度用 Stream；失败用 `TTUpgradeException` / notImplemented 特例；禁止 null 当成功
- [ ] iOS：业务编排尽量共用；DFU 入口允许 premise 薄包装；Pod 名为 `TTLockDFUOnPremise`
- [ ] Android AAR 文件名不变；premise 已补 dfu + okhttp
- [ ] main/premise 能力按 §1.2 表实现，不把网络网关 DFU / 表计键盘强行编进 premise
- [ ] OHOS 空实现可编译、通道注册齐全，错误对齐 `makeNotImplementedError`
- [ ] `onCancel` / 显式 `stop*` 均中止对应原生 DFU；成功/失败后 `endOfStream`
- [ ] 互斥：第二路升级失败，不静默杀第一路
- [ ] 升级 Stream 不套用 45s 默认超时
- [ ] 本轮不改 example、不改开放平台文档
- [ ] 子模块 main 与 premise 均合入后才算完成

## 9. 风险与 Task 0 spike 清单

| 项 | 处理 |
|----|------|
| `TTLockDFU` 与 `TTLock` 3.6.16 兼容版本 | **钉死 `3.6.14`**。tag `3.6.16` 里的 DFU podspec 仍是 3.6.14，公开头与 tag 3.6.14 一致。传递 `iOSDFULibrary ~> 4.14.0`。不用 trunk 最新 3.7.0 |
| `TTLockDFUOnPremise` 与 `TTLockOnPremise` 2.2.6 | **钉死 `2.2.6`**（旧插件 2.1.3）。类名：锁 `TTLockDFUOnPremise`，网关 `TTGatewayDFU`，设备 `TTDeviceDFU`。传递 `iOSDFULibrary ~> 4.14.0` |
| iOS `UpgradeOpration` / `UpgradeErrorCode` | 头文件已核实，main 3.6.14 与 premise 2.2.6 同名同值。**按名映射**（spike-notes）。`Preparing = 1`，禁止当 `TTUpgradeStatus` 下标。`UpgradeOprationSetLockTimeError` 无同名 Dart 枚举 |
| premise `GatewayDfuClient` 仅有包升级 | **已再确认**：只有 `startDfu(Context, mac, package, DfuCallback)`。无 clientId/token/gatewayId 重载。无参 `retryEnterDfuModeByNet/ByBle` 不是网络 start。§1.2 维持 notImplemented |
| premise 水电表/键盘 DeviceDfu | AAR `DeviceDfuClient` 与 iOS `TTDeviceDFU` 的**包升级** API 存在。§1.2 仍 notImplemented，本轮不改能力表。premise iOS 无 clientId 重载，model 无 `deviceId` |
| `DeviceDfuClient.setUrl`（premise） | 方法仍在；旧插件未封装；本轮不迁 |
| EventSink 线程 | 回调若不在主线程，实现时 hop 到主线程再 sink |

## 10. writing-plans 约束

单份实现计划即可，但必须：

1. **Task 0：spike**（iOS Pod/类名/枚举头文件；Android premise AAR Gateway/Device API 再确认；版本钉死）  
2. 再按「Pigeon → Dart API → Android main → Android premise → iOS main → iOS premise → OHOS → analyze」拆任务  
3. spike 未完成前不得开始原生 DFU 调用实现（2026-11-26 已完成，见 spike-notes；T5/T6 可以按钉死版本开工）  

---

## 修订记录（相对初稿）

- 修正 iOS premise：`TTLockDFUOnPremise` + 类名差异 + 薄包装  
- 拆分 main/premise 能力表；禁止「代码路径相同」  
- premise Android 补 dfu/okhttp  
- 写明网关同 MAC 重试、`cacheGatewayMac`  
- 生命周期对齐 scan（cancel→abort、endOfStream、互斥）  
- 锁成功刷新 lockData 跨端语义  
- OHOS / 超时 / 联邦注册清单 / 错误映射补强  
- Task 0 spike 强制进入计划  
- 2026-11-26 Task 0：钉死 `TTLockDFU` 3.6.14、`TTLockDFUOnPremise` 2.2.6；premise 网关无网络 `startDfu`；iOS premise 刷新用 `getLockSystemInfoWithLockData`；Android premise `TTLockClient.getLockSystemInfo` 仅一参。详见 `docs/superpowers/plans/2026-11-26-upgrade-sdk-migration-spike-notes.md`  
