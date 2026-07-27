# addFaceUrl / setAlias Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 接入 iOS SDK 的 `addFaceUrl` / `setAlias`，增量补齐 `TTLockFunction`，Android/OHOS 对新 API 返回 `NOT_IMPLEMENTED`。

**Architecture:** 契约优先：先改 `pigeons/messages.dart` 并跑 Pigeon，再实现 Dart 聚合层与 iOS 原生；Android/OHOS 仅补桩方法与 EnumConverter exhaustive case。

**Tech Stack:** Flutter/Dart (FVM)、Pigeon（OHOS fork）、Kotlin、Swift、ArkTS

**Spec:** `docs/superpowers/specs/2026-07-27-add-face-url-set-alias-design.md`

## Global Constraints

- 使用 `fvm flutter` / `fvm dart`（SDK：`custom_3.27.5-ohos-1.0.4`）
- 禁止手写 MethodChannel；所有跨端变更必须经 `pigeons/messages.dart`
- `messages.dart` 与生成文件（`messages.g.dart`、`Messages.kt`、`Messages.swift`、`Messages.ets`）必须同提交
- Android（`ttlock_flutter_android`）与 iOS（`ttlock_flutter_ios`）是 git submodule：先在子模块内 commit，再更新主仓指针
- 不改 example；不改 `ttlock_classic.dart`
- Android/OHOS 新 HostApi：`FlutterError("NOT_IMPLEMENTED", ...)`

## File map

| File | Responsibility |
|------|----------------|
| `ttlock_flutter_platform_interface/pigeons/messages.dart` | 契约：`TTAliasType`、`TTLockFunction` 增量、`addFaceUrl`/`setAlias` |
| `ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart` | Pigeon 生成 |
| `ttlock_flutter_android/.../Messages.kt` | Pigeon 生成 |
| `ttlock_flutter_ios/ios/Classes/Messages.swift` | Pigeon 生成 |
| `ttlock_flutter_ohos/.../Messages.ets` | Pigeon 生成 |
| `ttlock_flutter/lib/src/tt_lock_api.dart` | Dart API 封装 |
| `ttlock_flutter_ios/.../LockHostApiImpl.swift` | iOS SDK 调用 |
| `ttlock_flutter_ios/.../EnumConverter.swift` | `aliasTypeConvert` + feature 映射 |
| `ttlock_flutter_android/.../LockApi.kt` | NOT_IMPLEMENTED 桩 |
| `ttlock_flutter_android/.../EnumConverter.kt` | 新 function case |
| `ttlock_flutter_ohos/.../LockHostApiImpl.ets` | NOT_IMPLEMENTED 桩 |
| `ttlock_flutter_ohos/.../EnumConverter.ets` | 新 function case |

---

### Task 1: Pigeon 契约 + 代码生成

**Files:**
- Modify: `ttlock_flutter_platform_interface/pigeons/messages.dart`
- Generate: `lib/pigeon/messages.g.dart`、`ttlock_flutter_android/.../Messages.kt`、`ttlock_flutter_ios/.../Messages.swift`、`ttlock_flutter_ohos/.../Messages.ets`

**Interfaces:**
- Produces:
  - `enum TTAliasType { fingerprint, card, wirelessKeyFob, face, palmVein, passcode, qrCode }`
  - `TTLockFunction.yiNuoPhotoFace` / `urlFace` / `humanPresenceSensor`
  - `Future<String> TTLockHostApi.addFaceUrl(String url, List<TTCycleModel>? cycleList, int startDate, int endDate, String lockData)`
  - `Future<void> TTLockHostApi.setAlias(TTAliasType type, String credentialId, String alias, String lockData)`

- [ ] **Step 1: 在 Enums 区新增 `TTAliasType`**

在 `enum TTLockFunction` **之前**插入（保持 Data Models → Enums 顺序；别名类型与锁能力位相邻便于查阅）：

