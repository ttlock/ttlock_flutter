import StandardMessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMessageCodec';
import BasicMessageChannel, { Reply } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BasicMessageChannel';
import { BinaryMessenger } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import MessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/MessageCodec';
import { ByteBuffer } from '@ohos/flutter_ohos/src/main/ets/util/ByteBuffer';
import StandardMethodCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMethodCodec';
import { EventChannel, EventSink, StreamHandler } from '@ohos/flutter_ohos';


/** Error class for passing custom error details to Flutter via a thrown PlatformException. */
export class FlutterError implements Error {

  /** The error code. */
  public code: string;

  /** The error name. */
  public name: string;

  /** The error message. */
  public message: string;
  /** The error stack. */
  public stack?: string;

  constructor(code: string, name: string,  message: string, stack?: string) 
  {
    this.code = code;
    this.name = name;
    this.message = message;
    this.stack = stack;
  }
}

function wrapError(error: Error): Array<Object | null> {
  let errorList: Array<Object | null> = new Array<Object | null>(3);
  if (error instanceof FlutterError) {
    let err: FlutterError = error as FlutterError;
    errorList[0] = err.code;
    errorList[1] = err.name;
    errorList[2] = err.message;
  } else {
    errorList[0] = error.toString();
    errorList[1] = error.name;
    errorList[2] = "Cause: " + error.message + ", Stacktrace: " + error.stack;
  }
  return errorList;
}

/*
*  刷卡录入流阶段。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTAddCardPhase {
  /* 已进入刷卡模式，等待用户刷卡。*/
  WAITING,
  /* 刷卡成功，[AddCardEvent.cardNumber] 有效。*/
  SUCCESS
}

/*
*  刷卡录入流阶段。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTAddCardPhaseEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  指纹录入流阶段。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTAddFingerprintPhase {
  /* 已进入录入模式，等待首次按压。*/
  WAITING,
  /* 采集中，见 [AddFingerprintEvent.currentCount] / [totalCount]。*/
  COLLECTING,
  /* 录入成功，[AddFingerprintEvent.fingerprintNumber] 有效。*/
  SUCCESS
}

/*
*  指纹录入流阶段。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTAddFingerprintPhaseEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  人脸录入流阶段。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTAddFacePhase {
  /* 可开始人脸采集。*/
  CAN_START_ADD,
  /* 采集中，见 [AddFaceEvent.errorCode] 获取实时反馈。*/
  COLLECTING,
  /* 采集异常，见 [AddFaceEvent.errorCode]。*/
  ERROR,
  /* 录入成功，[AddFaceEvent.faceNumber] 有效。*/
  SUCCESS
}

/*
*  人脸录入流阶段。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTAddFacePhaseEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  掌静脉录入流阶段。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTAddPalmVeinPhase {
  /* 可开始掌静脉采集。*/
  CAN_START_ADD,
  /* 采集异常，见 [AddPalmVeinEvent.errorCode]。*/
  ERROR,
  /* 录入成功，[AddPalmVeinEvent.palmVeinNumber] 有效。*/
  SUCCESS
}

/*
*  掌静脉录入流阶段。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTAddPalmVeinPhaseEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  蓝牙适配器状态。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTBluetoothState {
  /* 未知。*/
  UNKNOW,
  /* 重置中。*/
  RESETTING,
  /* 不支持。*/
  UNSUPPORTED,
  /* 未授权。*/
  UN_AUTHORIZED,
  /* 已关闭。*/
  TURN_OFF,
  /* 已开启。*/
  TURN_ON
}

/*
*  蓝牙适配器状态。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTBluetoothStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  密码类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTPasscodeType {
  /* 一次性。*/
  ONCE,
  /* 永久。*/
  PERMANENT,
  /* 限期。*/
  PERIOD,
  /* 周期。*/
  CYCLE
}

/*
*  密码类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTPasscodeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  操作记录查询类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTOperateRecordType {
  /* 最新。*/
  LATEST,
  /* 全部。*/
  TOTAL
}

/*
*  操作记录查询类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTOperateRecordTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁控制动作。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTControlAction {
  /* 开锁。*/
  UNLOCK,
  /* 关锁。*/
  LOCK
}

/*
*  锁控制动作。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTControlActionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁开关状态。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLockSwitchState {
  /* 已关锁。*/
  LOCK,
  /* 已开锁。*/
  UNLOCK,
  /* 未知。*/
  UNKNOW
}

/*
*  锁开关状态。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLockSwitchStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  通行模式类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTPassageModeType {
  /* 按周。*/
  WEEKLY,
  /* 按月。*/
  MONTHLY
}

/*
*  通行模式类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTPassageModeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁配置项。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLockConfig {
  /* 声音。*/
  AUDIO,
  /* 密码可见。*/
  PASSCODE_VISIBLE,
  /* 冻结。*/
  FREEZE,
  /* 防撬警报。*/
  TAMPER_ALERT,
  /* 重置按钮。*/
  RESET_BUTTON,
  /* 隐私锁。*/
  PRIVACY_LOCK,
  /* 通行模式自动开锁。*/
  PASSAGE_MODE_AUTO_UNLOCK,
  /* WiFi 锁省电模式。*/
  WIFI_LOCK_POWER_SAVING_MODE,
  /* 双重认证。*/
  DOUBLE_AUTH,
  /* 公共模式。*/
  PUBLIC_MODE,
  /* 低电量自动开锁。*/
  LOW_BATTERY_AUTO_UNLOCK,
  /* 安全 M1 卡。*/
  SECURITY_M1CARD,
  /* 半自动模式控制。*/
  SEMI_AUTOMATIC_MODE_CONTROL,
  /* 锁监管。*/
  LOCK_SUPERVISION
}

/*
*  锁配置项。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLockConfigEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁安装方向。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLockDirection {
  /* 左开。*/
  LEFT,
  /* 右开。*/
  RIGHT
}

/*
*  锁安装方向。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLockDirectionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  音量档位。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTSoundVolumeType {
  /* 一档。*/
  FIRST_LEVEL,
  /* 二档。*/
  SECOND_LEVEL,
  /* 三档。*/
  THIRD_LEVEL,
  /* 四档。*/
  FOURTH_LEVEL,
  /* 五档。*/
  FIFTH_LEVEL,
  /* 关闭。*/
  OFF,
  /* 开启。*/
  ON
}

/*
*  音量档位。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTSoundVolumeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  灵敏度档位。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTSensitivityValue {
  /* 关闭。*/
  OFF,
  /* 低。*/
  LOW,
  /* 中。*/
  MEDIUM,
  /* 高。*/
  HIGH
}

/*
*  灵敏度档位。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTSensitivityValueEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁操作错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLockError {
  /* 成功。*/
  SUCCESS,
  /* 锁已重置。*/
  RESETED,
  /* CRC 校验错误。*/
  CRC_ERROR,
  /* 无权限。*/
  NO_PERMISSTION,
  /* 管理员密码错误。*/
  WRONG_ADMIN_CODE,
  /* 存储空间不足。*/
  NO_STORAGE_SPACE,
  /* 正在设置模式。*/
  IN_SETTING_MODE,
  /* 无管理员。*/
  NO_ADMIN,
  /* 不在设置模式。*/
  NOT_IN_SETTING_MODE,
  /* 动态码错误。*/
  WRONG_DYNAMIC_CODE,
  /* 电量不足。*/
  NO_POWER,
  /* 重置密码。*/
  RESET_PASSCODE,
  /* 更新密码索引。*/
  UNPDATE_PASSCODE_INDEX,
  /* 无效锁标识位置。*/
  INVALID_LOCK_FLAG_POS,
  /* 电子钥匙已过期。*/
  EKEY_EXPIRED,
  /* 密码长度无效。*/
  PASSCODE_LENGTH_INVALID,
  /* 密码相同。*/
  SAME_PASSCODES,
  /* 电子钥匙未激活。*/
  EKEY_INACTIVE,
  /* AES 密钥错误。*/
  AES_KEY,
  /* 通用失败。*/
  FAIL,
  /* 密码已存在。*/
  PASSCODE_EXIST,
  /* 密码不存在。*/
  PASSCODE_NOT_EXIST,
  /* 添加密码时存储空间不足。*/
  LACK_OF_STORAGE_SPACE_WHEN_ADDING_PASSCODES,
  /* 参数长度无效。*/
  INVALID_PARA_LENGTH,
  /* 卡不存在。*/
  CARD_NOT_EXIST,
  /* 指纹重复。*/
  FINGERPRINT_DUPLICATION,
  /* 指纹不存在。*/
  FINGERPRINT_NOT_EXIST,
  /* 无效指令。*/
  INVALID_COMMAND,
  /* 处于冻结模式。*/
  IN_FREEZE_MODE,
  /* 客户端参数无效。*/
  INVALID_CLIENT_PARA,
  /* 锁已锁定。*/
  LOCK_IS_LOCKED,
  /* 记录不存在。*/
  RECORD_NOT_EXIST,
  /* 不支持修改密码。*/
  NOT_SUPPORT_MODIFY_PASSCODE,
  /* 蓝牙已关闭。*/
  BLUETOOTH_OFF,
  /* 蓝牙连接超时。*/
  BLUETOOTH_CONNECT_TIMEOUNT,
  /* 蓝牙断开连接。*/
  BLUETOOTH_DISCONNECTION,
  /* 锁正忙。*/
  LOCK_IS_BUSY,
  /* 无效的锁数据。*/
  INVALID_LOCK_DATA,
  /* 无效参数。*/
  INVALID_PARAMETER,
  /* WiFi 错误。*/
  WRONG_WIFI,
  /* WiFi 密码错误。*/
  WRONG_WIFI_PASSWORD,
  /* 扫描已经开始。*/
  SCAN_FAILED_ALREADY_START,
  /* 应用注册失败。*/
  SCAN_FAILED_APPLICATION_REGISTRATION_FAILED,
  /* 扫描内部错误。*/
  SCAN_FAILED_INTERNAL_ERROR,
  /* 功能不支持。*/
  SCAN_FAILED_FEATURE_UNSUPPORTED,
  /* 硬件资源不足。*/
  SCAN_FAILED_OUT_OF_HARDWARE_RESOURCES,
  /* 无线键盘初始化失败。*/
  INIT_WIRELESS_KEYBOARD_FAILED,
  /* 无线键盘无响应。*/
  WIRELESS_KEYBOARD_NO_RESPONSE,
  /* 设备连接失败。*/
  DEVICE_CONNECT_FAILED,
  /* 签名验证失败。*/
  SIGNATURE_VERIFICATION_FAILED,
  /* 无效的应用。*/
  INVALID_APPLICATION
}

/*
*  锁操作错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLockErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  错误所属设备类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTErrorDevice {
  /* 锁。*/
  LOCK,
  /* 键盘。*/
  KEY_PAD,
  /* 钥匙。*/
  KEY
}

/*
*  错误所属设备类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTErrorDeviceEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  电梯联动激活类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLiftWorkActivateType {
  /* 全部楼层。*/
  ALL_FLOORS,
  /* 指定楼层。*/
  SPECIFIC_FLOORS
}

/*
*  电梯联动激活类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLiftWorkActivateTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  省电模式工作类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTPowerSaverWorkType {
  /* 全部卡。*/
  ALL_CARDS,
  /* 酒店卡。*/
  HOTEL_CARD,
  /* 房卡。*/
  ROOM_CARD
}

/*
*  省电模式工作类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTPowerSaverWorkTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  网关型号。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTGatewayType {
  /* G2 网关。*/
  G2,
  /* G3 网关。*/
  G3,
  /* G4 网关。*/
  G4,
  /* G5 网关。*/
  G5,
  /* G6 网关。*/
  G6
}

/*
*  网关型号。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTGatewayTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  网关连接状态。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTGatewayConnectStatus {
  /* 超时。*/
  TIMEOUT,
  /* 成功。*/
  SUCCESS,
  /* 失败。*/
  FAILED
}

/*
*  网关连接状态。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTGatewayConnectStatusEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  网关操作错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTGatewayError {
  /* 成功。*/
  SUCCESS,
  /* 失败。*/
  FAILED,
  /* WiFi 名称错误。*/
  BAD_WIFI_NAME,
  /* WiFi 密码错误。*/
  BAD_WIFI_PASSWORD,
  /* 无效指令。*/
  INVALID_COMMAND,
  /* 超时。*/
  TIME_OUT,
  /* 无 SIM 卡。*/
  NO_SIM_CARD,
  /* 无网线。*/
  NO_CABLE,
  /* CRC 校验错误。*/
  WRONG_CRC,
  /* AES 密钥错误。*/
  WRONG_AES_KEY,
  /* 配置路由器失败。*/
  FAILED_CONFIGURE_ROUTER,
  /* 配置服务器失败。*/
  FAILED_CONFIGURE_SERVER,
  /* 配置账号失败。*/
  FAILED_CONFIGURE_ACCOUNT,
  /* 通信断开。*/
  COMMUNICATION_DISCONNECTED,
  /* 未连接。*/
  UN_CONNECTED,
  /* 连接超时。*/
  CONNECT_TIMEOUT,
  /* 数据格式错误。*/
  DATA_FORMAT_ERROR,
  /* 配置账号失败。*/
  FAILED_CONFIG_ACCOUNT,
  /* 配置 IP 失败。*/
  FAILED_CONFIG_IP,
  /* 无效 IP。*/
  INVALID_IP
}

/*
*  网关操作错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTGatewayErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  远程配件操作错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTRemoteAccessoryError {
  /* 成功。*/
  SUCCESS,
  /* 失败。*/
  FAILED,
  /* 无响应。*/
  NO_RESPONSE,
  /* CRC 校验错误。*/
  WRONG_CRC,
  /* 请求失败。*/
  REQUEST_FAILED,
  /* 连接失败。*/
  CONNECT_FAILED,
  /* 设备正忙。*/
  DEVICE_IS_BUSY,
  /* 数据格式错误。*/
  DATA_FORMAT_ERROR
}

/*
*  远程配件操作错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTRemoteAccessoryErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  多功能键盘操作错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTMultifunctionalKeypadError {
  /* 成功。*/
  SUCCESS,
  /* 失败。*/
  FAILED,
  /* 指纹重复。*/
  DUPLICATE_FINGERPRINT,
  /* 存储空间不足。*/
  NO_STORAGE_SPACE,
  /* CRC 校验错误。*/
  WRONG_CRC,
  /* 无响应。*/
  NO_RESPONSE,
  /* 键盘连接失败。*/
  KEYPAD_CONNECT_FAILED,
  /* 数据格式错误。*/
  DATA_FORMAT_ERROR
}

/*
*  多功能键盘操作错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTMultifunctionalKeypadErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  远程配件类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTRemoteAccessory {
  /* 遥控器。*/
  REMOTE_KEY,
  /* 无线键盘。*/
  REMOTE_KEYPAD,
  /* 门磁。*/
  DOOR_SENSOR
}

/*
*  远程配件类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTRemoteAccessoryEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  IP 设置类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTIpSettingType {
  /* 静态 IP。*/
  STATIC_IP,
  /* 动态 IP（DHCP）。*/
  DHCP
}

/*
*  IP 设置类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTIpSettingTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  NB 唤醒模式。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTNbAwakeMode {
  /* 键盘。*/
  KEYPAD,
  /* 卡。*/
  CARD,
  /* 指纹。*/
  FINGERPRINT
}

/*
*  NB 唤醒模式。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTNbAwakeModeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  NB 唤醒时间类型。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTNbAwakeTimeType {
  /* 定点。*/
  POINT,
  /* 间隔。*/
  INTERVAL
}

/*
*  NB 唤醒时间类型。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTNbAwakeTimeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁功能能力位。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTLockFunction {
  /* 密码。*/
  PASSCODE,
  /* IC 卡。*/
  IC_CARD,
  /* 指纹。*/
  FINGERPRINT,
  /* 手环。*/
  WRISTBAND,
  /* 自动闭锁。*/
  AUTO_LOCK,
  /* 删除密码。*/
  DELETE_PASSCODE,
  /* 管理密码。*/
  MANAGE_PASSCODE,
  /* 锁定。*/
  LOCKING,
  /* 密码可见。*/
  PASSCODE_VISIBLE,
  /* 网关开锁。*/
  GATEWAY_UNLOCK,
  /* 锁冻结。*/
  LOCK_FREEZE,
  /* 周期密码。*/
  CYCLE_PASSWORD,
  /* 开锁开关。*/
  UNLOCK_SWITCH,
  /* 声音开关。*/
  AUDIO_SWITCH,
  /* NB-IoT。*/
  NB_IO_T,
  /* 获取管理员密码。*/
  GET_ADMIN_PASSCODE,
  /* 酒店卡。*/
  HOTEL_CARD,
  /* 无时钟。*/
  NO_CLOCK,
  /* 正常模式不广播。*/
  NO_BROADCAST_IN_NORMAL,
  /* 通行模式。*/
  PASSAGE_MODE,
  /* 关闭自动闭锁。*/
  TURN_OFF_AUTO_LOCK,
  /* 无线键盘。*/
  WIRELESS_KEYPAD,
  /* 灯光。*/
  LIGHT,
  /* 酒店卡黑名单。*/
  HOTEL_CARD_BLACKLIST,
  /* 身份证。*/
  IDENTITY_CARD,
  /* 防撬警报。*/
  TAMPER_ALERT,
  /* 重置按钮。*/
  RESET_BUTTON,
  /* 隐私锁。*/
  PRIVACY_LOCK,
  /* 死锁。*/
  DEAD_LOCK,
  /* 周期卡或指纹。*/
  CYCLIC_CARD_OR_FINGERPRINT,
  /* 指静脉。*/
  FINGER_VEIN,
  /* BLE 5.0。*/
  BLE5G,
  /* NB 唤醒。*/
  NB_AWAKE,
  /* 恢复周期密码。*/
  RECOVER_CYCLE_PASSCODE,
  /* 遥控钥匙。*/
  REMOTE_KEY,
  /* 获取配件电量。*/
  GET_ACCESSORY_ELECTRIC_QUANTITY,
  /* 音量和语言设置。*/
  SOUND_VOLUME_AND_LANGUAGE_SETTING,
  /* 二维码。*/
  QR_CODE,
  /* 门磁状态。*/
  DOOR_SENSOR_STATE,
  /* 通行模式自动开锁设置。*/
  PASSAGE_MODE_AUTO_UNLOCK_SETTING,
  /* 门磁。*/
  DOOR_SENSOR,
  /* 门磁警报。*/
  DOOR_SENSOR_ALERT,
  /* 灵敏度。*/
  SENSITIVITY,
  /* 人脸。*/
  FACE,
  /* CPU 卡。*/
  CPU_CARD,
  /* WiFi 锁。*/
  WIFI_LOCK,
  /* WiFi 锁静态 IP。*/
  WIFI_LOCK_STATIC_IP,
  /* 密码按键数量。*/
  PASSCODE_KEY_NUMBER,
  /* 独立激活。*/
  STAND_ALONE_ACTIVATION,
  /* 双重认证。*/
  DOUBLE_AUTH,
  /* 授权开锁。*/
  AUTHORIZED_UNLOCK,
  /* 网关授权开锁。*/
  GATEWAY_AUTHORIZED_UNLOCK,
  /* 无电子钥匙开锁。*/
  NO_EKEY_UNLOCK,
  /* 指安拍照人脸。*/
  ZHI_AN_PHOTO_FACE,
  /* 掌静脉。*/
  PALM_VEIN,
  /* WiFi 区域。*/
  WIFI_AREA,
  /* 小草摄像头。*/
  XIAO_CAO_CAMERA,
  /* 通过编码重置锁。*/
  RESET_LOCK_BY_CODE,
  /* 第三方蓝牙设备。*/
  THIRD_PARTY_BLUETOOTH_DEVICE,
  /* 自动设置角度。*/
  AUTO_SET_ANGLE,
  /* 手动设置角度。*/
  MANUAL_SET_ANGLE,
  /* 控制斜舌。*/
  CONTROL_LATCH_BOLT,
  /* 自动设置开锁方向。*/
  AUTO_SET_UNLOCK_DIRECTION,
  /* IC 卡安全设置。*/
  IC_CARD_SECURITY_SETTING,
  /* WiFi 省电时间。*/
  WIFI_POWER_SAVING_TIME,
  /* 多功能键盘。*/
  MULTI_FUNCTION_KEYPAD,
  /* 不支持关闭斜舌。*/
  DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT,
  /* 公共模式。*/
  PUBLIC_MODE,
  /* 低电量自动开锁。*/
  LOW_BATTERY_AUTO_UNLOCK,
  /* 电机驱动时间。*/
  MOTOR_DRIVE_TIME,
  /* 修改特征值。*/
  MODIFY_FEATURE_VALUE,
  /* 修改锁名前缀。*/
  MODIFY_LOCK_NAME_PREFIX,
  /* 授权码。*/
  AUTH_CODE,
  /* 未授权尝试警报。*/
  UNAUTHORIZED_ATTEMPT_ALARM,
  /* 省电模式支持 WiFi。*/
  POWER_SAVER_SUPPORT_WIFI,
  /* 蓝牙广播设置。*/
  BLUETOOTH_ADVERTISING_SETTING,
  /* 工作模式。*/
  WORKING_MODE,
  /* 供应商代码。*/
  SUPPLIER_CODE,
  /* Cat.1。*/
  CAT_ONE,
  /* 强制开门警报。*/
  FORCED_OPENING_DOOR_ALARM,
  /* 指安人脸特征第二代。*/
  ZHI_AN_FACE_FEATURE_SECOND_GENERATION,
  /* 支持死锁。*/
  SUPPORT_DEAD_LOCKING,
  /* 工作时间。*/
  WORKING_TIME,
  /* 自定义二维码。*/
  CUSTOM_QRCODE,
  /* 安全 M1 卡。*/
  SECURITY_M1CARD,
  /* 易盛人脸。*/
  YI_SHENG_PHOTO_FACE,
  /* 图片人脸传输。*/
  PICTURE_FACE_DELIVERY,
  /* 支持设置别名。*/
  SUPPORT_SET_ALIAS,
  /* 隐藏 WiFi/Cat.1 休眠模式设置。*/
  HIDE_WIFI_CAT_ONE_SLEEP_MODE_SETTING,
  /* 半自动模式控制。*/
  SEMI_AUTOMATIC_MODE_CONTROL,
  /* 支持设置用户属性。*/
  SUPPORT_SET_USER_ATTRIBUTES,
  /* 支持监管。*/
  SUPPORT_SUPERVISION
}

/*
*  锁功能能力位。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTLockFunctionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  人脸录入状态。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTFaceState {
  /* 可开始添加。*/
  CAN_START_ADD,
  /* 错误。*/
  ERROR
}

/*
*  人脸录入状态。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTFaceStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  水表功能特性。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTWaterMeterFeature {
  /* Cat.1。*/
  CAT_ONE
}

/*
*  水表功能特性。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTWaterMeterFeatureEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  电表功能特性。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTElectricMeterFeature {
  /* Cat.1。*/
  CAT_ONE,
  /* Telink。*/
  TELINK
}

