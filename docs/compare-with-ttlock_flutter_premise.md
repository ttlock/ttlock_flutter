# 与旧项目 `ttlock_flutter_premise` 框架对比

## 1. 对比结论

新项目 `ttlock_flutter` 从单包插件升级为联邦化多包架构，并以 **Pigeon** 生成强类型跨端契约，替代旧版 **MethodChannel + EventChannel + 字符串命令** 协议。  
核心收益是：**契约单一来源、编译期可校验、跨端行为更易对齐、扩展与协作成本更低、迁移路径更清晰**。

---

## 2. Pigeon 是什么

[Pigeon](https://pub.dev/packages/pigeon) 是 Flutter 团队维护的代码生成工具：你在 **Dart** 里用类、枚举、`abstract class` 描述「Flutter 与宿主平台之间要传什么、调什么」，再由 Pigeon 生成：

- Dart 侧：`HostApi` 的调用端、`EventChannelApi` 的 `Stream` 封装等；
- Kotlin / Java（Android）、Swift / Objective-C（iOS）等：对应的接口实现桩、序列化编解码、Channel 注册样板代码。

本仓库中，契约定义集中在 `ttlock_flutter_platform_interface/pigeons/messages.dart`，生成物包括例如：

- `ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart`（Dart）
- `ttlock_flutter_android/.../Messages.kt`（Kotlin）
- `ttlock_flutter_ios/ios/Classes/Messages.swift`（Swift）

修改跨端接口时，流程是 **先改 Pigeon 输入文件 → 再执行生成命令**（见该文件顶部注释：`fvm dart run pigeon --input pigeons/messages.dart`），而不是在三端各自手写方法名与参数拼装。

---

## 3. 为什么选择 Pigeon（相对手写 Channel）

| 考量 | 手写 MethodChannel / EventChannel | Pigeon |
|------|-----------------------------------|--------|
| 契约位置 | Dart、Android、iOS 各写一套「方法名字符串 + Map 键」 | **一份 Dart 即契约源**，生成多端绑定 |
| 类型安全 | 参数/返回值多为 `Map`/`dynamic`，拼写错误运行时才发现 | **生成强类型 API**，字段与枚举在 Dart 侧即约束 |
| 演进成本 | 增删字段要在三端同步改解析，易漏 | 改模型后 **生成代码会迫使** 实现类编译失败，漏改易暴露 |
| 样板代码 | 大量 `invokeMethod`、switch 分发、手动编解码 | **编解码与 Channel 细节由生成代码承担** |
| 与联邦化插件 | 仍可在各实现包中只写「实现接口」，但协议易与 `platform_interface` 漂移 | **天然落在 `platform_interface` 包**，与 `ttlock_flutter` / `*_android` / `*_ios` 边界一致 |

结合本插件 **接口面大**（锁、网关、多种配件、大量配置与枚举），Pigeon 能显著降低「字符串协议 + Map」在长期迭代中的返工与线上隐性 bug。  
补充：当前 `ttlock_flutter_platform_interface` 的 `dev_dependencies` 中 Pigeon 指向 **带 OpenHarmony 等扩展的 fork**（见该包 `pubspec.yaml`），便于后续与多宿主生态对齐；选型上仍以「契约与代码生成」为主因，fork 为工程化落地细节。

---

## 4. 架构层面对比（细化）

| 维度 | 新项目 `ttlock_flutter` | 旧项目 `ttlock_flutter_premise` |
|------|-------------------------|----------------------------------|
| 工程形态 | **联邦化插件**：聚合包 `ttlock_flutter` + `ttlock_flutter_platform_interface` + `ttlock_flutter_android` / `ttlock_flutter_ios` | **单包插件**：Dart 与 Android/iOS 原生同仓紧耦合 |
| 对外 API 边界 | 聚合包暴露高层 API；平台差异收敛在实现包 | `lib/ttlock.dart` 等单文件承载大量静态方法与命令常量 |
| 跨端通信 | **Pigeon**：多个 `@HostApi()`（如 `TTLockHostApi`、`TTGatewayHostApi`、`TTAccessoryHostApi`）+ 一个 `@EventChannelApi()`（`TTEventChannelApi`，多路流通过多个无参方法映射多条 EventChannel） | **双 Channel**：固定 `MethodChannel` / `EventChannel` 名称，`call.method` 为命令字符串 |
| 异步语义 | Pigeon `@async` → Dart 端 `Future`；事件侧生成 `Stream` 订阅入口 | `invokeMethod` 后依赖 **事件回传 + 队列/命令匹配** 驱动回调 |
| 原生插件类职责 | Kotlin/Swift 主要实现 **生成接口** + 调用厂商 SDK | Java/ObjC 中 **命令分发 + 队列 + SDK 调用** 交织，单类体积大 |

---

## 5. 代码组织对比

### 5.1 新项目

- **`ttlock_flutter`**：对外 API、异常与门面，依赖 `platform_interface` 与具体实现包。
- **`ttlock_flutter_platform_interface`**：`pigeons/messages.dart` 契约、Pigeon 生成代码（`lib/pigeon/`）、对外暴露的类型与接口约定。
- **`ttlock_flutter_android` / `ttlock_flutter_ios`**：分别实现 HostApi、EventChannel 的 StreamHandler、以及与 TTLock 各 SDK 的桥接（如 `LockHostApiImpl` 等）。

### 5.2 旧项目

- **`lib/ttlock.dart`**：集中定义命令常量、`MethodChannel`/`EventChannel`、回调常量、以及与命令队列相关的调度逻辑。
- **Android**：`TtlockFlutterPlugin.java` 等，`onMethodCall` 按命令类型分支，门锁侧大量命令进入 `commandQue` 串行执行。
- **iOS**：`TtlockFlutterPlugin.m` 同样集中处理命令与事件广播。

---

## 6. 协议与数据模型对比

### 6.1 旧架构（字符串 + Map）

- **路由方式**：`MethodChannel.invokeMethod(commandString, map)`，`command` 与 Dart 常量、Java `TTLockCommand`、iOS 侧常量需人工保持一致。
- **参数与结果**：多用 `Map<String, Object>` 传递；事件里再带 `command`、`data`、`resultState` 等字段，由 Dart 统一解析后分发给队列或监听方。
- **典型风险**：键名拼写、类型强转、三端常量不同步；新增字段时若只改一端，编译期**不会**报错。

### 6.2 新架构（Pigeon 模型 + 生成编解码）

- **路由方式**：生成代码内部完成 method name 与参数列表映射；业务侧调用的是 **`TTLockHostApi#controlLock`** 这类方法，而不是散落字符串。
- **参数与结果**：`TTLockInitParams`、`ControlLockResult` 等 **具名类型**；枚举如 `TTControlAction`、`TTLockConfig` 等与原生侧由生成代码对齐。
- **事件流**：`TTEventChannelApi` 中每个扫描/添加流程对应 **独立方法签名**，生成多条 EventChannel（见 `messages.dart` 内注释：Pigeon 限制单文件仅一个 `@EventChannelApi`，故用多方法表达多路流）；需要上下文的流在订阅前通过 `setEventLockData`、`setEventGatewayMac`、`setEventKeypadMac` 等 **显式注入**，减少「隐式全局队列状态」带来的理解成本。

---

## 7. API 与调用方式对比

### 7.1 旧架构特点（回调式 + 命令字符串）

- 调用以 **静态方法 + 成功/失败/进度回调** 为主。
- 参数多使用 **`Map` 动态传递**。
- 命令通过 **字符串常量** 路由（如 `controlLock`、`addCard`）。
- 结果常通过 **统一 EventChannel 广播**，再由队列与 `command` 匹配到对应回调。

**风险小结**：字符串与 Map 错误难在编译期发现；扫描与长流程场景下，**回调队列与事件分发**耦合度高，排查与单测成本大。

### 7.2 新架构特点（强类型 + Future / Stream）

- 调用以 **`Future<T>`**、**`Stream<T>`** 为主，异步语义贴近 Dart 习惯用法。
- 参数与返回值为 **Pigeon 生成或手写的强类型模型**。
- **编译期**可发现大量字段缺失、类型不匹配、枚举分支遗漏（配合静态分析）。
- 事件流按能力拆分，**方法名即语义**，配合显式 `setEvent*` 降低隐式依赖。

---

## 8. 事件处理机制对比

| 维度 | 新项目 | 旧项目 |
|------|--------|--------|
| 事件入口 | **Pigeon `EventChannelApi`**：多方法 → 多条 EventChannel / 多类 StreamHandler | **单一 EventChannel**，所有事件同一管道广播 |
| 路由到业务 | 生成代码 + 各 `Stream` 类型直接表达业务数据 | Dart 侧解析 Map，按 `command` 字符串再分发 |
| 上下文 | `setEventLockData` / `setEventGatewayMac` / `setEventKeypadMac` 等 **显式设置** | 依赖 **命令队列**、历史调用顺序等隐式状态 |
| 可读性 | 「订阅哪个流」即对应哪个能力 | 需理解 **command + queue + resultState** 整体机制 |
| 可测试性 | 可按流、按 HostApi 方法切分 mock | 事件与队列紧耦合，mock 切面更大 |

---

## 9. 错误处理对比

- **新项目**：原生错误经 Pigeon/包装层映射为 **统一的 Flutter 侧异常模型**（如 `pigeon_errors.dart` 等），业务捕获方式一致。
- **旧项目**：错误码、错误信息在 **多处字符串分支与 Map** 中转换，类型约束弱，易出现「同一错误多种表现形式」。

---

## 10. 迁移收益（从旧到新）

- **跨端一致性**：契约单一来源，减少 Android/iOS 行为分叉。
- **扩展新能力**：先扩展 Pigeon 模型与 HostApi / EventChannel 方法，再实现原生；比逐端加字符串命令更不易漏改。
- **协作与 Code Review**：diff 集中在 `messages.dart` 与生成文件，接口变更一目了然。
- **长期维护**：减少「魔法字符串 + 隐式队列」带来的认知负担。

---

## 11. 迁移建议（实操）

1. **先替换调用入口**：业务从旧 `TTLock` 静态回调 API 迁至新 `*_api` / 门面 API。  
2. **分模块迁移**：先迁移锁基础能力（扫描、开关锁、初始化），再迁移网关和配件。  
3. **统一错误处理**：将旧回调错误分支收敛为新异常模型处理。  
4. **事件流改造**：将旧的统一事件监听迁移为 **按能力订阅的 `Stream`**。  
5. **保留过渡层**：短期可利用 `ttlock_classic.dart`（若项目提供）适配，逐步消除历史调用。

---

## 12. 何时仍需关注旧项目

- 仍有历史业务依赖 **旧回调签名** 且短期无法整体替换。
- 某些边缘设备能力尚未在新架构中完成封装。

**建议策略**：

- 新增功能 **仅在新架构** 实现。
- 旧架构只做必要修复，**不继续扩展** 能力面。