```dart
/// 凭证别名类型（对应 iOS `TTAliasType`）。
enum TTAliasType {
  /// 指纹。
  fingerprint,

  /// IC 卡。
  card,

  /// 无线钥匙。
  wirelessKeyFob,

  /// 人脸。
  face,

  /// 掌静脉。
  palmVein,

  /// 密码。
  passcode,

  /// 二维码。
  qrCode,
}
```

- [ ] **Step 2: 扩展 `TTLockFunction` 末尾**

在 `supportSupervision,` 之后、`}` 之前追加：

```dart
  /// 易诺拍照人脸。
  yiNuoPhotoFace,

  /// 通过 URL 添加人脸。
  urlFace,

  /// 人体存在传感器。
  humanPresenceSensor,
```

- [ ] **Step 3: 在 `TTLockHostApi` 的 `addFaceData` 之后增加两个方法**

紧挨现有：

```dart
  @async
  String addFaceData(List<TTCycleModel>? cycleList, int startDate, int endDate, String faceFeatureData, String lockData);
```

其后插入：

```dart
  /// 通过图片 URL 添加人脸。
  ///
  /// 返回人脸编号。
  ///
  /// [url] 人脸图片 URL。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳；永久钥匙传 0。
  /// [endDate] 有效期结束时间，毫秒时间戳；永久钥匙传 0。
  /// [lockData] 锁凭证。
  @async
  String addFaceUrl(
    String url,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  /// 为凭证设置别名。
  ///
  /// [type] 别名类型（指纹/卡/人脸等）。
  /// [credentialId] 凭证标识（人脸编号、卡号、密码等）。
  /// [alias] 别名字符串。
  /// [lockData] 锁凭证。
  @async
  void setAlias(
    TTAliasType type,
    String credentialId,
    String alias,
    String lockData,
  );
```

- [ ] **Step 4: 运行 Pigeon 生成**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_platform_interface
fvm dart run pigeon --input pigeons/messages.dart
```

Expected: 退出码 0；上述四个生成文件更新；生成接口含 `addFaceUrl` / `setAlias` / `TTAliasType`。

- [ ] **Step 5: 确认生成产物含新符号**

```bash
rg -n "addFaceUrl|setAlias|TTAliasType|yiNuoPhotoFace|urlFace|humanPresenceSensor" \
  lib/pigeon/messages.g.dart \
  ../ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt \
  ../ttlock_flutter_ios/ios/Classes/Messages.swift \
  ../ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/Messages.ets
```

Expected: 四端均有匹配。

- [ ] **Step 6: Commit（主仓 + 两子模块生成文件）**

在 **android 子模块**：

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_android
git add android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt
git commit -m "$(cat <<'EOF'
chore: regenerate Pigeon Messages for addFaceUrl/setAlias

EOF
)"
```

在 **ios 子模块**：

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_ios
git add ios/Classes/Messages.swift
git commit -m "$(cat <<'EOF'
chore: regenerate Pigeon Messages for addFaceUrl/setAlias

EOF
)"
```

在 **主仓**：

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter
git add ttlock_flutter_platform_interface/pigeons/messages.dart \
  ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart \
  ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/Messages.ets \
  ttlock_flutter_android ttlock_flutter_ios
git commit -m "$(cat <<'EOF'
feat(contract): add addFaceUrl, setAlias, and TTLockFunction increments

EOF
)"
```

---

### Task 2: Dart 聚合层 `TTLockApi`

**Files:**
- Modify: `ttlock_flutter/lib/src/tt_lock_api.dart`（在 `addFaceData` 之后）

**Interfaces:**
- Consumes: Task 1 生成的 `TTLockHostApi.addFaceUrl` / `setAlias`、`TTAliasType`
- Produces:
  - `Future<String> addFaceUrl(String url, {List<TTCycleModel>? cycleList, required int startDate, required int endDate, required String lockData})`
  - `Future<void> setAlias({required TTAliasType type, required String credentialId, required String alias, required String lockData})`

- [ ] **Step 1: 在 `addFaceData` 后添加方法**

