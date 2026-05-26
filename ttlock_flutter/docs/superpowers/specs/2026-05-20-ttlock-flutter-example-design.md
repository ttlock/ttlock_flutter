# TTLock Flutter SDK 示例应用 — 设计文档

> 日期: 2026-05-20
> 状态: 已批准
> 架构师: Claude

## 1. 概述

对 `ttlock_flutter/example/` 进行现代化重构，打造兼具开发调试工具和 Demo 展示能力的示例应用。覆盖 SDK 全部 7 个领域 API（锁、网关、远程钥匙、无线键盘、门磁、水表、电表），采用 Flutter 生态最新实践。

## 2. 技术栈

| 类别 | 包 | 用途 |
|------|------|------|
| 状态管理 | `flutter_riverpod` + `riverpod_annotation` + `riverpod_generator` | 编译安全、测试友好 |
| 数据类 | `freezed_annotation` + `freezed` + `json_serializable` | 不可变状态、union/sealed 类型 |
| 路由 | `go_router` + `go_router_builder` | 类型安全路由 |
| 存储 | `shared_preferences` | 配置持久化 |
| 权限 | `permission_handler` | 蓝牙/位置 |
| Toast | `fluttertoast` | 轻量操作反馈 |
| 代码生成 | `build_runner` | 统一生成入口 |

**去除** `bmprogresshud`。

## 3. 环境模式与构建配置

通过 Flutter 的 `--dart-define-from-file` 在构建时指定运行模式，设置页 UI 根据模式动态适配。

### 3.1 配置文件

项目根目录(`example/`)提供两个配置文件模板：

**`config.on_premise.json`** — 本地化版：
```json
{
  "mode": "on_premise"
}
```

**`config.online.json`** — 在线版：
```json
{
  "mode": "online"
}
```

### 3.2 构建命令

```bash
# 本地化版
fvm flutter run --dart-define-from-file=config.on_premise.json

# 在线版
fvm flutter run --dart-define-from-file=config.online.json
```

### 3.3 运行时行为差异

| 差异点 | on_premise 模式 | online 模式 |
|--------|----------------|-------------|
| 设置页字段 | 必填: serverIp, serverPort, uid(可选) | 必填: uid |
| 网关初始化 | 传入 serverIp/serverPort | 不传服务器参数 |
| 锁网络配置 | 提供 configServer | 不提供 |

### 3.4 代码实现

```dart
// core/env/app_mode.dart
enum AppMode { onPremise, online }

class AppEnv {
  static const mode = AppMode.onPremise; // 实际通过 dart-define 注入
  static AppMode get current => mode;
}
```

通过 `--dart-define` 在编译期注入模式常量，Dart 的 `const` 保证无用分支在 release build 中被 tree-shake 掉。

## 4. 目录结构

```
example/lib/
├── main.dart
├── app.dart                              # MaterialApp + 主题 + 路由
│
├── core/
│   ├── theme/
│   │   ├── app_theme.dart                # ThemeData 定义
│   │   ├── app_colors.dart               # 色彩 token
│   │   └── app_text_styles.dart          # 字体 token
│   ├── router/
│   │   ├── app_router.dart               # GoRouter 配置
│   │   └── routes.dart                   # 类型安全路由定义 (go_router_builder)
│   ├── storage/
│   │   ├── config_storage.dart           # 配置读写
│   │   └── config_provider.dart          # Provider 暴露
│   └── widgets/
│       ├── device_card.dart              # 设备卡片
│       ├── section_header.dart           # 分组标题
│       ├── error_display.dart            # 统一错误展示
│       ├── loading_overlay.dart          # 加载遮罩
│       └── api_result_tile.dart          # API 调用结果展示
│
├── features/
│   ├── dashboard/
│   │   ├── dashboard_page.dart           # 设备总览首页
│   │   └── dashboard_provider.dart
│   ├── settings/
│   │   ├── settings_page.dart            # 配置页
│   │   └── model/
│   │       └── config_model.dart         # freezed 配置模型
│   ├── scan/
│   │   ├── scan_page.dart                # 统一扫描页
│   │   └── scan_provider.dart
│   ├── lock/
│   │   ├── lock_page.dart                # 锁控制中心
│   │   ├── lock_provider.dart
│   │   └── model/
│   │       └── lock_state.dart           # freezed 状态
│   ├── gateway/
│   │   ├── gateway_page.dart
│   │   ├── gateway_provider.dart
│   │   └── model/
│   │       └── gateway_state.dart
│   ├── remote_key/
│   │   ├── remote_key_page.dart
│   │   └── remote_key_provider.dart
│   ├── remote_keypad/
│   │   ├── keypad_page.dart
│   │   └── keypad_provider.dart
│   ├── door_sensor/
│   │   ├── door_sensor_page.dart         # 挂锁 + 独立门磁
│   │   └── door_sensor_provider.dart
│   ├── water_meter/
│   │   ├── water_meter_page.dart
│   │   └── water_meter_provider.dart
│   └── electric_meter/
│       ├── electric_meter_page.dart
│       └── electric_meter_provider.dart
│
└── providers/
    └── ttlock_providers.dart             # TTLock 单例注入
```

