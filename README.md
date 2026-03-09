# TTLock Flutter Plugin (On-Premise)

基于 Future/Stream 的 TTLock 智能锁、网关及配件 Flutter 插件，适用于本地/on-premise SDK 场景。

## 功能概览

- **锁 (Lock)**：扫描、初始化、开关锁、密码/卡/指纹/人脸、时间与记录、WiFi 配置、自动上锁、电梯/酒店等扩展功能。
- **网关 (Gateway)**：扫描、连接、初始化、配置 IP/APN、进入升级模式。
- **配件 (Accessory)**：遥控器、键盘、门磁的扫描与初始化等。

## 环境要求

- Dart SDK `>=3.0.0 <4.0.0`
- Flutter 兼容当前插件所支持的平台（Android / iOS）

## 安装

在 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  ttlock_premise_flutter: ^0.0.3  # 或当前最新版本
```

## 配置

### iOS

1. 在 Xcode 中打开工程，进入 `Project` → `Info` → `Custom iOS Target Properties`。
2. 添加键 `Privacy - Bluetooth Peripheral Usage Description`，值填写蓝牙使用说明（如 "用于连接智能锁"）。

### Android

**AndroidManifest.xml：**

1. 在 `<manifest>` 元素上添加 `xmlns:tools="http://schemas.android.com/tools"`。
2. 在 `<application>` 元素上添加 `tools:replace="android:label"`。
3. 添加以下权限：

```xml
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

**MainActivity：**  
在继承 `FlutterActivity` 的 MainActivity 中，将权限回调交给 TTLock 插件：

```java
@Override
public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    TtlockFlutterPlugin ttlockflutterpluginPlugin = (TtlockFlutterPlugin) getFlutterEngine().getPlugins().get(TtlockFlutterPlugin.class);
    if (ttlockflutterpluginPlugin != null) {
        ttlockflutterpluginPlugin.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
    super.onRequestPermissionsResult(requestCode, permissions, grantResults);
}
```

**使用 on-premise SDK 时**，在 `build.gradle` 中配置仓库与构建类型，例如：

```groovy
repositories {
    flatDir {
        dirs 'libs', '..\\..\\..\\android\\libs'
    }
}
buildTypes {
    release {
        minifyEnabled false
        shrinkResources false
    }
}
```

## 快速开始

引入包并开启调试日志（可选）：

```dart
import 'package:ttlock_premise_flutter/ttlock.dart';

TTLock.printLog = true;
```

### 扫描锁并初始化

扫描返回 `Stream`，初始化与后续操作为 `Future`，失败时抛出 `TTLockException`：

```dart
final sub = TTLock.lock.startScanLock().listen((model) {
  print('发现: ${model.lockName} ${model.lockMac}');
});

final params = TTLockInitParams(
  lockMac: scanModel.lockMac,
  lockVersion: scanModel.lockVersion,
  isInited: scanModel.isInited,
);
try {
  final lockData = await TTLock.lock.initLock(params);
  // 使用 lockData 进行后续操作
} on TTLockException catch (e) {
  print('失败: ${e.error} ${e.message}');
}
```

### 开锁与错误处理

```dart
try {
  final r = await TTLock.lock.controlLock(lockData, TTControlAction.unlock);
  print('开锁成功 lockTime:${r.lockTime} 电量:${r.electricQuantity}');
} on TTLockException catch (e) {
  print('开锁失败: ${e.error} ${e.message}');
}
```

### 开锁后获取记录与校时

```dart
try {
  await TTLock.lock.controlLock(lockData, TTControlAction.unlock);

  final record = await TTLock.lock.getLockOperateRecord(
    type: TTOperateRecordType.latest,
    lockData: lockData,
  );
  print('操作记录: $record');

  final timestamp = DateTime.now().millisecondsSinceEpoch;
  await TTLock.lock.setLockTime(timestamp: timestamp, lockData: lockData);
  print('已设置锁时间: $timestamp');
} on TTLockException catch (e) {
  print('错误: ${e.error} ${e.message}');
}
```

## API 结构说明

插件通过三个入口暴露能力，对应接口分别为 `TTLockApi`、`TTGatewayApi`、`TTAccessoryApi`。单次操作为 `Future<T>`，失败抛异常；扫描、添加凭证等过程性操作为 `Stream<T>`。

---

### TTLock.lock（TTLockApi）— 锁

