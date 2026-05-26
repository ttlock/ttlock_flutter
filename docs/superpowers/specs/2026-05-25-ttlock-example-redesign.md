# TTLock Example App 重构设计文档

## 概述

对 `ttlock_flutter/example` 进行功能完善与架构重构，解决现有应用在设备扫描、配件管理、命令交互、数据持久化等方面的不足。

### 目标
- 统一扫描页，支持主扫描（独立设备）和配件扫描（绑定到锁的设备）两种模式
- 完善锁详情页，提供可配置参数的命令面板 + 绑定配件入口 + 锁配置
- 建立配件管理流程：锁详情 → 配件列表页 → 扫描添加 → 配件详情页
- 所有设备类型全量本地持久化
- Dashboard 通过 TabBar 分类展示独立设备

### 非目标
- 不修改插件层（`ttlock_flutter`）的 API
- 不修改主题/入口/Provider 注册等基础设施
- 不引入新的第三方依赖

## 导航架构

### 底部 Tab（不变）
| Tab | 路由 | 内容 |
|-----|------|------|
| 📊 Dashboard | `/` | TabBar 分类展示独立设备 |
| 🔍 扫描 | `/scan` | 参数化扫描页 |
| ⚙️ 设置 | `/settings` | 服务器配置 + 设备管理 |

### 路由表
| 路径 | 页面 | 说明 |
|------|------|------|
| `/` | `DashboardPage` | TabBar: 锁/网关/水表/电表 |
| `/scan` | `ScanPage` | 主扫描 + 配件扫描（参数化） |
| `/settings` | `SettingsPage` | 配置页（保持现有） |
| `/lock/:mac` | `LockPage` | 锁详情（3 Section） |
| `/gateway/:mac` | `GatewayPage` | 网关详情 |
| `/lock/:mac/door-sensors` | `DoorSensorListPage` | 门磁列表 |
| `/lock/:mac/remote-keys` | `RemoteKeyListPage` | 遥控器列表 |
| `/lock/:mac/keypads` | `KeypadListPage` | 键盘列表 |
| `/door-sensor/:mac` | `DoorSensorInfoPage` | 门磁详情 |
| `/remote-key/:mac` | `RemoteKeyInfoPage` | 遥控器详情 |
| `/keypad/:mac` | `KeypadInfoPage` | 键盘详情 |
| `/water-meter/:id` | `WaterMeterPage` | 水表详情 |
| `/electric-meter/:id` | `ElectricMeterPage` | 电表详情 |

### 配件管理流程
```
锁详情 Page
  → Section 2 配件入口
    → 点击 [门磁] → /lock/:mac/door-sensors
      → 列表页（右上角 + 按钮）
        → 点击 + → /scan?type=doorSensor&lockData=xxx&lockMac=xxx
          → 扫描页配件模式 → 扫描 → 点击设备 → SDK init + 持久化
          → pop 回列表页（刷新）
        → 点击已有配件 → /door-sensor/:mac → 详情页（信息/删除/设置）
    → 点击 [遥控器] → /lock/:mac/remote-keys（同上逻辑）
    → 点击 [键盘] → /lock/:mac/keypads（同上逻辑）
```

## 通用扫描页设计

### ScanConfig
```dart
class ScanConfig {
  final ScanMode mode;           // main / accessory
  final DeviceType? deviceType;  // 预选设备类型
  final String? lockData;        // 配件模式：所属锁的 lockData
  final String? lockMac;         // 配件模式：所属锁的 MAC
}

enum ScanMode { main, accessory }

// DeviceType 覆盖可扫描的类型
enum DeviceType { lock, gateway, doorSensor, remoteKey, keypad, waterMeter, electricMeter }
```

### 主扫描模式
1. 页面显示设备类型选择器 GridView（🔒锁 / 📡网关 / 💧水表 / ⚡电表）
2. 用户选择类型，启动对应 BLE 扫描流
3. 扫描结果列表（名称、MAC、信号强度）
4. 用户点击设备 → SDK init → 持久化 → 导航到详情页

### 配件扫描模式
1. 页面不显示类型选择器，直接启动指定类型的 BLE 扫描流
2. 扫描结果列表
3. 用户点击设备 → SDK init（自动传入 lockData）→ 持久化（含 boundLockMac）
4. pop 回配件列表页（列表自动刷新）

