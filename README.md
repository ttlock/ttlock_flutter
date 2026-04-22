# TTLock Flutter（On-Premise）项目介绍

`ttlock_flutter` 是 TTLock 本地化（On-Premise）场景下的 Flutter 插件工程，提供智能门锁、网关及配件设备（如遥控器、门磁、水电表等）的统一跨平台接入能力。

项目采用 **Federated Plugin（联邦插件）** 架构，使用 **Pigeon** 维护 Flutter 与原生端的强类型通信契约，目标是提升接口一致性、可维护性与扩展效率。

## 核心能力

- 门锁能力：扫描、初始化、开关锁、密码/卡/指纹/人脸管理、配置项读写等
- 网关能力：扫描、连接、初始化、网络配置
- 配件能力：遥控器、键盘、门磁、水表、电表等接入与管理
- 事件能力：基于 EventChannel 的持续事件流（扫描进度、添加卡/指纹/人脸过程等）
- 错误治理：统一错误码与 Flutter 异常模型，降低业务层适配复杂度

## 仓库结构（Monorepo）

- `ttlock_flutter`：对外聚合包（业务侧主入口）
- `ttlock_flutter_platform_interface`：Pigeon 契约定义与生成代码
- `ttlock_flutter_android`：Android 原生实现（Kotlin）
- `ttlock_flutter_ios`：iOS 原生实现（Swift）
- `ttlock_flutter_ohos`：OHOS 预留实现（当前阶段未纳入默认聚合）

## 技术方案亮点

- **联邦化分层**：Dart API / 契约层 / 平台实现解耦，平台演进互不阻塞
- **强类型通信**：通过 Pigeon 生成 Dart/Kotlin/Swift 代码，减少字符串协议错误
- **事件上下文治理**：扫描类与添加类流式接口在订阅前显式设置上下文参数
- **平滑兼容**：保留经典 API 适配入口（如 `ttlock_classic.dart`），降低迁移成本

## 适用场景

- 物业/公寓/酒店等本地化部署门禁系统
- 需要 Flutter 统一接入 Android + iOS 的设备控制能力
- 需要从老版 MethodChannel 插件逐步迁移到强类型新架构

## 快速开始（开发）

1. 进入子包并安装依赖（示例）：
   - `cd ttlock_flutter/example`
   - `fvm flutter pub get`
2. 运行示例应用：
   - `fvm flutter run`

## 相关文档

- 架构详解：`docs/architecture.md`
- 与旧框架对比：`docs/compare-with-ttlock_flutter_premise.md`