/*
*  电表功能特性。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTElectricMeterFeatureEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  独立门磁操作错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTStandaloneDoorSensorError {
  /* 成功。*/
  SUCCESS,
  /* 失败。*/
  FAILED,
  /* CRC 校验错误。*/
  WRONG_CRC,
  /* Wi-Fi 名称错误。*/
  WRONG_SSID,
  /* Wi-Fi 密码错误。*/
  WRONG_WIFI_PASSWORD,
  /* MAC 地址错误。*/
  BAD_MAC_ADDRESS,
  /* Token 错误。*/
  BAD_TOKEN,
  /* 蓝牙未开启。*/
  BLUETOOTH_POWER_OFF,
  /* 连接超时。*/
  CONNECT_TIMEOUT,
  /* 连接断开。*/
  DISCONNECT,
  /* 设备无响应。*/
  NO_RESPONSE,
  /* 连接失败。*/
  CONNECT_FAILED,
  /* 设备正忙。*/
  DEVICE_IS_BUSY,
  /* 数据格式错误。*/
  DATA_FORMAT_ERROR
}

/*
*  独立门磁操作错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTStandaloneDoorSensorErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  独立门磁功能特性。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTStandaloneDoorSensorFeature {
  /* 2.4G Wi-Fi。*/
  WIFI24G,
  /* 5G Wi-Fi。*/
  WIFI5G,
  /* 授权码。*/
  AUTH_CODE,
  /* 告警。*/
  ALARM
}

/*
*  独立门磁功能特性。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTStandaloneDoorSensorFeatureEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  水电表付费模式。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTMeterPayMode {
  /* 后付费。*/
  POSTPAID,
  /* 预付费。*/
  PREPAID
}

/*
*  水电表付费模式。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTMeterPayModeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  人脸采集错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTFaceErrorCode {
  /* 正常。*/
  NORMAL,
  /* 未检测到人脸。*/
  NO_FACE_DETECTED,
  /* 距离顶部过近。*/
  TOO_CLOSE_TO_THE_TOP,
  /* 距离底部过近。*/
  TOO_CLOSE_TO_THE_BOTTOM,
  /* 距离左侧过近。*/
  TOO_CLOSE_TO_THE_LEFT,
  /* 距离右侧过近。*/
  TOO_CLOSE_TO_THE_RIGHT,
  /* 距离过远。*/
  TOO_FAR_AWAY,
  /* 距离过近。*/
  TOO_CLOSE,
  /* 眉毛被遮挡。*/
  EYEBROWS_COVERED,
  /* 眼睛被遮挡。*/
  EYES_COVERED,
  /* 面部被遮挡。*/
  FACE_COVERED,
  /* 人脸方向不正确。*/
  FACE_DIRECTION,
  /* 检测到睁眼。*/
  EYE_OPENING_DETECTED,
  /* 眼睛闭合状态。*/
  EYES_CLOSED_STATUS,
  /* 检测眼睛失败。*/
  FAILED_TO_DETECT_EYE,
  /* 需要将头转向左侧。*/
  NEED_TURN_HEAD_TO_LEFT,
  /* 需要将头转向右侧。*/
  NEED_TURN_HEAD_TO_RIGHT,
  /* 需要抬头。*/
  NEED_RAISE_HEAD,
  /* 需要低头。*/
  NEED_LOWER_HEAD,
  /* 需要将头向左倾斜。*/
  NEED_TILT_HEAD_TO_LEFT,
  /* 需要将头向右倾斜。*/
  NEED_TILT_HEAD_TO_RIGHT
}

/*
*  人脸采集错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTFaceErrorCodeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  掌静脉采集错误码。
* 
*  Generated enum from Pigeon that represents data sent in messages.
*/
export enum TTPalmVeinErrorCode {
  /* 未知状态。*/
  UNKNOWN_STATUS,
  /* 未检测到掌静脉。*/
  NO_PALM_VEIN_DETECTED,
  /* 掌部矩形置信度低。*/
  PALM_RECT_CONF_LOW,
  /* 掌部关键点置信度低。*/
  PALM_LANDMARK_CONF_LOW,
  /* 掌部旋转角度错误。*/
  PALM_ANGLE_ROLL_ERROR,
  /* 掌部倾斜角度错误。*/
  PALM_ANGLE_LEAN_ERROR,
  /* 掌部被遮挡。*/
  PALM_BLOCK,
  /* 掌部模糊。*/
  PALM_BLUR,
  /* 手背朝上。*/
  PALM_BACK
}