### 设备扫描 API 映射
| DeviceType | BLE 扫描流 | SDK init |
|-----------|-----------|----------|
| lock | `TTLock.lock.lockScanLock()` | `api.initLock(params)` |
| gateway | `TTLock.gateway.gatewayStartScan()` | `api.gatewayConnect(gatewayMac)` |
| doorSensor | `TTLock.doorSensor.accessoryStartScanDoorSensor()` | `api.initDoorSensor(mac, lockData)` |
| remoteKey | `TTLock.remoteKey.accessoryStartScanRemoteKey()` | `api.addRemoteKey(mac, ..., lockData)` |
| keypad | `TTLock.remoteKeypad.accessoryStartScanRemoteKeypad()` | `api.initKeypad(mac, lockData)` |
| waterMeter | `TTLock.waterMeter.accessoryWaterMeterStartScan()` | `api.waterMeterInit(mac, ...)` |
| electricMeter | `TTLock.electricMeter.accessoryElectricMeterStartScan()` | `api.electricMeterInit(mac, ...)` |

## 锁详情页设计

3 个 Section 垂直排列，使用 ListView。

### Section 1：控制命令
开关锁大按钮（主操作），下方按分组列出命令：

- **Control**: Unlock / Lock / Get Switch State / Get Power / Set Time / Get Time / Get Operate Record
- **Passcode**: Create Custom Passcode / Get All Passcodes / Get Admin Passcode / Modify Admin Passcode / Modify Passcode / Delete Passcode / Reset Passcode / Set Erase Passcode / Recover Passcode
- **Card**: Get All Cards / Clear All Cards / Modify Card Validity Period / Delete Card / Report Loss Card
- **Fingerprint**: Get All Fingerprints / Clear All Fingerprints / Modify Fingerprint Validity Period
- **Face**: Get All Face / Clear Face / Delete Face
- **Config**: Auto Lock Time / Remote Unlock / Audio / Direction / Sound Volume / Sensitivity / Power Saver
- **System**: System Info / Feature Value / Reset Lock / Reset Ekey
- **Network**: Config WiFi / Get WiFi Info / Config Server
- **Advanced**: Passage Mode / Lift Control / IP Config / NB-IoT Server / Hotel Mode

**命令参数配置**：需要参数的命令点击后弹出 BottomSheet/Dialog，示例：
- 创建密码 → 密码输入 + 日期范围选择器
- 设置自动锁定 → 滑动条秒数选择
- 配置 WiFi → SSID + 密码输入
- 配置服务器 → IP + Port 输入
- 修改有效期 → 日期选择器

### Section 2：配件入口
三行独立入口，显示当前类型已绑定数量，点击跳转对应列表页：

```
🔗 Door Sensor      (1)  >
🔗 Remote Keys      (2)  >
🔗 Keypad           (0)  >
```

每个入口显示箭头图标引导点击。

### Section 3：锁配置
- 音频开关
- 音量等级
- 开门方向
- 自动锁定时间
- 通行模式管理
- 双认证开关
- WiFi 配网
- 电梯控制
- 重置锁

## 配件管理页面

### 配件列表页（3 个页面，统一模式）
- 顶部显示所属锁名称
- ListView 列出该锁的所有该类型配件
- 每个配件项：名称 + MAC + 电量（可选）
- 右上角 FloatingActionButton / AppBar action → "+" → 跳转 ScanPage(配件模式)
- 点击配件 → 导航到配件详情页
- 空状态：友好提示「暂无配件，点击右上角添加」
- 使用 Future build() + state.when 加载数据

### 配件详情页（3 个页面，统一模式）
- 设备基本信息（名称、MAC、电量、型号）
- 功能操作（按设备类型）：
  - 门磁：开门报警开关、消息推送设置
  - 遥控器：有效期设置
  - 键盘：添加指纹/卡片入口
- 底部「解绑/删除」按钮
- 重命名（点击名称编辑）

## Dashboard 设计

### 布局
- AppBar: "TTLock Devices"
- TabBar 横向滚动，各 tab 图标 + 名称
- TabView 切换显示各设备列表

### Tab 列表
| Tab | 图标 | 内容 |
|-----|------|------|
| Locks | 🔒 | 已保存锁列表 |
| Gateways | 📡 | 已保存网关列表 |
| Water Meters | 💧 | 已保存水表列表 |
| Electric Meters | ⚡ | 已保存电表列表 |

### 设备卡片
每个设备卡片：图标 + 名称 + MAC + 电量（通过 SDK 查询），点击导航到详情页。

使用 Future build() + state.when 异步加载。

## 数据模型