| 分类 | 接口 | 说明 | 返回 |
|------|------|------|------|
| **扫描与蓝牙** | `startScanLock()` | 扫描附近锁 | `Stream<TTLockScanModel>` |
| | `stopScanLock()` | 停止扫描 | `Future<void>` |
| | `getBluetoothState()` | 当前蓝牙状态 | `Future<TTBluetoothState>` |
| **初始化与重置** | `initLock(params)` | 初始化（添加）锁，返回 lockData | `Future<String>` |
| | `resetLock(lockData)` | 恢复出厂 | `Future<void>` |
| | `resetEkey(lockData)` | 重置所有 eKey | `Future<String>` |
| | `resetLockByCode(lockMac, resetCode)` | 按重置码重置 | `Future<void>` |
| | `verifyLock(lockMac)` | 校验锁连接 | `Future<void>` |
| **控制** | `controlLock(lockData, action)` | 开/关锁 | `Future<ControlLockResult>` |
| | `getLockSwitchState(lockData)` | 当前开关状态 | `Future<TTLockSwitchState>` |
| | `supportFunction(function, lockData)` | 是否支持某功能 | `Future<bool>` |
| **密码** | `createCustomPasscode(...)` | 创建自定义密码 | `Future<void>` |
| | `modifyPasscode(...)` | 修改密码 | `Future<void>` |
| | `deletePasscode(...)` | 删除密码 | `Future<void>` |
| | `resetPasscode(lockData)` | 重置所有密码 | `Future<String>` |
| | `getAdminPasscode(lockData)` | 获取管理员密码 | `Future<String>` |
| | `modifyAdminPasscode(...)` | 修改管理员密码 | `Future<String>` |
| | `getAllValidPasscodes(lockData)` | 所有有效密码 | `Future<List<dynamic>>` |
| | `setErasePasscode(...)` / `recoverPasscode(...)` | 擦除/恢复密码 | `Future<void>` |
| **卡** | `addCard(...)` | 添加卡（过程流） | `Stream<AddCardEvent>` |
| | `modifyCardValidityPeriod(...)` / `deleteCard(...)` | 修改有效期/删除卡 | `Future<void>` |
| | `getAllValidCards(lockData)` / `clearAllCards(lockData)` | 查询/清空卡 | `Future` |
| | `recoverCard(...)` | 恢复卡 | `Future<void>` |
| **指纹** | `addFingerprint(...)` | 添加指纹（过程流） | `Stream<AddFingerprintEvent>` |
| | `modifyFingerprintValidityPeriod(...)` / `deleteFingerprint(...)` | 修改/删除指纹 | `Future<void>` |
| | `getAllValidFingerprints(lockData)` / `clearAllFingerprints(lockData)` | 查询/清空指纹 | `Future` |
| **人脸** | `addFace(...)` | 添加人脸（过程流） | `Stream<AddFaceEvent>` |
| | `addFaceData(...)` | 用人脸特征数据添加 | `Future<String>` |
| | `modifyFace(...)` / `deleteFace(...)` / `clearFace(lockData)` | 修改/删除/清空人脸 | `Future<void>` |
| **时间** | `setLockTime(timestamp, lockData)` | 设置锁时间 | `Future<void>` |
| | `getLockTime(lockData)` | 获取锁时间 | `Future<int>` |
| **记录与系统** | `getLockOperateRecord(type, lockData)` | 操作记录 | `Future<String>` |
| | `getLockPower(lockData)` | 电量 | `Future<int>` |
| | `getLockSystemInfo(lockData)` | 系统信息 | `Future<TTLockSystemModel>` |
| | `getLockFeatureValue(lockData)` | 功能位 | `Future<String>` |
| **自动上锁** | `getAutoLockingPeriodicTime(lockData)` | 自动上锁时长 | `Future<AutoLockingTime>` |
| | `setAutoLockingPeriodicTime(seconds, lockData)` | 设置自动上锁时长 | `Future<void>` |
| **远程开锁开关** | `getRemoteUnlockSwitchState(lockData)` | 远程开锁开关状态 | `Future<bool>` |
| | `setRemoteUnlockSwitchState(isOn, lockData)` | 设置远程开锁开关 | `Future<String>` |
| **配置与方向** | `getLockConfig(config, lockData)` / `setLockConfig(...)` | 锁配置项 | `Future` |
| | `getLockDirection(lockData)` / `setLockDirection(...)` | 锁方向 | `Future` |
| **通行模式** | `addPassageMode(...)` | 添加通行模式 | `Future<void>` |
| | `clearAllPassageModes(lockData)` | 清空通行模式 | `Future<void>` |
| **电梯** | `activateLift(floors, lockData)` | 激活电梯楼层 | `Future<ControlLockResult>` |
| | `setLiftControlable(...)` / `setLiftWorkMode(...)` | 可控制楼层/工作模式 | `Future<void>` |
| **省电与酒店** | `setPowerSaverWorkMode(...)` / `setPowerSaverControlableLock(...)` | 省电模式 | `Future<void>` |
| | `setHotel(...)` / `setHotelCardSector(...)` | 酒店信息/卡扇区 | `Future<void>` |
| **版本** | `getLockVersion(lockMac)` | 锁版本号 | `Future<String>` |
| **WiFi 锁** | `scanWifi(lockData)` | 扫描 WiFi | `Stream<List<dynamic>>` |
| | `configWifi(...)` / `configServer(...)` / `getWifiInfo(lockData)` | 配网/服务器/ WiFi 信息 | `Future` |
| | `configIp(ipSetting, lockData)` / `configCameraLockWifi(...)` | IP/相机锁 WiFi | `Future` |
| **声音与灵敏度** | `setSoundVolume(...)` / `getSoundVolume(lockData)` | 音量 | `Future` |
| | `setSensitivity(value, lockData)` | 灵敏度 | `Future<void>` |
| **锁端配件** | `addRemoteKey(...)` / `deleteRemoteKey(...)` / `clearRemoteKey(...)` | 遥控器增删清 | `Future<void>` |
| | `setRemoteKeyValidDate(...)` | 遥控器有效期 | `Future<void>` |
| | `getRemoteAccessoryElectricQuantity(...)` | 配件电量 | `Future<AccessoryElectricQuantityResult>` |
| | `addDoorSensor(...)` / `deleteDoorSensor(...)` / `setDoorSensorAlertTime(...)` | 门磁 | `Future<void>` |
| **升级** | `setLockEnterUpgradeMode(lockData)` | 进入升级模式 | `Future<void>` |

