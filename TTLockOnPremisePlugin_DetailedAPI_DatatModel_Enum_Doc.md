## TTLock Flutter Plugin（On-Premise）详细文档：接口 / 数据模型 / Enum（Dart侧）

> 目标：把 `ttlock_flutter_onpremise` 插件端所有“可被 Flutter 调用的接口（API/Stream）”、对应的“请求/返回数据模型（Map字段 -> Dart Model）”、以及“Dart enum 定义”做成一份可维护的技术文档。

---

## 1. 范围与术语

- **Dart侧接口**：`lib/ttlock.dart` 导出的 `TTLockApi` / `TTGatewayApi` / `TTAccessoryApi` 以及其方法签名与返回类型。
- **通信协议层**（Dart <-> Android 原生）：
  - `MethodChannel`：执行一次性命令（`invoke`/`send`）。
  - `EventChannel`：执行持续命令（扫描/进度类），以事件流形式回传。
- **数据模型**：`lib/models/*.dart` 中的 class，用于把原生 `Map<String, dynamic>` 转成强类型对象（以及少量参数类用于序列化）。
- **enum**：主要来自 `lib/models/enums.dart`（Dart侧所有 enum）。

---

## 2. 对外入口（Flutter 侧如何访问）

### 2.1 插件入口：`TTLock`

文件：`lib/ttlock.dart`

- `TTLock.lock`：类型 `TTLockApi`（默认实现 `TTLockImpl`）
- `TTLock.gateway`：类型 `TTGatewayApi`（默认实现 `TTGatewayImpl`）
- `TTLock.accessory`：类型 `TTAccessoryApi`（默认实现 `TTAccessoryImpl`）
- `TTLock.platform`：底层平台实现 `TTLockPlatform`（默认 `TTLockMethodChannel`）

`TTLock` 还暴露：
- `TTLock.printLog`：控制原生事件是否打印到日志

### 2.2 三个核心抽象接口

文件：`lib/api/tt_lock_api.dart`、`lib/api/tt_gateway_api.dart`、`lib/api/tt_accessory_api.dart`

- `abstract class TTLockApi`
- `abstract class TTGatewayApi`
- `abstract class TTAccessoryApi`

### 2.3 事件/流统一抽象

文件：`lib/src/platform/tt_lock_platform.dart`

- `TTLockPlatform.invoke(command, params)`：一次性命令，返回 `Future<Map<String, dynamic>>`
- `TTLockPlatform.send(command, params)`：不等待返回（用于 stop-scan / disconnect 等）
- `TTLockPlatform.eventStream(command, params)`：返回 `Stream<PlatformStreamEvent>`

`PlatformStreamEvent`（文件：`lib/models/events.dart`）：
- `isProgress`：是否为进度事件
- `data`：事件数据 `Map<String, dynamic>`

---

## 3. 原生通信协议（MethodChannel / EventChannel）

### 3.1 Channel 名称

- `MethodChannel`：`com.ttlock/command/ttlock`
- `EventChannel`：`com.ttlock/listen/ttlock`

文件对应：
- Dart：`lib/src/platform/tt_lock_method_channel.dart`
- Android：`android/src/main/java/com/ttlock/ttlock_flutter/constant/TTLockCommand.java`

### 3.2 MethodChannel：命令执行语义

文件：`lib/src/platform/tt_lock_method_channel.dart`

- `invoke(command, params)`：
  1. 确保已订阅 EventChannel 广播（`TTLockListen`）。
  2. 若同一个 `command` 已存在未完成的 completer，会用 `TTException(code:-1, message:'Superseded by a new request')` 结束旧请求。
  3. 调用 `_commandChannel.invokeMethod(command, params)`
  4. 等待对应 `command` 的成功事件（最终事件）返回 `data` Map。
- `send(command, params)`：
  - 不关心返回，直接调用 `invokeMethod`。
  - 额外逻辑：如果 `command` 是某些 `stopScanXxx`，会关闭对应 `startScanXxx` 的流（通过 `TTCommands.scanStopToStartMap`）。
- `eventStream(command, params)`：
  - 创建一个 `StreamController.broadcast()`，并同样调用 `_commandChannel.invokeMethod(command, params)`。
  - 该流的关闭策略由 `_shouldCloseStreamOnSuccess` / stop-scan send 共同决定。

### 3.3 EventChannel：广播事件结构

Dart 在 `_onEvent` 中解析原生事件 Map（简化后的字段约定）：

- `command`：`String`，用于路由到具体请求/流
- `data`：`Map?`，用于成功/进度事件的业务数据
- `resultState`：`int`
  - `1`：进度事件（progress）
  - `2`：错误事件（error）
  - 其它：成功事件（success）

错误事件还包含（同样从 event Map 取）：
- `errorCode`：`int`
- `errorMessage`：`String?`

### 3.4 Stream 生命周期（非常重要）

文件：`lib/src/platform/tt_lock_method_channel.dart`

1. **startScanXxx（多设备扫描）流**
   - `TTCommands.scanStartCommands` 中的命令：在成功事件到来时不会自动 close。
   - 关闭时机通常来自你调用对应 `stopScanXxx()`，因为 `send()` 会基于 `TTCommands.scanStopToStartMap` 关闭流。

2. **scanWifi / getSurroundWifi**
   - 在成功事件时，根据 `data['finished'] == true` 决定是否 close。

3. **addCard / addFingerprint / addFace 等“进度式 enroll”**
   - 进度事件 `isProgress==true` 会持续产出
   - 最终完成事件 `isProgress==false` 时按 `_shouldCloseStreamOnSuccess` 默认 close。

4. **特殊：多功能键盘 add fingerprint 的部分错误不会立刻 close**
   - 条件：`command == TTCommands.multifunctionalKeypadAddFingerprint && data['errorDevice'] == TTErrorDevice.keyPad.value`

---

## 4. 接口总览（Lock / Gateway / Accessory）

以下“command 名称”来自 Dart 的 `lib/src/constants/commands.dart`（`TTCommands`）。

> 说明：下表的“请求字段/响应字段”均以 `TTLockImpl/TTGatewayImpl/TTAccessoryImpl` 中构造参数与解析 Map 的字段为准；这是最准确的“当前版本协议”。

---

### 4.1 Lock：`TTLockApi`（`TTLock.lock`）

文件：`lib/api/tt_lock_api.dart` / 实现：`lib/src/impl/tt_lock_impl.dart`

#### 4.1.1 Scan & Bluetooth

| API 方法 | 通信方式 | command | 请求字段 | 返回/事件字段 |
|---|---|---|---|---|
| `Stream<TTLockScanModel> startScanLock()` | EventStream | `startScanLock` | （空） | 每次事件 `data` -> `TTLockScanModel.fromMap` |
| `Future<void> stopScanLock()` | send | `stopScanLock` | （空） | void |
| `Future<TTBluetoothState> getBluetoothState()` | invoke | `getBluetoothState` | （空） | 返回 `state:int` -> `TTBluetoothState.fromValue` |

`TTLockScanModel` 来自 `lib/models/scan_models.dart`（字段见第 5 节）。

#### 4.1.2 Init & Reset