### 锁设备
```dart
@freezed
class SavedLockDevice with _$SavedLockDevice {
  const factory SavedLockDevice({
    required String name,
    required String mac,
    required String lockData,
    required TTLockVersion lockVersion,
    required DateTime initializedAt,
  }) = _SavedLockDevice;
  factory SavedLockDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedLockDeviceFromJson(json);
}
```

### 网关设备
```dart
@freezed
class SavedGatewayDevice with _$SavedGatewayDevice {
  const factory SavedGatewayDevice({
    required String name,
    required String mac,
    required String gatewayModel,
    required DateTime initializedAt,
  }) = _SavedGatewayDevice;
  factory SavedGatewayDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedGatewayDeviceFromJson(json);
}
```

### 门磁
```dart
@freezed
class SavedDoorSensor with _$SavedDoorSensor {
  const factory SavedDoorSensor({
    required String name,
    required String mac,
    required String boundLockMac,
    required DateTime initializedAt,
  }) = _SavedDoorSensor;
  factory SavedDoorSensor.fromJson(Map<String, dynamic> json) =>
      _$SavedDoorSensorFromJson(json);
}
```

### 遥控器
```dart
@freezed
class SavedRemoteKey with _$SavedRemoteKey {
  const factory SavedRemoteKey({
    required String name,
    required String mac,
    required String boundLockMac,
    required DateTime initializedAt,
  }) = _SavedRemoteKey;
  factory SavedRemoteKey.fromJson(Map<String, dynamic> json) =>
      _$SavedRemoteKeyFromJson(json);
}
```

### 键盘
```dart
@freezed
class SavedKeypad with _$SavedKeypad {
  const factory SavedKeypad({
    required String name,
    required String mac,
    required String boundLockMac,
    required bool isMultiFunction,
    required DateTime initializedAt,
  }) = _SavedKeypad;
  factory SavedKeypad.fromJson(Map<String, dynamic> json) =>
      _$SavedKeypadFromJson(json);
}
```

### 水电表
```dart
@freezed
class SavedMeterDevice with _$SavedMeterDevice {
  const factory SavedMeterDevice({
    required String name,
    required String mac,
    required String meterId,
    required String meterType,  // 'water' | 'electric'
    required DateTime initializedAt,
  }) = _SavedMeterDevice;
  factory SavedMeterDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedMeterDeviceFromJson(json);
}
```

### 状态模型（freezed）
各页面异步状态通过 `state.when` 处理，无需额外状态模型（Provider 直接返回设备列表数据）。

## 持久化层

### Storage 类
每个 Storage 类封装 SharedPreferences 的 JSON 序列化/反序列化：

- `LockStorage` → key `saved_locks` → `List<SavedLockDevice>`
- `GatewayStorage` → key `saved_gateways` → `List<SavedGatewayDevice>`
- `AccessoryStorage` → key `saved_accessories` → `List<SavedDoorSensor | SavedRemoteKey | SavedKeypad>`（统一存储，type 字段区分）
- `MeterStorage` → key `saved_meters` → `List<SavedMeterDevice>`

锁的 `SavedLockDevice` 保留现有 `SavedDevice` 迁移方案。

### Provider 封装
```dart
@riverpod
class LockListNotifier extends _$LockListNotifier {
  @override
  Future<List<SavedLockDevice>> build() async => LockStorage.load();
  Future<void> addDevice(SavedLockDevice device) async { ... }
  Future<void> removeDevice(String mac) async { ... }
}

@riverpod
class AccessoryListNotifier extends _$AccessoryListNotifier {
  @override
  Future<List<SavedDoorSensor>> build(String lockMac) async {
    final all = await AccessoryStorage.loadDoorSensors();
    return all.where((a) => a.boundLockMac == lockMac).toList();
  }
  ...
}
```

## Provider 架构

```
Page Layer (只消费)
  DashboardPage → ref.watch(lockListProvider), ref.watch(gatewayListProvider), ...
  ScanPage → ref.watch(scanNotifierProvider)
  LockPage → ref.watch(lockDataProvider(mac)), ref.watch(accessoryCountProvider(mac))
  AccessoryListPage → ref.watch(accessoryListProvider(lockMac))
  AccessoryInfoPage → ref.read(xxxProvider)

Feature Provider Layer (@riverpod codegen)
  lockListProvider → LockStorage
  gatewayListProvider → GatewayStorage
  accessoryListProvider(mac) → AccessoryStorage (过滤 boundLockMac)
  meterListProvider → MeterStorage
  scanNotifierProvider → TTLock APIs (BLE 扫描)
  lockDetailProvider(mac) → LockStorage + TTLock APIs

Storage Layer (纯读写)
  LockStorage / GatewayStorage / AccessoryStorage / MeterStorage
  (SharedPreferences + jsonEncode/decode)
```