/*
*  掌静脉采集错误码。
* 
*  Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed
*/
export class TTPalmVeinErrorCodeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/*
*  锁版本信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockVersion {
  private protocolType: number;

  public setProtocolType(protocolType: number): void {
    this.protocolType = protocolType;
  }

  getProtocolType(): number{
    return this.protocolType;
  }

  private protocolVersion: number;

  public setProtocolVersion(protocolVersion: number): void {
    this.protocolVersion = protocolVersion;
  }

  getProtocolVersion(): number{
    return this.protocolVersion;
  }

  private scene: number;

  public setScene(scene: number): void {
    this.scene = scene;
  }

  getScene(): number{
    return this.scene;
  }

  private groupId: number;

  public setGroupId(groupId: number): void {
    this.groupId = groupId;
  }

  getGroupId(): number{
    return this.groupId;
  }

  private orgId: number;

  public setOrgId(orgId: number): void {
    this.orgId = orgId;
  }

  getOrgId(): number{
    return this.orgId;
  }

  constructor(protocolType: number, protocolVersion: number, scene: number, groupId: number, orgId: number) {
    this.protocolType = protocolType;
    this.protocolVersion = protocolVersion;
    this.scene = scene;
    this.groupId = groupId;
    this.orgId = orgId;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.protocolType === undefined || this.protocolType === null) {
      arr.push(null);
    } else {
      arr.push(this.protocolType);
    }
    if (this.protocolVersion === undefined || this.protocolVersion === null) {
      arr.push(null);
    } else {
      arr.push(this.protocolVersion);
    }
    if (this.scene === undefined || this.scene === null) {
      arr.push(null);
    } else {
      arr.push(this.scene);
    }
    if (this.groupId === undefined || this.groupId === null) {
      arr.push(null);
    } else {
      arr.push(this.groupId);
    }
    if (this.orgId === undefined || this.orgId === null) {
      arr.push(null);
    } else {
      arr.push(this.orgId);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockVersion {
    let protocolTypeObject: Object = arr[0];
    const protocolType: number = protocolTypeObject as number;
    let protocolVersionObject: Object = arr[1];
    const protocolVersion: number = protocolVersionObject as number;
    let sceneObject: Object = arr[2];
    const scene: number = sceneObject as number;
    let groupIdObject: Object = arr[3];
    const groupId: number = groupIdObject as number;
    let orgIdObject: Object = arr[4];
    const orgId: number = orgIdObject as number;
    return new TTLockVersion(protocolType, protocolVersion, scene, groupId, orgId);
  }
}

/*
*  锁初始化参数。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockInitParams {
  private lockMac: string;

  public setLockMac(lockMac: string): void {
    this.lockMac = lockMac;
  }

  getLockMac(): string{
    return this.lockMac;
  }

  private lockVersion: TTLockVersion;

  public setLockVersion(lockVersion: TTLockVersion): void {
    this.lockVersion = lockVersion;
  }

  getLockVersion(): TTLockVersion{
    return this.lockVersion;
  }

  private isInited: boolean;

  public setIsInited(isInited: boolean): void {
    this.isInited = isInited;
  }

  getIsInited(): boolean{
    return this.isInited;
  }

  private clientPara?: string;

  public setClientPara(clientPara: string | undefined): void {
    this.clientPara = clientPara;
  }

  getClientPara(): string | undefined{
    return this.clientPara;
  }

  private hotelInfo?: string;

  public setHotelInfo(hotelInfo: string | undefined): void {
    this.hotelInfo = hotelInfo;
  }

  getHotelInfo(): string | undefined{
    return this.hotelInfo;
  }

  private buildingNumber?: number;

  public setBuildingNumber(buildingNumber: number | undefined): void {
    this.buildingNumber = buildingNumber;
  }

  getBuildingNumber(): number | undefined{
    return this.buildingNumber;
  }

  private floorNumber?: number;

  public setFloorNumber(floorNumber: number | undefined): void {
    this.floorNumber = floorNumber;
  }

  getFloorNumber(): number | undefined{
    return this.floorNumber;
  }

  constructor(lockMac: string, lockVersion: TTLockVersion, isInited: boolean, clientPara?: string, hotelInfo?: string, buildingNumber?: number, floorNumber?: number) {
    this.lockMac = lockMac;
    this.lockVersion = lockVersion;
    this.isInited = isInited;
    this.clientPara = clientPara;
    this.hotelInfo = hotelInfo;
    this.buildingNumber = buildingNumber;
    this.floorNumber = floorNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.lockMac === undefined || this.lockMac === null) {
      arr.push(null);
    } else {
      arr.push(this.lockMac);
    }
    if (this.lockVersion === undefined || this.lockVersion === null) {
      arr.push(null);
    } else {
      arr.push(this.lockVersion);
    }
    if (this.isInited === undefined || this.isInited === null) {
      arr.push(null);
    } else {
      arr.push(this.isInited);
    }
    if (this.clientPara === undefined || this.clientPara === null) {
      arr.push(null);
    } else {
      arr.push(this.clientPara);
    }
    if (this.hotelInfo === undefined || this.hotelInfo === null) {
      arr.push(null);
    } else {
      arr.push(this.hotelInfo);
    }
    if (this.buildingNumber === undefined || this.buildingNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.buildingNumber);
    }
    if (this.floorNumber === undefined || this.floorNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.floorNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockInitParams {
    let lockMacObject: Object = arr[0];
    const lockMac: string = lockMacObject as string;
    let lockVersionObject: Object = arr[1];
    const lockVersion: TTLockVersion = lockVersionObject as TTLockVersion;
    let isInitedObject: Object = arr[2];
    const isInited: boolean = isInitedObject as boolean;
    let clientPara: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let clientParaObject: Object = arr[3];
      clientPara = clientParaObject as string | undefined;
    }
    let hotelInfo: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let hotelInfoObject: Object = arr[4];
      hotelInfo = hotelInfoObject as string | undefined;
    }
    let buildingNumber: number | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let buildingNumberObject: Object = arr[5];
      buildingNumber = buildingNumberObject as number | undefined;
    }
    let floorNumber: number | undefined = undefined;
    if (arr[6] !== null && arr[6] !== undefined) {
      let floorNumberObject: Object = arr[6];
      floorNumber = floorNumberObject as number | undefined;
    }
    return new TTLockInitParams(lockMac, lockVersion, isInited, clientPara, hotelInfo, buildingNumber, floorNumber);
  }
}

/*
*  网关初始化参数。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTGatewayInitParams {
  private type: TTGatewayType;

  public setType(type: TTGatewayType): void {
    this.type = type;
  }

  getType(): TTGatewayType{
    return this.type;
  }

  private ttlockUid: number;

  public setTtlockUid(ttlockUid: number): void {
    this.ttlockUid = ttlockUid;
  }

  getTtlockUid(): number{
    return this.ttlockUid;
  }

  private gatewayName?: string;

  public setGatewayName(gatewayName: string | undefined): void {
    this.gatewayName = gatewayName;
  }

  getGatewayName(): string | undefined{
    return this.gatewayName;
  }

  private ttlockLoginPassword?: string;

  public setTtlockLoginPassword(ttlockLoginPassword: string | undefined): void {
    this.ttlockLoginPassword = ttlockLoginPassword;
  }

  getTtlockLoginPassword(): string | undefined{
    return this.ttlockLoginPassword;
  }

  private wifi?: string;

  public setWifi(wifi: string | undefined): void {
    this.wifi = wifi;
  }

  getWifi(): string | undefined{
    return this.wifi;
  }

  private wifiPassword?: string;

  public setWifiPassword(wifiPassword: string | undefined): void {
    this.wifiPassword = wifiPassword;
  }

  getWifiPassword(): string | undefined{
    return this.wifiPassword;
  }

  private serverIp?: string;

  public setServerIp(serverIp: string | undefined): void {
    this.serverIp = serverIp;
  }

  getServerIp(): string | undefined{
    return this.serverIp;
  }

  private serverPort?: string;

  public setServerPort(serverPort: string | undefined): void {
    this.serverPort = serverPort;
  }

  getServerPort(): string | undefined{
    return this.serverPort;
  }

  private companyId?: number;

  public setCompanyId(companyId: number | undefined): void {
    this.companyId = companyId;
  }

  getCompanyId(): number | undefined{
    return this.companyId;
  }

  private branchId?: number;

  public setBranchId(branchId: number | undefined): void {
    this.branchId = branchId;
  }

  getBranchId(): number | undefined{
    return this.branchId;
  }

  constructor(type: TTGatewayType, ttlockUid: number, gatewayName?: string, ttlockLoginPassword?: string, wifi?: string, wifiPassword?: string, serverIp?: string, serverPort?: string, companyId?: number, branchId?: number) {
    this.type = type;
    this.ttlockUid = ttlockUid;
    this.gatewayName = gatewayName;
    this.ttlockLoginPassword = ttlockLoginPassword;
    this.wifi = wifi;
    this.wifiPassword = wifiPassword;
    this.serverIp = serverIp;
    this.serverPort = serverPort;
    this.companyId = companyId;
    this.branchId = branchId;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.type === undefined || this.type === null) {
      arr.push(null);
    } else {
      const typeStr = TTGatewayType[this.type as number];
      arr.push(new TTGatewayTypeEnum(typeStr));
    }
    if (this.ttlockUid === undefined || this.ttlockUid === null) {
      arr.push(null);
    } else {
      arr.push(this.ttlockUid);
    }
    if (this.gatewayName === undefined || this.gatewayName === null) {
      arr.push(null);
    } else {
      arr.push(this.gatewayName);
    }
    if (this.ttlockLoginPassword === undefined || this.ttlockLoginPassword === null) {
      arr.push(null);
    } else {
      arr.push(this.ttlockLoginPassword);
    }
    if (this.wifi === undefined || this.wifi === null) {
      arr.push(null);
    } else {
      arr.push(this.wifi);
    }
    if (this.wifiPassword === undefined || this.wifiPassword === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiPassword);
    }
    if (this.serverIp === undefined || this.serverIp === null) {
      arr.push(null);
    } else {
      arr.push(this.serverIp);
    }
    if (this.serverPort === undefined || this.serverPort === null) {
      arr.push(null);
    } else {
      arr.push(this.serverPort);
    }
    if (this.companyId === undefined || this.companyId === null) {
      arr.push(null);
    } else {
      arr.push(this.companyId);
    }
    if (this.branchId === undefined || this.branchId === null) {
      arr.push(null);
    } else {
      arr.push(this.branchId);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTGatewayInitParams {
    const typeStr: string = arr[0] as string;
    const type: TTGatewayType = TTGatewayType[typeStr];
    let ttlockUidObject: Object = arr[1];
    const ttlockUid: number = ttlockUidObject as number;
    let gatewayName: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let gatewayNameObject: Object = arr[2];
      gatewayName = gatewayNameObject as string | undefined;
    }
    let ttlockLoginPassword: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let ttlockLoginPasswordObject: Object = arr[3];
      ttlockLoginPassword = ttlockLoginPasswordObject as string | undefined;
    }
    let wifi: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let wifiObject: Object = arr[4];
      wifi = wifiObject as string | undefined;
    }
    let wifiPassword: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let wifiPasswordObject: Object = arr[5];
      wifiPassword = wifiPasswordObject as string | undefined;
    }
    let serverIp: string | undefined = undefined;
    if (arr[6] !== null && arr[6] !== undefined) {
      let serverIpObject: Object = arr[6];
      serverIp = serverIpObject as string | undefined;
    }
    let serverPort: string | undefined = undefined;
    if (arr[7] !== null && arr[7] !== undefined) {
      let serverPortObject: Object = arr[7];
      serverPort = serverPortObject as string | undefined;
    }
    let companyId: number | undefined = undefined;
    if (arr[8] !== null && arr[8] !== undefined) {
      let companyIdObject: Object = arr[8];
      companyId = companyIdObject as number | undefined;
    }
    let branchId: number | undefined = undefined;
    if (arr[9] !== null && arr[9] !== undefined) {
      let branchIdObject: Object = arr[9];
      branchId = branchIdObject as number | undefined;
    }
    return new TTGatewayInitParams(type, ttlockUid, gatewayName, ttlockLoginPassword, wifi, wifiPassword, serverIp, serverPort, companyId, branchId);
  }
}

/*
*  IP 设置模型（静态 IP / DHCP）。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTIpSetting {
  private type: number;

  public setType(type: number): void {
    this.type = type;
  }

  getType(): number{
    return this.type;
  }

  private ipAddress?: string;

  public setIpAddress(ipAddress: string | undefined): void {
    this.ipAddress = ipAddress;
  }

  getIpAddress(): string | undefined{
    return this.ipAddress;
  }

  private subnetMask?: string;

  public setSubnetMask(subnetMask: string | undefined): void {
    this.subnetMask = subnetMask;
  }

  getSubnetMask(): string | undefined{
    return this.subnetMask;
  }

  private router?: string;

  public setRouter(router: string | undefined): void {
    this.router = router;
  }

  getRouter(): string | undefined{
    return this.router;
  }

  private preferredDns?: string;

  public setPreferredDns(preferredDns: string | undefined): void {
    this.preferredDns = preferredDns;
  }

  getPreferredDns(): string | undefined{
    return this.preferredDns;
  }

  private alternateDns?: string;

  public setAlternateDns(alternateDns: string | undefined): void {
    this.alternateDns = alternateDns;
  }

  getAlternateDns(): string | undefined{
    return this.alternateDns;
  }

  constructor(type: number, ipAddress?: string, subnetMask?: string, router?: string, preferredDns?: string, alternateDns?: string) {
    this.type = type;
    this.ipAddress = ipAddress;
    this.subnetMask = subnetMask;
    this.router = router;
    this.preferredDns = preferredDns;
    this.alternateDns = alternateDns;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.type === undefined || this.type === null) {
      arr.push(null);
    } else {
      arr.push(this.type);
    }
    if (this.ipAddress === undefined || this.ipAddress === null) {
      arr.push(null);
    } else {
      arr.push(this.ipAddress);
    }
    if (this.subnetMask === undefined || this.subnetMask === null) {
      arr.push(null);
    } else {
      arr.push(this.subnetMask);
    }
    if (this.router === undefined || this.router === null) {
      arr.push(null);
    } else {
      arr.push(this.router);
    }
    if (this.preferredDns === undefined || this.preferredDns === null) {
      arr.push(null);
    } else {
      arr.push(this.preferredDns);
    }
    if (this.alternateDns === undefined || this.alternateDns === null) {
      arr.push(null);
    } else {
      arr.push(this.alternateDns);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTIpSetting {
    let typeObject: Object = arr[0];
    const type: number = typeObject as number;
    let ipAddress: string | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let ipAddressObject: Object = arr[1];
      ipAddress = ipAddressObject as string | undefined;
    }
    let subnetMask: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let subnetMaskObject: Object = arr[2];
      subnetMask = subnetMaskObject as string | undefined;
    }
    let router: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let routerObject: Object = arr[3];
      router = routerObject as string | undefined;
    }
    let preferredDns: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let preferredDnsObject: Object = arr[4];
      preferredDns = preferredDnsObject as string | undefined;
    }
    let alternateDns: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let alternateDnsObject: Object = arr[5];
      alternateDns = alternateDnsObject as string | undefined;
    }
    return new TTIpSetting(type, ipAddress, subnetMask, router, preferredDns, alternateDns);
  }
}

/*
*  周期时间段（用于凭证有效期中的周期时间设置）。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTCycleModel {
  private weekDay: number;

  public setWeekDay(weekDay: number): void {
    this.weekDay = weekDay;
  }

  getWeekDay(): number{
    return this.weekDay;
  }

  private startTime: number;

  public setStartTime(startTime: number): void {
    this.startTime = startTime;
  }

  getStartTime(): number{
    return this.startTime;
  }

  private endTime: number;

  public setEndTime(endTime: number): void {
    this.endTime = endTime;
  }

  getEndTime(): number{
    return this.endTime;
  }

  constructor(weekDay: number, startTime: number, endTime: number) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.weekDay === undefined || this.weekDay === null) {
      arr.push(null);
    } else {
      arr.push(this.weekDay);
    }
    if (this.startTime === undefined || this.startTime === null) {
      arr.push(null);
    } else {
      arr.push(this.startTime);
    }
    if (this.endTime === undefined || this.endTime === null) {
      arr.push(null);
    } else {
      arr.push(this.endTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTCycleModel {
    let weekDayObject: Object = arr[0];
    const weekDay: number = weekDayObject as number;
    let startTimeObject: Object = arr[1];
    const startTime: number = startTimeObject as number;
    let endTimeObject: Object = arr[2];
    const endTime: number = endTimeObject as number;
    return new TTCycleModel(weekDay, startTime, endTime);
  }
}

/*
*  [TTEventChannelApi.lockScanWifi] 订阅前通过 [TTLockHostApi.setLockScanWifiParam] 写入。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockScanWifiEventParam {
  private lockData: string;

  public setLockData(lockData: string): void {
    this.lockData = lockData;
  }

  getLockData(): string{
    return this.lockData;
  }

  constructor(lockData: string) {
    this.lockData = lockData;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.lockData === undefined || this.lockData === null) {
      arr.push(null);
    } else {
      arr.push(this.lockData);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockScanWifiEventParam {
    let lockDataObject: Object = arr[0];
    const lockData: string = lockDataObject as string;
    return new TTLockScanWifiEventParam(lockData);
  }
}

/*
*  lockAddCard / lockAddFingerprint / lockAddFace 订阅前写入（含有效期，毫秒时间戳）。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockCredentialEventParam {
  private lockData: string;

  public setLockData(lockData: string): void {
    this.lockData = lockData;
  }

  getLockData(): string{
    return this.lockData;
  }

  private cycleList?: Array<TTCycleModel>;

  public setCycleList(cycleList: Array<TTCycleModel> | undefined): void {
    this.cycleList = cycleList;
  }

  getCycleList(): Array<TTCycleModel> | undefined{
    return this.cycleList;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(lockData: string, startDate: number, endDate: number, cycleList?: Array<TTCycleModel>) {
    this.lockData = lockData;
    this.cycleList = cycleList;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.lockData === undefined || this.lockData === null) {
      arr.push(null);
    } else {
      arr.push(this.lockData);
    }
    if (this.cycleList === undefined || this.cycleList === null) {
      arr.push(null);
    } else {
      arr.push(this.cycleList);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockCredentialEventParam {
    let lockDataObject: Object = arr[0];
    const lockData: string = lockDataObject as string;
    let cycleList: Array<TTCycleModel> | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let cycleListObject: Object = arr[1];
      cycleList = cycleListObject as Array<TTCycleModel> | undefined;
    }
    let startDateObject: Object = arr[2];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[3];
    const endDate: number = endDateObject as number;
    return new TTLockCredentialEventParam(lockData, startDate, endDate, cycleList);
  }
}

/*
*  accessoryAddKeypadFingerprint / accessoryAddKeypadCard 订阅前写入。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTKeypadCredentialEventParam {
  private keypadMac: string;

  public setKeypadMac(keypadMac: string): void {
    this.keypadMac = keypadMac;
  }

  getKeypadMac(): string{
    return this.keypadMac;
  }

  private lockData: string;

  public setLockData(lockData: string): void {
    this.lockData = lockData;
  }

  getLockData(): string{
    return this.lockData;
  }

  private isMultifunctional: boolean;

  public setIsMultifunctional(isMultifunctional: boolean): void {
    this.isMultifunctional = isMultifunctional;
  }

  getIsMultifunctional(): boolean{
    return this.isMultifunctional;
  }

  private cycleList?: Array<TTCycleModel>;

  public setCycleList(cycleList: Array<TTCycleModel> | undefined): void {
    this.cycleList = cycleList;
  }

  getCycleList(): Array<TTCycleModel> | undefined{
    return this.cycleList;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(keypadMac: string, lockData: string, isMultifunctional: boolean, startDate: number, endDate: number, cycleList?: Array<TTCycleModel>) {
    this.keypadMac = keypadMac;
    this.lockData = lockData;
    this.isMultifunctional = isMultifunctional;
    this.cycleList = cycleList;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.keypadMac === undefined || this.keypadMac === null) {
      arr.push(null);
    } else {
      arr.push(this.keypadMac);
    }
    if (this.lockData === undefined || this.lockData === null) {
      arr.push(null);
    } else {
      arr.push(this.lockData);
    }
    if (this.isMultifunctional === undefined || this.isMultifunctional === null) {
      arr.push(null);
    } else {
      arr.push(this.isMultifunctional);
    }
    if (this.cycleList === undefined || this.cycleList === null) {
      arr.push(null);
    } else {
      arr.push(this.cycleList);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTKeypadCredentialEventParam {
    let keypadMacObject: Object = arr[0];
    const keypadMac: string = keypadMacObject as string;
    let lockDataObject: Object = arr[1];
    const lockData: string = lockDataObject as string;
    let isMultifunctionalObject: Object = arr[2];
    const isMultifunctional: boolean = isMultifunctionalObject as boolean;
    let cycleList: Array<TTCycleModel> | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let cycleListObject: Object = arr[3];
      cycleList = cycleListObject as Array<TTCycleModel> | undefined;
    }
    let startDateObject: Object = arr[4];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[5];
    const endDate: number = endDateObject as number;
    return new TTKeypadCredentialEventParam(keypadMac, lockData, isMultifunctional, startDate, endDate, cycleList);
  }
}

/*
*  开关锁操作结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class ControlLockResult {
  private lockTime: number;

  public setLockTime(lockTime: number): void {
    this.lockTime = lockTime;
  }

  getLockTime(): number{
    return this.lockTime;
  }

  private electricQuantity: number;

  public setElectricQuantity(electricQuantity: number): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number{
    return this.electricQuantity;
  }

  private uniqueId: number;

  public setUniqueId(uniqueId: number): void {
    this.uniqueId = uniqueId;
  }

  getUniqueId(): number{
    return this.uniqueId;
  }

  private lockData?: string;

  public setLockData(lockData: string | undefined): void {
    this.lockData = lockData;
  }

  getLockData(): string | undefined{
    return this.lockData;
  }

  constructor(lockTime: number, electricQuantity: number, uniqueId: number, lockData?: string) {
    this.lockTime = lockTime;
    this.electricQuantity = electricQuantity;
    this.uniqueId = uniqueId;
    this.lockData = lockData;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.lockTime === undefined || this.lockTime === null) {
      arr.push(null);
    } else {
      arr.push(this.lockTime);
    }
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.uniqueId === undefined || this.uniqueId === null) {
      arr.push(null);
    } else {
      arr.push(this.uniqueId);
    }
    if (this.lockData === undefined || this.lockData === null) {
      arr.push(null);
    } else {
      arr.push(this.lockData);
    }
    return arr;
  }

  static fromList(arr: Object[]): ControlLockResult {
    let lockTimeObject: Object = arr[0];
    const lockTime: number = lockTimeObject as number;
    let electricQuantityObject: Object = arr[1];
    const electricQuantity: number = electricQuantityObject as number;
    let uniqueIdObject: Object = arr[2];
    const uniqueId: number = uniqueIdObject as number;
    let lockData: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let lockDataObject: Object = arr[3];
      lockData = lockDataObject as string | undefined;
    }
    return new ControlLockResult(lockTime, electricQuantity, uniqueId, lockData);
  }
}

/*
*  自动闭锁时间配置。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AutoLockingTime {
  private currentTime: number;

  public setCurrentTime(currentTime: number): void {
    this.currentTime = currentTime;
  }

  getCurrentTime(): number{
    return this.currentTime;
  }

  private minTime: number;

  public setMinTime(minTime: number): void {
    this.minTime = minTime;
  }

  getMinTime(): number{
    return this.minTime;
  }

  private maxTime: number;

  public setMaxTime(maxTime: number): void {
    this.maxTime = maxTime;
  }

  getMaxTime(): number{
    return this.maxTime;
  }

  constructor(currentTime: number, minTime: number, maxTime: number) {
    this.currentTime = currentTime;
    this.minTime = minTime;
    this.maxTime = maxTime;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.currentTime === undefined || this.currentTime === null) {
      arr.push(null);
    } else {
      arr.push(this.currentTime);
    }
    if (this.minTime === undefined || this.minTime === null) {
      arr.push(null);
    } else {
      arr.push(this.minTime);
    }
    if (this.maxTime === undefined || this.maxTime === null) {
      arr.push(null);
    } else {
      arr.push(this.maxTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): AutoLockingTime {
    let currentTimeObject: Object = arr[0];
    const currentTime: number = currentTimeObject as number;
    let minTimeObject: Object = arr[1];
    const minTime: number = minTimeObject as number;
    let maxTimeObject: Object = arr[2];
    const maxTime: number = maxTimeObject as number;
    return new AutoLockingTime(currentTime, minTime, maxTime);
  }
}

/*
*  锁连接的 WiFi 信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTWifiInfoModel {
  private wifiMac: string;

  public setWifiMac(wifiMac: string): void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string{
    return this.wifiMac;
  }

  private wifiRssi: number;

  public setWifiRssi(wifiRssi: number): void {
    this.wifiRssi = wifiRssi;
  }

  getWifiRssi(): number{
    return this.wifiRssi;
  }

  constructor(wifiMac: string, wifiRssi: number) {
    this.wifiMac = wifiMac;
    this.wifiRssi = wifiRssi;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.wifiMac === undefined || this.wifiMac === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiMac);
    }
    if (this.wifiRssi === undefined || this.wifiRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiRssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWifiInfoModel {
    let wifiMacObject: Object = arr[0];
    const wifiMac: string = wifiMacObject as string;
    let wifiRssiObject: Object = arr[1];
    const wifiRssi: number = wifiRssiObject as number;
    return new TTWifiInfoModel(wifiMac, wifiRssi);
  }
}

/*
*  摄像头锁 WiFi 配置结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class CameraLockWifiResult {
  private serialNumber: string;

  public setSerialNumber(serialNumber: string): void {
    this.serialNumber = serialNumber;
  }

  getSerialNumber(): string{
    return this.serialNumber;
  }

  private wifiName: string;

  public setWifiName(wifiName: string): void {
    this.wifiName = wifiName;
  }

  getWifiName(): string{
    return this.wifiName;
  }

  constructor(serialNumber: string, wifiName: string) {
    this.serialNumber = serialNumber;
    this.wifiName = wifiName;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.serialNumber === undefined || this.serialNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.serialNumber);
    }
    if (this.wifiName === undefined || this.wifiName === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiName);
    }
    return arr;
  }

  static fromList(arr: Object[]): CameraLockWifiResult {
    let serialNumberObject: Object = arr[0];
    const serialNumber: string = serialNumberObject as string;
    let wifiNameObject: Object = arr[1];
    const wifiName: string = wifiNameObject as string;
    return new CameraLockWifiResult(serialNumber, wifiName);
  }
}

/*
*  锁系统信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockSystemModel {
  private modelNum?: string;

  public setModelNum(modelNum: string | undefined): void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision: string | undefined): void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision: string | undefined): void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity: number | undefined): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private nbOperator?: string;

  public setNbOperator(nbOperator: string | undefined): void {
    this.nbOperator = nbOperator;
  }

  getNbOperator(): string | undefined{
    return this.nbOperator;
  }

  private nbNodeId?: string;

  public setNbNodeId(nbNodeId: string | undefined): void {
    this.nbNodeId = nbNodeId;
  }

  getNbNodeId(): string | undefined{
    return this.nbNodeId;
  }

  private nbCardNumber?: string;

  public setNbCardNumber(nbCardNumber: string | undefined): void {
    this.nbCardNumber = nbCardNumber;
  }

  getNbCardNumber(): string | undefined{
    return this.nbCardNumber;
  }

  private nbRssi?: string;

  public setNbRssi(nbRssi: string | undefined): void {
    this.nbRssi = nbRssi;
  }

  getNbRssi(): string | undefined{
    return this.nbRssi;
  }

  private lockData?: string;

  public setLockData(lockData: string | undefined): void {
    this.lockData = lockData;
  }

  getLockData(): string | undefined{
    return this.lockData;
  }

  constructor(modelNum?: string, hardwareRevision?: string, firmwareRevision?: string, electricQuantity?: number, nbOperator?: string, nbNodeId?: string, nbCardNumber?: string, nbRssi?: string, lockData?: string) {
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
    this.electricQuantity = electricQuantity;
    this.nbOperator = nbOperator;
    this.nbNodeId = nbNodeId;
    this.nbCardNumber = nbCardNumber;
    this.nbRssi = nbRssi;
    this.lockData = lockData;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.modelNum === undefined || this.modelNum === null) {
      arr.push(null);
    } else {
      arr.push(this.modelNum);
    }
    if (this.hardwareRevision === undefined || this.hardwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.hardwareRevision);
    }
    if (this.firmwareRevision === undefined || this.firmwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.firmwareRevision);
    }
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.nbOperator === undefined || this.nbOperator === null) {
      arr.push(null);
    } else {
      arr.push(this.nbOperator);
    }
    if (this.nbNodeId === undefined || this.nbNodeId === null) {
      arr.push(null);
    } else {
      arr.push(this.nbNodeId);
    }
    if (this.nbCardNumber === undefined || this.nbCardNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.nbCardNumber);
    }
    if (this.nbRssi === undefined || this.nbRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.nbRssi);
    }
    if (this.lockData === undefined || this.lockData === null) {
      arr.push(null);
    } else {
      arr.push(this.lockData);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockSystemModel {
    let modelNum: string | undefined = undefined;
    if (arr[0] !== null && arr[0] !== undefined) {
      let modelNumObject: Object = arr[0];
      modelNum = modelNumObject as string | undefined;
    }
    let hardwareRevision: string | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let hardwareRevisionObject: Object = arr[1];
      hardwareRevision = hardwareRevisionObject as string | undefined;
    }
    let firmwareRevision: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let firmwareRevisionObject: Object = arr[2];
      firmwareRevision = firmwareRevisionObject as string | undefined;
    }
    let electricQuantity: number | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let electricQuantityObject: Object = arr[3];
      electricQuantity = electricQuantityObject as number | undefined;
    }
    let nbOperator: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let nbOperatorObject: Object = arr[4];
      nbOperator = nbOperatorObject as string | undefined;
    }
    let nbNodeId: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let nbNodeIdObject: Object = arr[5];
      nbNodeId = nbNodeIdObject as string | undefined;
    }
    let nbCardNumber: string | undefined = undefined;
    if (arr[6] !== null && arr[6] !== undefined) {
      let nbCardNumberObject: Object = arr[6];
      nbCardNumber = nbCardNumberObject as string | undefined;
    }
    let nbRssi: string | undefined = undefined;
    if (arr[7] !== null && arr[7] !== undefined) {
      let nbRssiObject: Object = arr[7];
      nbRssi = nbRssiObject as string | undefined;
    }
    let lockData: string | undefined = undefined;
    if (arr[8] !== null && arr[8] !== undefined) {
      let lockDataObject: Object = arr[8];
      lockData = lockDataObject as string | undefined;
    }
    return new TTLockSystemModel(modelNum, hardwareRevision, firmwareRevision, electricQuantity, nbOperator, nbNodeId, nbCardNumber, nbRssi, lockData);
  }
}

/*
*  配件电量查询结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AccessoryElectricQuantityResult {
  private electricQuantity: number;

  public setElectricQuantity(electricQuantity: number): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number{
    return this.electricQuantity;
  }

  private updateDate: number;

  public setUpdateDate(updateDate: number): void {
    this.updateDate = updateDate;
  }

  getUpdateDate(): number{
    return this.updateDate;
  }

  constructor(electricQuantity: number, updateDate: number) {
    this.electricQuantity = electricQuantity;
    this.updateDate = updateDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.updateDate === undefined || this.updateDate === null) {
      arr.push(null);
    } else {
      arr.push(this.updateDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): AccessoryElectricQuantityResult {
    let electricQuantityObject: Object = arr[0];
    const electricQuantity: number = electricQuantityObject as number;
    let updateDateObject: Object = arr[1];
    const updateDate: number = updateDateObject as number;
    return new AccessoryElectricQuantityResult(electricQuantity, updateDate);
  }
}

/*
*  通行模式配置。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTPassageModeModel {
  private type: TTPassageModeType;

  public setType(type: TTPassageModeType): void {
    this.type = type;
  }

  getType(): TTPassageModeType{
    return this.type;
  }

  private weekly?: Array<number>;

  public setWeekly(weekly: Array<number> | undefined): void {
    this.weekly = weekly;
  }

  getWeekly(): Array<number> | undefined{
    return this.weekly;
  }

  private monthly?: Array<number>;

  public setMonthly(monthly: Array<number> | undefined): void {
    this.monthly = monthly;
  }

  getMonthly(): Array<number> | undefined{
    return this.monthly;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(type: TTPassageModeType, startDate: number, endDate: number, weekly?: Array<number>, monthly?: Array<number>) {
    this.type = type;
    this.weekly = weekly;
    this.monthly = monthly;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.type === undefined || this.type === null) {
      arr.push(null);
    } else {
      const typeStr = TTPassageModeType[this.type as number];
      arr.push(new TTPassageModeTypeEnum(typeStr));
    }
    if (this.weekly === undefined || this.weekly === null) {
      arr.push(null);
    } else {
      arr.push(this.weekly);
    }
    if (this.monthly === undefined || this.monthly === null) {
      arr.push(null);
    } else {
      arr.push(this.monthly);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTPassageModeModel {
    const typeStr: string = arr[0] as string;
    const type: TTPassageModeType = TTPassageModeType[typeStr];
    let weekly: Array<number> | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let weeklyObject: Object = arr[1];
      weekly = weeklyObject as Array<number> | undefined;
    }
    let monthly: Array<number> | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let monthlyObject: Object = arr[2];
      monthly = monthlyObject as Array<number> | undefined;
    }
    let startDateObject: Object = arr[3];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[4];
    const endDate: number = endDateObject as number;
    return new TTPassageModeModel(type, startDate, endDate, weekly, monthly);
  }
}

/*
*  锁扫描结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTLockScanModel {
  private lockName: string;

  public setLockName(lockName: string): void {
    this.lockName = lockName;
  }

  getLockName(): string{
    return this.lockName;
  }

  private lockMac: string;

  public setLockMac(lockMac: string): void {
    this.lockMac = lockMac;
  }

  getLockMac(): string{
    return this.lockMac;
  }

  private isInited: boolean;

  public setIsInited(isInited: boolean): void {
    this.isInited = isInited;
  }

  getIsInited(): boolean{
    return this.isInited;
  }

  private isAllowUnlock: boolean;

  public setIsAllowUnlock(isAllowUnlock: boolean): void {
    this.isAllowUnlock = isAllowUnlock;
  }

  getIsAllowUnlock(): boolean{
    return this.isAllowUnlock;
  }

  private electricQuantity: number;

  public setElectricQuantity(electricQuantity: number): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number{
    return this.electricQuantity;
  }

  private lockVersion: TTLockVersion;

  public setLockVersion(lockVersion: TTLockVersion): void {
    this.lockVersion = lockVersion;
  }

  getLockVersion(): TTLockVersion{
    return this.lockVersion;
  }

  private lockSwitchState: TTLockSwitchState;

  public setLockSwitchState(lockSwitchState: TTLockSwitchState): void {
    this.lockSwitchState = lockSwitchState;
  }

  getLockSwitchState(): TTLockSwitchState{
    return this.lockSwitchState;
  }

  private rssi: number;

  public setRssi(rssi: number): void {
    this.rssi = rssi;
  }

  getRssi(): number{
    return this.rssi;
  }

  private oneMeterRssi: number;

  public setOneMeterRssi(oneMeterRssi: number): void {
    this.oneMeterRssi = oneMeterRssi;
  }

  getOneMeterRssi(): number{
    return this.oneMeterRssi;
  }

  private timestamp: number;

  public setTimestamp(timestamp: number): void {
    this.timestamp = timestamp;
  }

  getTimestamp(): number{
    return this.timestamp;
  }

  constructor(lockName: string, lockMac: string, isInited: boolean, isAllowUnlock: boolean, electricQuantity: number, lockVersion: TTLockVersion, lockSwitchState: TTLockSwitchState, rssi: number, oneMeterRssi: number, timestamp: number) {
    this.lockName = lockName;
    this.lockMac = lockMac;
    this.isInited = isInited;
    this.isAllowUnlock = isAllowUnlock;
    this.electricQuantity = electricQuantity;
    this.lockVersion = lockVersion;
    this.lockSwitchState = lockSwitchState;
    this.rssi = rssi;
    this.oneMeterRssi = oneMeterRssi;
    this.timestamp = timestamp;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.lockName === undefined || this.lockName === null) {
      arr.push(null);
    } else {
      arr.push(this.lockName);
    }
    if (this.lockMac === undefined || this.lockMac === null) {
      arr.push(null);
    } else {
      arr.push(this.lockMac);
    }
    if (this.isInited === undefined || this.isInited === null) {
      arr.push(null);
    } else {
      arr.push(this.isInited);
    }
    if (this.isAllowUnlock === undefined || this.isAllowUnlock === null) {
      arr.push(null);
    } else {
      arr.push(this.isAllowUnlock);
    }
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.lockVersion === undefined || this.lockVersion === null) {
      arr.push(null);
    } else {
      arr.push(this.lockVersion);
    }
    if (this.lockSwitchState === undefined || this.lockSwitchState === null) {
      arr.push(null);
    } else {
      const lockSwitchStateStr = TTLockSwitchState[this.lockSwitchState as number];
      arr.push(new TTLockSwitchStateEnum(lockSwitchStateStr));
    }
    if (this.rssi === undefined || this.rssi === null) {
      arr.push(null);
    } else {
      arr.push(this.rssi);
    }
    if (this.oneMeterRssi === undefined || this.oneMeterRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.oneMeterRssi);
    }
    if (this.timestamp === undefined || this.timestamp === null) {
      arr.push(null);
    } else {
      arr.push(this.timestamp);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockScanModel {
    let lockNameObject: Object = arr[0];
    const lockName: string = lockNameObject as string;
    let lockMacObject: Object = arr[1];
    const lockMac: string = lockMacObject as string;
    let isInitedObject: Object = arr[2];
    const isInited: boolean = isInitedObject as boolean;
    let isAllowUnlockObject: Object = arr[3];
    const isAllowUnlock: boolean = isAllowUnlockObject as boolean;
    let electricQuantityObject: Object = arr[4];
    const electricQuantity: number = electricQuantityObject as number;
    let lockVersionObject: Object = arr[5];
    const lockVersion: TTLockVersion = lockVersionObject as TTLockVersion;
    const lockSwitchStateStr: string = arr[6] as string;
    const lockSwitchState: TTLockSwitchState = TTLockSwitchState[lockSwitchStateStr];
    let rssiObject: Object = arr[7];
    const rssi: number = rssiObject as number;
    let oneMeterRssiObject: Object = arr[8];
    const oneMeterRssi: number = oneMeterRssiObject as number;
    let timestampObject: Object = arr[9];
    const timestamp: number = timestampObject as number;
    return new TTLockScanModel(lockName, lockMac, isInited, isAllowUnlock, electricQuantity, lockVersion, lockSwitchState, rssi, oneMeterRssi, timestamp);
  }
}

/*
*  密码信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTPasscodeModel {
  private keyboardPwd: string;

  public setKeyboardPwd(keyboardPwd: string): void {
    this.keyboardPwd = keyboardPwd;
  }

  getKeyboardPwd(): string{
    return this.keyboardPwd;
  }

  private newKeyboardPwd: string;

  public setNewKeyboardPwd(newKeyboardPwd: string): void {
    this.newKeyboardPwd = newKeyboardPwd;
  }

  getNewKeyboardPwd(): string{
    return this.newKeyboardPwd;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  private keyboardPwdType: number;

  public setKeyboardPwdType(keyboardPwdType: number): void {
    this.keyboardPwdType = keyboardPwdType;
  }

  getKeyboardPwdType(): number{
    return this.keyboardPwdType;
  }

  private cycleType?: number;

  public setCycleType(cycleType: number | undefined): void {
    this.cycleType = cycleType;
  }

  getCycleType(): number | undefined{
    return this.cycleType;
  }

  constructor(keyboardPwd: string, newKeyboardPwd: string, startDate: number, endDate: number, keyboardPwdType: number, cycleType?: number) {
    this.keyboardPwd = keyboardPwd;
    this.newKeyboardPwd = newKeyboardPwd;
    this.startDate = startDate;
    this.endDate = endDate;
    this.keyboardPwdType = keyboardPwdType;
    this.cycleType = cycleType;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.keyboardPwd === undefined || this.keyboardPwd === null) {
      arr.push(null);
    } else {
      arr.push(this.keyboardPwd);
    }
    if (this.newKeyboardPwd === undefined || this.newKeyboardPwd === null) {
      arr.push(null);
    } else {
      arr.push(this.newKeyboardPwd);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    if (this.keyboardPwdType === undefined || this.keyboardPwdType === null) {
      arr.push(null);
    } else {
      arr.push(this.keyboardPwdType);
    }
    if (this.cycleType === undefined || this.cycleType === null) {
      arr.push(null);
    } else {
      arr.push(this.cycleType);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTPasscodeModel {
    let keyboardPwdObject: Object = arr[0];
    const keyboardPwd: string = keyboardPwdObject as string;
    let newKeyboardPwdObject: Object = arr[1];
    const newKeyboardPwd: string = newKeyboardPwdObject as string;
    let startDateObject: Object = arr[2];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[3];
    const endDate: number = endDateObject as number;
    let keyboardPwdTypeObject: Object = arr[4];
    const keyboardPwdType: number = keyboardPwdTypeObject as number;
    let cycleType: number | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let cycleTypeObject: Object = arr[5];
      cycleType = cycleTypeObject as number | undefined;
    }
    return new TTPasscodeModel(keyboardPwd, newKeyboardPwd, startDate, endDate, keyboardPwdType, cycleType);
  }
}

/*
*  IC 卡信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTICCardModel {
  private cardNumber: string;

  public setCardNumber(cardNumber: string): void {
    this.cardNumber = cardNumber;
  }

  getCardNumber(): string{
    return this.cardNumber;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(cardNumber: string, startDate: number, endDate: number) {
    this.cardNumber = cardNumber;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.cardNumber === undefined || this.cardNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.cardNumber);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTICCardModel {
    let cardNumberObject: Object = arr[0];
    const cardNumber: string = cardNumberObject as string;
    let startDateObject: Object = arr[1];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[2];
    const endDate: number = endDateObject as number;
    return new TTICCardModel(cardNumber, startDate, endDate);
  }
}

/*
*  指纹信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTFingerprintModel {
  private fingerprintNumber: string;

  public setFingerprintNumber(fingerprintNumber: string): void {
    this.fingerprintNumber = fingerprintNumber;
  }

  getFingerprintNumber(): string{
    return this.fingerprintNumber;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(fingerprintNumber: string, startDate: number, endDate: number) {
    this.fingerprintNumber = fingerprintNumber;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.fingerprintNumber === undefined || this.fingerprintNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.fingerprintNumber);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTFingerprintModel {
    let fingerprintNumberObject: Object = arr[0];
    const fingerprintNumber: string = fingerprintNumberObject as string;
    let startDateObject: Object = arr[1];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[2];
    const endDate: number = endDateObject as number;
    return new TTFingerprintModel(fingerprintNumber, startDate, endDate);
  }
}

/*
*  掌静脉信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTPalmVeinModel {
  private palmVeinNumber: string;

  public setPalmVeinNumber(palmVeinNumber: string): void {
    this.palmVeinNumber = palmVeinNumber;
  }

  getPalmVeinNumber(): string{
    return this.palmVeinNumber;
  }

  private startDate: number;

  public setStartDate(startDate: number): void {
    this.startDate = startDate;
  }

  getStartDate(): number{
    return this.startDate;
  }

  private endDate: number;

  public setEndDate(endDate: number): void {
    this.endDate = endDate;
  }

  getEndDate(): number{
    return this.endDate;
  }

  constructor(palmVeinNumber: string, startDate: number, endDate: number) {
    this.palmVeinNumber = palmVeinNumber;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.palmVeinNumber === undefined || this.palmVeinNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.palmVeinNumber);
    }
    if (this.startDate === undefined || this.startDate === null) {
      arr.push(null);
    } else {
      arr.push(this.startDate);
    }
    if (this.endDate === undefined || this.endDate === null) {
      arr.push(null);
    } else {
      arr.push(this.endDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTPalmVeinModel {
    let palmVeinNumberObject: Object = arr[0];
    const palmVeinNumber: string = palmVeinNumberObject as string;
    let startDateObject: Object = arr[1];
    const startDate: number = startDateObject as number;
    let endDateObject: Object = arr[2];
    const endDate: number = endDateObject as number;
    return new TTPalmVeinModel(palmVeinNumber, startDate, endDate);
  }
}

/*
*  网关扫描结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTGatewayScanModel {
  private gatewayName: string;

  public setGatewayName(gatewayName: string): void {
    this.gatewayName = gatewayName;
  }

  getGatewayName(): string{
    return this.gatewayName;
  }

  private gatewayMac: string;

  public setGatewayMac(gatewayMac: string): void {
    this.gatewayMac = gatewayMac;
  }

  getGatewayMac(): string{
    return this.gatewayMac;
  }

  private rssi: number;

  public setRssi(rssi: number): void {
    this.rssi = rssi;
  }

  getRssi(): number{
    return this.rssi;
  }

  private isDfuMode: boolean;

  public setIsDfuMode(isDfuMode: boolean): void {
    this.isDfuMode = isDfuMode;
  }

  getIsDfuMode(): boolean{
    return this.isDfuMode;
  }

  private type: TTGatewayType;

  public setType(type: TTGatewayType): void {
    this.type = type;
  }

  getType(): TTGatewayType{
    return this.type;
  }

  constructor(gatewayName: string, gatewayMac: string, rssi: number, isDfuMode: boolean, type: TTGatewayType) {
    this.gatewayName = gatewayName;
    this.gatewayMac = gatewayMac;
    this.rssi = rssi;
    this.isDfuMode = isDfuMode;
    this.type = type;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.gatewayName === undefined || this.gatewayName === null) {
      arr.push(null);
    } else {
      arr.push(this.gatewayName);
    }
    if (this.gatewayMac === undefined || this.gatewayMac === null) {
      arr.push(null);
    } else {
      arr.push(this.gatewayMac);
    }
    if (this.rssi === undefined || this.rssi === null) {
      arr.push(null);
    } else {
      arr.push(this.rssi);
    }
    if (this.isDfuMode === undefined || this.isDfuMode === null) {
      arr.push(null);
    } else {
      arr.push(this.isDfuMode);
    }
    if (this.type === undefined || this.type === null) {
      arr.push(null);
    } else {
      const typeStr = TTGatewayType[this.type as number];
      arr.push(new TTGatewayTypeEnum(typeStr));
    }
    return arr;
  }

  static fromList(arr: Object[]): TTGatewayScanModel {
    let gatewayNameObject: Object = arr[0];
    const gatewayName: string = gatewayNameObject as string;
    let gatewayMacObject: Object = arr[1];
    const gatewayMac: string = gatewayMacObject as string;
    let rssiObject: Object = arr[2];
    const rssi: number = rssiObject as number;
    let isDfuModeObject: Object = arr[3];
    const isDfuMode: boolean = isDfuModeObject as boolean;
    const typeStr: string = arr[4] as string;
    const type: TTGatewayType = TTGatewayType[typeStr];
    return new TTGatewayScanModel(gatewayName, gatewayMac, rssi, isDfuMode, type);
  }
}

/*
*  网关设备信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class GatewayDeviceInfo {
  private modelNum: string;

  public setModelNum(modelNum: string): void {
    this.modelNum = modelNum;
  }

  getModelNum(): string{
    return this.modelNum;
  }

  private hardwareRevision: string;

  public setHardwareRevision(hardwareRevision: string): void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string{
    return this.hardwareRevision;
  }

  private firmwareRevision: string;

  public setFirmwareRevision(firmwareRevision: string): void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string{
    return this.firmwareRevision;
  }

  private networkMac: string;

  public setNetworkMac(networkMac: string): void {
    this.networkMac = networkMac;
  }

  getNetworkMac(): string{
    return this.networkMac;
  }

  constructor(modelNum: string, hardwareRevision: string, firmwareRevision: string, networkMac: string) {
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
    this.networkMac = networkMac;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.modelNum === undefined || this.modelNum === null) {
      arr.push(null);
    } else {
      arr.push(this.modelNum);
    }
    if (this.hardwareRevision === undefined || this.hardwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.hardwareRevision);
    }
    if (this.firmwareRevision === undefined || this.firmwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.firmwareRevision);
    }
    if (this.networkMac === undefined || this.networkMac === null) {
      arr.push(null);
    } else {
      arr.push(this.networkMac);
    }
    return arr;
  }

  static fromList(arr: Object[]): GatewayDeviceInfo {
    let modelNumObject: Object = arr[0];
    const modelNum: string = modelNumObject as string;
    let hardwareRevisionObject: Object = arr[1];
    const hardwareRevision: string = hardwareRevisionObject as string;
    let firmwareRevisionObject: Object = arr[2];
    const firmwareRevision: string = firmwareRevisionObject as string;
    let networkMacObject: Object = arr[3];
    const networkMac: string = networkMacObject as string;
    return new GatewayDeviceInfo(modelNum, hardwareRevision, firmwareRevision, networkMac);
  }
}

/*
*  遥控配件（遥控器、键盘）扫描结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTRemoteAccessoryScanModel {
  private name: string;

  public setName(name: string): void {
    this.name = name;
  }

  getName(): string{
    return this.name;
  }

  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private rssi: number;

  public setRssi(rssi: number): void {
    this.rssi = rssi;
  }

  getRssi(): number{
    return this.rssi;
  }

  private scanTime?: number;

  public setScanTime(scanTime: number | undefined): void {
    this.scanTime = scanTime;
  }

  getScanTime(): number | undefined{
    return this.scanTime;
  }

  private isMultifunctionalKeypad: boolean;

  public setIsMultifunctionalKeypad(isMultifunctionalKeypad: boolean): void {
    this.isMultifunctionalKeypad = isMultifunctionalKeypad;
  }

  getIsMultifunctionalKeypad(): boolean{
    return this.isMultifunctionalKeypad;
  }

  private advertisementData: Map<string, Object | undefined>;

  public setAdvertisementData(advertisementData: Map<string, Object | undefined>): void {
    this.advertisementData = advertisementData;
  }

  getAdvertisementData(): Map<string, Object | undefined>{
    return this.advertisementData;
  }

  constructor(name: string, mac: string, rssi: number, isMultifunctionalKeypad: boolean, advertisementData: Map<string, Object | undefined>, scanTime?: number) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
    this.scanTime = scanTime;
    this.isMultifunctionalKeypad = isMultifunctionalKeypad;
    this.advertisementData = advertisementData;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.rssi === undefined || this.rssi === null) {
      arr.push(null);
    } else {
      arr.push(this.rssi);
    }
    if (this.scanTime === undefined || this.scanTime === null) {
      arr.push(null);
    } else {
      arr.push(this.scanTime);
    }
    if (this.isMultifunctionalKeypad === undefined || this.isMultifunctionalKeypad === null) {
      arr.push(null);
    } else {
      arr.push(this.isMultifunctionalKeypad);
    }
    if (this.advertisementData === undefined || this.advertisementData === null) {
      arr.push(null);
    } else {
      arr.push(this.advertisementData);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTRemoteAccessoryScanModel {
    let nameObject: Object = arr[0];
    const name: string = nameObject as string;
    let macObject: Object = arr[1];
    const mac: string = macObject as string;
    let rssiObject: Object = arr[2];
    const rssi: number = rssiObject as number;
    let scanTime: number | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let scanTimeObject: Object = arr[3];
      scanTime = scanTimeObject as number | undefined;
    }
    let isMultifunctionalKeypadObject: Object = arr[4];
    const isMultifunctionalKeypad: boolean = isMultifunctionalKeypadObject as boolean;
    let advertisementDataObject: Object = arr[5];
    const advertisementData: Map<string, Object | undefined> = advertisementDataObject as Map<string, Object | undefined>;
    return new TTRemoteAccessoryScanModel(name, mac, rssi, isMultifunctionalKeypad, advertisementData, scanTime);
  }
}

/*
*  独立门磁初始化参数。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTStandaloneDoorSensorInitParams {
  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private doorSensorName: string;

  public setDoorSensorName(doorSensorName: string): void {
    this.doorSensorName = doorSensorName;
  }

  getDoorSensorName(): string{
    return this.doorSensorName;
  }

  private wifiName: string;

  public setWifiName(wifiName: string): void {
    this.wifiName = wifiName;
  }

  getWifiName(): string{
    return this.wifiName;
  }

  private wifiPassword: string;

  public setWifiPassword(wifiPassword: string): void {
    this.wifiPassword = wifiPassword;
  }

  getWifiPassword(): string{
    return this.wifiPassword;
  }

  private serverAddress: string;

  public setServerAddress(serverAddress: string): void {
    this.serverAddress = serverAddress;
  }

  getServerAddress(): string{
    return this.serverAddress;
  }

  private portNumber: number;

  public setPortNumber(portNumber: number): void {
    this.portNumber = portNumber;
  }

  getPortNumber(): number{
    return this.portNumber;
  }

  constructor(mac: string, doorSensorName: string, wifiName: string, wifiPassword: string, serverAddress: string, portNumber: number) {
    this.mac = mac;
    this.doorSensorName = doorSensorName;
    this.wifiName = wifiName;
    this.wifiPassword = wifiPassword;
    this.serverAddress = serverAddress;
    this.portNumber = portNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.doorSensorName === undefined || this.doorSensorName === null) {
      arr.push(null);
    } else {
      arr.push(this.doorSensorName);
    }
    if (this.wifiName === undefined || this.wifiName === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiName);
    }
    if (this.wifiPassword === undefined || this.wifiPassword === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiPassword);
    }
    if (this.serverAddress === undefined || this.serverAddress === null) {
      arr.push(null);
    } else {
      arr.push(this.serverAddress);
    }
    if (this.portNumber === undefined || this.portNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.portNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTStandaloneDoorSensorInitParams {
    let macObject: Object = arr[0];
    const mac: string = macObject as string;
    let doorSensorNameObject: Object = arr[1];
    const doorSensorName: string = doorSensorNameObject as string;
    let wifiNameObject: Object = arr[2];
    const wifiName: string = wifiNameObject as string;
    let wifiPasswordObject: Object = arr[3];
    const wifiPassword: string = wifiPasswordObject as string;
    let serverAddressObject: Object = arr[4];
    const serverAddress: string = serverAddressObject as string;
    let portNumberObject: Object = arr[5];
    const portNumber: number = portNumberObject as number;
    return new TTStandaloneDoorSensorInitParams(mac, doorSensorName, wifiName, wifiPassword, serverAddress, portNumber);
  }
}

/*
*  独立门磁扫描结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTStandaloneDoorSensorScanModel {
  private name: string;

  public setName(name: string): void {
    this.name = name;
  }

  getName(): string{
    return this.name;
  }

  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private rssi: number;

  public setRssi(rssi: number): void {
    this.rssi = rssi;
  }

  getRssi(): number{
    return this.rssi;
  }

  private scanTime?: number;

  public setScanTime(scanTime: number | undefined): void {
    this.scanTime = scanTime;
  }

  getScanTime(): number | undefined{
    return this.scanTime;
  }

  constructor(name: string, mac: string, rssi: number, scanTime?: number) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
    this.scanTime = scanTime;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.rssi === undefined || this.rssi === null) {
      arr.push(null);
    } else {
      arr.push(this.rssi);
    }
    if (this.scanTime === undefined || this.scanTime === null) {
      arr.push(null);
    } else {
      arr.push(this.scanTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTStandaloneDoorSensorScanModel {
    let nameObject: Object = arr[0];
    const name: string = nameObject as string;
    let macObject: Object = arr[1];
    const mac: string = macObject as string;
    let rssiObject: Object = arr[2];
    const rssi: number = rssiObject as number;
    let scanTime: number | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let scanTimeObject: Object = arr[3];
      scanTime = scanTimeObject as number | undefined;
    }
    return new TTStandaloneDoorSensorScanModel(name, mac, rssi, scanTime);
  }
}

/*
*  独立门磁设备信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTStandaloneDoorSensorInfo {
  private doorSensorData?: string;

  public setDoorSensorData(doorSensorData: string | undefined): void {
    this.doorSensorData = doorSensorData;
  }

  getDoorSensorData(): string | undefined{
    return this.doorSensorData;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity: number | undefined): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private featureValue?: string;

  public setFeatureValue(featureValue: string | undefined): void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string | undefined{
    return this.featureValue;
  }

  private wifiMac?: string;

  public setWifiMac(wifiMac: string | undefined): void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string | undefined{
    return this.wifiMac;
  }

  private modelNum?: string;

  public setModelNum(modelNum: string | undefined): void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision: string | undefined): void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision: string | undefined): void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  constructor(doorSensorData?: string, electricQuantity?: number, featureValue?: string, wifiMac?: string, modelNum?: string, hardwareRevision?: string, firmwareRevision?: string) {
    this.doorSensorData = doorSensorData;
    this.electricQuantity = electricQuantity;
    this.featureValue = featureValue;
    this.wifiMac = wifiMac;
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.doorSensorData === undefined || this.doorSensorData === null) {
      arr.push(null);
    } else {
      arr.push(this.doorSensorData);
    }
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.featureValue === undefined || this.featureValue === null) {
      arr.push(null);
    } else {
      arr.push(this.featureValue);
    }
    if (this.wifiMac === undefined || this.wifiMac === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiMac);
    }
    if (this.modelNum === undefined || this.modelNum === null) {
      arr.push(null);
    } else {
      arr.push(this.modelNum);
    }
    if (this.hardwareRevision === undefined || this.hardwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.hardwareRevision);
    }
    if (this.firmwareRevision === undefined || this.firmwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.firmwareRevision);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTStandaloneDoorSensorInfo {
    let doorSensorData: string | undefined = undefined;
    if (arr[0] !== null && arr[0] !== undefined) {
      let doorSensorDataObject: Object = arr[0];
      doorSensorData = doorSensorDataObject as string | undefined;
    }
    let electricQuantity: number | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let electricQuantityObject: Object = arr[1];
      electricQuantity = electricQuantityObject as number | undefined;
    }
    let featureValue: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let featureValueObject: Object = arr[2];
      featureValue = featureValueObject as string | undefined;
    }
    let wifiMac: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let wifiMacObject: Object = arr[3];
      wifiMac = wifiMacObject as string | undefined;
    }
    let modelNum: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let modelNumObject: Object = arr[4];
      modelNum = modelNumObject as string | undefined;
    }
    let hardwareRevision: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let hardwareRevisionObject: Object = arr[5];
      hardwareRevision = hardwareRevisionObject as string | undefined;
    }
    let firmwareRevision: string | undefined = undefined;
    if (arr[6] !== null && arr[6] !== undefined) {
      let firmwareRevisionObject: Object = arr[6];
      firmwareRevision = firmwareRevisionObject as string | undefined;
    }
    return new TTStandaloneDoorSensorInfo(doorSensorData, electricQuantity, featureValue, wifiMac, modelNum, hardwareRevision, firmwareRevision);
  }
}

/*
*  水电表扫描结果（通用）。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTMeterScanModel {
  private name: string;

  public setName(name: string): void {
    this.name = name;
  }

  getName(): string{
    return this.name;
  }

  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private rssi: number;

  public setRssi(rssi: number): void {
    this.rssi = rssi;
  }

  getRssi(): number{
    return this.rssi;
  }

  constructor(name: string, mac: string, rssi: number) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.rssi === undefined || this.rssi === null) {
      arr.push(null);
    } else {
      arr.push(this.rssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTMeterScanModel {
    let nameObject: Object = arr[0];
    const name: string = nameObject as string;
    let macObject: Object = arr[1];
    const mac: string = macObject as string;
    let rssiObject: Object = arr[2];
    const rssi: number = rssiObject as number;
    return new TTMeterScanModel(name, mac, rssi);
  }
}

/*
*  水表初始化结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTWaterMeterInitResult {
  private waterMeterId: number;

  public setWaterMeterId(waterMeterId: number): void {
    this.waterMeterId = waterMeterId;
  }

  getWaterMeterId(): number{
    return this.waterMeterId;
  }

  private featureValue: string;

  public setFeatureValue(featureValue: string): void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string{
    return this.featureValue;
  }

  constructor(waterMeterId: number, featureValue: string) {
    this.waterMeterId = waterMeterId;
    this.featureValue = featureValue;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.waterMeterId === undefined || this.waterMeterId === null) {
      arr.push(null);
    } else {
      arr.push(this.waterMeterId);
    }
    if (this.featureValue === undefined || this.featureValue === null) {
      arr.push(null);
    } else {
      arr.push(this.featureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWaterMeterInitResult {
    let waterMeterIdObject: Object = arr[0];
    const waterMeterId: number = waterMeterIdObject as number;
    let featureValueObject: Object = arr[1];
    const featureValue: string = featureValueObject as string;
    return new TTWaterMeterInitResult(waterMeterId, featureValue);
  }
}

/*
*  电表初始化结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTElectricMeterInitResult {
  private electricMeterId: number;

  public setElectricMeterId(electricMeterId: number): void {
    this.electricMeterId = electricMeterId;
  }

  getElectricMeterId(): number{
    return this.electricMeterId;
  }

  private featureValue: string;

  public setFeatureValue(featureValue: string): void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string{
    return this.featureValue;
  }

  constructor(electricMeterId: number, featureValue: string) {
    this.electricMeterId = electricMeterId;
    this.featureValue = featureValue;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.electricMeterId === undefined || this.electricMeterId === null) {
      arr.push(null);
    } else {
      arr.push(this.electricMeterId);
    }
    if (this.featureValue === undefined || this.featureValue === null) {
      arr.push(null);
    } else {
      arr.push(this.featureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTElectricMeterInitResult {
    let electricMeterIdObject: Object = arr[0];
    const electricMeterId: number = electricMeterIdObject as number;
    let featureValueObject: Object = arr[1];
    const featureValue: string = featureValueObject as string;
    return new TTElectricMeterInitResult(electricMeterId, featureValue);
  }
}

/*
*  WiFi 扫描结果列表。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTWifiScanResult {
  private wifiList: Array<TTWifiScanEntry>;

  public setWifiList(wifiList: Array<TTWifiScanEntry>): void {
    this.wifiList = wifiList;
  }

  getWifiList(): Array<TTWifiScanEntry>{
    return this.wifiList;
  }

  constructor(wifiList: Array<TTWifiScanEntry>) {
    this.wifiList = wifiList;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.wifiList === undefined || this.wifiList === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiList);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWifiScanResult {
    let wifiListObject: Object = arr[0];
    const wifiList: Array<TTWifiScanEntry> = wifiListObject as Array<TTWifiScanEntry>;
    return new TTWifiScanResult(wifiList);
  }
}

/*
*  WiFi 扫描条目（全可选字段，兼容不同场景）。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTWifiScanEntry {
  private wifiMac?: string;

  public setWifiMac(wifiMac: string | undefined): void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string | undefined{
    return this.wifiMac;
  }

  private wifiRssi?: number;

  public setWifiRssi(wifiRssi: number | undefined): void {
    this.wifiRssi = wifiRssi;
  }

  getWifiRssi(): number | undefined{
    return this.wifiRssi;
  }

  private bssid?: string;

  public setBssid(bssid: string | undefined): void {
    this.bssid = bssid;
  }

  getBssid(): string | undefined{
    return this.bssid;
  }

  private ssid?: string;

  public setSsid(ssid: string | undefined): void {
    this.ssid = ssid;
  }

  getSsid(): string | undefined{
    return this.ssid;
  }

  private wifiName?: string;

  public setWifiName(wifiName: string | undefined): void {
    this.wifiName = wifiName;
  }

  getWifiName(): string | undefined{
    return this.wifiName;
  }

  private name?: string;

  public setName(name: string | undefined): void {
    this.name = name;
  }

  getName(): string | undefined{
    return this.name;
  }

  constructor(wifiMac?: string, wifiRssi?: number, bssid?: string, ssid?: string, wifiName?: string, name?: string) {
    this.wifiMac = wifiMac;
    this.wifiRssi = wifiRssi;
    this.bssid = bssid;
    this.ssid = ssid;
    this.wifiName = wifiName;
    this.name = name;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.wifiMac === undefined || this.wifiMac === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiMac);
    }
    if (this.wifiRssi === undefined || this.wifiRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiRssi);
    }
    if (this.bssid === undefined || this.bssid === null) {
      arr.push(null);
    } else {
      arr.push(this.bssid);
    }
    if (this.ssid === undefined || this.ssid === null) {
      arr.push(null);
    } else {
      arr.push(this.ssid);
    }
    if (this.wifiName === undefined || this.wifiName === null) {
      arr.push(null);
    } else {
      arr.push(this.wifiName);
    }
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWifiScanEntry {
    let wifiMac: string | undefined = undefined;
    if (arr[0] !== null && arr[0] !== undefined) {
      let wifiMacObject: Object = arr[0];
      wifiMac = wifiMacObject as string | undefined;
    }
    let wifiRssi: number | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let wifiRssiObject: Object = arr[1];
      wifiRssi = wifiRssiObject as number | undefined;
    }
    let bssid: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let bssidObject: Object = arr[2];
      bssid = bssidObject as string | undefined;
    }
    let ssid: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let ssidObject: Object = arr[3];
      ssid = ssidObject as string | undefined;
    }
    let wifiName: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let wifiNameObject: Object = arr[4];
      wifiName = wifiNameObject as string | undefined;
    }
    let name: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let nameObject: Object = arr[5];
      name = nameObject as string | undefined;
    }
    return new TTWifiScanEntry(wifiMac, wifiRssi, bssid, ssid, wifiName, name);
  }
}

/*
*  无线键盘初始化结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class RemoteKeypadInitResult {
  private electricQuantity: number;

  public setElectricQuantity(electricQuantity: number): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number{
    return this.electricQuantity;
  }

  private wirelessKeypadFeatureValue: string;

  public setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue: string): void {
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  getWirelessKeypadFeatureValue(): string{
    return this.wirelessKeypadFeatureValue;
  }

  constructor(electricQuantity: number, wirelessKeypadFeatureValue: string) {
    this.electricQuantity = electricQuantity;
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.wirelessKeypadFeatureValue === undefined || this.wirelessKeypadFeatureValue === null) {
      arr.push(null);
    } else {
      arr.push(this.wirelessKeypadFeatureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): RemoteKeypadInitResult {
    let electricQuantityObject: Object = arr[0];
    const electricQuantity: number = electricQuantityObject as number;
    let wirelessKeypadFeatureValueObject: Object = arr[1];
    const wirelessKeypadFeatureValue: string = wirelessKeypadFeatureValueObject as string;
    return new RemoteKeypadInitResult(electricQuantity, wirelessKeypadFeatureValue);
  }
}

/*
*  多功能键盘初始化结果。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class MultifunctionalKeypadInitResult {
  private electricQuantity: number;

  public setElectricQuantity(electricQuantity: number): void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number{
    return this.electricQuantity;
  }

  private wirelessKeypadFeatureValue: string;

  public setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue: string): void {
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  getWirelessKeypadFeatureValue(): string{
    return this.wirelessKeypadFeatureValue;
  }

  private slotNumber: number;

  public setSlotNumber(slotNumber: number): void {
    this.slotNumber = slotNumber;
  }

  getSlotNumber(): number{
    return this.slotNumber;
  }

  private slotLimit: number;

  public setSlotLimit(slotLimit: number): void {
    this.slotLimit = slotLimit;
  }

  getSlotLimit(): number{
    return this.slotLimit;
  }

  private modelNum?: string;

  public setModelNum(modelNum: string | undefined): void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision: string | undefined): void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision: string | undefined): void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  constructor(electricQuantity: number, wirelessKeypadFeatureValue: string, slotNumber: number, slotLimit: number, modelNum?: string, hardwareRevision?: string, firmwareRevision?: string) {
    this.electricQuantity = electricQuantity;
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
    this.slotNumber = slotNumber;
    this.slotLimit = slotLimit;
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.electricQuantity === undefined || this.electricQuantity === null) {
      arr.push(null);
    } else {
      arr.push(this.electricQuantity);
    }
    if (this.wirelessKeypadFeatureValue === undefined || this.wirelessKeypadFeatureValue === null) {
      arr.push(null);
    } else {
      arr.push(this.wirelessKeypadFeatureValue);
    }
    if (this.slotNumber === undefined || this.slotNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.slotNumber);
    }
    if (this.slotLimit === undefined || this.slotLimit === null) {
      arr.push(null);
    } else {
      arr.push(this.slotLimit);
    }
    if (this.modelNum === undefined || this.modelNum === null) {
      arr.push(null);
    } else {
      arr.push(this.modelNum);
    }
    if (this.hardwareRevision === undefined || this.hardwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.hardwareRevision);
    }
    if (this.firmwareRevision === undefined || this.firmwareRevision === null) {
      arr.push(null);
    } else {
      arr.push(this.firmwareRevision);
    }
    return arr;
  }

  static fromList(arr: Object[]): MultifunctionalKeypadInitResult {
    let electricQuantityObject: Object = arr[0];
    const electricQuantity: number = electricQuantityObject as number;
    let wirelessKeypadFeatureValueObject: Object = arr[1];
    const wirelessKeypadFeatureValue: string = wirelessKeypadFeatureValueObject as string;
    let slotNumberObject: Object = arr[2];
    const slotNumber: number = slotNumberObject as number;
    let slotLimitObject: Object = arr[3];
    const slotLimit: number = slotLimitObject as number;
    let modelNum: string | undefined = undefined;
    if (arr[4] !== null && arr[4] !== undefined) {
      let modelNumObject: Object = arr[4];
      modelNum = modelNumObject as string | undefined;
    }
    let hardwareRevision: string | undefined = undefined;
    if (arr[5] !== null && arr[5] !== undefined) {
      let hardwareRevisionObject: Object = arr[5];
      hardwareRevision = hardwareRevisionObject as string | undefined;
    }
    let firmwareRevision: string | undefined = undefined;
    if (arr[6] !== null && arr[6] !== undefined) {
      let firmwareRevisionObject: Object = arr[6];
      firmwareRevision = firmwareRevisionObject as string | undefined;
    }
    return new MultifunctionalKeypadInitResult(electricQuantity, wirelessKeypadFeatureValue, slotNumber, slotLimit, modelNum, hardwareRevision, firmwareRevision);
  }
}

/*
*  水表 Cat.1 设备信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class WaterMeterDeviceInfo {
  private catOneCardNumber: string;

  public setCatOneCardNumber(catOneCardNumber: string): void {
    this.catOneCardNumber = catOneCardNumber;
  }

  getCatOneCardNumber(): string{
    return this.catOneCardNumber;
  }

  private catOneImsi: string;

  public setCatOneImsi(catOneImsi: string): void {
    this.catOneImsi = catOneImsi;
  }

  getCatOneImsi(): string{
    return this.catOneImsi;
  }

  private catOneNodeId: string;

  public setCatOneNodeId(catOneNodeId: string): void {
    this.catOneNodeId = catOneNodeId;
  }

  getCatOneNodeId(): string{
    return this.catOneNodeId;
  }

  private catOneOperator: string;

  public setCatOneOperator(catOneOperator: string): void {
    this.catOneOperator = catOneOperator;
  }

  getCatOneOperator(): string{
    return this.catOneOperator;
  }

  private catOneRssi: number;

  public setCatOneRssi(catOneRssi: number): void {
    this.catOneRssi = catOneRssi;
  }

  getCatOneRssi(): number{
    return this.catOneRssi;
  }

  constructor(catOneCardNumber: string, catOneImsi: string, catOneNodeId: string, catOneOperator: string, catOneRssi: number) {
    this.catOneCardNumber = catOneCardNumber;
    this.catOneImsi = catOneImsi;
    this.catOneNodeId = catOneNodeId;
    this.catOneOperator = catOneOperator;
    this.catOneRssi = catOneRssi;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.catOneCardNumber === undefined || this.catOneCardNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneCardNumber);
    }
    if (this.catOneImsi === undefined || this.catOneImsi === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneImsi);
    }
    if (this.catOneNodeId === undefined || this.catOneNodeId === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneNodeId);
    }
    if (this.catOneOperator === undefined || this.catOneOperator === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneOperator);
    }
    if (this.catOneRssi === undefined || this.catOneRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneRssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): WaterMeterDeviceInfo {
    let catOneCardNumberObject: Object = arr[0];
    const catOneCardNumber: string = catOneCardNumberObject as string;
    let catOneImsiObject: Object = arr[1];
    const catOneImsi: string = catOneImsiObject as string;
    let catOneNodeIdObject: Object = arr[2];
    const catOneNodeId: string = catOneNodeIdObject as string;
    let catOneOperatorObject: Object = arr[3];
    const catOneOperator: string = catOneOperatorObject as string;
    let catOneRssiObject: Object = arr[4];
    const catOneRssi: number = catOneRssiObject as number;
    return new WaterMeterDeviceInfo(catOneCardNumber, catOneImsi, catOneNodeId, catOneOperator, catOneRssi);
  }
}

/*
*  电表 Cat.1 设备信息。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class ElectricMeterDeviceInfo {
  private catOneCardNumber: string;

  public setCatOneCardNumber(catOneCardNumber: string): void {
    this.catOneCardNumber = catOneCardNumber;
  }

  getCatOneCardNumber(): string{
    return this.catOneCardNumber;
  }

  private catOneImsi: string;

  public setCatOneImsi(catOneImsi: string): void {
    this.catOneImsi = catOneImsi;
  }

  getCatOneImsi(): string{
    return this.catOneImsi;
  }

  private catOneNodeId: string;

  public setCatOneNodeId(catOneNodeId: string): void {
    this.catOneNodeId = catOneNodeId;
  }

  getCatOneNodeId(): string{
    return this.catOneNodeId;
  }

  private catOneOperator: string;

  public setCatOneOperator(catOneOperator: string): void {
    this.catOneOperator = catOneOperator;
  }

  getCatOneOperator(): string{
    return this.catOneOperator;
  }

  private catOneRssi: number;

  public setCatOneRssi(catOneRssi: number): void {
    this.catOneRssi = catOneRssi;
  }

  getCatOneRssi(): number{
    return this.catOneRssi;
  }

  constructor(catOneCardNumber: string, catOneImsi: string, catOneNodeId: string, catOneOperator: string, catOneRssi: number) {
    this.catOneCardNumber = catOneCardNumber;
    this.catOneImsi = catOneImsi;
    this.catOneNodeId = catOneNodeId;
    this.catOneOperator = catOneOperator;
    this.catOneRssi = catOneRssi;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.catOneCardNumber === undefined || this.catOneCardNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneCardNumber);
    }
    if (this.catOneImsi === undefined || this.catOneImsi === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneImsi);
    }
    if (this.catOneNodeId === undefined || this.catOneNodeId === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneNodeId);
    }
    if (this.catOneOperator === undefined || this.catOneOperator === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneOperator);
    }
    if (this.catOneRssi === undefined || this.catOneRssi === null) {
      arr.push(null);
    } else {
      arr.push(this.catOneRssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): ElectricMeterDeviceInfo {
    let catOneCardNumberObject: Object = arr[0];
    const catOneCardNumber: string = catOneCardNumberObject as string;
    let catOneImsiObject: Object = arr[1];
    const catOneImsi: string = catOneImsiObject as string;
    let catOneNodeIdObject: Object = arr[2];
    const catOneNodeId: string = catOneNodeIdObject as string;
    let catOneOperatorObject: Object = arr[3];
    const catOneOperator: string = catOneOperatorObject as string;
    let catOneRssiObject: Object = arr[4];
    const catOneRssi: number = catOneRssiObject as number;
    return new ElectricMeterDeviceInfo(catOneCardNumber, catOneImsi, catOneNodeId, catOneOperator, catOneRssi);
  }
}

/*
*  水表初始化参数。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTWaterMeterInitParam {
  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private name: string;

  public setName(name: string): void {
    this.name = name;
  }

  getName(): string{
    return this.name;
  }

  private payMode: TTMeterPayMode;

  public setPayMode(payMode: TTMeterPayMode): void {
    this.payMode = payMode;
  }

  getPayMode(): TTMeterPayMode{
    return this.payMode;
  }

  private price: number;

  public setPrice(price: number): void {
    this.price = price;
  }

  getPrice(): number{
    return this.price;
  }

  constructor(mac: string, name: string, payMode: TTMeterPayMode, price: number) {
    this.mac = mac;
    this.name = name;
    this.payMode = payMode;
    this.price = price;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    if (this.payMode === undefined || this.payMode === null) {
      arr.push(null);
    } else {
      const payModeStr = TTMeterPayMode[this.payMode as number];
      arr.push(new TTMeterPayModeEnum(payModeStr));
    }
    if (this.price === undefined || this.price === null) {
      arr.push(null);
    } else {
      arr.push(this.price);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWaterMeterInitParam {
    let macObject: Object = arr[0];
    const mac: string = macObject as string;
    let nameObject: Object = arr[1];
    const name: string = nameObject as string;
    const payModeStr: string = arr[2] as string;
    const payMode: TTMeterPayMode = TTMeterPayMode[payModeStr];
    let priceObject: Object = arr[3];
    const price: number = priceObject as number;
    return new TTWaterMeterInitParam(mac, name, payMode, price);
  }
}

/*
*  电表初始化参数。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class TTElectricMeterInitParam {
  private mac: string;

  public setMac(mac: string): void {
    this.mac = mac;
  }

  getMac(): string{
    return this.mac;
  }

  private name: string;

  public setName(name: string): void {
    this.name = name;
  }

  getName(): string{
    return this.name;
  }

  private payMode: TTMeterPayMode;

  public setPayMode(payMode: TTMeterPayMode): void {
    this.payMode = payMode;
  }

  getPayMode(): TTMeterPayMode{
    return this.payMode;
  }

  private price: number;

  public setPrice(price: number): void {
    this.price = price;
  }

  getPrice(): number{
    return this.price;
  }

  constructor(mac: string, name: string, payMode: TTMeterPayMode, price: number) {
    this.mac = mac;
    this.name = name;
    this.payMode = payMode;
    this.price = price;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.mac === undefined || this.mac === null) {
      arr.push(null);
    } else {
      arr.push(this.mac);
    }
    if (this.name === undefined || this.name === null) {
      arr.push(null);
    } else {
      arr.push(this.name);
    }
    if (this.payMode === undefined || this.payMode === null) {
      arr.push(null);
    } else {
      const payModeStr = TTMeterPayMode[this.payMode as number];
      arr.push(new TTMeterPayModeEnum(payModeStr));
    }
    if (this.price === undefined || this.price === null) {
      arr.push(null);
    } else {
      arr.push(this.price);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTElectricMeterInitParam {
    let macObject: Object = arr[0];
    const mac: string = macObject as string;
    let nameObject: Object = arr[1];
    const name: string = nameObject as string;
    const payModeStr: string = arr[2] as string;
    const payMode: TTMeterPayMode = TTMeterPayMode[payModeStr];
    let priceObject: Object = arr[3];
    const price: number = priceObject as number;
    return new TTElectricMeterInitParam(mac, name, payMode, price);
  }
}

/*
*  刷卡录入流事件。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AddCardEvent {
  private phase: TTAddCardPhase;

  public setPhase(phase: TTAddCardPhase): void {
    this.phase = phase;
  }

  getPhase(): TTAddCardPhase{
    return this.phase;
  }

  private cardNumber?: string;

  public setCardNumber(cardNumber: string | undefined): void {
    this.cardNumber = cardNumber;
  }

  getCardNumber(): string | undefined{
    return this.cardNumber;
  }

  constructor(phase: TTAddCardPhase, cardNumber?: string) {
    this.phase = phase;
    this.cardNumber = cardNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.phase === undefined || this.phase === null) {
      arr.push(null);
    } else {
      const phaseStr = TTAddCardPhase[this.phase as number];
      arr.push(new TTAddCardPhaseEnum(phaseStr));
    }
    if (this.cardNumber === undefined || this.cardNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.cardNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddCardEvent {
    const phaseStr: string = arr[0] as string;
    const phase: TTAddCardPhase = TTAddCardPhase[phaseStr];
    let cardNumber: string | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let cardNumberObject: Object = arr[1];
      cardNumber = cardNumberObject as string | undefined;
    }
    return new AddCardEvent(phase, cardNumber);
  }
}

/*
*  指纹录入流事件。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AddFingerprintEvent {
  private phase: TTAddFingerprintPhase;

  public setPhase(phase: TTAddFingerprintPhase): void {
    this.phase = phase;
  }

  getPhase(): TTAddFingerprintPhase{
    return this.phase;
  }

  private currentCount?: number;

  public setCurrentCount(currentCount: number | undefined): void {
    this.currentCount = currentCount;
  }

  getCurrentCount(): number | undefined{
    return this.currentCount;
  }

  private totalCount?: number;

  public setTotalCount(totalCount: number | undefined): void {
    this.totalCount = totalCount;
  }

  getTotalCount(): number | undefined{
    return this.totalCount;
  }

  private fingerprintNumber?: string;

  public setFingerprintNumber(fingerprintNumber: string | undefined): void {
    this.fingerprintNumber = fingerprintNumber;
  }

  getFingerprintNumber(): string | undefined{
    return this.fingerprintNumber;
  }

  constructor(phase: TTAddFingerprintPhase, currentCount?: number, totalCount?: number, fingerprintNumber?: string) {
    this.phase = phase;
    this.currentCount = currentCount;
    this.totalCount = totalCount;
    this.fingerprintNumber = fingerprintNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.phase === undefined || this.phase === null) {
      arr.push(null);
    } else {
      const phaseStr = TTAddFingerprintPhase[this.phase as number];
      arr.push(new TTAddFingerprintPhaseEnum(phaseStr));
    }
    if (this.currentCount === undefined || this.currentCount === null) {
      arr.push(null);
    } else {
      arr.push(this.currentCount);
    }
    if (this.totalCount === undefined || this.totalCount === null) {
      arr.push(null);
    } else {
      arr.push(this.totalCount);
    }
    if (this.fingerprintNumber === undefined || this.fingerprintNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.fingerprintNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddFingerprintEvent {
    const phaseStr: string = arr[0] as string;
    const phase: TTAddFingerprintPhase = TTAddFingerprintPhase[phaseStr];
    let currentCount: number | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      let currentCountObject: Object = arr[1];
      currentCount = currentCountObject as number | undefined;
    }
    let totalCount: number | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let totalCountObject: Object = arr[2];
      totalCount = totalCountObject as number | undefined;
    }
    let fingerprintNumber: string | undefined = undefined;
    if (arr[3] !== null && arr[3] !== undefined) {
      let fingerprintNumberObject: Object = arr[3];
      fingerprintNumber = fingerprintNumberObject as string | undefined;
    }
    return new AddFingerprintEvent(phase, currentCount, totalCount, fingerprintNumber);
  }
}

/*
*  人脸录入流事件。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AddFaceEvent {
  private phase: TTAddFacePhase;

  public setPhase(phase: TTAddFacePhase): void {
    this.phase = phase;
  }

  getPhase(): TTAddFacePhase{
    return this.phase;
  }

  private errorCode?: TTFaceErrorCode;

  public setErrorCode(errorCode: TTFaceErrorCode | undefined): void {
    this.errorCode = errorCode;
  }

  getErrorCode(): TTFaceErrorCode | undefined{
    return this.errorCode;
  }

  private faceNumber?: string;

  public setFaceNumber(faceNumber: string | undefined): void {
    this.faceNumber = faceNumber;
  }

  getFaceNumber(): string | undefined{
    return this.faceNumber;
  }

  constructor(phase: TTAddFacePhase, errorCode?: TTFaceErrorCode, faceNumber?: string) {
    this.phase = phase;
    this.errorCode = errorCode;
    this.faceNumber = faceNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.phase === undefined || this.phase === null) {
      arr.push(null);
    } else {
      const phaseStr = TTAddFacePhase[this.phase as number];
      arr.push(new TTAddFacePhaseEnum(phaseStr));
    }
    if (this.errorCode === undefined || this.errorCode === null) {
      arr.push(null);
    } else {
      const errorCodeStr = TTFaceErrorCode[this.errorCode as number];
      arr.push(new TTFaceErrorCodeEnum(errorCodeStr));
    }
    if (this.faceNumber === undefined || this.faceNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.faceNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddFaceEvent {
    const phaseStr: string = arr[0] as string;
    const phase: TTAddFacePhase = TTAddFacePhase[phaseStr];
    let errorCode: TTFaceErrorCode | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      const errorCodeStr: string = arr[1] as string;
      errorCode = TTFaceErrorCode[errorCodeStr];
    }
    let faceNumber: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let faceNumberObject: Object = arr[2];
      faceNumber = faceNumberObject as string | undefined;
    }
    return new AddFaceEvent(phase, errorCode, faceNumber);
  }
}

/*
*  掌静脉录入流事件。
* 
*  Generated class from Pigeon that represents data sent in messages.
*/
export class AddPalmVeinEvent {
  private phase: TTAddPalmVeinPhase;