| API 方法 | 通信方式 | command | 请求字段 | 返回字段 |
|---|---|---|---|---|
| `Future<String> initLock(TTLockInitParams params)` | invoke | `initLock` | `params.toMap()`：`lockMac, lockVersion, isInited, clientPara?, hotelInfo?, buildingNumber?, floorNumber?` | `lockData:string` |
| `Future<void> resetLock(String lockData)` | invoke | `resetLock` | `lockData` | void |
| `Future<String> resetEkey(String lockData)` | invoke | `resetEkey` | `lockData` | `lockData:string` |
| `Future<void> resetLockByCode({lockMac, resetCode})` | invoke | `resetLockByCode` | `lockMac, resetCode` | void |
| `Future<void> verifyLock(String lockMac)` | invoke | `verifyLock` | `lockMac` | void |

#### 4.1.3 Control（开锁/关锁/状态）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `Future<ControlLockResult> controlLock(String lockData, TTControlAction action)` | `controlLock` | `lockData, controlAction: action.value` | `lockTime, electricQuantity, uniqueId, lockData?` -> `ControlLockResult.fromMap` |
| `Future<TTLockSwitchState> getLockSwitchState(String lockData)` | `getLockSwitchState` | `lockData` | `lockSwitchState:int` -> `TTLockSwitchState.fromValue` |
| `Future<bool> supportFunction(TTLockFunction function, String lockData)` | `functionSupport` | `lockData, supportFunction:function.value` | `isSupport:bool` |

#### 4.1.4 Passcode（密码）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `createCustomPasscode(...)` | `createCustomPasscode` | `passcode, startDate, endDate, lockData` | void |
| `modifyPasscode(...)` | `modifyPasscode` | `passcodeOrigin, passcodeNew?, startDate, endDate, lockData` | void |
| `deletePasscode(...)` | `deletePasscode` | `passcode, lockData` | void |
| `resetPasscode(lockData)` | `resetPasscodes` | `lockData` | `lockData:string` |
| `getAdminPasscode(lockData)` | `getAdminPasscodeWithLockData` | `lockData` | `adminPasscode:string` |
| `setErasePasscode(...)` | `setAdminErasePasscode` | `erasePasscode, lockData` | void |
| `getAllValidPasscodes(lockData)` | `getAllValidPasscode` | `lockData` | `passcodeListString:string` -> `jsonDecode` -> `List` |
| `recoverPasscode(...)` | `recoverPasscodeWithPasswordType` | `passcode, passcodeNew, type, cycleType, startDate, endDate, lockData` | void |
| `modifyAdminPasscode(...)` | `modifyAdminPasscode` | `adminPasscode, lockData` | `lockData?` |
| `getPasscodeVerificationParams(lockData)` | `getPasscodeVerificationParamsWithLockData` | `lockData` | `lockData:string`（若为 null -> ''） |

#### 4.1.5 Card（IC卡）

| API 方法 | 通信方式 | command | 请求字段 | 事件/返回字段 |
|---|---|---|---|---|
| `Stream<AddCardEvent> addCard(...)` | EventStream | `addCard` | `startDate,endDate,lockData, cycleJsonList?(TTCycleModel.encodeList)` | progress: 仅 `AddCardProgress`；完成：`cardNumber:string` |
| `modifyCardValidityPeriod(...)` | invoke | `modifyIcCard` | `cardNumber,startDate,endDate,lockData, cycleJsonList?` | void |
| `deleteCard(...)` | invoke | `deleteIcCard` | `cardNumber,lockData` | void |
| `getAllValidCards(lockData)` | invoke | `getAllValidIcCard` | `lockData` | `cardListString:string` -> `jsonDecode` -> `List` |
| `clearAllCards(lockData)` | invoke | `clearAllIcCard` | `lockData` | void |
| `recoverCard(...)` | invoke | `recoverCardWithCardType` | `cardNumber,startDate,endDate,lockData` | void |
| `reportLossCard(...)` | invoke | `reportLossCard` | `cardNumber,lockData` | void |

#### 4.1.6 Fingerprint（指纹）

| API 方法 | 通信方式 | command | 请求字段 | 事件/返回字段 |
|---|---|---|---|---|
| `Stream<AddFingerprintEvent> addFingerprint(...)` | EventStream | `addFingerprint` | `startDate,endDate,lockData, cycleJsonList?` | progress：`currentCount:int,totalCount:int`；完成：`fingerprintNumber:string` |
| `modifyFingerprintValidityPeriod(...)` | invoke | `modifyFingerprint` | `fingerprintNumber,startDate,endDate,lockData, cycleJsonList?` | void |
| `deleteFingerprint(...)` | invoke | `deleteFingerprint` | `fingerprintNumber,lockData` | void |
| `getAllValidFingerprints(lockData)` | invoke | `getAllValidFingerprint` | `lockData` | `fingerprintListString:string` -> `jsonDecode` -> `List` |
| `clearAllFingerprints(lockData)` | invoke | `clearAllFingerprint` | `lockData` | void |

#### 4.1.7 Face（人脸）

| API 方法 | 通信方式 | command | 请求字段 | 事件/返回字段 |
|---|---|---|---|---|
| `Stream<AddFaceEvent> addFace(...)` | EventStream | `faceAdd` | `startDate,endDate,lockData, cycleJsonList?` | progress：`state:int -> TTFaceState`、`errorCode:int -> TTFaceErrorCode`；完成：`faceNumber:string` |
| `Future<String> addFaceData(...)` | invoke | `faceDataAdd` | `startDate,endDate,lockData,faceFeatureData, cycleJsonList?` | `faceNumber:string` |
| `modifyFace(...)` | invoke | `faceModify` | `faceNumber,startDate,endDate,lockData, cycleJsonList?` | void |
| `deleteFace(...)` | invoke | `faceDelete` | `lockData,faceNumber` | void |
| `clearFace(lockData)` | invoke | `faceClear` | `lockData` | void |

#### 4.1.8 Time（锁内时间与工作时段）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `setLockTime(timestamp, lockData)` | `setLockTime` | `timestamp, lockData` | void |
| `getLockTime(lockData)` | `getLockTime` | `lockData` | `timestamp:int` |
| `setLockWorkingTime(startDate, endDate, lockData)` | `setLockWorkingTime` | `startDate,endDate,lockData` | void |

#### 4.1.9 Records / Power / System

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getLockOperateRecord(type, lockData)` | `getLockOperateRecord` | `logType:type.value, lockData` | `records:string?`（null -> ''） |
| `getLockPower(lockData)` | `getLockPower` | `lockData` | `electricQuantity:int` |
| `getLockSystemInfo(lockData)` | `getLockSystemInfoWithLockData` | `lockData` | 直接传入 `TTLockSystemModel.fromMap` |
| `getLockFeatureValue(lockData)` | `getLockFreatureValue` | `lockData` | `lockData:string`（字段名为 lockData） |

#### 4.1.10 Auto Locking（自动上锁）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getAutoLockingPeriodicTime(lockData)` | `getLockAutomaticLockingPeriodicTime` | `lockData` | `currentTime,minTime,maxTime` -> `AutoLockingTime.fromMap` |
| `setAutoLockingPeriodicTime(seconds, lockData)` | `setLockAutomaticLockingPeriodicTime` | `currentTime: seconds, lockData` | void |

#### 4.1.11 Remote Unlock Switch（远程解锁开关）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getRemoteUnlockSwitchState(lockData)` | `getLockRemoteUnlockSwitchState` | `lockData` | `isOn:bool` |
| `setRemoteUnlockSwitchState(isOn, lockData)` | `setLockRemoteUnlockSwitchState` | `isOn, lockData` | `lockData:string`（更新后的 lockData） |

#### 4.1.12 Config（锁配置开关）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getLockConfig(config, lockData)` | `getLockConfig` | `lockData, lockConfig: config.value` | `isOn:bool` |
| `setLockConfig(config, isOn, lockData)` | `setLockConfig` | `isOn, lockData, lockConfig` | void |

