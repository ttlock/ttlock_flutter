# 设计：addFaceUrl / setAlias（iOS SDK 增量）

日期：2026-07-27  
状态：已批准（等待实现计划）

## 背景

iOS TTLock SDK 新增：

- `+[TTLock addFaceUrl:cyclicConfig:startDate:endDate:lockData:success:failure:]` — 通过图片 URL 添加人脸
- `+[TTLock setAliasWithType:credentialId:alias:lockData:success:failure:]` — 为凭证设置别名
- 能力位增量：`YiNuoPhotoFace(112)`、`UrlFace(124)`、`HumanPresenceSensor(128)` 等

`ttlock_flutter` 需按契约优先流程接入；Android / OHOS 原生 SDK 暂未对齐，对应方法返回 `NOT_IMPLEMENTED`。本次不改 example 应用。

## 目标

1. 在 Pigeon 契约中暴露 `addFaceUrl`、`setAlias` 与相关枚举/能力位。
2. Dart 聚合层提供 `TTLock.lock.addFaceUrl` / `setAlias`。
3. iOS 完整实现；Android / OHOS 对新 HostApi 返回 `NOT_IMPLEMENTED`。
4. `TTLockFunction` 对照 iOS `TTLockFeatureValue` 做增量补缺，并修复已有 `supportSetAlias` 在 iOS EnumConverter 中映射为 `nil` 的问题。

## 非目标

- example 演示页 / UI
- classic（`ttlock_classic.dart`）回调包装
- Android / OHOS 真实 SDK 对接
- 重构既有命名（如 `supportSetAlias`、`supportSupervision`）

## 方案选择

采用 **one-shot HostApi**（对齐现有 `addFaceData`），不走 EventChannel：

| 方案 | 说明 | 结论 |
|------|------|------|
| HostApi one-shot（选用） | 与 SDK success/failure 语义一致 | ✅ |
| EventChannel | SDK 无进度回调，过度设计 | ❌ |
| 三端全 stub | 浪费已可用的 iOS SDK | ❌ |

## 契约变更（`pigeons/messages.dart`）

### 新增枚举 `TTAliasType`

对应 iOS `TTAliasType`：

| Case | SDK raw |
|------|---------|
| `fingerprint` | `0x01` |
| `card` | `0x02` |
| `wirelessKeyFob` | `0x03` |
| `face` | `0x04` |
| `palmVein` | `0x05` |
| `passcode` | `0x06` |
| `qrCode` | `0x07` |

### `TTLockHostApi` 新增方法

放在 `addFaceData` 附近：

```dart
/// 通过图片 URL 添加人脸。返回人脸编号。
@async
String addFaceUrl(
  String url,
  List<TTCycleModel>? cycleList,
  int startDate,
  int endDate,
  String lockData,
);

/// 为凭证设置别名。
@async
void setAlias(
  TTAliasType type,
  String credentialId,
  String alias,
  String lockData,
);
```

### `TTLockFunction` 增量

对照当前枚举末尾与 iOS `TTLockFeatureValue`，**仅追加缺失项**（保持既有 case 顺序与命名不变）：

| 新增 case | SDK |
|-----------|-----|
| `yiNuoPhotoFace` | `TTLockFeatureValueYiNuoPhotoFace = 112` |
| `urlFace` | `TTLockFeatureValueUrlFace = 124` |
| `humanPresenceSensor` | `TTLockFeatureValueHumanPresenceSensor = 128` |

已存在、无需新增：`supportSetAlias(114)`、`hideWifiCatOneSleepModeSetting(117)`、`semiAutomaticModeControl(119)`、`supportSetUserAttributes(120)`、`supportSupervision`（iOS 现映射 `proofCapture=126`）。

生成产物须同提交：`messages.g.dart`、`Messages.kt`、`Messages.swift`、`Messages.ets`。

## Dart 聚合层

`ttlock_flutter/lib/src/tt_lock_api.dart`：

- `Future<String> addFaceUrl(...)` → `runLockApi(() => _host.addFaceUrl(...))`
- `Future<void> setAlias(...)` → `runLockApi(() => _host.setAlias(...))`

参数校验：`lockData` / `url` / `credentialId` 非空（与现有 API 风格一致）。

## 平台实现

### iOS（完整）

- `LockHostApiImpl.addFaceUrl` → `TTLock.addFaceUrl(...)`，success 回传 `faceNumber`
- `LockHostApiImpl.setAlias` → `TTLock.setAliasWithType(...)`
- `EnumConverter`：
  - `aliasTypeConvert(TTAliasType) → TTAliasType`（SDK）
  - `lockFunctionConvert`：
    - `supportSetAlias`：**从 `nil` 改为** `.setAlias`
    - `yiNuoPhotoFace` → `.yiNuoPhotoFace`
    - `urlFace` → `.urlFace`
    - `humanPresenceSensor` → `.humanPresenceSensor`

### Android / OHOS（桩）

- `addFaceUrl` / `setAlias`：`FlutterError(code: "NOT_IMPLEMENTED", ...)`
- `EnumConverter`：新 `TTLockFunction` 有对应 SDK 常量则映射，否则 `null`/`undefined`（`supportFunction` → false）

## 错误处理

沿用现有 `runLockApi` / 原生 `lockErrorToFlutterError`（iOS）路径；`NOT_IMPLEMENTED` 经 `PlatformException` 透出，由调用方处理。

## 测试

- 契约生成后三端编译可通过（Android/OHOS 桩方法签名匹配生成接口）
- 无强制单测（与同仓库同类 HostApi 增量一致）；可选：Dart 层 mock HostApi 冒烟

## 验收标准

1. Pigeon 生成成功，四端生成文件与 `messages.dart` 同步。
2. iOS 可调用 `addFaceUrl` / `setAlias` 并正确映射错误与能力位。
3. Android / OHOS 调用上述两方法得到 `NOT_IMPLEMENTED`。
4. `supportFunction(TTLockFunction.urlFace | yiNuoPhotoFace | humanPresenceSensor | supportSetAlias, ...)` 在 iOS 上能查到对应 feature。
5. example 无改动。
