# ttlock_flutter

`ttlock_flutter` 是对外聚合包，采用 Federated Plugin 结构。

## 包结构

- `../ttlock_flutter/`：对外 Dart API（`TTLock` 门面）
- `../ttlock_flutter_platform_interface/`：Pigeon 契约与生成代码
- `../ttlock_flutter_android/`：Android 实现
- `../ttlock_flutter_ios/`：iOS 实现
- `../ttlock_flutter_ohos/`：占位（本阶段未接入）

## 使用

```yaml
dependencies:
  ttlock_flutter:
    path: ../ttlock_flutter
```

```dart
import 'package:ttlock_flutter/ttlock.dart';
```

## 本阶段范围

- 已完成：Android / iOS + Pigeon 联邦化
- 未完成：OHOS（`ttlock_flutter_ohos` 暂未接线，不在 umbrella 默认聚合）

## 示例

```bash
cd example
fvm flutter pub get
fvm flutter run
```