#### 4.1.13 Direction（左右开门/手持方向）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getLockDirection(lockData)` | `getLockDirection` | `lockData` | `direction:int` |
| `setLockDirection(direction, lockData)` | `setLockDirection` | `lockData, direction:int` | void |

#### 4.1.14 Passage Mode（门禁通行模式）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `addPassageMode(type, weekly?, monthly?, startTime, endTime, lockData)` | `addPassageMode` | `passageModeType:type.value, startDate:startTime, endDate:endTime, lockData, weekly? or monthly?` | void |
| `clearAllPassageModes(lockData)` | `clearAllPassageModes` | `lockData` | void |

#### 4.1.15 Lift / Power Saver / Hotel / Version / NB / WiFi / Sound & Sensitivity / RemoteAccessory / Upgrade

> 以下所有“字段名”均来自 `lib/src/impl/tt_lock_impl.dart` 中组装 params 的 key，以及 `TTLockImpl` 中从返回 `data` 里读取的 key。

##### 4.1.15.1 Lift（升降/楼层控制）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `activateLift(floors, lockData)` | `activateLiftFloors` | `floors, lockData` | `lockTime, electricQuantity, uniqueId, lockData?` -> `ControlLockResult.fromMap` |
| `setLiftControlable(floors, lockData)` | `setLiftControlableFloors` | `floors, lockData` | void |
| `setLiftWorkMode(type, lockData)` | `setLiftWorkMode` | `liftWorkActiveType: type.value, lockData` | void |

##### 4.1.15.2 Power Saver（省电模式）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `setPowerSaverWorkMode(type, lockData)` | `setPowerSaverWorkMode` | `powerSaverType: type.value, lockData` | void |
| `setPowerSaverControlableLock(lockMac, lockData)` | `setPowerSaverControlable` | `lockMac, lockData` | void |

##### 4.1.15.3 Hotel（酒店信息）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `setHotel(hotelInfo, buildingNumber, floorNumber, lockData)` | `setHotelInfo` | `hotelInfo, buildingNumber, floorNumber, lockData` | void |
| `setHotelCardSector(sector, lockData)` | `setHotelCardSector` | `sector, lockData` | void |

##### 4.1.15.4 Version / NB-IoT（固件版本 / NB服务器）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `getLockVersion(lockMac)` | `getLockVersion` | `lockMac` | `lockVersion:string` |
| `setNBServerAddress(ip, port, lockData)` | `setNBServerAddress` | `ip, port, lockData` | `electricQuantity:int`（返回电量） |

##### 4.1.15.5 WiFi Lock（锁内 WiFi 设置与扫描）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<List<dynamic>> scanWifi(lockData)` | EventStream | `scanWifi` | `lockData`（params: `{lockData: ...}`） | 每次事件 `e.data['wifiList']` |
| `configWifi(wifiName, wifiPassword, lockData)` | invoke | `configWifi` | `wifiName, wifiPassword, lockData` | void |
| `configServer(ip, port, lockData)` | invoke | `configServer` | `ip, port, lockData` | void |
| `getWifiInfo(lockData)` | invoke | `getWifiInfo` | `lockData` | `TTWifiInfoModel.fromMap`（`wifiMac, wifiRssi`） |
| `configIp(ipSetting, lockData)` | invoke | `configIp` | `ipSetting.toMap()` + `lockData` + `ipSettingJsonStr=jsonEncode(ipSetting.toMap())` | void |
| `configCameraLockWifi(wifiName, wifiPassword, lockData)` | invoke | `configCameraLockWifi` | `wifiName, wifiPassword, lockData` | `CameraLockWifiResult.fromMap`（`videoModuleSerialNumber, wifiName`） |

##### 4.1.15.6 Sound / Sensitivity（声音与灵敏度）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `setSoundVolume(type, lockData)` | `setLockSoundWithSoundVolume` | `soundVolumeType: type.value, lockData` | void |
| `getSoundVolume(lockData)` | `getLockSoundWithSoundVolume` | `lockData` | `soundVolumeType:int` -> `TTSoundVolumeType.fromValue` |
| `setSensitivity(value, lockData)` | `setSensitivity` | `lockData, sensitivityValue: value.value` | void |

##### 4.1.15.7 Remote Accessory（锁上远程配件：远程钥匙/门磁）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `addRemoteKey(remoteKeyMac, cycleList?, startDate, endDate, lockData)` | `lockAddRemoteKey` | `mac, cycleJsonList?(TTCycleModel.encodeList), startDate, endDate, lockData` | void |
| `deleteRemoteKey(remoteKeyMac, lockData)` | `lockDeleteRemoteKey` | `mac, lockData` | void |
| `clearRemoteKey(lockData)` | `clearRemoteKey` | `lockData` | void |
| `setRemoteKeyValidDate(remoteKeyMac, cycleList?, startDate, endDate, lockData)` | `lockModifyRemoteKeyValidDate` | `mac, cycleJsonList?(...), startDate, endDate, lockData` | void |
| `getRemoteAccessoryElectricQuantity(accessory, mac, lockData)` | `lockGetRemoteAccessoryElectricQuantity` | `remoteAccessory: accessory.value, mac, lockData` | `AccessoryElectricQuantityResult.fromMap`（`electricQuantity, updateDate`） |
| `addDoorSensor(doorSensorMac, lockData)` | `lockAddDoorSensor` | `mac, lockData` | void |
| `deleteDoorSensor(lockData)` | `lockDeleteDoorSensor` | `lockData` | void |
| `setDoorSensorAlertTime(alertTime, lockData)` | `lockSetDoorSensorAlertTime` | `alertTime, lockData` | void |

> 说明：`setDoorSensorSwitch/getDoorSensorSwitchState/getDoorSensorState` 在 Dart 侧目前是注释掉（未纳入 `TTLockApi` 的公开方法）。

##### 4.1.15.8 Upgrade（进入升级模式）

| API 方法 | command | 请求字段 | 返回字段 |
|---|---|---|---|
| `setLockEnterUpgradeMode(lockData)` | `setLockEnterUpgradeMode` | `lockData` | void |

---

### 4.2 Gateway：`TTGatewayApi`（`TTLock.gateway`）

文件：`lib/api/tt_gateway_api.dart` / 实现：`lib/src/impl/tt_gateway_impl.dart`

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<TTGatewayScanModel> startScan()` | EventStream | `startScanGateway` | （空） | `TTGatewayScanModel.fromMap(data)` |
| `Future<void> stopScan()` | send | `stopScanGateway` | （空） | void |
| `Future<TTGatewayConnectStatus> connect(String mac)` | invoke | `connectGateway` | `mac` | `status:int -> TTGatewayConnectStatus` |
| `Future<void> disconnect(String mac)` | invoke | `disconnectGateway` | `mac` | void |
| `Stream<List<dynamic>> getNearbyWifi()` | EventStream | `getSurroundWifi` | （无显式参数） | 事件：`data['wifiList']`（`List<dynamic>`） |
| `Future<Map<String, dynamic>> init(TTGatewayInitParams params)` | invoke | `initGateway` | `params.toMap()` + `addGatewayJsonStr=params.toJsonStr()` | 直接返回 Map |
| `Future<void> configIp(TTIpSetting ipSetting)` | invoke | `gatewayConfigIp` | `ipSetting.toMap()` + `ipSettingJsonStr` | void |
| `Future<void> configApn({mac, apn})` | invoke | `gatewayConfigApn` | `mac, apn` | void |
| `Future<String?> getNetworkMac()` | invoke | `getNetworkMac` | （空） | `networkMac:string?` |
| `Future<void> enterUpgradeMode(String mac)` | invoke | `upgradeGateway` | `mac` | void |

---

### 4.3 Accessory：`TTAccessoryApi`（`TTLock.accessory`）

文件：`lib/api/tt_accessory_api.dart` / 实现：`lib/src/impl/tt_accessory_impl.dart`

#### 4.3.1 Remote Key

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<TTRemoteAccessoryScanModel> startScanRemoteKey()` | EventStream | `startScanRemoteKey` | （空） | `TTRemoteAccessoryScanModel.fromMap(data)` |
| `Future<void> stopScanRemoteKey()` | send | `stopScanRemoteKey` | （空） | void |
| `Future<TTLockSystemModel> initRemoteKey({mac, lockData})` | invoke | `initRemoteKey` | `mac, lockData` | `TTLockSystemModel.fromMap(data)` |