```dart
  Future<String> addFaceUrl(
    String url, {
    List<pigeon.TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) {
    if (url.isEmpty) {
      throw ArgumentError.value(url, 'url', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(
      () => _host.addFaceUrl(url, cycleList, startDate, endDate, lockData),
    );
  }

  Future<void> setAlias({
    required pigeon.TTAliasType type,
    required String credentialId,
    required String alias,
    required String lockData,
  }) {
    if (credentialId.isEmpty) {
      throw ArgumentError.value(credentialId, 'credentialId', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(
      () => _host.setAlias(type, credentialId, alias, lockData),
    );
  }
```

说明：`TTAliasType` / `AddFaceEvent` 等已通过 `ttlock.dart` 对 `messages.g.dart` 的 export 对外可见，无需额外 export。`addFaceData` 现为位置参数风格；`addFaceUrl` 对 `url` 用位置参数、其余用命名参数，便于调用方读写。若希望与 `addFaceData` 完全同形，可改为全位置参数——以与 `addFaceData` 一致为准：

**最终以与 `addFaceData` 同形为准（全位置参数）：**

```dart
  Future<String> addFaceUrl(
    String url,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) {
    if (url.isEmpty) {
      throw ArgumentError.value(url, 'url', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(
      () => _host.addFaceUrl(url, cycleList, startDate, endDate, lockData),
    );
  }

  Future<void> setAlias(
    pigeon.TTAliasType type,
    String credentialId,
    String alias,
    String lockData,
  ) {
    if (credentialId.isEmpty) {
      throw ArgumentError.value(credentialId, 'credentialId', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(
      () => _host.setAlias(type, credentialId, alias, lockData),
    );
  }
```

- [ ] **Step 2: 分析**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter
fvm flutter analyze lib/src/tt_lock_api.dart
```

Expected: No issues（或仅既有无关告警）。

- [ ] **Step 3: Commit**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter
git add ttlock_flutter/lib/src/tt_lock_api.dart
git commit -m "$(cat <<'EOF'
feat(dart): expose addFaceUrl and setAlias on TTLockApi

EOF
)"
```

---

### Task 3: iOS 实现

**Files:**
- Modify: `ttlock_flutter_ios/ios/Classes/EnumConverter.swift`
- Modify: `ttlock_flutter_ios/ios/Classes/LockHostApiImpl.swift`

**Interfaces:**
- Consumes: Pigeon `TTAliasType`、`addFaceUrl`/`setAlias` 协议方法
- Produces: `aliasTypeConvert(_:)`；`featureValueConvert` 补全映射

- [ ] **Step 1: 在 `EnumConverter.swift` 增加 `aliasTypeConvert`**

注意：Pigeon 与 SDK 同名 `TTAliasType`，SDK 侧必须用模块前缀（与 `TTLockSDK.TTError` 同模式）：

```swift
func aliasTypeConvert(_ type: TTAliasType) -> TTLockSDK.TTAliasType {
  switch type {
  case .fingerprint:
    return .fingerprint
  case .card:
    return .card
  case .wirelessKeyFob:
    return .wirelessKeyFob
  case .face:
    return .face
  case .palmVein:
    return .palmVein
  case .passcode:
    return .passcode
  case .qrCode:
    return .qrCode
  }
}
```

若 SDK Swift 名与上述不一致（例如仍带前缀），以 Xcode/`TTMacros.h` 导入后实际 case 名为准；rawValue 对照：`0x01…0x07`。

- [ ] **Step 2: 更新 `featureValueConvert`**

将：

```swift
  case .supportSetAlias:
    return nil
```

改为：

```swift
  case .supportSetAlias:
    return TTLockFeatureValue.setAlias
```

并在 `switch` 末尾（`supportSupervision` 之后）增加：

```swift
  case .yiNuoPhotoFace:
    return TTLockFeatureValue.yiNuoPhotoFace
  case .urlFace:
    return TTLockFeatureValue.urlFace
  case .humanPresenceSensor:
    return TTLockFeatureValue.humanPresenceSensor
```