  public setPhase(phase: TTAddPalmVeinPhase): void {
    this.phase = phase;
  }

  getPhase(): TTAddPalmVeinPhase{
    return this.phase;
  }

  private errorCode?: TTPalmVeinErrorCode;

  public setErrorCode(errorCode: TTPalmVeinErrorCode | undefined): void {
    this.errorCode = errorCode;
  }

  getErrorCode(): TTPalmVeinErrorCode | undefined{
    return this.errorCode;
  }

  private palmVeinNumber?: string;

  public setPalmVeinNumber(palmVeinNumber: string | undefined): void {
    this.palmVeinNumber = palmVeinNumber;
  }

  getPalmVeinNumber(): string | undefined{
    return this.palmVeinNumber;
  }

  constructor(phase: TTAddPalmVeinPhase, errorCode?: TTPalmVeinErrorCode, palmVeinNumber?: string) {
    this.phase = phase;
    this.errorCode = errorCode;
    this.palmVeinNumber = palmVeinNumber;
  }

  toList(): Array<Object | null> {
    let arr: Array<Object | null> = new Array<Object | null>();
    if (this.phase === undefined || this.phase === null) {
      arr.push(null);
    } else {
      const phaseStr = TTAddPalmVeinPhase[this.phase as number];
      arr.push(new TTAddPalmVeinPhaseEnum(phaseStr));
    }
    if (this.errorCode === undefined || this.errorCode === null) {
      arr.push(null);
    } else {
      const errorCodeStr = TTPalmVeinErrorCode[this.errorCode as number];
      arr.push(new TTPalmVeinErrorCodeEnum(errorCodeStr));
    }
    if (this.palmVeinNumber === undefined || this.palmVeinNumber === null) {
      arr.push(null);
    } else {
      arr.push(this.palmVeinNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddPalmVeinEvent {
    const phaseStr: string = arr[0] as string;
    const phase: TTAddPalmVeinPhase = TTAddPalmVeinPhase[phaseStr];
    let errorCode: TTPalmVeinErrorCode | undefined = undefined;
    if (arr[1] !== null && arr[1] !== undefined) {
      const errorCodeStr: string = arr[1] as string;
      errorCode = TTPalmVeinErrorCode[errorCodeStr];
    }
    let palmVeinNumber: string | undefined = undefined;
    if (arr[2] !== null && arr[2] !== undefined) {
      let palmVeinNumberObject: Object = arr[2];
      palmVeinNumber = palmVeinNumberObject as string | undefined;
    }
    return new AddPalmVeinEvent(phase, errorCode, palmVeinNumber);
  }
}

export class PigeonCodec extends StandardMessageCodec {
  static readonly INSTANCE: PigeonCodec  = new PigeonCodec();

  getByte(n: number): number {
    let byteArray = new Uint8Array(1);
    byteArray[0] = n;
    return byteArray[0] as number;
  }
  private constructor() {
    super();
  }

  readValueOfType(type: number,  buffer: ByteBuffer): ESObject {
    switch (type) {
      case this.getByte(129): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTAddCardPhase[value as number];
      }
      case this.getByte(130): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTAddFingerprintPhase[value as number];
      }
      case this.getByte(131): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTAddFacePhase[value as number];
      }
      case this.getByte(132): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTAddPalmVeinPhase[value as number];
      }
      case this.getByte(133): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTBluetoothState[value as number];
      }
      case this.getByte(134): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPasscodeType[value as number];
      }
      case this.getByte(135): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTOperateRecordType[value as number];
      }
      case this.getByte(136): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTControlAction[value as number];
      }
      case this.getByte(137): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockSwitchState[value as number];
      }
      case this.getByte(138): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPassageModeType[value as number];
      }
      case this.getByte(139): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockConfig[value as number];
      }
      case this.getByte(140): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockDirection[value as number];
      }
      case this.getByte(141): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTSoundVolumeType[value as number];
      }
      case this.getByte(142): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTSensitivityValue[value as number];
      }
      case this.getByte(143): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockError[value as number];
      }
      case this.getByte(144): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTErrorDevice[value as number];
      }
      case this.getByte(145): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLiftWorkActivateType[value as number];
      }
      case this.getByte(146): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPowerSaverWorkType[value as number];
      }
      case this.getByte(147): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayType[value as number];
      }
      case this.getByte(148): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayConnectStatus[value as number];
      }
      case this.getByte(149): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayError[value as number];
      }
      case this.getByte(150): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTRemoteAccessoryError[value as number];
      }
      case this.getByte(151): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTMultifunctionalKeypadError[value as number];
      }
      case this.getByte(152): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTRemoteAccessory[value as number];
      }
      case this.getByte(153): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTIpSettingType[value as number];
      }
      case this.getByte(154): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTNbAwakeMode[value as number];
      }
      case this.getByte(155): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTNbAwakeTimeType[value as number];
      }
      case this.getByte(156): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockFunction[value as number];
      }
      case this.getByte(157): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTFaceState[value as number];
      }
      case this.getByte(158): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTWaterMeterFeature[value as number];
      }
      case this.getByte(159): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTElectricMeterFeature[value as number];
      }
      case this.getByte(160): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTStandaloneDoorSensorError[value as number];
      }
      case this.getByte(161): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTStandaloneDoorSensorFeature[value as number];
      }
      case this.getByte(162): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTMeterPayMode[value as number];
      }
      case this.getByte(163): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTFaceErrorCode[value as number];
      }
      case this.getByte(164): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPalmVeinErrorCode[value as number];
      }
      case this.getByte(165):
        return TTLockVersion.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(166):
        return TTLockInitParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(167):
        return TTGatewayInitParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(168):
        return TTIpSetting.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(169):
        return TTCycleModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(170):
        return TTLockScanWifiEventParam.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(171):
        return TTLockCredentialEventParam.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(172):
        return TTKeypadCredentialEventParam.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(173):
        return ControlLockResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(174):
        return AutoLockingTime.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(175):
        return TTWifiInfoModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(176):
        return CameraLockWifiResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(177):
        return TTLockSystemModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(178):
        return AccessoryElectricQuantityResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(179):
        return TTPassageModeModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(180):
        return TTLockScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(181):
        return TTPasscodeModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(182):
        return TTICCardModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(183):
        return TTFingerprintModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(184):
        return TTPalmVeinModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(185):
        return TTGatewayScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(186):
        return GatewayDeviceInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(187):
        return TTRemoteAccessoryScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(188):
        return TTStandaloneDoorSensorInitParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(189):
        return TTStandaloneDoorSensorScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(190):
        return TTStandaloneDoorSensorInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(191):
        return TTMeterScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(192):
        return TTWaterMeterInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(193):
        return TTElectricMeterInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(194):
        return TTWifiScanResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(195):
        return TTWifiScanEntry.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(196):
        return RemoteKeypadInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(197):
        return MultifunctionalKeypadInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(198):
        return WaterMeterDeviceInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(199):
        return ElectricMeterDeviceInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(200):
        return TTWaterMeterInitParam.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(201):
        return TTElectricMeterInitParam.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(202):
        return AddCardEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(203):
        return AddFingerprintEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(204):
        return AddFaceEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(205):
        return AddPalmVeinEvent.fromList(super.readValue(buffer) as Object[]);
      default:
        return super.readValueOfType(type, buffer);
    }
  }

  writeValue(stream: ByteBuffer , value: ESObject): ESObject{
    if (value instanceof TTAddCardPhaseEnum) {
      stream.writeUint8(this.getByte(129));
      this.writeValue(stream, value == null ? null : TTAddCardPhase[value.index as string]);
    } else if (value instanceof TTAddFingerprintPhaseEnum) {
      stream.writeUint8(this.getByte(130));
      this.writeValue(stream, value == null ? null : TTAddFingerprintPhase[value.index as string]);
    } else if (value instanceof TTAddFacePhaseEnum) {
      stream.writeUint8(this.getByte(131));
      this.writeValue(stream, value == null ? null : TTAddFacePhase[value.index as string]);
    } else if (value instanceof TTAddPalmVeinPhaseEnum) {
      stream.writeUint8(this.getByte(132));
      this.writeValue(stream, value == null ? null : TTAddPalmVeinPhase[value.index as string]);
    } else if (value instanceof TTBluetoothStateEnum) {
      stream.writeUint8(this.getByte(133));
      this.writeValue(stream, value == null ? null : TTBluetoothState[value.index as string]);
    } else if (value instanceof TTPasscodeTypeEnum) {
      stream.writeUint8(this.getByte(134));
      this.writeValue(stream, value == null ? null : TTPasscodeType[value.index as string]);
    } else if (value instanceof TTOperateRecordTypeEnum) {
      stream.writeUint8(this.getByte(135));
      this.writeValue(stream, value == null ? null : TTOperateRecordType[value.index as string]);
    } else if (value instanceof TTControlActionEnum) {
      stream.writeUint8(this.getByte(136));
      this.writeValue(stream, value == null ? null : TTControlAction[value.index as string]);
    } else if (value instanceof TTLockSwitchStateEnum) {
      stream.writeUint8(this.getByte(137));
      this.writeValue(stream, value == null ? null : TTLockSwitchState[value.index as string]);
    } else if (value instanceof TTPassageModeTypeEnum) {
      stream.writeUint8(this.getByte(138));
      this.writeValue(stream, value == null ? null : TTPassageModeType[value.index as string]);
    } else if (value instanceof TTLockConfigEnum) {
      stream.writeUint8(this.getByte(139));
      this.writeValue(stream, value == null ? null : TTLockConfig[value.index as string]);
    } else if (value instanceof TTLockDirectionEnum) {
      stream.writeUint8(this.getByte(140));
      this.writeValue(stream, value == null ? null : TTLockDirection[value.index as string]);
    } else if (value instanceof TTSoundVolumeTypeEnum) {
      stream.writeUint8(this.getByte(141));
      this.writeValue(stream, value == null ? null : TTSoundVolumeType[value.index as string]);
    } else if (value instanceof TTSensitivityValueEnum) {
      stream.writeUint8(this.getByte(142));
      this.writeValue(stream, value == null ? null : TTSensitivityValue[value.index as string]);
    } else if (value instanceof TTLockErrorEnum) {
      stream.writeUint8(this.getByte(143));
      this.writeValue(stream, value == null ? null : TTLockError[value.index as string]);
    } else if (value instanceof TTErrorDeviceEnum) {
      stream.writeUint8(this.getByte(144));
      this.writeValue(stream, value == null ? null : TTErrorDevice[value.index as string]);
    } else if (value instanceof TTLiftWorkActivateTypeEnum) {
      stream.writeUint8(this.getByte(145));
      this.writeValue(stream, value == null ? null : TTLiftWorkActivateType[value.index as string]);
    } else if (value instanceof TTPowerSaverWorkTypeEnum) {
      stream.writeUint8(this.getByte(146));
      this.writeValue(stream, value == null ? null : TTPowerSaverWorkType[value.index as string]);
    } else if (value instanceof TTGatewayTypeEnum) {
      stream.writeUint8(this.getByte(147));
      this.writeValue(stream, value == null ? null : TTGatewayType[value.index as string]);
    } else if (value instanceof TTGatewayConnectStatusEnum) {
      stream.writeUint8(this.getByte(148));
      this.writeValue(stream, value == null ? null : TTGatewayConnectStatus[value.index as string]);
    } else if (value instanceof TTGatewayErrorEnum) {
      stream.writeUint8(this.getByte(149));
      this.writeValue(stream, value == null ? null : TTGatewayError[value.index as string]);
    } else if (value instanceof TTRemoteAccessoryErrorEnum) {
      stream.writeUint8(this.getByte(150));
      this.writeValue(stream, value == null ? null : TTRemoteAccessoryError[value.index as string]);
    } else if (value instanceof TTMultifunctionalKeypadErrorEnum) {
      stream.writeUint8(this.getByte(151));
      this.writeValue(stream, value == null ? null : TTMultifunctionalKeypadError[value.index as string]);
    } else if (value instanceof TTRemoteAccessoryEnum) {
      stream.writeUint8(this.getByte(152));
      this.writeValue(stream, value == null ? null : TTRemoteAccessory[value.index as string]);
    } else if (value instanceof TTIpSettingTypeEnum) {
      stream.writeUint8(this.getByte(153));
      this.writeValue(stream, value == null ? null : TTIpSettingType[value.index as string]);
    } else if (value instanceof TTNbAwakeModeEnum) {
      stream.writeUint8(this.getByte(154));
      this.writeValue(stream, value == null ? null : TTNbAwakeMode[value.index as string]);
    } else if (value instanceof TTNbAwakeTimeTypeEnum) {
      stream.writeUint8(this.getByte(155));
      this.writeValue(stream, value == null ? null : TTNbAwakeTimeType[value.index as string]);
    } else if (value instanceof TTLockFunctionEnum) {
      stream.writeUint8(this.getByte(156));
      this.writeValue(stream, value == null ? null : TTLockFunction[value.index as string]);
    } else if (value instanceof TTFaceStateEnum) {
      stream.writeUint8(this.getByte(157));
      this.writeValue(stream, value == null ? null : TTFaceState[value.index as string]);
    } else if (value instanceof TTWaterMeterFeatureEnum) {
      stream.writeUint8(this.getByte(158));
      this.writeValue(stream, value == null ? null : TTWaterMeterFeature[value.index as string]);
    } else if (value instanceof TTElectricMeterFeatureEnum) {
      stream.writeUint8(this.getByte(159));
      this.writeValue(stream, value == null ? null : TTElectricMeterFeature[value.index as string]);
    } else if (value instanceof TTStandaloneDoorSensorErrorEnum) {
      stream.writeUint8(this.getByte(160));
      this.writeValue(stream, value == null ? null : TTStandaloneDoorSensorError[value.index as string]);
    } else if (value instanceof TTStandaloneDoorSensorFeatureEnum) {
      stream.writeUint8(this.getByte(161));
      this.writeValue(stream, value == null ? null : TTStandaloneDoorSensorFeature[value.index as string]);
    } else if (value instanceof TTMeterPayModeEnum) {
      stream.writeUint8(this.getByte(162));
      this.writeValue(stream, value == null ? null : TTMeterPayMode[value.index as string]);
    } else if (value instanceof TTFaceErrorCodeEnum) {
      stream.writeUint8(this.getByte(163));
      this.writeValue(stream, value == null ? null : TTFaceErrorCode[value.index as string]);
    } else if (value instanceof TTPalmVeinErrorCodeEnum) {
      stream.writeUint8(this.getByte(164));
      this.writeValue(stream, value == null ? null : TTPalmVeinErrorCode[value.index as string]);
    } else if (value instanceof TTLockVersion) {
      stream.writeUint8(this.getByte(165));
      this.writeValue(stream, (value as TTLockVersion).toList());
    } else if (value instanceof TTLockInitParams) {
      stream.writeUint8(this.getByte(166));
      this.writeValue(stream, (value as TTLockInitParams).toList());
    } else if (value instanceof TTGatewayInitParams) {
      stream.writeUint8(this.getByte(167));
      this.writeValue(stream, (value as TTGatewayInitParams).toList());
    } else if (value instanceof TTIpSetting) {
      stream.writeUint8(this.getByte(168));
      this.writeValue(stream, (value as TTIpSetting).toList());
    } else if (value instanceof TTCycleModel) {
      stream.writeUint8(this.getByte(169));
      this.writeValue(stream, (value as TTCycleModel).toList());
    } else if (value instanceof TTLockScanWifiEventParam) {
      stream.writeUint8(this.getByte(170));
      this.writeValue(stream, (value as TTLockScanWifiEventParam).toList());
    } else if (value instanceof TTLockCredentialEventParam) {
      stream.writeUint8(this.getByte(171));
      this.writeValue(stream, (value as TTLockCredentialEventParam).toList());
    } else if (value instanceof TTKeypadCredentialEventParam) {
      stream.writeUint8(this.getByte(172));
      this.writeValue(stream, (value as TTKeypadCredentialEventParam).toList());
    } else if (value instanceof ControlLockResult) {
      stream.writeUint8(this.getByte(173));
      this.writeValue(stream, (value as ControlLockResult).toList());
    } else if (value instanceof AutoLockingTime) {
      stream.writeUint8(this.getByte(174));
      this.writeValue(stream, (value as AutoLockingTime).toList());
    } else if (value instanceof TTWifiInfoModel) {
      stream.writeUint8(this.getByte(175));
      this.writeValue(stream, (value as TTWifiInfoModel).toList());
    } else if (value instanceof CameraLockWifiResult) {
      stream.writeUint8(this.getByte(176));
      this.writeValue(stream, (value as CameraLockWifiResult).toList());
    } else if (value instanceof TTLockSystemModel) {
      stream.writeUint8(this.getByte(177));
      this.writeValue(stream, (value as TTLockSystemModel).toList());
    } else if (value instanceof AccessoryElectricQuantityResult) {
      stream.writeUint8(this.getByte(178));
      this.writeValue(stream, (value as AccessoryElectricQuantityResult).toList());
    } else if (value instanceof TTPassageModeModel) {
      stream.writeUint8(this.getByte(179));
      this.writeValue(stream, (value as TTPassageModeModel).toList());
    } else if (value instanceof TTLockScanModel) {
      stream.writeUint8(this.getByte(180));
      this.writeValue(stream, (value as TTLockScanModel).toList());
    } else if (value instanceof TTPasscodeModel) {
      stream.writeUint8(this.getByte(181));
      this.writeValue(stream, (value as TTPasscodeModel).toList());
    } else if (value instanceof TTICCardModel) {
      stream.writeUint8(this.getByte(182));
      this.writeValue(stream, (value as TTICCardModel).toList());
    } else if (value instanceof TTFingerprintModel) {
      stream.writeUint8(this.getByte(183));
      this.writeValue(stream, (value as TTFingerprintModel).toList());
    } else if (value instanceof TTPalmVeinModel) {
      stream.writeUint8(this.getByte(184));
      this.writeValue(stream, (value as TTPalmVeinModel).toList());
    } else if (value instanceof TTGatewayScanModel) {
      stream.writeUint8(this.getByte(185));
      this.writeValue(stream, (value as TTGatewayScanModel).toList());
    } else if (value instanceof GatewayDeviceInfo) {
      stream.writeUint8(this.getByte(186));
      this.writeValue(stream, (value as GatewayDeviceInfo).toList());
    } else if (value instanceof TTRemoteAccessoryScanModel) {
      stream.writeUint8(this.getByte(187));
      this.writeValue(stream, (value as TTRemoteAccessoryScanModel).toList());
    } else if (value instanceof TTStandaloneDoorSensorInitParams) {
      stream.writeUint8(this.getByte(188));
      this.writeValue(stream, (value as TTStandaloneDoorSensorInitParams).toList());
    } else if (value instanceof TTStandaloneDoorSensorScanModel) {
      stream.writeUint8(this.getByte(189));
      this.writeValue(stream, (value as TTStandaloneDoorSensorScanModel).toList());
    } else if (value instanceof TTStandaloneDoorSensorInfo) {
      stream.writeUint8(this.getByte(190));
      this.writeValue(stream, (value as TTStandaloneDoorSensorInfo).toList());
    } else if (value instanceof TTMeterScanModel) {
      stream.writeUint8(this.getByte(191));
      this.writeValue(stream, (value as TTMeterScanModel).toList());
    } else if (value instanceof TTWaterMeterInitResult) {
      stream.writeUint8(this.getByte(192));
      this.writeValue(stream, (value as TTWaterMeterInitResult).toList());
    } else if (value instanceof TTElectricMeterInitResult) {
      stream.writeUint8(this.getByte(193));
      this.writeValue(stream, (value as TTElectricMeterInitResult).toList());
    } else if (value instanceof TTWifiScanResult) {
      stream.writeUint8(this.getByte(194));
      this.writeValue(stream, (value as TTWifiScanResult).toList());
    } else if (value instanceof TTWifiScanEntry) {
      stream.writeUint8(this.getByte(195));
      this.writeValue(stream, (value as TTWifiScanEntry).toList());
    } else if (value instanceof RemoteKeypadInitResult) {
      stream.writeUint8(this.getByte(196));
      this.writeValue(stream, (value as RemoteKeypadInitResult).toList());
    } else if (value instanceof MultifunctionalKeypadInitResult) {
      stream.writeUint8(this.getByte(197));
      this.writeValue(stream, (value as MultifunctionalKeypadInitResult).toList());
    } else if (value instanceof WaterMeterDeviceInfo) {
      stream.writeUint8(this.getByte(198));
      this.writeValue(stream, (value as WaterMeterDeviceInfo).toList());
    } else if (value instanceof ElectricMeterDeviceInfo) {
      stream.writeUint8(this.getByte(199));
      this.writeValue(stream, (value as ElectricMeterDeviceInfo).toList());
    } else if (value instanceof TTWaterMeterInitParam) {
      stream.writeUint8(this.getByte(200));
      this.writeValue(stream, (value as TTWaterMeterInitParam).toList());
    } else if (value instanceof TTElectricMeterInitParam) {
      stream.writeUint8(this.getByte(201));
      this.writeValue(stream, (value as TTElectricMeterInitParam).toList());
    } else if (value instanceof AddCardEvent) {
      stream.writeUint8(this.getByte(202));
      this.writeValue(stream, (value as AddCardEvent).toList());
    } else if (value instanceof AddFingerprintEvent) {
      stream.writeUint8(this.getByte(203));
      this.writeValue(stream, (value as AddFingerprintEvent).toList());
    } else if (value instanceof AddFaceEvent) {
      stream.writeUint8(this.getByte(204));
      this.writeValue(stream, (value as AddFaceEvent).toList());
    } else if (value instanceof AddPalmVeinEvent) {
      stream.writeUint8(this.getByte(205));
      this.writeValue(stream, (value as AddPalmVeinEvent).toList());
    } else {
      super.writeValue(stream, value);
    }
  }
}

