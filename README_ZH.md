# TTLock Flutter SDK

[English](./README.md)

`ttlock_flutter` 是通通锁（TTLock）本地化（On-Premise）场景下的 Flutter 插件，基于 **Federated Plugin + Pigeon** 提供强类型 `Future` / `Stream` API，统一覆盖智能锁、网关、无线钥匙 / 键盘、门磁、水电表以及**固件升级**等设备能力。

> 当前版本对应插件 **0.0.3**（以 `ttlock_flutter/pubspec.yaml` 为准）。  
> 仅使用新版入口 `package:ttlock_flutter/ttlock.dart`；旧版 callback 风格（`ttlock_classic.dart` 等）已标记 Deprecated。

## 能力一览

| 模块 | 入口 | 主要能力 |
|------|------|----------|
| 锁 | `TTLock.lock` | 扫描、初始化、开关锁、密码 / 卡 / 指纹 / 人脸 / 掌静脉 / 二维码、配置、WiFi 锁、电梯 / 酒店、配件绑定等 |
| 网关 | `TTLock.gateway` | 扫描、连接、初始化、附近 WiFi、IP / APN 配置 |
| 无线钥匙 | `TTLock.remoteKey` | 扫描、初始化遥控器 |
| 无线键盘 | `TTLock.remoteKeypad` | 扫描、初始化（普通 / 多功能）、在键盘上录入指纹 / 卡、已存锁管理 |
| 门磁 | `TTLock.doorSensor` | 普通门磁扫描与初始化；独立门磁扫描、初始化与特性查询 |
| 电表 | `TTLock.electricMeter` | 扫描、连接、初始化、通断 / 余量 / 充值 / 付费模式、Cat.1 等 |
| 水表 | `TTLock.waterMeter` | 扫描、连接、初始化、通断 / 余量 / 充值 / 付费模式、累计用量、Cat.1 等 |
| 固件升级 | `TTLock.upgrade` | 锁 / 网关 / 水表 / 电表 / 键盘：网络 DFU 或固件包 DFU；进度以 `Stream<TTUpgradeEvent>` 推送 |

## 接入配置

### 1. 引入依赖

插件未发布到 pub.dev（`publish_to: none`），通过 Git 依赖引入。

#### 在线 / 云端（默认）

`ttlock_flutter` 会拉取 `ttlock_flutter_android` / `ttlock_flutter_ios`，且未写死 `ref`（默认分支为在线打包，如 `ttlock-release` / CocoaPod `TTLock`）。

```yaml
dependencies:
  ttlock_flutter:
    git:
      url: https://github.com/ttlock/ttlock_flutter.git
      path: ttlock_flutter
      ref: mix   # 按团队发布分支 / tag 调整
```

#### 本地化（On-Premise）

`ttlock_flutter` 依赖保持不变，再用 **`dependency_overrides`** 把 Android / iOS 实现覆写到 **`premise`** 分支（对应本地化 AAR `TTLockOnPremise` / CocoaPod `TTLockOnPremise`）：

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

> override 的 git 地址需与 `ttlock_flutter/pubspec.yaml` 中声明的一致。切到 `premise` 后，请按 §2.1 放置本地化 AAR，并在 iOS 侧重新执行 `pod install`。

然后执行：

```bash
flutter pub get
```

### 2. Android

#### 2.1 原生 SDK AAR

`ttlock_flutter_android` 通过 `flatDir` 依赖 TTLock 原生 Android SDK 的 **本地 AAR**（不是 Maven Central 坐标）。

| 场景 | AAR 文件名 | 常见来源 |
|------|------------|----------|
| 本地化（On-Premise） | `TTLockOnPremise.aar` | 通通锁本地化交付包 |
| 在线版 / 云端 SDK 打包 | `ttlock-release.aar` | 对应 Android SDK 发行包 |

**接入步骤**

1. 先看当前插件分支 `ttlock_flutter_android/android/build.gradle` 声明的是哪个 AAR，例如：
   - 本地化：`implementation(name: 'TTLockOnPremise', ext: 'aar')`
   - 在线打包：`implementation(name: 'ttlock-release', ext: 'aar')`
2. 若自行维护 Android 子模块，将对应 AAR 放到插件目录：
   - `ttlock_flutter_android/android/libs/<AAR文件名>.aar`
3. **同时把同名 AAR 复制到宿主 App**（多数 Flutter 工程必须这样做；`flatDir { dirs 'libs' }` 会按宿主工程解析）：

```text
your_app/android/app/libs/TTLockOnPremise.aar
# 或
your_app/android/app/libs/ttlock-release.aar
```

若没有 `libs` 目录请先创建。文件名（去掉 `.aar`）必须与 `implementation(name: '...')` 完全一致。

若编译报错 `Could not find :TTLockOnPremise:` 或 `Could not find :ttlock-release:`，通常是宿主 `android/app/libs/` 未放置或文件名不匹配。

**说明**