#### 4.3.2 Remote Keypad（标准/多功能）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<TTRemoteAccessoryScanModel> startScanRemoteKeypad()` | EventStream | `startScanRemoteKeypad` | （空） | `TTRemoteAccessoryScanModel` |
| `Future<void> stopScanRemoteKeypad()` | send | `remoteKeypadStopScan` | （空） | void |
| `Future<RemoteKeypadInitResult> initRemoteKeypad({mac, lockMac})` | invoke | `remoteKeypadInit` | `mac, lockMac` | `RemoteKeypadInitResult.fromMap` |
| `Future<MultifunctionalKeypadInitResult> initMultifunctionalKeypad({mac, lockData})` | invoke | `multifunctionalRemoteKeypadInit` | `mac, lockData` | `MultifunctionalKeypadInitResult.fromMap` |
| `Future<List<dynamic>> getStoredLocks(String mac)` | invoke | `multifunctionalRemoteKeypadGetLocks` | `mac` | `data['lockMacs']` |
| `Future<void> deleteStoredLock({mac, slotNumber})` | invoke | `multifunctionalRemoteKeypadDeleteLock` | `mac, slotNumber` | void |

进度类 enroll：

| API 方法 | 通信方式 | command | 请求字段 | 事件/返回字段 |
|---|---|---|---|---|
| `Stream<AddFingerprintEvent> addKeypadFingerprint(...)` | EventStream | `multifunctionalKeypadAddFingerprint` | `mac,startDate,endDate,lockData, cycleJsonList?` | progress：`currentCount,totalCount`；完成：`fingerprintNumber` |
| `Stream<AddCardEvent> addKeypadCard(...)` | EventStream | `multifunctionalKeypadAddCard` | `startDate,endDate,lockData, cycleJsonList?` | progress：仅 `AddCardProgress`；完成：`cardNumber` |

#### 4.3.3 Door Sensor（门磁/门上传感器）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<TTRemoteAccessoryScanModel> startScanDoorSensor()` | EventStream | `startScanDoorSensor` | （空） | `TTRemoteAccessoryScanModel` |
| `Future<void> stopScanDoorSensor()` | send | `stopScanDoorSensor` | （空） | void |
| `Future<TTLockSystemModel> initDoorSensor({mac, lockData})` | invoke | `doorSensorInit` | `mac, lockData` | `TTLockSystemModel.fromMap` |

#### 4.3.4 Standalone Door Sensor（独立门磁）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `Stream<TTStandaloneDoorSensorScanModel> standaloneDoorSensorStartScan()` | EventStream | `standaloneDoorSensorStartScan` | （空） | `TTStandaloneDoorSensorScanModel` |
| `Future<void> standaloneDoorSensorStopScan()` | send | `standaloneDoorSensorStopScan` | （空） | void |
| `Future<TTStandaloneDoorSensorInfo> standaloneDoorSensorInit({mac, info})` | invoke | `standaloneDoorSensorInit` | `mac, info(Map)` | `TTStandaloneDoorSensorInfo.fromMap` |
| `Future<String> standaloneDoorSensorReadFeatureValue(mac)` | invoke | `standaloneDoorGetFeatureValue` | `mac` | `featureValue:string` |
| `Future<bool> standaloneDoorSensorIsSupportFunction(featureValue, function)` | invoke | `standaloneDoorIsSupportFunction` | `featureValue,function:int` | `isSupport:bool` |

#### 4.3.5 Water Meter / Electric Meter（水表/电表）

下面字段映射来自 `lib/src/impl/tt_accessory_impl.dart`。

##### 4.3.5.1 Water Meter（`TTLock.accessory.*waterMeter*`）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `waterMeterConfigServer(url, clientId, accessToken)` | invoke | `waterMeterConfigServer` | `url, clientId, accessToken` | void |
| `Stream<TTMeterScanModel> waterMeterStartScan()` | EventStream | `waterMeterStartScan` | （空） | `TTMeterScanModel.fromMap`（`name, mac, rssi`） |
| `waterMeterStopScan()` | send | `waterMeterStopScan` | （空） | void |
| `waterMeterConnect(mac)` | invoke | `waterMeterConnect` | `mac` | void |
| `waterMeterDisconnect(mac)` | invoke | `waterMeterDisconnect` | `mac` | void |
| `waterMeterInit(params)` | invoke | `waterMeterInit` | `params: Map<String,dynamic>` | `TTWaterMeterInitResult.fromMap`（`waterMeterId, featureValue?`） |
| `waterMeterDelete(waterMeterId)` | invoke | `waterMeterDelete` | `waterMeterId` | void |
| `waterMeterSetPowerOnOff(isOn)` | invoke | `waterMeterSetPowerOnOff` | `waterMeterId, isOn` | void |
| `waterMeterSetRemainderM3(remainderM3)` | invoke | `waterMeterSetRemainderM3` | `waterMeterId, remainderM3` | void |
| `waterMeterClearRemainderM3()` | invoke | `waterMeterClearRemainderM3` | `waterMeterId` | void |
| `waterMeterReadData()` | invoke | `waterMeterReadData` | `waterMeterId` | `Map<String,dynamic>`（原样返回） |
| `waterMeterSetPayMode(payMode)` | invoke | `waterMeterSetPayMode` | `waterMeterId, payMode` | void |
| `waterMeterCharge(amount)` | invoke | `waterMeterCharge` | `waterMeterId, amount` | void |
| `waterMeterSetTotalUsage(totalM3)` | invoke | `waterMeterSetTotalUsage` | `waterMeterId, totalM3` | void |
| `waterMeterGetFeatureValue(waterMeterId)` | invoke | `waterMeterGetFeatureValue` | `waterMeterId` | `featureValue:string` |
| `waterMeterGetDeviceInfo(waterMeterId)` | invoke | `waterMeterGetDeviceInfo` | `waterMeterId` | `Map<String,dynamic>`（原样返回） |
| `waterMeterIsSupportFunction(featureValue, function)` | invoke | `waterMeterIsSupportFunction` | `featureValue, function` | `isSupport:bool` |
| `waterMeterConfigApn(apn)` | invoke | `waterMeterConfigApn` | `apn` | void |
| `waterMeterConfigMeterServer(ip, port)` | invoke | `waterMeterConfigMeterServer` | `ip, port` | void |
| `waterMeterReset(waterMeterId)` | invoke | `waterMeterReset` | `waterMeterId` | void |

##### 4.3.5.2 Electric Meter（`TTLock.accessory.*electricMeter*`）