（Swift 枚举 case 名以 Pod 头文件桥接结果为准；若为 `.yiNuoPhotoFace` / `TTLockFeatureValueYiNuoPhotoFace` 等，按编译器提示调整。）

- [ ] **Step 3: 在 `LockHostApiImpl.swift` 的 `addFaceData` 后实现两方法**

对齐现有 `addFaceData` 写法：

```swift
  func addFaceUrl(
    url: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    TTLock.addFaceUrl(
      url, cyclicConfig: cycleList?.map { $0.toMap() } ?? [], startDate: startDate,
      endDate: endDate, lockData: lockData
    ) { faceNumber in
      completion(.success(faceNumber ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "addFaceUrl", error: errorCode, message: errorMsg)))
    }
  }

  func setAlias(
    type: TTAliasType, credentialId: String, alias: String, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setAliasWith(
      aliasTypeConvert(type), credentialId: credentialId, alias: alias, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setAlias", error: errorCode, message: errorMsg)))
    }
  }
```

说明：ObjC `setAliasWithType:credentialId:...` 在 Swift 中可能显示为 `setAliasWith(_:credentialId:alias:lockData:success:failure:)` 或 `setAlias(withType:...)`——以实际自动补全为准；`addFaceUrl` 的 `cyclicConfig` 若 SDK 要求非 optional，空周期用 `[]`（与头文件注释一致）。

- [ ] **Step 4: Commit（ios 子模块 + 主仓指针）**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_ios
git add ios/Classes/EnumConverter.swift ios/Classes/LockHostApiImpl.swift
git commit -m "$(cat <<'EOF'
feat(ios): implement addFaceUrl and setAlias

EOF
)"

cd /Users/chuyi/StudioProjects/ttlock_flutter
git add ttlock_flutter_ios
git commit -m "$(cat <<'EOF'
chore: bump ios submodule for addFaceUrl/setAlias

EOF
)"
```

---

### Task 4: Android 桩 + EnumConverter

**Files:**
- Modify: `ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/LockApi.kt`
- Modify: `ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/EnumConverter.kt`

**Interfaces:**
- Consumes: 生成的 `TTLockHostApi.addFaceUrl` / `setAlias`
- Produces: NOT_IMPLEMENTED 回调；`lockFunctionConvert` exhaustive

- [ ] **Step 1: 在 `LockApi.kt` 的 `addFaceData` 后增加桩**

对齐 `AccessoryApi.getStoredLocks` 风格：

```kotlin
    override fun addFaceUrl(
        url: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<String>) -> Unit
    ) {
        callback(
            Result.failure(
                FlutterError("NOT_IMPLEMENTED", "addFaceUrl is not implemented", null)
            )
        )
    }

    override fun setAlias(
        type: TTAliasType,
        credentialId: String,
        alias: String,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        callback(
            Result.failure(
                FlutterError("NOT_IMPLEMENTED", "setAlias is not implemented", null)
            )
        )
    }
```

- [ ] **Step 2: 更新 `EnumConverter.kt` 的 `when`**

在现有 `TTLockFunction.SUPPORT_SUPERVISION -> ...` 分支后追加（Android SDK 若无对应常量则返回 `null`）：

```kotlin
        TTLockFunction.YI_NUO_PHOTO_FACE -> null
        TTLockFunction.URL_FACE -> null
        TTLockFunction.HUMAN_PRESENCE_SENSOR -> null
```

若 Android `FeatureValue` 已有同名常量，优先映射；否则保持 `null`（`supportFunction` → false）。

- [ ] **Step 3: Commit（android 子模块 + 主仓指针）**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_android
git add android/src/main/kotlin/com/ttlock/ttlock_flutter/LockApi.kt \
  android/src/main/kotlin/com/ttlock/ttlock_flutter/EnumConverter.kt
git commit -m "$(cat <<'EOF'
feat(android): stub addFaceUrl/setAlias as NOT_IMPLEMENTED

EOF
)"

cd /Users/chuyi/StudioProjects/ttlock_flutter
git add ttlock_flutter_android
git commit -m "$(cat <<'EOF'
chore: bump android submodule for addFaceUrl/setAlias stubs

EOF
)"
```