- 同一构建不要混用本地化 AAR 与在线版 AAR，除非你明确清楚双依赖的 API 重叠风险。
- 插件已额外引入 Nordic DFU（`no.nordicsemi.android:dfu`），因为 flatDir AAR 不会带上 Maven 传递依赖。
- Release 开启 R8 时，插件已通过 `consumer-rules.pro` 防止 SDK 类被裁剪，请勿随意去掉相关规则。

#### 2.2 权限

在 `android/app/src/main/AndroidManifest.xml` 声明权限（使用 `tools:targetApi` 时根节点需 `xmlns:tools`）：

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

<!-- Android 9–11 BLE 扫描常依赖定位；须声明并在运行时申请 -->
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

在扫描 / 连接前动态申请 `BLUETOOTH_SCAN` / `BLUETOOTH_CONNECT`（以及需要时的定位权限）。人脸能力另加 `CAMERA`。建议 `minSdk` **≥ 26**。

### 3. iOS

在 `ios/Runner/Info.plist` 配置用途说明：

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>需要使用蓝牙连接智能锁与网关设备</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>需要使用蓝牙连接智能锁与网关设备</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>扫描附近蓝牙设备需要定位权限</string>
```

人脸场景按需补充相机 / 相册说明。首次使用蓝牙时系统会弹窗授权。

### 4. OpenHarmony（OHOS）

在 entry 模块 `module.json5` 的 `requestPermissions` 中声明（文案与 `$string` 资源按产品调整）：

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

`ACCESS_BLUETOOTH` / 定位为 **user_grant**，BLE 操作前需运行时申请。人脸能力另加 `ohos.permission.CAMERA`。

### 5. Import

```dart
import 'package:ttlock_flutter/ttlock.dart';
```

新版 API **无需**再调用旧版 `prepareBTService`；原生侧在插件注册时就绪。业务侧请在扫描 / 操作前完成权限（及蓝牙开关）检查，可用 `TTLock.setBleGuard(...)` 统一拦截。

## 最小示例

```dart
import 'package:ttlock_flutter/ttlock.dart';

Future<void> unlock(String lockData) async {
  try {
    final result = await TTLock.lock.controlLock(
      lockData,
      TTControlAction.unlock,
    );
    print('开锁成功，电量: ${result.electricQuantity}');
  } on TTLockException catch (e) {
    print('失败: ${e.code} ${e.message}');
  }
}
```

## 固件升级

入口：`TTLock.upgrade`（`TTUpgradeApi`）。升级 API 均返回 `Stream<TTUpgradeEvent>`（进度 / 成功）。失败抛 `TTUpgradeException`（`TTLockUpgradeError`）；平台未实现抛 `TTUpgradeNotImplementedException`。

| 方法 | 说明 |
|------|------|
| `upgradeLock` | 锁网络 DFU；成功时可能带回刷新后的 `lockData` |
| `upgradeLockByPackage` | 锁固件包升级；成功时可能带回刷新后的 `lockData` |
| `upgradeGateway` | 网关网络 DFU；Android：同一 `gatewayMac` 再次订阅可按 `TTDfuType` 重试 |
| `upgradeGatewayByPackage` | 网关固件包升级 |
| `upgradeWaterMeter` / `upgradeElectricMeter` | 水电表网络升级 |
| `upgradeWaterMeterByPackage` / `upgradeElectricMeterByPackage` | 水电表固件包升级——须先调用 `waterMeterSetClientParam` / `electricMeterSetClientParam` |
| `upgradeKeypad` / `upgradeKeypadByPackage` | 键盘网络 / 固件包升级；`lockData` / `slotNumber` / `featureValue` 可选 |

取消订阅（`StreamSubscription.cancel`）即中止升级。三端 / 本地化可用范围见 [PLATFORM_API_ZH.md](./PLATFORM_API_ZH.md)。

```dart
final sub = TTLock.upgrade.upgradeLockByPackage(
  lockMac: lockMac,
  lockData: lockData,
  firmwarePackage: firmwarePackage,
).listen(
  (event) {
    if (event.phase == TTUpgradePhase.progress) {
      print('进度: ${event.progress}% (${event.status})');
    } else if (event.phase == TTUpgradePhase.success) {
      print('完成，lockData: ${event.lockData}');
    }
  },
  onError: (e) {
    if (e is TTUpgradeException) {
      print('升级失败: ${e.code} ${e.message}');
    }
  },
);
// 中止：await sub.cancel();
```

## 平台支持

| 平台 | 状态 |
|------|------|
| Android | 已支持（`ttlock_flutter_android`） |
| iOS | 已支持（`ttlock_flutter_ios`） |
| OHOS | 已支持（`ttlock_flutter_ohos`） |

## 详细文档

- 三端 API 差异（仅列不可用项）：[PLATFORM_API_ZH.md](./PLATFORM_API_ZH.md)
- BleGuard、超时、通用约定、错误码、模型、各模块 API 与场景示例，见开放平台 **Flutter SDK** 文档。

## 相关资源

- 插件仓库：<https://github.com/ttlock/ttlock_flutter>
- 云端 REST 接口文档见开放平台 `cloud/` 目录（锁初始化、更新锁数据等需与 BLE 操作配合）