## 4. 设备层级与导航

### 4.1 设备层级关系

```
Lock（核心设备）— 扫描、初始化、获取 lockData
├── Remote Key（远程钥匙）— 通过 lockData 添加到锁
├── Remote Keypad（无线键盘）— 通过 lockData/lockMac 初始化
├── Door Sensor（挂锁门磁）— 通过 lockData 添加到锁
│
Gateway（网关）— 独立设备，通过 WiFi/Ethernet 为锁提供远程访问
Standalone Door Sensor（独立门磁）— 独立设备
Water Meter（水表）— 独立设备，服务器通信
Electric Meter（电表）— 独立设备，服务器通信
```

### 4.2 页面路由

```
App Shell (BottomNavigationBar)
├── / 首页 → Dashboard（设备总览 + 快捷入口）
├── /scan 扫描 → ScanPage（统一扫描所有设备类型）
├── /settings 设置 → SettingsPage（uid、服务器配置）

设备操作页（全屏推入）:
├── /lock/:lockData            → 锁控制中心（含配件入口）
├── /gateway/:mac              → 网关操作
├── /gateway/wifi/:mac         → 网关配 WiFi（G2）
├── /remote-key/:mac           → 远程钥匙
├── /remote-keypad/:mac        → 无线键盘
├── /door-sensor/:mac          → 门磁（挂锁/独立）
├── /water-meter/:id           → 水表操作
└── /electric-meter/:id        → 电表操作
```

### 4.3 配件的访问路径

配件**不单独出现在底部导航**，而是从锁详情页进入，反映真实的蓝牙设备拓扑：
- 锁详情页 → "添加远程钥匙" → RemoteKeyPage
- 锁详情页 → "添加无线键盘" → KeypadPage
- 锁详情页 → "添加门磁" → DoorSensorPage

水表、电表、独立门磁、网关作为独立设备，可通过扫描直接进入。

## 5. 主题设计

### 5.1 色彩体系

IoT/硬件管理风格，支持暗色模式：

| Token | 亮色 | 暗色 | 用途 |
|-------|------|------|------|
| `primary` | `#1976D2` | `#90CAF9` | 主色 - 科技蓝 |
| `secondary` | `#00BCD4` | `#80DEEA` | 辅色 - 青绿 |
| `surface` | `#F5F7FA` | `#1A1D21` | 表面背景 |
| `error` | `#E53935` | `#EF9A9A` | 错误/断开 |
| `success` | `#43A047` | `#A5D6A7` | 成功/在线 |
| `warning` | `#FB8C00` | `#FFCC80` | 警告/低电量 |

### 5.2 组件风格

- 设备卡片: 16px 圆角, 轻微阴影, LED 状态指示点
- 操作按钮: 12px 圆角, 大触控区域 (48px min)
- 分组列表: section header 带 SF Symbol / Material 图标
- 扫描页: RSSI 信号强度条 + 设备类型标签

## 6. 核心基础设施

### 6.1 配置存储

```dart
@freezed
class ConfigModel with _$ConfigModel {
  const factory ConfigModel({
    @Default(0) int uid,
    String? serverIp,     // on_premise 模式必填
    String? serverPort,   // on_premise 模式必填
    @Default('Gateway') String gatewayName,
  }) = _ConfigModel;
  
  factory ConfigModel.fromJson(Map<String, dynamic> json) => _$ConfigModelFromJson(json);
}
```

纯用户输入，通过 `shared_preferences` 持久化。启动时如果配置不完整，引导用户填写。

设置页根据 `AppEnv.mode` 动态显示必填字段：
- `on_premise` 模式：显示 serverIp、serverPort 为必填，uid 为可选
- `online` 模式：显示 uid 为必填，隐藏服务器字段

### 6.2 扫描流程

1. 进入扫描页 → 同时启动锁、网关、钥匙、键盘、门磁、水表、电表的蓝牙扫描
2. 结果按设备类型分组展示（每组带 SectionHeader）
3. 点击设备 → 根据类型和是否已初始化，路由到对应页面
4. 扫描页显示扫描状态（正在扫描 / 已停止 / 未开启蓝牙）

### 6.3 错误处理

统一使用 SDK 的 `TTException` 体系。每个 Feature Provider 封装错误处理：

```dart
@riverpod
class Lock extends _$Lock {
  Future<void> someOperation() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await runLockApi(() => _api.someMethod());
      state = state.copyWith(isLoading: false);
    } on TTLockException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
```

`ErrorDisplay` widget 统一渲染 `TTException` 的错误码和信息。

## 7. Feature 模块详设

### 7.1 Scan 模块

