# 开发规范与流程（契约优先）

本文档约束 **人类开发者** 与 **AI 助手** 在 `ttlock_flutter` 联邦仓库中的协作方式，目标与 [`architecture.md`](./architecture.md) 一致：**单一契约源、强类型跨端通信、枚举与原生 SDK 显式对齐**。

---

## 1. 适用范围与阅读顺序

| 顺序 | 文档 / 位置 | 用途 |
|------|----------------|------|
| 1 | [`architecture.md`](./architecture.md) | 分层职责、调用链、模块拆分 |
| 2 | 本文档 | 日常改动的步骤、门禁清单、枚举与接口约定 |
| 3 | `ttlock_flutter_platform_interface/pigeons/messages.dart` 文件头注释 | Pigeon 生成命令 |

---

## 2. 强制规则（不可跳过）

### 2.1 新增 / 变更跨端接口：必须先改 Pigeon 契约

**所有** Flutter ↔ 原生的 HostApi、EventChannel 流类型、以及跨端传递的数据模型，**必须**在以下文件中定义或修改：

`ttlock_flutter_platform_interface/pigeons/messages.dart`

标准顺序（与 Pigeon 解析习惯及现有代码结构一致）：

1. **数据模型**：在 `// Data Models` 区域新增 `class`（字段类型仅使用 Pigeon 支持的类型；复杂结构可拆多个 class 或谨慎使用 `Map`）。
2. **枚举**：在 `// Enums` 区域新增 `enum`（见 [§3](#3-枚举-enum-规范与原生映射)）。
3. **接口**：在对应 `@HostApi()` 抽象类或 `@EventChannelApi()` 中增加方法 / 流；**禁止**在未更新 `messages.dart` 的情况下在 Android/iOS 手写新的 MethodChannel 字符串协议。

`@ConfigurePigeon` 已配置输出路径，生成会覆盖：

- `ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart`
- `ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt`
- `ttlock_flutter_ios/ios/Classes/Messages.swift`

### 2.2 枚举：必须实现与原生 SDK 的双向映射

凡在 `messages.dart` 中声明、且会传入 / 传出原生 TTLock SDK 的 **业务枚举**（非仅 Dart 内部使用），**必须**同时满足：

| 平台 | 文件 | 要求 |
|------|------|------|
| iOS | `ttlock_flutter_ios/ios/Classes/EnumConverter.swift` | 提供 **Pigeon → SDK** 的转换函数（如现有 `xxxConvert`），以及在回调 / 返回值中需要的 **SDK → Pigeon** 函数（如现有 `xxxRevert`） |
| Android | `ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/EnumConverter.kt` | 同上：`xxxConvert` / `xxxRevert`（或与现有命名风格一致的 `when` 映射） |

说明：

- **仅 Flutter 使用、永不进原生 SDK** 的枚举仍建议在契约层定义，但若确定无原生类型可对齐，须在 PR 中注明理由；默认仍按「需要原生映射」处理。
- Android 侧部分 SDK 使用 `Int` 常量而非 enum，现有代码用 `xxxConvert` 返回 `Int`、用 `xxxRevert` 从 SDK 类型还原为 Pigeon enum，**新增枚举须遵循同一模式**，避免在 `LockApi.kt` / `LockHostApiImpl.swift` 内散落 magic number。
- iOS 若 SDK 枚举含 `default` 未覆盖 case，须有安全回落（参考现有 `lockSwitchStateRevert`、`soundVolumeRevert` 的 `default` 分支）。

---

## 3. 枚举（enum）规范与原生映射

### 3.1 Dart（Pigeon 源文件）命名约定

- 与现有代码一致：类型名 **`TT` 前缀** + PascalCase case（如 `TTLockConfig.audio`）。
- case 名使用 **lowerCamelCase**，语义与原生 SDK 文档或现有 `TTLock` / `TTGateway` 概念对齐，避免缩写不一致导致双端理解偏差。
- 新增 case 属于 **破坏性变更** 时（影响序列化序号）：须评估旧客户端；必要时采用新 enum 或版本字段，并在 CHANGELOG 说明。

### 3.2 原生转换函数约定（与现有一致）

- **入参（Flutter → Native）**：`func <语义>Convert(_ value: PigeonEnum) -> SdkEnum`（Swift） / `fun <语义>Convert(value: PigeonEnum): SdkType`（Kotlin）。
- **出参（Native → Flutter）**：`func <语义>Revert(_ value: SdkEnum) -> PigeonEnum`（Swift） / `fun <语义>Revert(...): PigeonEnum`（Kotlin）。
- 在 `LockHostApiImpl.swift`、`GatewayHostApiImpl.swift`、`AccessoryHostApiImpl.swift` 及对应 `*Api.kt` 中 **只调用** `EnumConverter`（或极少数内联且须在评审中说明），避免在业务实现文件里重复 `switch`。

### 3.3 映射完整性自检清单

- [ ] Dart enum 每个 case 在 iOS `EnumConverter.swift` 中有明确分支（或 documented `default`）。
- [ ] Dart enum 每个 case 在 Android `EnumConverter.kt` 中有明确分支。
- [ ] 若 SDK 新增原生值：优先扩展 Pigeon enum + 双端映射；无法扩展时在 `Revert` 中落到明确的「未知 / 失败」case，禁止静默返回错误语义。

---

## 4. 标准开发流程（推荐逐步执行）

### 4.1 契约与生成

1. 编辑 `pigeons/messages.dart`（模型 → 枚举 → HostApi / EventChannelApi）。
2. 在 **`ttlock_flutter_platform_interface` 根目录**执行：

   ```bash
   fvm dart run pigeon --input pigeons/messages.dart
   ```

3. 提交生成物：`messages.g.dart`、`Messages.kt`、`Messages.swift` 与 `messages.dart` **同一次变更**提交，避免 CI 与本地不一致。

### 4.2 原生实现

1. **Android**：在对应 `*Api.kt` 中实现生成接口；错误码与枚举一律经 `EnumConverter.kt`。
2. **iOS**：在对应 `*HostApiImpl.swift` 中实现；枚举经 `EnumConverter.swift`。
3. 若新增 **EventChannel**：遵守 `messages.dart` 内注释——**同一输入文件仅一个 `@EventChannelApi()`**，新流通过增加无参 stream 方法扩展 `TTEventChannelApi`；上下文仍通过既有 `setEventLockData` / `setEventGatewayMac` / `setEventKeypadMac` 等 HostApi 设置。

### 4.3 Dart 业务门面

1. 在 `ttlock_flutter/lib/src/` 下对应 `*_api.dart` 封装 HostApi（异常映射参考现有 `runLockApi` / `pigeon_errors.dart`）。
2. 对外入口、导出与 `example` 演示按需增量更新。

### 4.4 验证

1. `fvm flutter analyze`（根与各 package 视改动范围）。
2. 运行 `example` 覆盖新接口或关键路径。
3. 若涉及仅 iOS 或仅 Android 的 SDK 差异，在 PR 描述中写明平台行为差异。

---

## 5. AI 助手使用说明（便于复制到 Cursor 规则）

在委托 AI 实现新能力时，**必须在提示词中要求**：

1. 所有新类型与接口写在 `ttlock_flutter_platform_interface/pigeons/messages.dart`，并执行 Pigeon 生成。
2. 每个跨端业务 enum 在 `EnumConverter.swift` 与 `EnumConverter.kt` 中补齐 **Convert + Revert**（或项目内等价命名），且不在实现类中硬编码 SDK 常量替代映射表。

AI 交付时应包含：**契约 diff、生成文件、双端 EnumConverter、HostApi 实现、（如有）ttlock_flutter 封装与 example**。

---

## 6. 与架构文档的关系

| 主题 | 详见 |
|------|------|
| 分层、事件流设计、演进策略 | [`architecture.md`](./architecture.md) §2–§7 |
| 本仓库与 `ttlock_flutter_premise` 等变体对比 | [`compare-with-ttlock_flutter_premise.md`](./compare-with-ttlock_flutter_premise.md) |

---

## 7. PR / Code Review 门禁（摘要）

- [ ] `messages.dart` 与生成物同步更新。
- [ ] 新增 / 修改的 Pigeon enum 已双端映射。
- [ ] 无新增「字符串 MethodChannel」绕过 Pigeon。
- [ ] `example` 或测试已覆盖或可说明豁免原因。

遵守以上规则即可保证：**同事与 AI 遵循同一契约源、枚举语义在双端可追踪、减少跨端协议漂移。**
