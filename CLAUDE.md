# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`ttlock_flutter` 是 TTLock 在线版/本地化（On-Premise）场景下的 Flutter 联邦插件，提供智能门锁、网关及配件设备（遥控器、键盘、门磁、水电表等）的跨平台接入能力。

核心设计原则：
- **Federated Plugin（联邦插件）** 架构：Dart API / 契约层 / 平台实现解耦
- **契约优先**：所有跨端通信通过 Pigeon 强类型定义，禁止 MethodChannel 字符串协议
- **枚举双向映射**：Pigeon 枚举必须在 Android/iOS 的 EnumConverter 中实现 Convert/Revert

## 仓库结构

```
ttlock_flutter/                          # 聚合包（业务侧主入口）
  lib/
    ttlock.dart                          # TTLock 单例入口（lock, gateway, remoteKey 等）
    ttlock_classic.dart                  # 旧式回调风格兼容（已标记 @Deprecated）
    src/*_api.dart                       # 按领域封装的 API（锁、网关、配件等）
    src/pigeon_errors.dart               # PlatformException → 业务异常转换（runLockApi, runGatewayApi 等）
    errors/                              # 统一异常模型（TTLockException 等）
  example/                               # 示例应用（Riverpod + go_router + hooks）
    lib/
      core/                              # 路由、主题、存储、环境、通用组件
      features/                          # 按设备领域拆分页面（lock, gateway, scan, settings 等）
      providers/                         # Riverpod providers（含 codegen .g.dart）

ttlock_flutter_platform_interface/       # 契约层（Pigeon 定义 + 生成代码）
  pigeons/messages.dart                  # Pigeon 输入（唯一契约源）
  lib/pigeon/messages.g.dart             # Dart 生成代码

ttlock_flutter_android/                  # Android 实现（Kotlin）— Git Submodule
  android/src/main/kotlin/.../
    Messages.kt                          # Pigeon 生成
    LockApi.kt / GatewayApi.kt / AccessoryApi.kt
    EnumConverter.kt
    StreamHandlers.kt

ttlock_flutter_ios/                      # iOS 实现（Swift）— Git Submodule
  ios/Classes/
    Messages.swift                       # Pigeon 生成
    LockHostApiImpl.swift / GatewayHostApiImpl.swift / AccessoryHostApiImpl.swift
    EnumConverter.swift
    EventStreamHandlers.swift

ttlock_flutter_ohos/                     # OHOS 实现（ArkTS）
  ohos/src/main/ets/components/plugin/  # 同上模式

docs/                                    # 架构、开发规范、对比文档
  architecture.md                        # 分层职责与调用链路详解
  development-workflow.md                # 契约优先的开发流程与 PR 门禁
  compare-with-ttlock_flutter_premise.md # 与旧架构对比
```

### 领域划分

- **锁**：扫描、初始化、开关锁、密码/卡/指纹/人脸管理、配置项读写、电梯控制
- **网关**：扫描、连接、初始化、网络配置
- **配件**：遥控器、键盘、门磁、水表、电表
- **事件流**：扫描进度、添加卡/指纹/人脸等持续事件（EventChannel）

### 异常体系

- `TTException` — 插件侧统一异常基类
- `TTLockException` / `TTGatewayException` / `TTRemoteAccessoryException` / `TTMultifunctionalKeypadException` / `TTFaceException` — 各领域异常
- `TTPigeonException` — Pigeon 平台异常（channel-error, null-error）
- `src/pigeon_errors.dart` 中的 `throwLockError` / `runLockApi` 等实现 `PlatformException` → 业务异常转换

### 错误映射模式

每个领域 API 在 `src/*_api.dart` 中通过 `src/pigeon_errors.dart` 的辅助函数包裹 Pigeon 调用：

```dart
// TTLockApi 示例
Future<SomeResult> someMethod() =>
    runLockApi(() => _host.somePigeonMethod());
```

`runLockApi` 捕获 `PlatformException`，将错误码转为对应的 `TTLockError` 枚举值并抛出 `TTLockException`。网关、配件等各有自己的 `runGatewayApi`/`runRemoteAccessoryApi`。

### 事件流上下文模式

订阅 EventChannel 前必须先通过 HostApi 设置上下文：
- 各 EventChannel 订阅前通过专用 `set*Param` 写入参数（如 `setLockAddCardParam`、`setGatewayGetNearbyWifiParam`），避免原生层硬编码默认有效期

实现见 `src/tt_lock_api.dart` 中 `lockScanWifi` / `lockAddCard` 等方法的 `asyncExpand` 模式。

## 基础命令

项目使用 FVM 管理 Flutter SDK 版本（`flutterSdkVersion: custom_3.27.5-ohos-1.0.4`）。

