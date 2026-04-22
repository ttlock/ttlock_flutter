# TTLock Flutter 项目架构详解

## 1. 架构目标

本项目采用联邦插件架构，核心目标是：

- 将对外 API、跨端通信契约、平台实现解耦
- 降低 Android/iOS 平台差异对 Flutter 业务代码的影响
- 通过强类型代码生成减少通信协议错误
- 为新能力扩展（设备类型、平台、接口）提供稳定演进路径

## 2. 分层与职责

### 2.1 聚合层（`ttlock_flutter`）

职责：

- 提供业务可直接使用的 Dart API（例如 `TTLock`、`TTGateway` 等）
- 封装底层 Pigeon HostApi 调用，输出更易用的业务门面
- 统一异常转换与参数校验

关键实现：

- `lib/src/*_api.dart`：按领域拆分 API（锁、网关、配件、水电表等）
- `lib/ttlock.dart`、`lib/ttgateway.dart` 等：对外主入口
- `lib/errors`：异常模型与映射逻辑
- `lib/ttlock_classic.dart`：旧式调用风格兼容入口

### 2.2 契约层（`ttlock_flutter_platform_interface`）

职责：

- 统一定义 Flutter 与原生通信的数据模型、枚举与接口
- 作为单一事实来源（Single Source of Truth）

关键实现：

- `pigeons/messages.dart`：Pigeon 输入定义（HostApi + EventChannelApi + 数据模型 + 枚举）
- `lib/pigeon/messages.g.dart`：Dart 侧生成代码
- Android/iOS 端对应的 `Messages.kt` / `Messages.swift` 由同一源生成

### 2.3 平台实现层（Android / iOS）

职责：

- 实现 Pigeon 约定的 HostApi
- 调用 TTLock On-Premise SDK 完成设备通信
- 将原生错误、枚举、模型映射回契约层类型
- 处理 EventChannel 事件流分发

Android（`ttlock_flutter_android`）：

- `LockApi.kt`、`GatewayApi.kt`、`AccessoryApi.kt`
- `StreamHandlers.kt`：事件流处理
- `EnumConverter.kt`：枚举转换

iOS（`ttlock_flutter_ios`）：

- `LockHostApiImpl.swift`、`GatewayHostApiImpl.swift`、`AccessoryHostApiImpl.swift`
- `EventStreamHandlers.swift`：事件流处理
- `EnumConverter.swift`：枚举转换

## 3. 通信机制设计

## 3.1 One-shot 调用链路

调用路径：

1. Flutter 业务调用 `TTLockApi` 等 Dart API
2. Dart API 通过 Pigeon `HostApi` 发起请求
3. 原生 HostApi 实现调用 TTLock SDK
4. 结果/错误映射为 Pigeon 类型回传 Flutter
5. Flutter 侧统一转换为业务异常（`TTLockException`）

## 3.2 事件流链路

调用路径：

1. Flutter 订阅 `EventChannelApi` 暴露的 Stream（如扫描、添加卡/指纹/人脸）
2. 订阅前通过 `setEventLockData` / `setEventGatewayMac` / `setEventKeypadMac` 设置上下文
3. 原生流处理器持续推送事件
4. Flutter 通过强类型模型消费事件进度和结果

说明：

- 将上下文设置与事件订阅解耦，避免旧架构中“依赖历史调用副作用”的隐性耦合

## 4. 模块拆分策略

按业务领域拆分，而非按平台拆分：

- 锁域：初始化、开关锁、凭证管理、系统配置
- 网关域：连接与网络配置
- 配件域：遥控器、键盘、门磁及扩展设备
- 计量域：水表、电表

收益：

- 新能力扩展只需在契约层+对应领域 API 增量演进
- 原生实现可按领域并行开发，降低冲突

## 4.1 各模块结构介绍

- `ttlock_flutter`
  - 联邦插件聚合层（App 侧主依赖入口）。
  - 对上提供稳定 Dart API；对下依赖 `ttlock_flutter_platform_interface` 与各平台实现包。
  - 负责业务参数整理、异常封装、调用链路聚合。

- `ttlock_flutter_platform_interface`
  - 联邦架构契约层，定义 Pigeon 通信协议与跨端模型。
  - 作为 Android/iOS/OHOS 的统一接口基线，避免各端协议漂移。
  - 所有新增能力建议先改该层契约，再落地平台实现。

- `ttlock_flutter_android`
  - Android 在线版平台实现层。
  - 实现 HostApi/EventChannel 逻辑，并桥接 Android 原生 TTLock SDK。
  - 负责 Android 侧枚举、错误码、模型转换。

- `ttlock_flutter_ios`
  - iOS 在线版平台实现层。
  - 实现 HostApi/EventChannel 逻辑，并桥接 iOS 原生 TTLock SDK。
  - 负责 iOS 侧枚举、错误码、模型转换。

- `ttlock_flutter_ohos`
  - OHOS 平台实现层（用于保持联邦架构多端一致性）。
  - 结构目标与 Android/iOS 对齐：遵循同一契约、相同领域划分、统一错误语义。
  - 当前能力可按契约演进逐步补齐。

- `ttlock_flutter_premise_android`
  - Android premise（离线版）平台实现层。
  - 对外接口语义尽量与 `ttlock_flutter_android` 保持一致，降低业务侧切换成本。
  - 核心差异在于底层依赖的 TTLock 原生 SDK 版本不同（离线版）。

- `ttlock_flutter_premise_ios`
  - iOS premise（离线版）平台实现层。
  - 与 `ttlock_flutter_ios` 的主要差异同样是底层原生 TTLock SDK 不同（离线版）。
  - 用于对接离线部署/离线能力场景。

## 4.2 premise 与非 premise 的区别

- TTLock 原生 SDK 分为两类：在线版与离线版。
- 非 premise（如 `ttlock_flutter_android`、`ttlock_flutter_ios`）依赖在线版 SDK。
- premise（如 `ttlock_flutter_premise_android`、`ttlock_flutter_premise_ios`）依赖离线版 SDK。
- 因此，`premise` 包的定位是：在保持 Flutter 层调用模型尽量一致的前提下，承载离线版 SDK 的平台实现。

## 5. 错误与类型治理

- 错误码在原生侧集中映射，Flutter 侧统一异常包装
- 通过 Pigeon 枚举约束错误值域，降低 magic number 传播
- 业务层无需处理 MethodChannel 的动态类型细节

## 6. 代码生成与开发流程

更完整的门禁清单、枚举与原生映射要求、以及面向 AI 的约束说明见：[开发规范与流程](./development-workflow.md)。

Pigeon 生成命令（在 `ttlock_flutter_platform_interface` 执行）：

- `fvm dart run pigeon --input pigeons/messages.dart`

建议流程：

1. 先改 `pigeons/messages.dart` 契约
2. 执行代码生成，更新 Dart/Kotlin/Swift 绑定
3. 分别补齐 Android/iOS HostApi 实现
4. 在 `ttlock_flutter` 层封装业务 API 与异常转换
5. 在 `example` 验证基础能力与事件链路

## 7. 兼容与演进建议

- 新功能优先走 Pigeon 契约，不再新增字符串命令协议
- 经典 API 仅用于迁移期兼容，避免继续扩散
- 逐步补齐 `ttlock_flutter_ohos` 的契约实现，保持联邦架构一致性