| API 方法 | 通信方式 | command | 请求字段 | 返回字段/事件字段 |
|---|---|---|---|---|
| `electricMeterConfigServer(url, clientId, accessToken)` | invoke | `electricMeterConfigServer` | `url, clientId, accessToken` | void |
| `Stream<TTMeterScanModel> electricMeterStartScan()` | EventStream | `electricMeterStartScan` | （空） | `TTMeterScanModel.fromMap`（`name, mac, rssi`） |
| `electricMeterStopScan()` | send | `electricMeterStopScan` | （空） | void |
| `electricMeterConnect(mac)` | invoke | `electricMeterConnect` | `mac` | void |
| `electricMeterDisconnect(mac)` | invoke | `electricMeterDisconnect` | `mac` | void |
| `electricMeterInit(params)` | invoke | `electricMeterInit` | `params: Map<String,dynamic>` | `TTElectricMeterInitResult.fromMap`（`electricMeterId, featureValue?`） |
| `electricMeterDelete(electricMeterId)` | invoke | `electricMeterDelete` | `electricMeterId` | void |
| `electricMeterSetPowerOnOff(isOn)` | invoke | `electricMeterSetPowerOnOff` | `electricMeterId, isOn` | void |
| `electricMeterSetRemainderKwh(remainderKwh)` | invoke | `electricMeterSetRemainderKwh` | `electricMeterId, remainderKwh` | void |
| `electricMeterClearRemainderKwh()` | invoke | `electricMeterClearRemainderKwh` | `electricMeterId` | void |
| `electricMeterReadData()` | invoke | `electricMeterReadData` | `electricMeterId` | `Map<String,dynamic>`（原样返回） |
| `electricMeterSetPayMode(payMode)` | invoke | `electricMeterSetPayMode` | `electricMeterId, payMode` | void |
| `electricMeterCharge(amount)` | invoke | `electricMeterCharge` | `electricMeterId, amount` | void |
| `electricMeterSetMaxPower(maxPower)` | invoke | `electricMeterSetMaxPower` | `electricMeterId, maxPower` | void |
| `electricMeterGetFeatureValue(electricMeterId)` | invoke | `electricMeterGetFeatureValue` | `electricMeterId` | `featureValue:string` |
| `electricMeterIsSupportFunction(featureValue, function)` | invoke | `electricMeterIsSupportFunction` | `featureValue, function` | `isSupport:bool` |

---

## 5. 数据模型（Dart class 字段字典）

以下列出 `lib/models/*.dart` 中对外使用的类型及其字段。

### 5.1 扫描模型（scan_models.dart）

`TTLockScanModel`
- `lockName:String`
- `lockMac:String`
- `isInited:bool`
- `isAllowUnlock:bool`
- `electricQuantity:int`
- `lockVersion:String`
- `lockSwitchState:TTLockSwitchState`（由 `lockSwitchState:int` -> enum）
- `rssi:int`
- `oneMeterRssi:int`
- `timestamp:int`

`TTGatewayScanModel`
- `gatewayName:String`
- `gatewayMac:String`
- `rssi:int`
- `isDfuMode:bool`
- `type:TTGatewayType`（由 `type:int` -> enum）

`TTRemoteAccessoryScanModel`
- `name:String`
- `mac:String`
- `rssi:int`
- `scanTime:int?`
- `isMultifunctionalKeypad:bool`（默认 false）
- `advertisementData:Map<String, dynamic>`（默认 `{}`）

### 5.2 独立门磁（standalone_door_sensor_models.dart）

`TTStandaloneDoorSensorScanModel`
- `name:String`
- `mac:String`
- `rssi:int`
- `scanTime:int?`

`TTStandaloneDoorSensorInfo`
- `doorSensorData:String?`
- `electricQuantity:int?`
- `featureValue:String?`
- `wifiMac:String?`
- `modelNum:String?`
- `hardwareRevision:String?`
- `firmwareRevision:String?`

### 5.3 锁/网关/参数模型（lock_models.dart, gateway_models.dart）

`ControlLockResult`
- `lockTime:int`
- `electricQuantity:int`
- `uniqueId:int`
- `lockData:String?`

`AutoLockingTime`
- `currentTime:int`
- `minTime:int`
- `maxTime:int`

`AccessoryElectricQuantityResult`
- `electricQuantity:int`
- `updateDate:int`

`TTLockSystemModel`
- `modelNum:String?`
- `hardwareRevision:String?`
- `firmwareRevision:String?`
- `electricQuantity:int?`
- `nbOperator:String?`
- `nbNodeId:String?`
- `nbCardNumber:String?`
- `nbRssi:String?`
- `lockData:String?`

`TTCycleModel`（用于循环周期）
- `weekDay:int`
- `startTime:int`
- `endTime:int`
- `toJson()`：返回 `{weekDay,startTime,endTime}`
- `encodeList(List<TTCycleModel>?)`：
  - 返回字符串（`jsonEncode(list.map(toJson).toList())`）

`TTWifiInfoModel`
- `wifiMac:String`
- `wifiRssi:int`

`CameraLockWifiResult`
- `serialNumber:String`（原生字段：`videoModuleSerialNumber`）
- `wifiName:String`

`TTLockInitParams`
- `lockMac:String`
- `lockVersion:String`
- `isInited:bool`
- `clientPara:String?`
- `hotelInfo:String?`
- `buildingNumber:int?`
- `floorNumber:int?`
- `toMap()`：不做 jsonEncode，只返回 Map（由 `TTLockImpl` 直接传给原生）

`TTIpSetting`
- `type:int`（通常由 `TTIpSettingType` enum 的 value 提供）
- `ipAddress:String?`
- `subnetMask:String?`
- `router:String?`
- `preferredDns:String?`
- `alternateDns:String?`
- `toMap()`：把 type + 可选字段组装成 Map

`TTGatewayInitParams`
- `type:int`
- `ttlockUid:int`
- `gatewayName:String?`
- `ttlockLoginPassword:String`（默认 `'123456'`）
- `wifi:String?`
- `wifiPassword:String?`
- `serverIp:String?`
- `serverPort:String?`
- `companyId:int?`
- `branchId:int?`
- `toMap()`
- `toJsonStr()`：`jsonEncode(toMap())`

`RemoteKeypadInitResult`
- `electricQuantity:int`
- `wirelessKeypadFeatureValue:String`

`MultifunctionalKeypadInitResult`
- `electricQuantity:int`
- `wirelessKeypadFeatureValue:String`
- `slotNumber:int`
- `slotLimit:int`
- `modelNum:String?`（来自 `systemInfoModel.modelNum`）
- `hardwareRevision:String?`（来自 `systemInfoModel.hardwareRevision`）
- `firmwareRevision:String?`（来自 `systemInfoModel.firmwareRevision`）

### 5.4 水表/电表（meter_models.dart）

`TTMeterScanModel`
- `name:String`
- `mac:String`
- `rssi:int`

`TTWaterMeterInitResult`
- `waterMeterId:String`
- `featureValue:String?`

`TTElectricMeterInitResult`
- `electricMeterId:String`
- `featureValue:String?`

### 5.5 进度事件模型（events.dart）

`AddCardEvent`（密封类）
- `AddCardProgress`：进度事件，无字段
- `AddCardComplete`：完成事件
  - `cardNumber:String`

`AddFingerprintEvent`
- `AddFingerprintProgress`
  - `currentCount:int`
  - `totalCount:int`
- `AddFingerprintComplete`
  - `fingerprintNumber:String`

`AddFaceEvent`
- `AddFaceProgress`
  - `state:TTFaceState`
  - `errorCode:TTFaceErrorCode`
