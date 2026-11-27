# ttlock_flutter

`ttlock_flutter` 是对外聚合包，采用 Federated Plugin 结构。

## 包结构

- `../ttlock_flutter/`：对外 Dart API（`TTLock` 门面）
- `../ttlock_flutter_platform_interface/`：Pigeon 契约与生成代码
- `../ttlock_flutter_android/`：Android 实现
- `../ttlock_flutter_ios/`：iOS 实现
- `../ttlock_flutter_ohos/`：OHOS 实现

## 使用

```yaml
dependencies:
  ttlock_flutter:
    git:
      url: https://github.com/ttlock/ttlock_flutter.git
      path: ttlock_flutter
      ref: mix
```

```dart
import 'package:ttlock_flutter/ttlock.dart';

// 锁 / 网关 / 配件 / 表计
await TTLock.lock.controlLock(lockData, TTControlAction.unlock);

// 固件升级（进度流；包升级示例）
TTLock.upgrade.upgradeLockByPackage(
  lockMac: lockMac,
  lockData: lockData,
  firmwarePackage: firmwarePackage,
).listen((event) { /* TTUpgradeEvent */ });
```

入口一览：`TTLock.lock` / `gateway` / `remoteKey` / `remoteKeypad` / `doorSensor` / `electricMeter` / `waterMeter` / **`upgrade`**。能力与约定见仓库根 [README_ZH](../README_ZH.md)。

## 本阶段范围

- 已完成：Android / iOS / OHOS + Pigeon 联邦化
- 三端 API 差异（含升级）：[PLATFORM_API_ZH.md](../PLATFORM_API_ZH.md)

## 示例

示例应用在包内 `example/`（开放平台 Demo，包名 `ttlock_flutter_demo`），随本仓库维护，非独立发布：

```bash
cd example
fvm flutter pub get
fvm flutter run
```