const PigeonMethodChannelCodec: StandardMethodCodec = new StandardMethodCodec(PigeonCodec.INSTANCE);


export interface Result<T> {
  success( result: T ): void;

  error( error: Error): void;
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class TTLockHostApi {
  /*
  *  订阅 [TTEventChannelApi.lockScanWifi] 前调用。
  * 
  *  [param] WiFi 扫描事件参数。
  */
  abstract setLockScanWifiParam(param: TTLockScanWifiEventParam ): void;
  /*
  *  订阅 [TTEventChannelApi.lockAddCard] 前调用。
  * 
  *  [param] 刷卡录入事件参数。
  */
  abstract setLockAddCardParam(param: TTLockCredentialEventParam ): void;
  /*
  *  订阅 [TTEventChannelApi.lockAddFingerprint] 前调用。
  * 
  *  [param] 指纹录入事件参数。
  */
  abstract setLockAddFingerprintParam(param: TTLockCredentialEventParam ): void;
  /*
  *  订阅 [TTEventChannelApi.lockAddFace] 前调用。
  * 
  *  [param] 人脸录入事件参数。
  */
  abstract setLockAddFaceParam(param: TTLockCredentialEventParam ): void;
  /*
  *  订阅 [TTEventChannelApi.lockAddPalmVein] 前调用。
  * 
  *  [param] 掌静脉录入事件参数。
  */
  abstract setLockAddPalmVeinParam(param: TTLockCredentialEventParam ): void;
  /* 获取蓝牙状态。*/
  abstract getBluetoothState(): TTBluetoothState;
  /*
  *  初始化锁。
  * 
  *  返回加密后的 [lockData] 凭证，后续操作均依赖此凭证。
  * 
  *  [params] 初始化参数。
  */
  abstract initLock(params: TTLockInitParams , result: Result<string>): void;
  /*
  *  重置锁。
  * 
  *  [lockData] 锁凭证。
  */
  abstract resetLock(lockData: string , result: Result<void>): void;
  /*
  *  重置电子钥匙。
  * 
  *  返回新的 [lockData] 凭证。
  * 
  *  [lockData] 当前锁凭证。
  */
  abstract resetEkey(lockData: string , result: Result<string>): void;
  /*
  *  通过编码重置锁。
  * 
  *  [lockMac] 锁蓝牙 MAC 地址。
  *  [resetCode] 重置码。
  */
  abstract resetLockByCode(lockMac: string , resetCode: string , result: Result<void>): void;
  /*
  *  验证锁。
  * 
  *  [lockMac] 锁蓝牙 MAC 地址。
  */
  abstract verifyLock(lockMac: string , result: Result<void>): void;
  /*
  *  控制锁开/关。
  * 
  *  [lockData] 锁凭证。
  *  [action] 开锁或关锁动作。
  */
  abstract controlLock(lockData: string , action: TTControlAction , result: Result<ControlLockResult>): void;
  /*
  *  获取锁开关状态。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockSwitchState(lockData: string , result: Result<TTLockSwitchState>): void;
  /*
  *  查询锁是否支持某功能。
  * 
  *  [lockFunction] 待查询的功能项。
  *  [lockData] 锁凭证。
  */
  abstract supportFunction(lockFunction: TTLockFunction , lockData: string ): boolean;
  /*
  *  创建自定义密码。
  * 
  *  [passcode] 密码内容。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract createCustomPasscode(passcode: string , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  修改密码。
  * 
  *  [passcodeOrigin] 原密码。
  *  [passcodeNew] 新密码，为 null 时仅修改有效期。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract modifyPasscode(passcodeOrigin: string , passcodeNew: string | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  删除密码。
  * 
  *  [passcode] 待删除的密码。
  *  [lockData] 锁凭证。
  */
  abstract deletePasscode(passcode: string , lockData: string , result: Result<void>): void;
  /*
  *  重置密码。
  * 
  *  返回新生成的密码。
  * 
  *  [lockData] 锁凭证。
  */
  abstract resetPasscode(lockData: string , result: Result<string>): void;
  /*
  *  获取管理员密码。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAdminPasscode(lockData: string , result: Result<string>): void;
  /*
  *  设置擦除密码。
  * 
  *  [erasePasscode] 擦除密码。
  *  [lockData] 锁凭证。
  */
  abstract setErasePasscode(erasePasscode: string , lockData: string ): void;
  /*
  *  获取所有有效密码。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAllValidPasscodes(lockData: string , result: Result<Array<TTPasscodeModel>>): void;
  /*
  *  恢复密码。
  * 
  *  [passcode] 原密码。
  *  [passcodeNew] 新密码。
  *  [type] 密码类型。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [cycleType] 周期类型。
  *  [lockData] 锁凭证。
  */
  abstract recoverPasscode(passcode: string , passcodeNew: string , type: TTPasscodeType , startDate: number , endDate: number , cycleType: number , lockData: string , result: Result<void>): void;
  /*
  *  修改管理员密码。
  * 
  *  [adminPasscode] 新管理员密码。
  *  [lockData] 锁凭证。
  */
  abstract modifyAdminPasscode(adminPasscode: string , lockData: string , result: Result<string | undefined>): void;
  /*
  *  获取密码验证参数。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getPasscodeVerificationParams(lockData: string , result: Result<string>): void;
  /*
  *  修改卡有效期。
  * 
  *  [cardNumber] 卡号。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract modifyCardValidityPeriod(cardNumber: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  删除卡。
  * 
  *  [cardNumber] 卡号。
  *  [lockData] 锁凭证。
  */
  abstract deleteCard(cardNumber: string , lockData: string , result: Result<void>): void;
  /*
  *  获取所有有效卡。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAllValidCards(lockData: string , result: Result<Array<TTICCardModel>>): void;
  /*
  *  清除所有卡。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearAllCards(lockData: string , result: Result<void>): void;
  /*
  *  恢复卡。
  * 
  *  [cardNumber] 卡号。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract recoverCard(cardNumber: string , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  挂失卡。
  * 
  *  [cardNumber] 卡号。
  *  [lockData] 锁凭证。
  */
  abstract reportLossCard(cardNumber: string , lockData: string , result: Result<void>): void;
  /*
  *  修改指纹有效期。
  * 
  *  [fingerprintNumber] 指纹编号。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract modifyFingerprintValidityPeriod(fingerprintNumber: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  删除指纹。
  * 
  *  [fingerprintNumber] 指纹编号。
  *  [lockData] 锁凭证。
  */
  abstract deleteFingerprint(fingerprintNumber: string , lockData: string , result: Result<void>): void;
  /*
  *  获取所有有效指纹。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAllValidFingerprints(lockData: string , result: Result<Array<TTFingerprintModel>>): void;
  /*
  *  清除所有指纹。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearAllFingerprints(lockData: string , result: Result<void>): void;
  /*
  *  修改人脸有效期。
  * 
  *  [faceNumber] 人脸编号。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract modifyFace(faceNumber: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  添加人脸数据。
  * 
  *  返回人脸编号。
  * 
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [faceFeatureData] 人脸特征数据。
  *  [lockData] 锁凭证。
  */
  abstract addFaceData(cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , faceFeatureData: string , lockData: string , result: Result<string>): void;
  /*
  *  删除人脸。
  * 
  *  [faceNumber] 人脸编号。
  *  [lockData] 锁凭证。
  */
  abstract deleteFace(faceNumber: string , lockData: string , result: Result<void>): void;
  /*
  *  清除所有人脸。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearFace(lockData: string , result: Result<void>): void;
  /*
  *  修改掌静脉有效期。
  * 
  *  [palmVeinNumber] 掌静脉编号。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract modifyPalmVein(palmVeinNumber: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  删除掌静脉。
  * 
  *  [palmVeinNumber] 掌静脉编号。
  *  [lockData] 锁凭证。
  */
  abstract deletePalmVein(palmVeinNumber: string , lockData: string , result: Result<void>): void;
  /*
  *  清除所有掌静脉。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearPalmVein(lockData: string , result: Result<void>): void;
  /*
  *  获取所有有效掌静脉。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAllValidPalmVeins(lockData: string , result: Result<Array<TTPalmVeinModel>>): void;
  /*
  *  设置电机扭矩等级。
  * 
  *  [torqueLevel] 扭矩等级。
  *  [lockData] 锁凭证。
  */
  abstract setMotorTorqueLevel(torqueLevel: number , lockData: string , result: Result<void>): void;
  /*
  *  设置锁斜舌保持时间。
  * 
  *  [keepTime] 斜舌保持时间（秒）。
  *  [lockData] 锁凭证。
  */
  abstract setLockLatchBolt(keepTime: number , lockData: string , result: Result<void>): void;
  /*
  *  设置锁时间。
  * 
  *  [timestamp] 目标时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract setLockTime(timestamp: number , lockData: string , result: Result<void>): void;
  /*
  *  获取锁时间。
  * 
  *  返回锁当前时间，毫秒时间戳。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockTime(lockData: string , result: Result<number>): void;
  /*
  *  设置锁工作时间。
  * 
  *  [startDate] 工作时段起始时间。
  *  [endDate] 工作时段结束时间。
  *  [lockData] 锁凭证。
  */
  abstract setLockWorkingTime(startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  获取锁操作记录。
  * 
  *  [type] 操作记录类型。
  *  [lockData] 锁凭证。
  */
  abstract getLockOperateRecord(type: TTOperateRecordType , lockData: string , result: Result<string>): void;
  /*
  *  获取锁电量。
  * 
  *  返回电量百分比。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockPower(lockData: string , result: Result<number>): void;
  /*
  *  获取锁系统信息。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockSystemInfo(lockData: string , result: Result<TTLockSystemModel>): void;
  /*
  *  获取锁特征值。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockFeatureValue(lockData: string , result: Result<string>): void;
  /*
  *  获取自动闭锁周期时间。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getAutoLockingPeriodicTime(lockData: string , result: Result<AutoLockingTime>): void;
  /*
  *  设置自动闭锁周期时间。
  * 
  *  [seconds] 自动闭锁周期（秒）。
  *  [lockData] 锁凭证。
  */
  abstract setAutoLockingPeriodicTime(seconds: number , lockData: string , result: Result<void>): void;
  /*
  *  获取远程开锁开关状态。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getRemoteUnlockSwitchState(lockData: string , result: Result<boolean>): void;
  /*
  *  设置远程开锁开关。
  * 
  *  [isOn] 是否开启远程开锁。
  *  [lockData] 锁凭证。
  */
  abstract setRemoteUnlockSwitchState(isOn: boolean , lockData: string , result: Result<string>): void;
  /*
  *  获取锁配置项。
  * 
  *  [config] 配置项类型。
  *  [lockData] 锁凭证。
  */
  abstract getLockConfig(config: TTLockConfig , lockData: string , result: Result<boolean>): void;
  /*
  *  设置锁配置项。
  * 
  *  [config] 配置项类型。
  *  [isOn] 是否开启。
  *  [lockData] 锁凭证。
  */
  abstract setLockConfig(config: TTLockConfig , isOn: boolean , lockData: string , result: Result<void>): void;
  /*
  *  获取灯光时间。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLightTime(lockData: string , result: Result<number>): void;
  /*
  *  设置灯光时间。
  * 
  *  [seconds] 灯光持续时间（秒）。
  *  [lockData] 锁凭证。
  */
  abstract setLightTime(seconds: number , lockData: string , result: Result<void>): void;
  /*
  *  获取锁方向。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getLockDirection(lockData: string , result: Result<TTLockDirection>): void;
  /*
  *  设置锁方向。
  * 
  *  [direction] 锁安装方向。
  *  [lockData] 锁凭证。
  */
  abstract setLockDirection(direction: TTLockDirection , lockData: string , result: Result<void>): void;
  /*
  *  添加通行模式。
  * 
  *  [type] 通行模式类型。
  *  [weekly] 每周生效日列表。
  *  [monthly] 每月生效日列表。
  *  [startTime] 每日起始时间。
  *  [endTime] 每日结束时间。
  *  [lockData] 锁凭证。
  */
  abstract addPassageMode(type: TTPassageModeType , weekly: Array<number> | undefined , monthly: Array<number> | undefined , startTime: number , endTime: number , lockData: string , result: Result<void>): void;
  /*
  *  清除所有通行模式。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearAllPassageModes(lockData: string , result: Result<void>): void;
  /*
  *  获取通行模式列表。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getPassageModes(lockData: string , result: Result<Array<TTPassageModeModel>>): void;
  /*
  *  激活电梯楼层。
  * 
  *  [floors] 待激活的楼层。
  *  [lockData] 锁凭证。
  */
  abstract activateLift(floors: string , lockData: string , result: Result<ControlLockResult>): void;
  /*
  *  设置电梯可控楼层。
  * 
  *  [floors] 可控楼层列表。
  *  [lockData] 锁凭证。
  */
  abstract setLiftControlable(floors: string , lockData: string , result: Result<void>): void;
  /*
  *  设置电梯工作模式。
  * 
  *  [type] 电梯工作模式类型。
  *  [lockData] 锁凭证。
  */
  abstract setLiftWorkMode(type: TTLiftWorkActivateType , lockData: string , result: Result<void>): void;
  /*
  *  设置省电工作模式。
  * 
  *  [type] 省电工作模式类型。
  *  [lockData] 锁凭证。
  */
  abstract setPowerSaverWorkMode(type: TTPowerSaverWorkType , lockData: string , result: Result<void>): void;
  /*
  *  设置省电可控锁。
  * 
  *  [lockMac] 可控锁 MAC 地址。
  *  [lockData] 锁凭证。
  */
  abstract setPowerSaverControlableLock(lockMac: string , lockData: string , result: Result<void>): void;
  /*
  *  设置酒店信息。
  * 
  *  [hotelInfo] 酒店信息。
  *  [buildingNumber] 楼栋号。
  *  [floorNumber] 楼层号。
  *  [lockData] 锁凭证。
  */
  abstract setHotel(hotelInfo: string , buildingNumber: number , floorNumber: number , lockData: string , result: Result<void>): void;
  /*
  *  设置酒店卡扇区。
  * 
  *  [sector] 卡扇区。
  *  [lockData] 锁凭证。
  */
  abstract setHotelCardSector(sector: string , lockData: string , result: Result<void>): void;
  /*
  *  获取锁版本。
  * 
  *  [lockMac] 锁蓝牙 MAC 地址。
  */
  abstract getLockVersion(lockMac: string , result: Result<TTLockVersion>): void;
  /*
  *  设置 NB 服务器地址。
  * 
  *  [ip] 服务器 IP。
  *  [port] 服务器端口。
  *  [lockData] 锁凭证。
  */
  abstract setNBServerAddress(ip: string , port: string , lockData: string , result: Result<number>): void;
  /*
  *  配置 WiFi。
  * 
  *  [wifiName] WiFi 名称。
  *  [wifiPassword] WiFi 密码。
  *  [lockData] 锁凭证。
  */
  abstract configWifi(wifiName: string , wifiPassword: string , lockData: string , result: Result<void>): void;
  /*
  *  配置服务器。
  * 
  *  [ip] 服务器 IP。
  *  [port] 服务器端口。
  *  [lockData] 锁凭证。
  */
  abstract configServer(ip: string , port: string , lockData: string , result: Result<void>): void;
  /*
  *  获取 WiFi 信息。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getWifiInfo(lockData: string , result: Result<TTWifiInfoModel>): void;
  /*
  *  配置 IP。
  * 
  *  [ipSetting] IP 设置参数。
  *  [lockData] 锁凭证。
  */
  abstract configIp(ipSetting: TTIpSetting , lockData: string , result: Result<void>): void;
  /*
  *  配置摄像头锁 WiFi。
  * 
  *  [wifiName] WiFi 名称。
  *  [wifiPassword] WiFi 密码。
  *  [lockData] 锁凭证。
  */
  abstract configCameraLockWifi(wifiName: string , wifiPassword: string , lockData: string , result: Result<CameraLockWifiResult>): void;
  /*
  *  设置音量。
  * 
  *  [type] 音量类型。
  *  [lockData] 锁凭证。
  */
  abstract setSoundVolume(type: TTSoundVolumeType , lockData: string , result: Result<void>): void;
  /*
  *  获取音量。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getSoundVolume(lockData: string , result: Result<TTSoundVolumeType>): void;
  /*
  *  设置灵敏度。
  * 
  *  [value] 灵敏度值。
  *  [lockData] 锁凭证。
  */
  abstract setSensitivity(value: TTSensitivityValue , lockData: string , result: Result<void>): void;
  /*
  *  获取灵敏度。
  * 
  *  [lockData] 锁凭证。
  */
  abstract getSensitivity(lockData: string , result: Result<TTSensitivityValue>): void;
  /*
  *  设置遥控钥匙有效期。
  * 
  *  [remoteKeyMac] 遥控钥匙 MAC 地址。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract setRemoteKeyValidDate(remoteKeyMac: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  添加遥控钥匙。
  * 
  *  [remoteKeyMac] 遥控钥匙 MAC 地址。
  *  [cycleList] 周期时间段列表。
  *  [startDate] 有效期起始时间，毫秒时间戳。
  *  [endDate] 有效期结束时间，毫秒时间戳。
  *  [lockData] 锁凭证。
  */
  abstract addRemoteKey(remoteKeyMac: string , cycleList: Array<TTCycleModel> | undefined , startDate: number , endDate: number , lockData: string , result: Result<void>): void;
  /*
  *  删除遥控钥匙。
  * 
  *  [remoteKeyMac] 遥控钥匙 MAC 地址。
  *  [lockData] 锁凭证。
  */
  abstract deleteRemoteKey(remoteKeyMac: string , lockData: string , result: Result<void>): void;
  /*
  *  清除所有遥控钥匙。
  * 
  *  [lockData] 锁凭证。
  */
  abstract clearRemoteKey(lockData: string , result: Result<void>): void;
  /*
  *  获取遥控配件电量。
  * 
  *  [accessory] 配件类型。
  *  [mac] 配件 MAC 地址。
  *  [lockData] 锁凭证。
  */
  abstract getRemoteAccessoryElectricQuantity(accessory: TTRemoteAccessory , mac: string , lockData: string , result: Result<AccessoryElectricQuantityResult>): void;
  /*
  *  添加门磁。
  * 
  *  [doorSensorMac] 门磁 MAC 地址。
  *  [lockData] 锁凭证。
  */
  abstract addDoorSensor(doorSensorMac: string , lockData: string , result: Result<void>): void;
  /*
  *  删除门磁。
  * 
  *  [lockData] 锁凭证。
  */
  abstract deleteDoorSensor(lockData: string , result: Result<void>): void;
  /*
  *  设置门磁警报时间。
  * 
  *  [alertTime] 警报时间（秒）。
  *  [lockData] 锁凭证。
  */
  abstract setDoorSensorAlertTime(alertTime: number , lockData: string , result: Result<void>): void;
  /** The codec used by TTLockHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTLockHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTLockHostApi | null, messageChannelSuffix: string = ''): void {
    const separatedMessageChannelSuffix: string = messageChannelSuffix !== '' ? '.' + messageChannelSuffix : '';
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockScanWifiParam' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setLockScanWifiParam(args[0] as TTLockScanWifiEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockAddCardParam' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setLockAddCardParam(args[0] as TTLockCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockAddFingerprintParam' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setLockAddFingerprintParam(args[0] as TTLockCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockAddFaceParam' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setLockAddFaceParam(args[0] as TTLockCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockAddPalmVeinParam' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setLockAddPalmVeinParam(args[0] as TTLockCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getBluetoothState' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object | null> = [];
              try {
                let pigeonEnumResult: TTBluetoothState = api!.getBluetoothState();
                let output: ESObject = pigeonEnumResult === null || pigeonEnumResult === undefined ? null : new TTBluetoothStateEnum(TTBluetoothState[pigeonEnumResult as number]);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.initLock' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.initLock(args[0] as TTLockInitParams, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetLock' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.resetLock(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetEkey' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.resetEkey(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetLockByCode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.resetLockByCode(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.verifyLock' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.verifyLock(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.controlLock' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<ControlLockResult>{
                    success(result: ControlLockResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<ControlLockResult> = new ResultImp();

              api!.controlLock(args[0] as string, TTControlAction[args[1] as string], resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockSwitchState' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockSwitchState>{
                    success(result: TTLockSwitchState): void {
                      let res: Array<Object | null> = [];
                      res.push((result === null || result === undefined ? null : new TTLockSwitchStateEnum(TTLockSwitchState[result as number])));
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockSwitchState> = new ResultImp();

              api!.getLockSwitchState(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.supportFunction' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                let output: boolean = api!.supportFunction(TTLockFunction[args[0] as string], args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.createCustomPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 4) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 4 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.createCustomPasscode(args[0] as string, args[1] as number, args[2] as number, args[3] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyPasscode(args[0] as string, args[1] as string | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deletePasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deletePasscode(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.resetPasscode(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAdminPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getAdminPasscode(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setErasePasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setErasePasscode(args[0] as string, args[1] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidPasscodes' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<TTPasscodeModel>>{
                    success(result: Array<TTPasscodeModel>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<TTPasscodeModel>> = new ResultImp();

              api!.getAllValidPasscodes(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.recoverPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 7) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 7 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.recoverPasscode(args[0] as string, args[1] as string, TTPasscodeType[args[2] as string], args[3] as number, args[4] as number, args[5] as number, args[6] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyAdminPasscode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string | undefined>{
                    success(result: string | undefined): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string | undefined> = new ResultImp();

              api!.modifyAdminPasscode(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getPasscodeVerificationParams' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getPasscodeVerificationParams(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyCardValidityPeriod' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyCardValidityPeriod(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteCard' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteCard(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidCards' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<TTICCardModel>>{
                    success(result: Array<TTICCardModel>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<TTICCardModel>> = new ResultImp();

              api!.getAllValidCards(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllCards' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearAllCards(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.recoverCard' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 4) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 4 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.recoverCard(args[0] as string, args[1] as number, args[2] as number, args[3] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.reportLossCard' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.reportLossCard(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyFingerprintValidityPeriod' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyFingerprintValidityPeriod(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteFingerprint' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteFingerprint(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidFingerprints' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<TTFingerprintModel>>{
                    success(result: Array<TTFingerprintModel>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<TTFingerprintModel>> = new ResultImp();

              api!.getAllValidFingerprints(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllFingerprints' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearAllFingerprints(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyFace' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyFace(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addFaceData' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.addFaceData(args[0] as Array<TTCycleModel> | undefined, args[1] as number, args[2] as number, args[3] as string, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteFace' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteFace(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearFace' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearFace(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyPalmVein' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyPalmVein(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deletePalmVein' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deletePalmVein(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearPalmVein' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearPalmVein(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidPalmVeins' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<TTPalmVeinModel>>{
                    success(result: Array<TTPalmVeinModel>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<TTPalmVeinModel>> = new ResultImp();

              api!.getAllValidPalmVeins(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setMotorTorqueLevel' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setMotorTorqueLevel(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockLatchBolt' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockLatchBolt(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockTime(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.getLockTime(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockWorkingTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockWorkingTime(args[0] as number, args[1] as number, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockOperateRecord' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getLockOperateRecord(TTOperateRecordType[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockPower' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.getLockPower(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockSystemInfo' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockSystemModel> = new ResultImp();

              api!.getLockSystemInfo(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockFeatureValue' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getLockFeatureValue(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAutoLockingPeriodicTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<AutoLockingTime>{
                    success(result: AutoLockingTime): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<AutoLockingTime> = new ResultImp();

              api!.getAutoLockingPeriodicTime(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setAutoLockingPeriodicTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setAutoLockingPeriodicTime(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getRemoteUnlockSwitchState' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<boolean>{
                    success(result: boolean): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<boolean> = new ResultImp();

              api!.getRemoteUnlockSwitchState(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setRemoteUnlockSwitchState' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.setRemoteUnlockSwitchState(args[0] as boolean, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockConfig' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<boolean>{
                    success(result: boolean): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<boolean> = new ResultImp();

              api!.getLockConfig(TTLockConfig[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockConfig' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockConfig(TTLockConfig[args[0] as string], args[1] as boolean, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLightTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.getLightTime(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLightTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLightTime(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockDirection' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockDirection>{
                    success(result: TTLockDirection): void {
                      let res: Array<Object | null> = [];
                      res.push((result === null || result === undefined ? null : new TTLockDirectionEnum(TTLockDirection[result as number])));
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockDirection> = new ResultImp();

              api!.getLockDirection(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockDirection' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockDirection(TTLockDirection[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addPassageMode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 6) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 6 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.addPassageMode(TTPassageModeType[args[0] as string], args[1] as Array<number> | undefined, args[2] as Array<number> | undefined, args[3] as number, args[4] as number, args[5] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllPassageModes' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearAllPassageModes(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getPassageModes' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<TTPassageModeModel>>{
                    success(result: Array<TTPassageModeModel>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<TTPassageModeModel>> = new ResultImp();

              api!.getPassageModes(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.activateLift' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<ControlLockResult>{
                    success(result: ControlLockResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<ControlLockResult> = new ResultImp();

              api!.activateLift(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLiftControlable' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLiftControlable(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLiftWorkMode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLiftWorkMode(TTLiftWorkActivateType[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setPowerSaverWorkMode' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setPowerSaverWorkMode(TTPowerSaverWorkType[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setPowerSaverControlableLock' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setPowerSaverControlableLock(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setHotel' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 4) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 4 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setHotel(args[0] as string, args[1] as number, args[2] as number, args[3] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setHotelCardSector' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setHotelCardSector(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockVersion' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockVersion>{
                    success(result: TTLockVersion): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockVersion> = new ResultImp();

              api!.getLockVersion(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setNBServerAddress' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<number> = new ResultImp();

              api!.setNBServerAddress(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configWifi' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.configWifi(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configServer' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.configServer(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getWifiInfo' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTWifiInfoModel>{
                    success(result: TTWifiInfoModel): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTWifiInfoModel> = new ResultImp();

              api!.getWifiInfo(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configIp' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.configIp(args[0] as TTIpSetting, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configCameraLockWifi' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<CameraLockWifiResult>{
                    success(result: CameraLockWifiResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<CameraLockWifiResult> = new ResultImp();

              api!.configCameraLockWifi(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setSoundVolume' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setSoundVolume(TTSoundVolumeType[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getSoundVolume' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTSoundVolumeType>{
                    success(result: TTSoundVolumeType): void {
                      let res: Array<Object | null> = [];
                      res.push((result === null || result === undefined ? null : new TTSoundVolumeTypeEnum(TTSoundVolumeType[result as number])));
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTSoundVolumeType> = new ResultImp();

              api!.getSoundVolume(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setSensitivity' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setSensitivity(TTSensitivityValue[args[0] as string], args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getSensitivity' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTSensitivityValue>{
                    success(result: TTSensitivityValue): void {
                      let res: Array<Object | null> = [];
                      res.push((result === null || result === undefined ? null : new TTSensitivityValueEnum(TTSensitivityValue[result as number])));
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTSensitivityValue> = new ResultImp();

              api!.getSensitivity(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setRemoteKeyValidDate' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setRemoteKeyValidDate(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addRemoteKey' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 5) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 5 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.addRemoteKey(args[0] as string, args[1] as Array<TTCycleModel> | undefined, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteRemoteKey' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteRemoteKey(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearRemoteKey' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.clearRemoteKey(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getRemoteAccessoryElectricQuantity' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<AccessoryElectricQuantityResult>{
                    success(result: AccessoryElectricQuantityResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<AccessoryElectricQuantityResult> = new ResultImp();

              api!.getRemoteAccessoryElectricQuantity(TTRemoteAccessory[args[0] as string], args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addDoorSensor' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.addDoorSensor(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteDoorSensor' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteDoorSensor(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setDoorSensorAlertTime' + separatedMessageChannelSuffix, TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setDoorSensorAlertTime(args[0] as number, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class TTGatewayHostApi {
  /*
  *  订阅 [TTEventChannelApi.gatewayGetNearbyWifi] 前调用。
  * 
  *  [gatewayMac] 网关 MAC 地址。
  */
  abstract setGatewayGetNearbyWifiParam(gatewayMac: string ): void;
  /*
  *  连接网关。
  * 
  *  [mac] 网关 MAC 地址。
  */
  abstract connect(mac: string , result: Result<TTGatewayConnectStatus>): void;
  /*
  *  断开网关连接。
  * 
  *  [mac] 网关 MAC 地址。
  */
  abstract disconnect(mac: string ): void;
  /*
  *  初始化网关。
  * 
  *  [params] 网关初始化参数。
  */
  abstract initGateway(params: TTGatewayInitParams , result: Result<GatewayDeviceInfo>): void;
  /*
  *  配置网关 IP。
  * 
  *  [mac] 网关 MAC 地址。
  *  [ipSetting] IP 设置参数。
  */
  abstract configIp(mac: string , ipSetting: TTIpSetting , result: Result<void>): void;
  /*
  *  配置网关 APN。
  * 
  *  [mac] 网关 MAC 地址。
  *  [apn] APN 接入点名称。
  */
  abstract configApn(mac: string , apn: string , result: Result<void>): void;
  /* 获取网关网络 MAC。*/
  abstract getNetworkMac(result: Result<string | undefined>): void;
  /*
  *  进入升级模式。
  * 
  *  [mac] 网关 MAC 地址。
  */
  abstract enterUpgradeMode(mac: string ): void;
  /** The codec used by TTGatewayHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTGatewayHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTGatewayHostApi | null, messageChannelSuffix: string = ''): void {
    const separatedMessageChannelSuffix: string = messageChannelSuffix !== '' ? '.' + messageChannelSuffix : '';
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.setGatewayGetNearbyWifiParam' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setGatewayGetNearbyWifiParam(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.connect' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTGatewayConnectStatus>{
                    success(result: TTGatewayConnectStatus): void {
                      let res: Array<Object | null> = [];
                      res.push((result === null || result === undefined ? null : new TTGatewayConnectStatusEnum(TTGatewayConnectStatus[result as number])));
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTGatewayConnectStatus> = new ResultImp();

              api!.connect(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.disconnect' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.disconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.initGateway' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<GatewayDeviceInfo>{
                    success(result: GatewayDeviceInfo): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<GatewayDeviceInfo> = new ResultImp();

              api!.initGateway(args[0] as TTGatewayInitParams, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.configIp' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.configIp(args[0] as string, args[1] as TTIpSetting, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.configApn' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.configApn(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.getNetworkMac' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              class ResultImp implements Result<string | undefined>{
                    success(result: string | undefined): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string | undefined> = new ResultImp();

              api!.getNetworkMac(resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.enterUpgradeMode' + separatedMessageChannelSuffix, TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.enterUpgradeMode(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class TTAccessoryHostApi {
  /*
  *  订阅 [TTEventChannelApi.accessoryAddKeypadFingerprint] 前调用。
  * 
  *  [param] 键盘指纹录入事件参数。
  */
  abstract setAccessoryAddKeypadFingerprintParam(param: TTKeypadCredentialEventParam ): void;
  /*
  *  订阅 [TTEventChannelApi.accessoryAddKeypadCard] 前调用。
  * 
  *  [param] 键盘刷卡录入事件参数。
  */
  abstract setAccessoryAddKeypadCardParam(param: TTKeypadCredentialEventParam ): void;
  /*
  *  初始化遥控器。
  * 
  *  [mac] 遥控器 MAC 地址。
  *  [lockData] 关联锁凭证。
  */
  abstract initRemoteKey(mac: string , lockData: string , result: Result<TTLockSystemModel>): void;
  /*
  *  初始化无线键盘。
  * 
  *  [mac] 键盘 MAC 地址。
  *  [lockMac] 关联锁 MAC 地址。
  */
  abstract initRemoteKeypad(mac: string , lockMac: string , result: Result<RemoteKeypadInitResult>): void;
  /*
  *  初始化多功能键盘。
  * 
  *  [mac] 键盘 MAC 地址。
  *  [lockData] 关联锁凭证。
  */
  abstract initMultifunctionalKeypad(mac: string , lockData: string , result: Result<MultifunctionalKeypadInitResult>): void;
  /*
  *  获取已存储的锁列表。
  * 
  *  [mac] 配件 MAC 地址。
  */
  abstract getStoredLocks(mac: string , result: Result<Array<string>>): void;
  /*
  *  删除已存储的锁。
  * 
  *  [mac] 配件 MAC 地址。
  *  [slotNumber] 存储槽位编号。
  */
  abstract deleteStoredLock(mac: string , slotNumber: number , result: Result<void>): void;
  /*
  *  初始化门磁。
  * 
  *  [mac] 门磁 MAC 地址。
  *  [lockData] 关联锁凭证。
  */
  abstract initDoorSensor(mac: string , lockData: string , result: Result<TTLockSystemModel>): void;
  /*
  *  独立门磁初始化。
  * 
  *  [params] 初始化参数。
  */
  abstract standaloneDoorSensorInit(params: TTStandaloneDoorSensorInitParams , result: Result<TTStandaloneDoorSensorInfo>): void;
  /*
  *  读取独立门磁特征值。
  * 
  *  [mac] 门磁 MAC 地址。
  */
  abstract standaloneDoorSensorReadFeatureValue(mac: string , result: Result<string>): void;
  /*
  *  查询独立门磁是否支持某功能。
  * 
  *  [featureValue] 设备特征值。
  *  [lockFunction] 待查询的功能项。
  */
  abstract standaloneDoorSensorIsSupportFunction(featureValue: string , lockFunction: TTStandaloneDoorSensorFeature ): boolean;
  /*
  *  配置蓝牙电表服务器。
  * 
  *  [url] 服务器地址。
  *  [clientId] 客户端 ID。
  *  [accessToken] 访问令牌。
  */
  abstract electricMeterConfigServer(url: string , clientId: string , accessToken: string ): void;
  /*
  *  连接电表。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterConnect(mac: string , result: Result<void>): void;
  /*
  *  断开电表连接。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterDisconnect(mac: string ): void;
  /*
  *  初始化电表。
  * 
  *  [params] 电表初始化参数。
  */
  abstract electricMeterInit(params: TTElectricMeterInitParam , result: Result<TTElectricMeterInitResult>): void;
  /*
  *  删除电表。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterDelete(mac: string , result: Result<void>): void;
  /*
  *  设置电表通断电。
  * 
  *  [mac] 电表 MAC 地址。
  *  [isOn] 是否通电。
  */
  abstract electricMeterSetPowerOnOff(mac: string , isOn: boolean , result: Result<void>): void;
  /*
  *  设置电表剩余电量。
  * 
  *  [mac] 电表 MAC 地址。
  *  [remainderKwh] 剩余电量（kWh）。
  */
  abstract electricMeterSetRemainderKwh(mac: string , remainderKwh: number , result: Result<void>): void;
  /*
  *  清除电表剩余电量。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterClearRemainderKwh(mac: string , result: Result<void>): void;
  /*
  *  读取电表数据。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterReadData(mac: string , result: Result<void>): void;
  /*
  *  设置电表付费模式。
  * 
  *  [mac] 电表 MAC 地址。
  *  [payMode] 付费模式。
  *  [price] 单价。
  */
  abstract electricMeterSetPayMode(mac: string , payMode: TTMeterPayMode , price: number , result: Result<void>): void;
  /*
  *  电表充值。
  * 
  *  [mac] 电表 MAC 地址。
  *  [amount] 充值金额。
  *  [kwh] 充值电量（kWh）。
  */
  abstract electricMeterCharge(mac: string , amount: number , kwh: number , result: Result<void>): void;
  /*
  *  设置电表最大功率。
  * 
  *  [mac] 电表 MAC 地址。
  *  [maxPower] 最大功率。
  */
  abstract electricMeterSetMaxPower(mac: string , maxPower: number , result: Result<void>): void;
  /*
  *  获取电表特征值。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterGetFeatureValue(mac: string , result: Result<string>): void;
  /*
  *  查询电表是否支持某功能。
  * 
  *  [featureValue] 设备特征值。
  *  [lockFunction] 待查询的功能项。
  */
  abstract electricMeterIsSupportFunction(featureValue: string , lockFunction: TTElectricMeterFeature ): boolean;
  /*
  *  获取电表设备信息。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterGetDeviceInfo(mac: string , result: Result<ElectricMeterDeviceInfo>): void;
  /*
  *  配置电表 APN。
  * 
  *  [mac] 电表 MAC 地址。
  *  [apn] APN 接入点名称。
  */
  abstract electricMeterConfigApn(mac: string , apn: string , result: Result<void>): void;
  /*
  *  配置4G卡蓝牙电表服务器。
  * 
  *  [mac] 电表 MAC 地址。
  *  [ip] 服务器 IP。
  *  [port] 服务器端口。
  */
  abstract electricMeterConfigMeterServer(mac: string , ip: string , port: string , result: Result<void>): void;
  /*
  *  重置电表。
  * 
  *  [mac] 电表 MAC 地址。
  */
  abstract electricMeterReset(mac: string , result: Result<void>): void;
  /*
  *  配置蓝牙水表服务器。
  * 
  *  [url] 服务器地址。
  *  [clientId] 客户端 ID。
  *  [accessToken] 访问令牌。
  */
  abstract waterMeterConfigServer(url: string , clientId: string , accessToken: string ): void;
  /*
  *  连接水表。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterConnect(mac: string , result: Result<void>): void;
  /*
  *  断开水表连接。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterDisconnect(mac: string ): void;
  /*
  *  初始化水表。
  * 
  *  [params] 水表初始化参数。
  */
  abstract waterMeterInit(params: TTWaterMeterInitParam , result: Result<TTWaterMeterInitResult>): void;
  /*
  *  删除水表。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterDelete(mac: string , result: Result<void>): void;
  /*
  *  设置水表通断水。
  * 
  *  [mac] 水表 MAC 地址。
  *  [isOn] 是否通水。
  */
  abstract waterMeterSetPowerOnOff(mac: string , isOn: boolean , result: Result<void>): void;
  /*
  *  设置水表剩余水量。
  * 
  *  [mac] 水表 MAC 地址。
  *  [remainderM3] 剩余水量（m³）。
  */
  abstract waterMeterSetRemainderM3(mac: string , remainderM3: number , result: Result<void>): void;
  /*
  *  清除水表剩余水量。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterClearRemainderM3(mac: string , result: Result<void>): void;
  /*
  *  读取水表数据。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterReadData(mac: string , result: Result<void>): void;
  /*
  *  设置水表付费模式。
  * 
  *  [mac] 水表 MAC 地址。
  *  [payMode] 付费模式。
  *  [price] 单价。
  */
  abstract waterMeterSetPayMode(mac: string , payMode: TTMeterPayMode , price: number , result: Result<void>): void;
  /*
  *  水表充值。
  * 
  *  [mac] 水表 MAC 地址。
  *  [amount] 充值金额。
  *  [m3] 充值水量（m³）。
  */
  abstract waterMeterCharge(mac: string , amount: number , m3: number , result: Result<void>): void;
  /*
  *  设置水表总用量。
  * 
  *  [mac] 水表 MAC 地址。
  *  [totalM3] 总用量（m³）。
  */
  abstract waterMeterSetTotalUsage(mac: string , totalM3: number , result: Result<void>): void;
  /*
  *  获取水表特征值。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterGetFeatureValue(mac: string , result: Result<string>): void;
  /*
  *  获取水表设备信息。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterGetDeviceInfo(mac: string , result: Result<WaterMeterDeviceInfo>): void;
  /*
  *  查询水表是否支持某功能。
  * 
  *  [featureValue] 设备特征值。
  *  [lockFunction] 待查询的功能项。
  */
  abstract waterMeterIsSupportFunction(featureValue: string , lockFunction: TTWaterMeterFeature ): boolean;
  /*
  *  配置水表 APN。
  * 
  *  [mac] 水表 MAC 地址。
  *  [apn] APN 接入点名称。
  */
  abstract waterMeterConfigApn(mac: string , apn: string , result: Result<void>): void;
  /*
  *  配置4G卡蓝牙水表服务器。
  * 
  *  [mac] 水表 MAC 地址。
  *  [ip] 服务器 IP。
  *  [port] 服务器端口。
  */
  abstract waterMeterConfigMeterServer(mac: string , ip: string , port: string , result: Result<void>): void;
  /*
  *  重置水表。
  * 
  *  [mac] 水表 MAC 地址。
  */
  abstract waterMeterReset(mac: string , result: Result<void>): void;
  /** The codec used by TTAccessoryHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTAccessoryHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTAccessoryHostApi | null, messageChannelSuffix: string = ''): void {
    const separatedMessageChannelSuffix: string = messageChannelSuffix !== '' ? '.' + messageChannelSuffix : '';
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.setAccessoryAddKeypadFingerprintParam' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setAccessoryAddKeypadFingerprintParam(args[0] as TTKeypadCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.setAccessoryAddKeypadCardParam' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.setAccessoryAddKeypadCardParam(args[0] as TTKeypadCredentialEventParam);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initRemoteKey' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockSystemModel> = new ResultImp();

              api!.initRemoteKey(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initRemoteKeypad' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<RemoteKeypadInitResult>{
                    success(result: RemoteKeypadInitResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<RemoteKeypadInitResult> = new ResultImp();

              api!.initRemoteKeypad(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initMultifunctionalKeypad' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<MultifunctionalKeypadInitResult>{
                    success(result: MultifunctionalKeypadInitResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<MultifunctionalKeypadInitResult> = new ResultImp();

              api!.initMultifunctionalKeypad(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.getStoredLocks' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<Array<string>>{
                    success(result: Array<string>): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<string>> = new ResultImp();

              api!.getStoredLocks(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.deleteStoredLock' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.deleteStoredLock(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initDoorSensor' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockSystemModel> = new ResultImp();

              api!.initDoorSensor(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorInit' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTStandaloneDoorSensorInfo>{
                    success(result: TTStandaloneDoorSensorInfo): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTStandaloneDoorSensorInfo> = new ResultImp();

              api!.standaloneDoorSensorInit(args[0] as TTStandaloneDoorSensorInitParams, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorReadFeatureValue' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.standaloneDoorSensorReadFeatureValue(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorIsSupportFunction' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                let output: boolean = api!.standaloneDoorSensorIsSupportFunction(args[0] as string, TTStandaloneDoorSensorFeature[args[1] as string]);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConfigServer' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.electricMeterConfigServer(args[0] as string, args[1] as string, args[2] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConnect' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterConnect(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterDisconnect' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.electricMeterDisconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterInit' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTElectricMeterInitResult>{
                    success(result: TTElectricMeterInitResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTElectricMeterInitResult> = new ResultImp();

              api!.electricMeterInit(args[0] as TTElectricMeterInitParam, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterDelete' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterDelete(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetPowerOnOff' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterSetPowerOnOff(args[0] as string, args[1] as boolean, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetRemainderKwh' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterSetRemainderKwh(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterClearRemainderKwh' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterClearRemainderKwh(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterReadData' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterReadData(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetPayMode' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterSetPayMode(args[0] as string, TTMeterPayMode[args[1] as string], args[2] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterCharge' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterCharge(args[0] as string, args[1] as number, args[2] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetMaxPower' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterSetMaxPower(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterGetFeatureValue' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.electricMeterGetFeatureValue(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterIsSupportFunction' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                let output: boolean = api!.electricMeterIsSupportFunction(args[0] as string, TTElectricMeterFeature[args[1] as string]);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterGetDeviceInfo' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<ElectricMeterDeviceInfo>{
                    success(result: ElectricMeterDeviceInfo): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<ElectricMeterDeviceInfo> = new ResultImp();

              api!.electricMeterGetDeviceInfo(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConfigApn' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterConfigApn(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConfigMeterServer' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterConfigMeterServer(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterReset' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterReset(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigServer' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.waterMeterConfigServer(args[0] as string, args[1] as string, args[2] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConnect' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterConnect(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterDisconnect' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                api!.waterMeterDisconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterInit' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<TTWaterMeterInitResult>{
                    success(result: TTWaterMeterInitResult): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTWaterMeterInitResult> = new ResultImp();

              api!.waterMeterInit(args[0] as TTWaterMeterInitParam, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterDelete' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterDelete(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetPowerOnOff' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterSetPowerOnOff(args[0] as string, args[1] as boolean, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetRemainderM3' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterSetRemainderM3(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterClearRemainderM3' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterClearRemainderM3(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterReadData' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterReadData(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetPayMode' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterSetPayMode(args[0] as string, TTMeterPayMode[args[1] as string], args[2] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterCharge' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterCharge(args[0] as string, args[1] as number, args[2] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetTotalUsage' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterSetTotalUsage(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterGetFeatureValue' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.waterMeterGetFeatureValue(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterGetDeviceInfo' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<WaterMeterDeviceInfo>{
                    success(result: WaterMeterDeviceInfo): void {
                      let res: Array<Object | null> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<WaterMeterDeviceInfo> = new ResultImp();

              api!.waterMeterGetDeviceInfo(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterIsSupportFunction' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              let res: Array<Object | null> = [];
              try {
                let output: boolean = api!.waterMeterIsSupportFunction(args[0] as string, TTWaterMeterFeature[args[1] as string]);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object | null> = wrapError(error);
                res = wrappedError;
              }
              reply.reply(res);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigApn' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 2) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 2 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterConfigApn(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigMeterServer' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 3) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 3 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterConfigMeterServer(args[0] as string, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, 'dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterReset' + separatedMessageChannelSuffix, TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              if (!(Array.isArray(message))) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected List.')));
                  return;
              }
              let args: Array<Object> = message as Array<Object>;
              if (args.length < 1) {
                  reply.reply(wrapError(new Error('Invalid Pigeon message: expected at least 1 argument(s).')));
                  return;
              }
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object | null> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object | null> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterReset(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
  }
}

/**
 * Internal [StreamHandler] that delegates to a [PigeonEventChannelWrapper].
 */
class PigeonStreamHandler<T> implements StreamHandler {
  private readonly wrapper: PigeonEventChannelWrapper<T>;
  private pigeonSink: PigeonEventSink<T> | null = null;

  constructor(wrapper: PigeonEventChannelWrapper<T>) {
    this.wrapper = wrapper;
  }

  onListen(args: Object, events: EventSink): void {
    this.pigeonSink = new PigeonEventSink<T>(events);
    this.wrapper.onListen(args, this.pigeonSink!);
  }

  onCancel(args: Object): void {
    this.pigeonSink = null;
    this.wrapper.onCancel(args);
  }
}

export interface PigeonEventChannelWrapper<T> {
  onListen(args: Object, sink: PigeonEventSink<T>): void;
  onCancel(args: Object): void;
}

export class PigeonEventSink<T> {
  private readonly sink: EventSink;

  constructor(sink: EventSink) {
    this.sink = sink;
  }

  success(value: T): void {
    this.sink.success(value);
  }

  error(errorCode: string, errorMessage: string | null, errorDetails: Object | null): void {
    this.sink.error(errorCode, errorMessage, errorDetails);
  }

  endOfStream(): void {
    this.sink.endOfStream();
  }
}

/*
*  持续事件流接口。
* 
*  订阅任一流方法前，须通过对应 [TTLockHostApi] / [TTGatewayHostApi] /
*  [TTAccessoryHostApi] 的 `set*Param` 方法写入上下文参数。
*/
export abstract class LockScanLockStreamHandler implements PigeonEventChannelWrapper<TTLockScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockScanLockStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockScanLock';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTLockScanModel> =
        new PigeonStreamHandler<TTLockScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTLockScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class LockScanWifiStreamHandler implements PigeonEventChannelWrapper<TTWifiScanResult> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockScanWifiStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockScanWifi';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTWifiScanResult> =
        new PigeonStreamHandler<TTWifiScanResult>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTWifiScanResult>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class LockAddCardStreamHandler implements PigeonEventChannelWrapper<AddCardEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockAddCardStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockAddCard';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddCardEvent> =
        new PigeonStreamHandler<AddCardEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddCardEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class LockAddFingerprintStreamHandler implements PigeonEventChannelWrapper<AddFingerprintEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockAddFingerprintStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockAddFingerprint';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddFingerprintEvent> =
        new PigeonStreamHandler<AddFingerprintEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddFingerprintEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class LockAddFaceStreamHandler implements PigeonEventChannelWrapper<AddFaceEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockAddFaceStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockAddFace';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddFaceEvent> =
        new PigeonStreamHandler<AddFaceEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddFaceEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class LockAddPalmVeinStreamHandler implements PigeonEventChannelWrapper<AddPalmVeinEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: LockAddPalmVeinStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.lockAddPalmVein';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddPalmVeinEvent> =
        new PigeonStreamHandler<AddPalmVeinEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddPalmVeinEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class GatewayStartScanStreamHandler implements PigeonEventChannelWrapper<TTGatewayScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: GatewayStartScanStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.gatewayStartScan';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTGatewayScanModel> =
        new PigeonStreamHandler<TTGatewayScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTGatewayScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class GatewayGetNearbyWifiStreamHandler implements PigeonEventChannelWrapper<TTWifiScanResult> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: GatewayGetNearbyWifiStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.gatewayGetNearbyWifi';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTWifiScanResult> =
        new PigeonStreamHandler<TTWifiScanResult>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTWifiScanResult>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryStartScanRemoteKeyStreamHandler implements PigeonEventChannelWrapper<TTRemoteAccessoryScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryStartScanRemoteKeyStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryStartScanRemoteKey';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTRemoteAccessoryScanModel> =
        new PigeonStreamHandler<TTRemoteAccessoryScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryStartScanRemoteKeypadStreamHandler implements PigeonEventChannelWrapper<TTRemoteAccessoryScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryStartScanRemoteKeypadStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryStartScanRemoteKeypad';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTRemoteAccessoryScanModel> =
        new PigeonStreamHandler<TTRemoteAccessoryScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryAddKeypadFingerprintStreamHandler implements PigeonEventChannelWrapper<AddFingerprintEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryAddKeypadFingerprintStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryAddKeypadFingerprint';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddFingerprintEvent> =
        new PigeonStreamHandler<AddFingerprintEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddFingerprintEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryAddKeypadCardStreamHandler implements PigeonEventChannelWrapper<AddCardEvent> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryAddKeypadCardStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryAddKeypadCard';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<AddCardEvent> =
        new PigeonStreamHandler<AddCardEvent>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<AddCardEvent>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryStartScanDoorSensorStreamHandler implements PigeonEventChannelWrapper<TTRemoteAccessoryScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryStartScanDoorSensorStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryStartScanDoorSensor';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTRemoteAccessoryScanModel> =
        new PigeonStreamHandler<TTRemoteAccessoryScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryStandaloneDoorSensorStartScanStreamHandler implements PigeonEventChannelWrapper<TTStandaloneDoorSensorScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryStandaloneDoorSensorStartScanStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryStandaloneDoorSensorStartScan';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTStandaloneDoorSensorScanModel> =
        new PigeonStreamHandler<TTStandaloneDoorSensorScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTStandaloneDoorSensorScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryWaterMeterStartScanStreamHandler implements PigeonEventChannelWrapper<TTMeterScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryWaterMeterStartScanStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryWaterMeterStartScan';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTMeterScanModel> =
        new PigeonStreamHandler<TTMeterScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTMeterScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


export abstract class AccessoryElectricMeterStartScanStreamHandler implements PigeonEventChannelWrapper<TTMeterScanModel> {
  static register(binaryMessenger: BinaryMessenger, streamHandler: AccessoryElectricMeterStartScanStreamHandler, instanceName: string = ''): void {
    let channelName: string = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.accessoryElectricMeterStartScan';
    if (instanceName !== '') {
      channelName += '.' + instanceName;
    }
    const internalStreamHandler: PigeonStreamHandler<TTMeterScanModel> =
        new PigeonStreamHandler<TTMeterScanModel>(streamHandler);
    const channel: EventChannel = new EventChannel(binaryMessenger, channelName, PigeonMethodChannelCodec);
    channel.setStreamHandler(internalStreamHandler);
  }

  onListen(args: Object, sink: PigeonEventSink<TTMeterScanModel>): void {
  }

  onCancel(args: Object): void {
  }
}