- `AddFaceComplete`
  - `faceNumber:String`

---

## 6. Enum（Dart侧全部 enum）

文件：`lib/models/enums.dart`

### 6.1 `TTBluetoothState`
| 枚举值 | value |
|---|---|
| `unknow` | 0 |
| `resetting` | 1 |
| `unsupported` | 2 |
| `unAuthorized` | 3 |
| `turnOff` | 4 |
| `turnOn` | 5 |

### 6.2 `TTPasscodeType`
| 枚举值 | value |
|---|---|
| `once` | 0 |
| `permanent` | 1 |
| `period` | 2 |
| `cycle` | 3 |

### 6.3 `TTOperateRecordType`
| 枚举值 | value |
|---|---|
| `latest` | 0 |
| `total` | 1 |

### 6.4 `TTControlAction`
| 枚举值 | value |
|---|---|
| `unlock` | 0 |
| `lock` | 1 |

### 6.5 `TTLockSwitchState`
| 枚举值 | value |
|---|---|
| `lock` | 0 |
| `unlock` | 1 |
| `unknow` | 2 |

### 6.6 `TTPassageModeType`
| 枚举值 | value |
|---|---|
| `weekly` | 0 |
| `monthly` | 1 |

### 6.7 `TTLockConfig`
| 枚举值 | value |
|---|---|
| `audio` | 0 |
| `passcodeVisible` | 1 |
| `freeze` | 2 |
| `tamperAlert` | 3 |
| `resetButton` | 4 |
| `privacyLock` | 5 |
| `passageModeAutoUnlock` | 6 |
| `wifiLockPowerSavingMode` | 7 |
| `doubleAuth` | 8 |
| `publicMode` | 9 |
| `lowBatteryAutoUnlock` | 10 |

### 6.8 `TTLockDirection`
| 枚举值 | value |
|---|---|
| `left` | 0 |
| `right` | 1 |

### 6.9 `TTSoundVolumeType`
| 枚举值 | value |
|---|---|
| `firstLevel` | 0 |
| `secondLevel` | 1 |
| `thirdLevel` | 2 |
| `fourthLevel` | 3 |
| `fifthLevel` | 4 |
| `off` | 5 |
| `on` | 6 |

### 6.10 `TTSensitivityValue`
| 枚举值 | value |
|---|---|
| `off` | 0 |
| `low` | 1 |
| `medium` | 2 |
| `high` | 3 |

### 6.11 `TTLockError`
| 枚举值 | value |
|---|---|
| `reseted` | 0 |
| `crcError` | 1 |
| `noPermisstion` | 2 |
| `wrongAdminCode` | 3 |
| `noStorageSpace` | 4 |
| `inSettingMode` | 5 |
| `noAdmin` | 6 |
| `notInSettingMode` | 7 |
| `wrongDynamicCode` | 8 |
| `noPower` | 9 |
| `resetPasscode` | 10 |
| `unpdatePasscodeIndex` | 11 |
| `invalidLockFlagPos` | 12 |
| `ekeyExpired` | 13 |
| `passcodeLengthInvalid` | 14 |
| `samePasscodes` | 15 |
| `ekeyInactive` | 16 |
| `aesKey` | 17 |
| `fail` | 18 |
| `passcodeExist` | 19 |
| `passcodeNotExist` | 20 |
| `lackOfStorageSpaceWhenAddingPasscodes` | 21 |
| `invalidParaLength` | 22 |
| `cardNotExist` | 23 |
| `fingerprintDuplication` | 24 |
| `fingerprintNotExist` | 25 |
| `invalidCommand` | 26 |
| `inFreezeMode` | 27 |
| `invalidClientPara` | 28 |
| `lockIsLocked` | 29 |
| `recordNotExist` | 30 |
| `notSupportModifyPasscode` | 31 |
| `bluetoothOff` | 32 |
| `bluetoothConnectTimeount` | 33 |
| `bluetoothDisconnection` | 34 |
| `lockIsBusy` | 35 |
| `invalidLockData` | 36 |
| `invalidParameter` | 37 |
| `wrongWifi` | 38 |
| `wrongWifiPassword` | 39 |

### 6.12 `TTErrorDevice`
| 枚举值 | value |
|---|---|
| `lock` | 0 |
| `keyPad` | 1 |
| `key` | 2 |

### 6.13 `TTLiftWorkActivateType`
| 枚举值 | value |
|---|---|
| `allFloors` | 0 |
| `specificFloors` | 1 |

### 6.14 `TTPowerSaverWorkType`
| 枚举值 | value |
|---|---|
| `allCards` | 0 |
| `hotelCard` | 1 |
| `roomCard` | 2 |

### 6.15 `TTNbAwakeMode`
| 枚举值 | value |
|---|---|
| `keypad` | 0 |
| `card` | 1 |
| `fingerprint` | 2 |

### 6.16 `TTNbAwakeTimeType`
| 枚举值 | value |
|---|---|
| `point` | 0 |
| `interval` | 1 |

### 6.17 `TTRemoteAccessory`
| 枚举值 | value |
|---|---|
| `remoteKey` | 0 |
| `remoteKeypad` | 1 |
| `doorSensor` | 2 |

### 6.18 `TTGatewayError`
| 枚举值 | value |
|---|---|
| `fail` | 0 |
| `wrongWifi` | 1 |
| `wrongWifiPassword` | 2 |
| `wrongCRC` | 3 |
| `wrongAeskey` | 4 |
| `notConnect` | 5 |
| `disconnect` | 6 |
| `failConfigRouter` | 7 |
| `failConfigServer` | 8 |
| `failConfigAccount` | 9 |
| `noSim` | 10 |
| `invalidCommand` | 11 |
| `failConfigIp` | 12 |
| `failInvalidIp` | 13 |

### 6.19 `TTGatewayType`
| 枚举值 | value |
|---|---|
| `g1` | 0 |
| `g2` | 1 |
| `g3` | 2 |
| `g4` | 3 |
| `g5` | 4 |

### 6.20 `TTIpSettingType`
| 枚举值 | value |
|---|---|
| `staticIp` | 0 |
| `dhcp` | 1 |

### 6.21 `TTGatewayConnectStatus`
| 枚举值 | value |
|---|---|
| `timeout` | 0 |
| `success` | 1 |
| `faile` | 2 |

### 6.22 `TTRemoteAccessoryError`
| 枚举值 | value |
|---|---|
| `fail` | 0 |
| `wrongCrc` | 1 |
| `connectTimeout` | 2 |

### 6.23 `TTRemoteKeyPadAccessoryError`
| 枚举值 | value |
|---|---|
| `fail` | 0 |
| `wrongCrc` | 1 |
| `connectTimeout` | 2 |
| `factoryDate` | 3 |
| `duplicateFingerprint` | 4 |
| `lackOfStorageSpace` | 5 |

### 6.24 `TTFaceState`
| 枚举值 | value |
|---|---|
| `canStartAdd` | 0 |
| `error` | 1 |

### 6.25 `TTFaceErrorCode`
| 枚举值 | value |
|---|---|
| `normal` | 0 |
| `noFaceDetected` | 1 |
| `tooCloseToTheTop` | 2 |
| `tooCloseToTheBottom` | 3 |
| `tooCloseToTheLeft` | 4 |
| `tooCloseToTheRight` | 5 |
| `tooFarAway` | 6 |
| `tooClose` | 7 |
| `eyebrowsCovered` | 8 |
| `eyesCovered` | 9 |
| `faceCovered` | 10 |
| `faceDirection` | 11 |
| `eyeOpeningDetected` | 12 |
| `eyesClosedStatus` | 13 |
| `failedToDetectEye` | 14 |
| `needTurnHeadToLeft` | 15 |
| `needTurnHeadToRight` | 16 |
| `needRaiseHead` | 17 |
| `needLowerHead` | 18 |
| `needTiltHeadToLeft` | 19 |
| `needTiltHeadToRight` | 20 |