```
ScanPage → ScanProvider
├── 启动所有类型的蓝牙扫描（Stream 订阅）
├── 结果按类型分组（ListMap<Type, Device>）
├── 点击设备 → 根据类型路由
│   ├── 锁（未初始化）→ initLock → LockPage
│   ├── 锁（已初始化）→ LockPage
│   ├── 网关 → 连接 + 初始化 → GatewayPage
│   ├── 远程钥匙/键盘 → KeypadPage
│   ├── 门磁(挂锁) → 需要锁上下文
│   ├── 门磁(独立) → 直接初始化
│   ├── 水表/电表 → 直接初始化
└── 扫描控制（开始/停止按钮）
```

### 7.2 Lock 模块

锁控制中心 — 功能分组列表：

| 分组 | 功能 |
|------|------|
| **控制** | 开锁、关锁、获取开关状态、获取电量、获取/设置时间 |
| **密码** | 创建自定义密码、修改密码、删除密码、重置密码、获取管理员密码、获取所有密码 |
| **卡片** | 添加卡片（流式进度）、修改有效期、删除、清除全部、获取全部 |
| **指纹** | 添加指纹（流式进度）、修改有效期、删除、清除全部、获取全部 |
| **人脸** | 添加人脸（流式进度）、修改、删除、清除 |
| **配置** | 自动锁定时间、远程开锁开关、音频开关、音量、方向、灵敏度 |
| **高级** | 通道模式（添加/清除）、电梯控制、省电模式、酒店模式 |
| **配件** | 添加远程钥匙、无线键盘、挂锁门磁 |
| **网络** | WiFi 配置、IP 配置、服务器配置 |
| **其他** | 重置锁、重置电子钥匙、系统信息、操作记录 |

每个功能项点击后：显示参数输入对话框 → 调用 API → 显示结果。

### 7.3 Gateway 模块

```
GatewayPage → GatewayProvider
├── 扫描网关 → 连接 → 初始化
├── G2: 额外 WiFi 配置步骤
├── 操作: IP 配置、APN 配置、获取网络 MAC、进入升级模式
└── 断开连接
```

### 7.4 Remote Key 模块

```
RemoteKeyPage → RemoteKeyProvider
├── 扫描远程钥匙
├── 初始化（需锁上下文）
├── 获取已存锁列表
└── 删除已存锁插槽
```

### 7.5 Remote Keypad 模块

```
KeypadPage → KeypadProvider
├── 扫描键盘
├── 初始化（普通键盘 vs 多功能键盘）
├── 多功能键盘: 添加指纹（流式）、添加卡片（流式）
└── 删除已存锁
```

### 7.6 Door Sensor 模块

```
DoorSensorPage → DoorSensorProvider
├── 挂锁门磁: 扫描、初始化（需 lockData）、删除
├── 独立门磁: 扫描、初始化、读取特征值、功能检查
└── 设置报警时间
```

### 7.7 Water Meter 模块

```
WaterMeterPage → WaterMeterProvider
├── 扫描水表
├── 配置服务器 → 连接 → 初始化
├── 操作: 开关、设置/清除剩余水量、读取数据、设置付费模式、充值、设置总用量
├── 配置: 功能特征值、APN、抄表服务器
└── 删除 / 重置
```

### 7.8 Electric Meter 模块

```
ElectricMeterPage → ElectricMeterProvider
├── 扫描电表
├── 配置服务器 → 连接 → 初始化
├── 操作: 开关、设置/清除剩余电量、读取数据、设置付费模式、充值、设置最大功率
├── 配置: 功能特征值
└── 删除
```

## 8. TTLock Provider 注入

```dart
// providers/ttlock_providers.dart
final ttlockProvider = Provider<TTLock>((ref) => TTLock.instance);
final lockApiProvider = Provider<TTLockApi>((ref) => TTLock.lock);
final gatewayApiProvider = Provider<TTGatewayApi>((ref) => TTLock.gateway);
// ... 其他 API 相似
```

通过 `ProviderScope` 在 App 根节点注入。

## 9. 测试策略

基础冒烟测试：

| 测试 | 范围 |
|------|------|
| Widget 测试 | 每个 Page 的渲染测试（mock provider） |
| Provider 测试 | 关键 Provider 的逻辑单元测试 |
| 路由测试 | GoRouter 路由路径正确性 |

不覆盖：与原生蓝牙交互的集成测试（需要真实设备）。

## 10. pubspec.yaml 依赖

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.6.0
  riverpod_annotation: ^2.6.0
  go_router: ^14.0.0
  freezed_annotation: ^2.4.0
  json_annotation: ^4.9.0
  shared_preferences: ^2.3.0
  permission_handler: ^11.0.0
  fluttertoast: ^8.2.0
  cupertino_icons: ^1.0.8

  ttlock_flutter:
    path: ../

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  freezed: ^2.5.0
  json_serializable: ^6.8.0
  riverpod_generator: ^2.6.0
  go_router_builder: ^2.7.0
  flutter_lints: ^5.0.0

dependency_overrides:
  permission_handler:
    git:
      url: https://gitcode.com/openharmony-sig/flutter_permission_handler.git
      path: permission_handler
      ref: br_permission_handler_v11.3.1_ohos
```