---

### TTLock.gateway（TTGatewayApi）— 网关

| 接口 | 说明 | 返回 |
|------|------|------|
| `startScan()` | 扫描附近网关 | `Stream<TTGatewayScanModel>` |
| `stopScan()` | 停止扫描 | `Future<void>` |
| `connect(mac)` | 按 MAC 连接网关 | `Future<TTGatewayConnectStatus>` |
| `disconnect(mac)` | 断开网关 | `Future<void>` |
| `getNearbyWifi()` | 通过已连接网关扫描 WiFi | `Stream<List<dynamic>>` |
| `init(params)` | 初始化（添加）网关 | `Future<Map<String, dynamic>>` |
| `configIp(ipSetting)` | 配置网关 IP | `Future<void>` |
| `configApn(mac, apn)` | 配置 APN | `Future<void>` |
| `enterUpgradeMode(mac)` | 进入升级（DFU）模式 | `Future<void>` |

---

### TTLock.accessory（TTAccessoryApi）— 配件

| 分类 | 接口 | 说明 | 返回 |
|------|------|------|------|
| **遥控器** | `startScanRemoteKey()` | 扫描遥控器 | `Stream<TTRemoteAccessoryScanModel>` |
| | `stopScanRemoteKey()` | 停止扫描 | `Future<void>` |
| | `initRemoteKey(mac, lockData)` | 初始化遥控器 | `Future<TTLockSystemModel>` |
| **键盘** | `startScanRemoteKeypad()` | 扫描键盘 | `Stream<TTRemoteAccessoryScanModel>` |
| | `stopScanRemoteKeypad()` | 停止扫描 | `Future<void>` |
| | `initRemoteKeypad(mac, lockMac)` | 初始化普通键盘 | `Future<RemoteKeypadInitResult>` |
| | `initMultifunctionalKeypad(mac, lockData)` | 初始化多功能键盘 | `Future<MultifunctionalKeypadInitResult>` |
| | `getStoredLocks(mac)` | 已存储的锁列表 | `Future<List<dynamic>>` |
| | `deleteStoredLock(mac, slotNumber)` | 删除已存锁 | `Future<void>` |
| | `addKeypadFingerprint(...)` | 通过键盘添加指纹 | `Stream<AddFingerprintEvent>` |
| | `addKeypadCard(...)` | 通过键盘添加卡 | `Stream<AddCardEvent>` |
| **门磁** | `startScanDoorSensor()` | 扫描门磁 | `Stream<TTRemoteAccessoryScanModel>` |
| | `stopScanDoorSensor()` | 停止扫描 | `Future<void>` |
| | `initDoorSensor(mac, lockData)` | 初始化门磁 | `Future<TTLockSystemModel>` |

---

### 约定与扩展

- **Future vs Stream**：单次操作使用 `Future<T>`，完成即返回或抛出 `TTLockException` / `TTGatewayException` / `TTAccessoryException`；扫描、添加卡/指纹/人脸等过程使用 `Stream<T>`，需 `listen` 或 `await for` 处理。
- **测试**：可通过 `TTLock.setImplementations(lockApi: ..., gatewayApi: ..., accessoryApi: ...)` 注入 mock 实现。

## 错误处理

异常类型均继承自 `TTException`（包含 `code` 与 `message`）：

- **`TTLockException`**：锁操作失败，含枚举 `TTLockError`。
- **`TTGatewayException`**：网关操作失败。
- **`TTAccessoryException`**：配件操作失败。

示例：

```dart
try {
  await TTLock.lock.controlLock(lockData, TTControlAction.unlock);
} on TTLockException catch (e) {
  print('${e.error}: ${e.message}');
} on TTGatewayException catch (e) {
  print('网关错误: ${e.error} ${e.message}');
}
```

## 能力检测

在调用具体功能前，可用 `supportFunction` 判断锁是否支持该能力：

```dart
final supported = await TTLock.lock.supportFunction(
  TTLockFunction.managePasscode,
  lockData,
);
if (supported) {
  await TTLock.lock.modifyPasscode(
    passcodeOrigin: '6666',
    passcodeNew: '7777',
    startDate: startDate,
    endDate: endDate,
    lockData: lockData,
  );
} else {
  print('该锁不支持修改密码');
}
```

## 示例工程

仓库中 `example/` 为完整示例，包含锁/网关扫描、锁控制、网关初始化等，可直接运行参考。

## 联系方式

开发者邮箱：ttlock-developers-email-list@googlegroups.com