### 6.26 `TTLockFunction`（功能/特性位）

字段：
- `value:int`
- `androidName:String?`（部分为 null）
- `iosName:String?`（部分为 null）

| 名称 | value | androidName | iosName |
|---|---:|---|---|
| `passcode` | 0 | `PASSCODE` | `TTLockFeatureValuePasscode` |
| `icCard` | 1 | `IC` | `TTLockFeatureValueICCard` |
| `fingerprint` | 2 | `FINGER_PRINT` | `TTLockFeatureValueFingerprint` |
| `wristband` | 3 | `WRIST_BAND` | `TTLockFeatureValueWristband` |
| `autoLock` | 4 | `AUTO_LOCK` | `TTLockFeatureValueAutoLock` |
| `deletePasscode` | 5 | `PASSCODE_WITH_DELETE_FUNCTION` | `TTLockFeatureValueDeletePasscode` |
| `managePasscode` | 7 | `MODIFY_PASSCODE_FUNCTION` | `TTLockFeatureValueManagePasscode` |
| `locking` | 8 | `MANUAL_LOCK` | `TTLockFeatureValueLocking` |
| `passcodeVisible` | 9 | `PASSWORD_DISPLAY_OR_HIDE` | `TTLockFeatureValuePasscodeVisible` |
| `gatewayUnlock` | 10 | `GATEWAY_UNLOCK` | `TTLockFeatureValueGatewayUnlock` |
| `lockFreeze` | 11 | `FREEZE_LOCK` | `TTLockFeatureValueLockFreeze` |
| `cyclePassword` | 12 | `CYCLIC_PASSWORD` | `TTLockFeatureValueCyclePassword` |
| `unlockSwitch` | 14 | `CONFIG_GATEWAY_UNLOCK` | `TTLockFeatureValueRemoteUnlockSwicth` |
| `audioSwitch` | 15 | `AUDIO_MANAGEMENT` | `TTLockFeatureValueAudioSwitch` |
| `nbIoT` | 16 | `NB_LOCK` | `TTLockFeatureValueNBIoT` |
| `getAdminPasscode` | 18 | `GET_ADMIN_CODE` | `TTLockFeatureValueGetAdminPasscode` |
| `hotelCard` | 19 | `HOTEL_LOCK` | `TTLockFeatureValueHotelCard` |
| `noClock` | 20 | `LOCK_NO_CLOCK_CHIP` | `TTLockFeatureValueNoClock` |
| `noBroadcastInNormal` | 21 | `SUPPORT_CLOSE_BLUETOOTH_ADVERTISING` | `TTLockFeatureValueNoBroadcastInNormal` |
| `passageMode` | 22 | `PASSAGE_MODE` | `TTLockFeatureValuePassageMode` |
| `turnOffAutoLock` | 23 | `PASSAGE_MODE_AND_AUTO_LOCK_AND_CAN_CLOSE` | `TTLockFeatureValueTurnOffAutoLock` |
| `wirelessKeypad` | 24 | `WIRELESS_KEYBOARD` | `TTLockFeatureValueWirelessKeypad` |
| `light` | 25 | `LAMP` | `TTLockFeatureValueLight` |
| `hotelCardBlacklist` | 26 | null | `TTLockFeatureValueHotelCardBlacklist` |
| `identityCard` | 27 | null | `TTLockFeatureValueIdentityCard` |
| `tamperAlert` | 28 | `TAMPER_ALERT` | `TTLockFeatureValueTamperAlert` |
| `resetButton` | 29 | `RESET_BUTTON` | `TTLockFeatureValueResetButton` |
| `privacyLock` | 30 | `PRIVACY_LOCK` | `TTLockFeatureValuePrivacyLock` |
| `deadLock` | 32 | `DEAD_LOCK` | `TTLockFeatureValueDeadLock` |
| `cyclicCardOrFingerprint` | 34 | `CYCLIC_IC_OR_FINGER_PRINT` | `TTLockFeatureValueCyclicCardOrFingerprint` |
| `fingerVein` | 37 | `FINGER_VEIN` | `TTLockFeatureValueFingerVein` |
| `ble5G` | 38 | `TELINK_CHIP` | `TTLockFeatureValueBle5G` |
| `nbAwake` | 39 | `NB_ACTIVITE_CONFIGURATION` | `TTLockFeatureValueNBAwake` |
| `recoverCyclePasscode` | 40 | `CYCLIC_PASSCODE_CAN_RECOVERY` | `TTLockFeatureValueRecoverCyclePasscode` |
| `remoteKey` | 41 | `REMOTE` | `TTLockFeatureValueWirelessKeyFob` |
| `getAccessoryElectricQuantity` | 42 | `ACCESSORY_BATTERY` | `TTLockFeatureValueGetAccessoryElectricQuantity` |
| `soundVolumeAndLanguageSetting` | 43 | `SOUND_VOLUME_AND_LANGUAGE_SETTING` | `TTLockFeatureValueSoundVolume` |
| `qrCode` | 44 | `QR_CODE` | `TTLockFeatureValueQRCode` |
| `doorSensorState` | 45 | `DOOR_SENSOR` | `TTLockFeatureValueSensorState` |
| `passageModeAutoUnlockSetting` | 46 | `PASSAGE_MODE_AUTO_UNLOCK_SETTING` | `TTLockFeatureValuePassageModeAutoUnlock` |
| `doorSensor` | 50 | `WIRELESS_DOOR_SENSOR` | `TTLockFeatureValueDoorSensor` |
| `doorSensorAlert` | 51 | `DOOR_OPEN_ALARM` | `TTLockFeatureValueDoorSensorAlert` |
| `sensitivity` | 52 | `SENSITIVITY` | `TTLockFeatureValueSensitivity` |
| `face` | 53 | `FACE_3D` | `TTLockFeatureValueFace` |
| `cpuCard` | 55 | `CPU_CARD` | `TTLockFeatureValueCpuCard` |
| `wifiLock` | 56 | `WIFI_LOCK` | `TTLockFeatureValueWifiLock` |
| `wifiLockStaticIP` | 58 | `WIFI_LOCK_SUPPORT_STATIC_IP` | `TTLockFeatureValueWifiLockStaticIP` |
| `passcodeKeyNumber` | 60 | `INCOMPLETE_PASSCODE` | `TTLockFeatureValuePasscodeKeyNumber` |
| `standAloneActivation` | 62 | null | `TTLockFeatureValueStandAloneActivation` |
| `doubleAuth` | 63 | `SUPPORT_DOUBLE_CHECK` | `TTLockFeatureValueDoubleAuth` |
| `authorizedUnlock` | 64 | `APP_AUTH_UNLOCK` | `TTLockFeatureValueAuthorizedUnlock` |
| `gatewayAuthorizedUnlock` | 65 | `GATEWAY_AUTH_UNLOCK` | `TTLockFeatureValueGatewayAuthorizedUnlock` |
| `noEkeyUnlock` | 66 | `DO_NOT_SUPPORT_APP_AND_GATEWAY_UNLOCK` | `TTLockFeatureValueNoEkeyUnlock` |
| `zhiAnPhotoFace` | 69 | `ZHI_AN_FACE_DELIVERY` | `TTLockFeatureValueZhiAnPhotoFace` |
| `palmVein` | 70 | `PALM_VEIN` | `TTLockFeatureValuePalmVein` |
| `wifiArea` | 71 | null | `TTLockFeatureValueWifiArea` |
| `xiaoCaoCamera` | 75 | `SUPPORT_GRASS` | `TTLockFeatureValueXiaoCaoCamera` |
| `resetLockByCode` | 76 | `RESET_LOCK_BY_CODE` | `TTLockFeatureValueResetLockByCode` |
| `thirdPartyBluetoothDevice` | 77 | `SUPPORT_THIRD_PARTY_BLUETOOTH_DEVICE` | null |
| `autoSetAngle` | 78 | `AUTO_SET_ANGLE` | `TTLockFeatureValueAutoSetAngle` |
| `manualSetAngle` | 79 | `MANUAL_SET_ANGLE` | `TTLockFeatureValueManualSetAngle` |
| `controlLatchBolt` | 80 | `CONTROL_LATCH_BOLT` | `TTLockFeatureValueControlLatchBolt` |
| `autoSetUnlockDirection` | 81 | `AUTO_SET_UNLOCK_DIRECTION` | `TTLockFeatureValueAutoSetUnlockDirection` |
| `icCardSecuritySetting` | 82 | `SUPPORT_IC_CARD_SECURITY_SETTING` | null |
| `wifiPowerSavingTime` | 83 | `SUPPORT_WIFI_SLEEP_MODE_TIMES_SETTING` | `TTLockFeatureValueWifiPowerSavingTime` |
| `multiFunctionKeypad` | 84 | `SUPPORT_MULTI_FUNCTION_KEYPAD` | `TTLockFeatureValueMultifunctionalKeypad` |
| `doNotSupportTurnOffLatchBolt` | 85 | `DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT` | null |
| `publicMode` | 86 | `SUPPORT_PUBLIC_MODE_SETTING` | `TTLockFeatureValuePublicMode` |
| `lowBatteryAutoUnlock` | 87 | `SUPPORT_LOW_BATTERY_UNLOCK_SETTING` | `TTLockFeatureValueLowBatteryAutoUnlock` |
| `motorDriveTime` | 88 | `SUPPORT_MOTOR_DRIVE_TIME_SETTING` | `TTLockFeatureValueMotorDriveTime` |
| `modifyFeatureValue` | 89 | `SUPPORT_MODIFY_FEATURE_VALUE` | `TTLockFeatureValueModifyFeatureValue` |
| `modifyLockNamePrefix` | 90 | `SUPPORT_MODIFY_LOCK_NAME_PREFIX` | `TTLockFeatureValueModifyLockNamePrefix` |
| `authCode` | 92 | `SUPPORT_AUTH_CODE` | `TTLockFeatureValueAuthCode` |
| `unauthorizedAttemptAlarm` | 93 | `UNAUTHORIZED_ATTEMPT_ALARM` | null |
| `powerSaverSupportWifi` | 96 | `POWER_SAVER_SUPPORT_WIFI` | `TTLockFeatureValuePowerSaverSupportWifi` |
| `bluetoothAdvertisingSetting` | 97 | `SUPPORT_BLUETOOTH_ADVERTISING_SETTING` | null |
| `workingMode` | 98 | `SUPPORT_WORKING_TIMES` | `TTLockFeatureValueWorkingMode` |
| `supplierCode` | 99 | `SUPPORT_SUPPLIER_CODE` | null |
| `catOne` | 100 | `SUPPORT_CAT_ONE` | null |
| `forcedOpeningDoorAlarm` | 102 | `SUPPORT_FORCED_OPENING_DOOR_ALARM` | null |
| `zhiAnFaceFeatureSecondGeneration` | 103 | `ZHI_AN_FACE_FEATURE_SECOND_GENERATION` | null |
| `supportDeadLocking` | 106 | `SUPPORT_DEAD_LOCKING` | null |
| `workingTime` | 107 | null | `TTLockFeatureValueWorkingTime` |
| `customQRCode` | 108 | `SUPPORT_CUSTOM_QR_CODE` | `TTLockFeatureValueCustomQRCode` |
| `securityM1Card` | 109 | `SUPPORT_SAFE_M1_CARD` | `TTLockFeatureValueSecurityM1Card` |
| `yiShengPhotoFace` | 110 | null | `TTLockFeatureValueYiShengPhotoFace` |

