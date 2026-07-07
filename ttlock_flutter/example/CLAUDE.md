# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`ttlock_flutter_example` 是 TTLock Flutter 联邦插件的演示/测试应用。它展示所有设备类型的接入方式（锁、网关、遥控器、键盘、门磁、水电表），并提供交互式命令界面来调用各原生 API。

## 基础命令

```bash
# 安装依赖
cd ttlock_flutter/example && fvm flutter pub get

# 代码生成（build_runner）
cd ttlock_flutter/example && fvm dart run build_runner build --delete-conflicting-outputs

# 持续监听代码生成
cd ttlock_flutter/example && fvm dart run build_runner watch --delete-conflicting-outputs

# 静态分析
cd ttlock_flutter/example && fvm flutter analyze

# 运行测试
cd ttlock_flutter/example && fvm flutter test

# 运行测试（单个文件）
cd ttlock_flutter/example && fvm flutter test test/core/env_test.dart

# 运行应用（On-Premise 模式，默认）
cd ttlock_flutter/example && fvm flutter run

# 运行应用（Online 模式）
cd ttlock_flutter/example && fvm flutter run --dart-define=mode=online
```

## 构建模式

应用通过 `--dart-define=mode` 区分两种运行模式（`lib/core/env/app_mode.dart`）：

| 模式 | 命令 | 适用场景 |
|------|------|----------|
| `onPremise` | `fvm flutter run`（默认）| 本地化部署（需 Server IP + Port） |
| `online` | `fvm flutter run --dart-define=mode=online` | TTLock 云服务（需 UID） |

两种模式共享同一代码路径，Settings 页面根据 `AppEnv.isOnPremise` / `AppEnv.isOnline` 动态展示不同的配置表单。

## 架构与目录结构

```
lib/
  main.dart                           # 入口：ProviderScope + MaterialApp.router
  app.dart                            # AppShell（底部导航栏，3 个 tab）
  core/
    env/app_mode.dart                 # AppEnv / AppMode（onPremise vs online）
    router/
      routes.dart                     # TypedStatefulShellRoute + GoRouteData 定义
      routes.g.dart                   # go_router_builder 生成
      app_router.dart                 # appRouterProvider（GoRouter 实例）
    storage/
      config_storage.dart             # ConfigModel 的 SharedPreferences 持久化
      config_provider.dart            # ConfigNotifier（Riverpod AsyncNotifier）
      device_storage.dart             # 已保存设备列表的 SharedPreferences 持久化
      device_provider.dart            # DeviceListNotifier（Riverpod AsyncNotifier）
    theme/
      app_colors.dart                 # 颜色常量（light + dark）
      app_text_styles.dart            # 文本样式常量
      app_theme.dart                  # ThemeData（Material 3, light + dark）
    widgets/
      device_card.dart                # 扫描到的设备卡片
      error_display.dart              # 错误信息展示 + 重试按钮
      section_header.dart             # 分区标题
      api_result_tile.dart            # API 调用结果行（带耗时）
      loading_overlay.dart            # Loading 覆盖层
  features/                           # 按设备领域拆分
    dashboard/                        # 首页：已保存设备列表 + 快捷控制
    scan/                             # BLE 扫描页面
    lock/                             # 锁控制（开关锁、密码、卡、指纹、人脸、配网等）
    gateway/                          # 网关控制
    remote_key/                       # 无线钥匙
    remote_keypad/                    # 无线键盘
    door_sensor/                      # 门磁
    water_meter/                      # 水表
    electric_meter/                   # 电表
    settings/                         # 配置页 + 数据模型
      model/
        config_model.dart             # freezed 配置模型（uid, serverIp, serverPort, gatewayName）
        saved_device.dart             # freezed 已保存设备模型
  providers/
    ttlock_providers.dart             # TTLock API 的 Riverpod provider（lockApiProvider 等）
```

### 路由结构

基于 `go_router` + `go_router_builder`，使用 `TypedStatefulShellRoute` 实现底部导航并保持各 tab 状态：

- Tab 1: **Dashboard**（`/`）— 已保存设备列表
- Tab 2: **Scan**（`/scan`）— BLE 扫描新设备
- Tab 3: **Settings**（`/settings`）— 配置服务器/UID 等
- Lock Detail（`/lock/:mac`）— 锁控制命令列表
- Gateway Detail（`/gateway/:mac`）— 网关控制

路由定义在 `lib/core/router/routes.dart`，通过 `go_router_builder` 生成 `routes.g.dart`。

### 状态管理

使用 `hooks_riverpod` + `riverpod_annotation` + `flutter_hooks`：

- **需 `ref` 的页面/组件**：必须使用 `HookConsumerWidget`（禁止 `ConsumerWidget` / `ConsumerStatefulWidget`）
- **UI 局部状态**：`useTextEditingController`、`useTabController`、`useState`、`useEffect`
- **数据 provider**（列表、配置、设备信息）：`@riverpod class` + `Future<T> build()`；页面用 `ref.watch(...).when()` 或 `AsyncValueView.when`
- **命令 provider**（BLE 操作、连接、扫描）：同步 `build()` + freezed state；操作 loading 用 `state.isLoading` 或 `loaderOverlay`
- **禁止**：`initState` 触发数据加载；数据页用手动 `isLoading` / `valueOrNull` 替代主数据 `.when()`

参考实现：`settings_page.dart`、`card_list_page.dart`

公共组件：`core/widgets/async_value_view.dart`

### 常见模式：Feature Page 结构

每个 feature 通常由 3 个文件组成：

1. `{feature}_page.dart` — UI 层（`HookConsumerWidget`）
2. `{feature}_provider.dart` — 状态管理（`@riverpod` Notifier，封装 API 调用）
3. `model/{feature}_state.dart`（可选）— freezed 状态模型

### 持久化

- `SharedPreferences` 存储配置和已保存设备
- `ConfigStorage` / `DeviceStorage` 封装 JSON 序列化/反序列化
- 通过 Riverpod `AsyncNotifier` 暴露给 UI

### 配置

- `config.on_premise.json` / `config.online.json` — 运行模式标记文件
- `build.yaml` — `freezed`（不含 `maybe_when`）、`json_serializable`（`field_rename: snake`）、`riverpod_generator`（`prefer_private_providers: true`）配置

## 依赖说明

重要依赖：
- `ttlock_flutter` — 被演示的插件本身（通过 `path: ../` 本地引用）
- `flutter_hooks` / `hooks_riverpod` — 状态管理
- `go_router` + `go_router_builder` — 类型安全路由
- `freezed` + `freezed_annotation` — 不可变数据模型
- `json_serializable` — JSON 序列化
- `shared_preferences` — 本地持久化
- `loader_overlay` — 全局加载覆盖层
- `toastification` — 操作结果提示

`dependency_overrides` 在本地开发时将 Android/iOS 实现指向 premise 分支。

## 测试

当前测试覆盖：
- `test/core/env_test.dart` — AppEnv 默认值测试
- `test/core/theme_test.dart` — 主题与颜色常量定义检查

通过 `TTLock.configurePigeon(binaryMessenger: ...)` 可注入 mock BinaryMessenger 进行插件 API 的 UI 测试。