---

### Task 5: OHOS 桩 + EnumConverter

**Files:**
- Modify: `ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/LockHostApiImpl.ets`
- Modify: `ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/EnumConverter.ets`

**Interfaces:**
- Consumes: 生成的 HostApi 方法、`makeNotImplementedError`
- Produces: 桩实现；exhaustive `lockFunctionConvert`

- [ ] **Step 1: 在 `LockHostApiImpl.ets` 的 `addFaceData` 后增加桩**

```arkts
  addFaceUrl(url: string, cycleList: Array<TTCycleModel>, startDate: number, endDate: number,
    lockData: string, result: Result<string>): void {
    result.error(makeNotImplementedError('addFaceUrl'));
  }

  setAlias(type: TTAliasType, credentialId: string, alias: string, lockData: string,
    result: Result<void>): void {
    result.error(makeNotImplementedError('setAlias'));
  }
```

（参数是否可空以生成的 `Messages.ets` 签名为准，保持一致。）

- [ ] **Step 2: 更新 `EnumConverter.ets`**

在现有返回 `null` 的多 case 列表中追加：

```arkts
    case TTLockFunction.YI_NUO_PHOTO_FACE:
    case TTLockFunction.URL_FACE:
    case TTLockFunction.HUMAN_PRESENCE_SENSOR:
```

放在 `case TTLockFunction.SUPPORT_SUPERVISION:` 同一组（继续 `return null;`）。

- [ ] **Step 3: Commit（主仓，OHOS 非 submodule）**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter
git add ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/LockHostApiImpl.ets \
  ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/EnumConverter.ets
git commit -m "$(cat <<'EOF'
feat(ohos): stub addFaceUrl/setAlias as NOT_IMPLEMENTED

EOF
)"
```

---

### Task 6: 静态校验与验收

**Files:** 无新文件；验证 Tasks 1–5

- [ ] **Step 1: 分析 Dart 包**

```bash
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter_platform_interface && fvm flutter analyze
cd /Users/chuyi/StudioProjects/ttlock_flutter/ttlock_flutter && fvm flutter analyze
```

Expected: 无新增 error。

- [ ] **Step 2: 对照验收清单**

| # | 标准 | 如何确认 |
|---|------|----------|
| 1 | 四端生成文件与契约同步 | `rg addFaceUrl` 四端命中 |
| 2 | iOS 实现真实 SDK 调用 | `LockHostApiImpl` 含 `TTLock.addFaceUrl` / `setAlias` |
| 3 | Android/OHOS 为 NOT_IMPLEMENTED | 对应桩存在 |
| 4 | iOS feature 映射含 setAlias / 三新 case | `EnumConverter.swift` |
| 5 | example 未改 | `git diff` 不含 `ttlock_flutter/example`（本 plan 相关 commit） |

- [ ] **Step 3: 若有遗漏，立即修补并单独 commit；无遗漏则结束**

---

## Spec coverage (self-review)

| Spec 要求 | Task |
|-----------|------|
| `TTAliasType` | Task 1 |
| `addFaceUrl` / `setAlias` HostApi | Task 1 |
| `TTLockFunction` 增量三项 | Task 1 |
| Pigeon 四端生成同提交 | Task 1 |
| Dart `TTLockApi` + 非空校验 | Task 2 |
| iOS 实现 + `supportSetAlias` 修复 | Task 3 |
| Android NOT_IMPLEMENTED | Task 4 |
| OHOS NOT_IMPLEMENTED | Task 5 |
| 不改 example / classic | Global Constraints + Task 6 |
| 验收 | Task 6 |

无 placeholder；方法签名与 spec 一致；`addFaceUrl` Dart 层采用与 `addFaceData` 相同的位置参数风格。
