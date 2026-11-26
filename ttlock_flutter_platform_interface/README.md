# ttlock_flutter_platform_interface

Pigeon 契约层：维护 `pigeons/messages.dart`，并生成 Dart / Android / iOS 三端代码。

## 生成命令

```bash
fvm dart run pigeon --input pigeons/messages.dart
```

或执行脚本：

```bash
./tool/generate_pigeon.sh
```

## CI 校验

```bash
./tool/verify_codegen.sh
```

该脚本会重新生成并检查以下文件是否有未提交差异：

- `lib/pigeon/messages.g.dart`
- `../ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt`
- `../ttlock_flutter_ios/ios/Classes/Messages.swift`

## 说明

- `dartPackageName` 固定为 `ttlock_flutter`，保持通道名前缀兼容。
- 本阶段不生成 OHOS `arkTSOut`（OHOS 侧手工维护对齐的 Messages）。
- 固件升级契约：`TTUpgradeHostApi`（`setUpgrade*Param`）+ `TTEventChannelApi` 下 `upgradeLock` / `upgradeLockByPackage` / `upgradeGateway` / `upgradeGatewayByPackage` / `upgradeWaterMeter` / `upgradeWaterMeterByPackage` / `upgradeElectricMeter` / `upgradeElectricMeterByPackage` / `upgradeKeypad` / `upgradeKeypadByPackage`；事件模型为 `TTUpgradeEvent`（`TTUpgradePhase` / `TTUpgradeStatus`），错误码为 `TTLockUpgradeError`。