**规则**：
- 页面不直接 import Storage 类
- 所有异步数据通过 `Future<> build()` 加载 + `state.when` 展示
- Feature Provider 提供命令式方法（addDevice, removeDevice 等）

## 文件变更清单

### 新增文件（~18 个）

**模型** (`lib/features/settings/model/`):
- `saved_gateway_device.dart` + `.freezed.dart` + `.g.dart`
- `saved_door_sensor.dart` + `.freezed.dart` + `.g.dart`
- `saved_remote_key.dart` + `.freezed.dart` + `.g.dart`
- `saved_keypad.dart` + `.freezed.dart` + `.g.dart`
- `saved_meter_device.dart` + `.freezed.dart` + `.g.dart`

**存储** (`lib/core/storage/`):
- `gateway_storage.dart`
- `accessory_storage.dart`（门磁/遥控器/键盘统一存储）
- `meter_storage.dart`（水电表）

**组件** (`lib/`):
- `features/scan/scan_config.dart` — ScanConfig + ScanMode
- `features/lock/widgets/command_dialog.dart` — 命令参数配置弹窗
- `features/lock/widgets/accessory_entry_section.dart` — 配件入口组件
- `core/widgets/device_type_selector.dart` — 设备类型选择器
- `core/widgets/device_card.dart` (已有，增强)

**页面** (`lib/features/`):
- `door_sensor/door_sensor_list_page.dart`
- `door_sensor/door_sensor_info_page.dart`
- `remote_key/remote_key_list_page.dart`
- `remote_key/remote_key_info_page.dart`
- `remote_keypad/keypad_list_page.dart`
- `remote_keypad/keypad_info_page.dart`

### 修改文件（~12 个）

- `features/scan/scan_page.dart` — 接收 ScanConfig 参数，支持两种模式
- `features/scan/scan_provider.dart` — 多类型扫描逻辑重构
- `features/lock/lock_page.dart` — 3 Section 布局重写
- `features/lock/lock_provider.dart` — 重构为 Section 数据聚合
- `features/dashboard/dashboard_page.dart` — TabBar 分类展示
- `features/dashboard/dashboard_provider.dart` — 聚合各设备类型
- `features/gateway/gateway_page.dart` — 完善功能 + 状态持久化
- `features/gateway/gateway_provider.dart` — 添加持久化支持
- `core/router/routes.dart` — 添加新路由定义
- `core/router/app_router.dart` — 注册新路由
- `core/storage/device_storage.dart` → 更名/适配为 `lock_storage.dart`
- `core/storage/device_provider.dart` → 适配新锁模型

### 删除
- `features/settings/model/saved_device.dart`（替换为 SavedLockDevice）
- `features/settings/model/saved_device.freezed.dart`
- `features/settings/model/saved_device.g.dart`

## 实施阶段

### Phase 1: 数据模型 + 存储层
1. 创建所有 freezed 模型文件（5 个 saved_*）
2. 创建 3 个 Storage 类
3. 迁移现有 SavedDevice → SavedLockDevice
4. `build_runner build` 生成代码
5. `flutter analyze` 验证

### Phase 2: 路由 + 扫描页
6. 创建 ScanConfig 模型
7. 重写 ScanPage/ScanProvider
8. 更新路由定义（routes.dart + app_router.dart）
9. 验证扫描流程

### Phase 3: Dashboard TabBar
10. 重写 DashboardPage/DashboardProvider
11. 实现 TabBar + 各设备类型列表
12. 验证分类展示

### Phase 4: 锁详情重构
13. 创建 command_dialog 组件
14. 创建 accessory_entry_section 组件
15. 重写 LockPage/LockProvider

### Phase 5: 配件管理
16. 创建 3 个配件列表页
17. 创建 3 个配件详情页
18. 验证完整配件管理流程

### Phase 6: 收尾
19. 完善网关页面
20. 完善其他页面
21. 全量运行 analyze + test

## 验证标准
- `fvm flutter pub get` 无错误
- `fvm dart run build_runner build --delete-conflicting-outputs` 成功
- `fvm flutter analyze` 零错误零警告
- `fvm flutter test` 所有测试通过
- `fvm flutter run` 可正常启动，扫描/配件/锁控制各流程可操作