```bash
# 获取依赖（需要在对应子包目录执行）
cd ttlock_flutter && fvm flutter pub get
cd ttlock_flutter_platform_interface && fvm flutter pub get
cd ttlock_flutter/example && fvm flutter pub get

# 运行分析
cd ttlock_flutter && fvm flutter analyze
cd ttlock_flutter_platform_interface && fvm flutter analyze

# 运行测试
cd ttlock_flutter && fvm flutter test
cd ttlock_flutter_platform_interface && fvm flutter test
cd ttlock_flutter_android && fvm flutter test
cd ttlock_flutter_ios && fvm flutter test

# 运行单个测试文件
cd ttlock_flutter && fvm flutter test test/ttlock_flutter_test.dart

# 运行示例应用
cd ttlock_flutter/example && fvm flutter run
```

### Example App 代码生成

示例应用使用 Riverpod + freezed + json_serializable + go_router_builder：

```bash
cd ttlock_flutter/example
fvm dart run build_runner build --delete-conflicting-outputs
```

### Pigeon 代码生成

```bash
cd ttlock_flutter_platform_interface
fvm dart run pigeon --input pigeons/messages.dart
```

生成文件会覆盖：
- `ttlock_flutter_platform_interface/lib/pigeon/messages.g.dart`
- `ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt`
- `ttlock_flutter_ios/ios/Classes/Messages.swift`
- `ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/Messages.ets`

## Pigeon 输入文件约定

`pigeons/messages.dart` 中按以下顺序组织（与 Pigeon 解析顺序一致）：

1. **Data Models** — Pigeon 数据模型 class
2. **Enums** — 跨端业务枚举（`TT` 前缀、lowerCamelCase case 名）
3. **@HostApi()** — 抽象类定义 One-shot 方法
4. **@EventChannelApi()** — 流式接口（仅一个 `TTEventChannelApi`，新流通过增加无参方法扩展）

Pigeon 使用**自定义 fork**（基于 OHOS 兼容版本），来自 `https://gitcode.com/openharmony-sig/flutter_packages.git`，`br_pigeon-v25.3.2_ohos`。

## Example App 架构

示例应用是独立的 Flutter 应用，用于演示和验证插件功能：

- **状态管理**: `hooks_riverpod` + `riverpod_annotation`（codegen）
- **路由**: `go_router` + `go_router_builder`（codegen），`StatefulNavigationShell` 实现底部导航保持 tab 状态
- **UI**: `flutter_hooks`、`toastification`、`loader_overlay`
- **持久化**: `shared_preferences`
- **生成**: `build_runner` 驱动（freezed, json_serializable, riverpod_generator, go_router_builder）

本地开发时，example 通过 `dependency_overrides` 使用本地子模块的 premise 分支。

## Git Submodule 工作流

Android 和 iOS 实现包是独立的 Git 子模块（参见 `.gitmodules`）：

```bash
# 首次克隆
git clone --recurse-submodules <repo-url>

# 更新子模块
git submodule update --init --recursive

# 在子模块内开发
cd ttlock_flutter_android   # 或 ttlock_flutter_ios
git fetch
git checkout <branch>

# 修改并提交
# （在子模块内修改、commit、push）
# 回到主仓库提交子模块指针变更
git add ttlock_flutter_android
git commit -m "chore: bump android submodule"
```

## 测试

- `TTLock.configurePigeon(binaryMessenger: ...)` / `TTLock.setImplementations(...)` 支持注入 mock BinaryMessenger 或完全替换 API 实现以隔离测试
- 当前 `ttlock_flutter/test/` 含基础导出测试；`ttlock_flutter_platform_interface/test/`、`ttlock_flutter_android/test/`、`ttlock_flutter_ios/test/` 各含自有测试

## 重要开发规范

1. **契约优先**: 所有 Flutter ↔ 原生接口变更必须先修改 `pigeons/messages.dart`，执行 Pigeon 生成，再实现平台层
2. **枚举双向映射**: 新增 Pigeon 枚举必须同时在 `EnumConverter.kt`（Android）和 `EnumConverter.swift`（iOS）实现 Convert（Pigeon→SDK）和 Revert（SDK→Pigeon）
3. **事件流上下文**: 订阅 EventChannel 前通过对应 `set*Param` HostApi 设置参数（见 `pigeons/messages.dart` 中 `TTLockHostApi` / `TTGatewayHostApi` / `TTAccessoryHostApi`）
4. **错误映射**: 原生错误码在 `src/pigeon_errors.dart` 中通过 `runLockApi` / `runGatewayApi` 等统一转换
5. **参考文档**: 开发流程与 PR 门禁详见 `docs/development-workflow.md`，架构详解见 `docs/architecture.md`