---

## 7. 异常（Errors / Exceptions）

文件：
- `lib/errors/tt_exception.dart`
- `lib/errors/tt_lock_exception.dart`
- `lib/errors/tt_gateway_exception.dart`
- `lib/errors/tt_accessory_exception.dart`

### 7.1 基类：`TTException`
- `code:int`
- `message:String`

### 7.2 Lock 错误：`TTLockException`
- `error:TTLockError`
- `code == error.value`

### 7.3 Gateway 错误：`TTGatewayException`
- `error:TTGatewayError`
- `code == error.value`

### 7.4 Accessory 错误：`TTAccessoryException`
- 直接承接 `code/message`（此 code 会被映射成 `TTRemoteAccessoryError` 或 `TTRemoteKeyPadAccessoryError` 或其它 device error）

### 7.5 错误映射规则（来自 `TTLockMethodChannel._buildException`）

文件：`lib/src/platform/tt_lock_method_channel.dart`

- 若 `command in TTCommands.gatewayErrorCommands`：
  - 用 `TTGatewayError.fromValue(errorCode)` 生成 `TTGatewayException`
- 若 `command in TTCommands.remoteErrorCommands`：
  - 用 `TTRemoteAccessoryError`（按 errorCode）生成 `TTAccessoryException`
- 若 `command in TTCommands.multifunctionalKeypadErrorCommands` 且 `data['errorDevice'] == TTErrorDevice.keyPad.value`：
  - 用 `TTRemoteKeyPadAccessoryError` 映射
- 其它情况：
  - 用 `TTLockError` 映射，并包含两类“修正逻辑”：
    1. `lockIsBusy`：会覆盖 message 为固定文本
    2. `errorCode > TTLockError.wrongWifiPassword.value`：会把 code 归一为 `TTLockError.fail`

---

## 8. 兼容旧版（Legacy / Classic）

文件：`lib/ttlock_classic.dart`

- `TTLock`（deprecated）是旧版回调式 API 的兼容层
- 旧版仅包含一个额外 enum：
  - `enum TTLockReuslt { success(0), progress(1), fail(2) }`（注意拼写 Reuslt）

此外，旧版的 `TTResponse` 定义了 classic 回调/事件 Map 的 key 常量（如 `command/data/resultState/errorCode/errorMessage/...`）。

> 建议：新业务统一使用 `TTLock.lock/gateway/accessory`（新 API + typed models），避免依赖 legacy 的 Map key 拼写与回调签名差异。

---

## 9. 下一步建议（可选）

1. 如你希望我把 Lock/Gateway/Accessory 中“第 4.1.15 之后未展开到表格”的方法也逐个补齐（command/请求字段/返回字段），告诉我我会继续完善成“完全覆盖”的方法-字段对照表。
2. 如你希望把 Android 原生侧 `TtlockFlutterPlugin.java` 的 `onMethodCall` / 各 command 分支也一起纳入（包括更多 Native 支持但 Dart 未暴露的 command），也可以继续扩展“原生支持 command 清单 & 字段协议”章节。

