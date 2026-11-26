# ttlock_flutter_ohos

[`ttlock_flutter`](https://github.com/ttlock/ttlock_flutter) 联邦插件的 **OpenHarmony（OHOS）平台实现**。宿主 App 通常只依赖 **`ttlock_flutter`**，由它在 OHOS 上选用本包。

## 在技术栈中的位置

```text
App  →  ttlock_flutter（Dart API）
     →  ttlock_flutter_platform_interface（Pigeon）
     →  ttlock_flutter_ohos（本包）  →  TTLock OHOS SDK
```

对外 Dart API 在父插件（`package:ttlock_flutter/ttlock.dart`）。

## 固件升级

升级等模块在 OHOS 上的可用范围见父仓库 [PLATFORM_API_ZH.md](../PLATFORM_API_ZH.md)。

## 通过父插件接入

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
```

权限与 OHOS 接入步骤见父仓库 README。
