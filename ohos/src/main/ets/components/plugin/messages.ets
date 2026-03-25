import StandardMessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMessageCodec';
import BasicMessageChannel, { Reply } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BasicMessageChannel';
import { BinaryMessenger,TaskQueue } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';
import MessageCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/MessageCodec';
import { ByteBuffer } from '@ohos/flutter_ohos/src/main/ets/util/ByteBuffer';


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

function wrapError(error: Error): Array<Object> {
  let errorList: Array<Object> = new Array<Object>(3);
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

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTBluetoothState {
  UNKNOW,
  RESETTING,
  UNSUPPORTED,
  UN_AUTHORIZED,
  TURN_OFF,
  TURN_ON
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTBluetoothStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTPasscodeType {
  ONCE,
  PERMANENT,
  PERIOD,
  CYCLE
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTPasscodeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTOperateRecordType {
  LATEST,
  TOTAL
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTOperateRecordTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTControlAction {
  UNLOCK,
  LOCK
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTControlActionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLockSwitchState {
  LOCK,
  UNLOCK,
  UNKNOW
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLockSwitchStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTPassageModeType {
  WEEKLY,
  MONTHLY
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTPassageModeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLockConfig {
  AUDIO,
  PASSCODE_VISIBLE,
  FREEZE,
  TAMPER_ALERT,
  RESET_BUTTON,
  PRIVACY_LOCK,
  PASSAGE_MODE_AUTO_UNLOCK,
  WIFI_LOCK_POWER_SAVING_MODE,
  DOUBLE_AUTH,
  PUBLIC_MODE,
  LOW_BATTERY_AUTO_UNLOCK
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLockConfigEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLockDirection {
  LEFT,
  RIGHT
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLockDirectionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTSoundVolumeType {
  FIRST_LEVEL,
  SECOND_LEVEL,
  THIRD_LEVEL,
  FOURTH_LEVEL,
  FIFTH_LEVEL,
  OFF,
  ON
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTSoundVolumeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTSensitivityValue {
  OFF,
  LOW,
  MEDIUM,
  HIGH
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTSensitivityValueEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLockError {
  SUCCESS,
  RESETED,
  CRC_ERROR,
  NO_PERMISSTION,
  WRONG_ADMIN_CODE,
  NO_STORAGE_SPACE,
  IN_SETTING_MODE,
  NO_ADMIN,
  NOT_IN_SETTING_MODE,
  WRONG_DYNAMIC_CODE,
  NO_POWER,
  RESET_PASSCODE,
  UNPDATE_PASSCODE_INDEX,
  INVALID_LOCK_FLAG_POS,
  EKEY_EXPIRED,
  PASSCODE_LENGTH_INVALID,
  SAME_PASSCODES,
  EKEY_INACTIVE,
  AES_KEY,
  FAIL,
  PASSCODE_EXIST,
  PASSCODE_NOT_EXIST,
  LACK_OF_STORAGE_SPACE_WHEN_ADDING_PASSCODES,
  INVALID_PARA_LENGTH,
  CARD_NOT_EXIST,
  FINGERPRINT_DUPLICATION,
  FINGERPRINT_NOT_EXIST,
  INVALID_COMMAND,
  IN_FREEZE_MODE,
  INVALID_CLIENT_PARA,
  LOCK_IS_LOCKED,
  RECORD_NOT_EXIST,
  NOT_SUPPORT_MODIFY_PASSCODE,
  BLUETOOTH_OFF,
  BLUETOOTH_CONNECT_TIMEOUNT,
  BLUETOOTH_DISCONNECTION,
  LOCK_IS_BUSY,
  INVALID_LOCK_DATA,
  INVALID_PARAMETER,
  WRONG_WIFI,
  WRONG_WIFI_PASSWORD,
  SCAN_FAILED_ALREADY_START,
  SCAN_FAILED_APPLICATION_REGISTRATION_FAILED,
  SCAN_FAILED_INTERNAL_ERROR,
  SCAN_FAILED_FEATURE_UNSUPPORTED,
  SCAN_FAILED_OUT_OF_HARDWARE_RESOURCES,
  INIT_WIRELESS_KEYBOARD_FAILED,
  WIRELESS_KEYBOARD_NO_RESPONSE,
  DEVICE_CONNECT_FAILED,
  SIGNATURE_VERIFICATION_FAILED,
  INVALID_APPLICATION
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLockErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTErrorDevice {
  LOCK,
  KEY_PAD,
  KEY
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTErrorDeviceEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLiftWorkActivateType {
  ALL_FLOORS,
  SPECIFIC_FLOORS
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLiftWorkActivateTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTPowerSaverWorkType {
  ALL_CARDS,
  HOTEL_CARD,
  ROOM_CARD
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTPowerSaverWorkTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTGatewayType {
  G1,
  G2,
  G3,
  G4,
  G5
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTGatewayTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTGatewayConnectStatus {
  TIMEOUT,
  SUCCESS,
  FAILED
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTGatewayConnectStatusEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTGatewayError {
  SUCCESS,
  FAILED,
  BAD_WIFI_NAME,
  BAD_WIFI_PASSWORD,
  INVALID_COMMAND,
  TIME_OUT,
  NO_SIM_CARD,
  NO_CABLE,
  WRONG_CRC,
  WRONG_AES_KEY,
  FAILED_CONFIGURE_ROUTER,
  FAILED_CONFIGURE_SERVER,
  FAILED_CONFIGURE_ACCOUNT,
  COMMUNICATION_DISCONNECTED,
  UN_CONNECTED,
  CONNECT_TIMEOUT,
  DATA_FORMAT_ERROR,
  FAILED_CONFIG_ACCOUNT,
  FAILED_CONFIG_IP,
  INVALID_IP
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTGatewayErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTRemoteAccessoryError {
  SUCCESS,
  FAILED,
  NO_RESPONSE,
  WRONG_CRC,
  REQUEST_FAILED,
  CONNECT_FAILED,
  DEVICE_IS_BUSY,
  DATA_FORMAT_ERROR
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTRemoteAccessoryErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTMultifunctionalKeypadError {
  SUCCESS,
  FAILED,
  DUPLICATE_FINGERPRINT,
  NO_STORAGE_SPACE,
  WRONG_CRC,
  NO_RESPONSE,
  KEYPAD_CONNECT_FAILED,
  DATA_FORMAT_ERROR
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTMultifunctionalKeypadErrorEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTRemoteAccessory {
  REMOTE_KEY,
  REMOTE_KEYPAD,
  DOOR_SENSOR
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTRemoteAccessoryEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTIpSettingType {
  STATIC_IP,
  DHCP
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTIpSettingTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTNbAwakeMode {
  KEYPAD,
  CARD,
  FINGERPRINT
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTNbAwakeModeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTNbAwakeTimeType {
  POINT,
  INTERVAL
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTNbAwakeTimeTypeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTLockFunction {
  PASSCODE,
  IC_CARD,
  FINGERPRINT,
  WRISTBAND,
  AUTO_LOCK,
  DELETE_PASSCODE,
  MANAGE_PASSCODE,
  LOCKING,
  PASSCODE_VISIBLE,
  GATEWAY_UNLOCK,
  LOCK_FREEZE,
  CYCLE_PASSWORD,
  UNLOCK_SWITCH,
  AUDIO_SWITCH,
  NB_IO_T,
  GET_ADMIN_PASSCODE,
  HOTEL_CARD,
  NO_CLOCK,
  NO_BROADCAST_IN_NORMAL,
  PASSAGE_MODE,
  TURN_OFF_AUTO_LOCK,
  WIRELESS_KEYPAD,
  LIGHT,
  HOTEL_CARD_BLACKLIST,
  IDENTITY_CARD,
  TAMPER_ALERT,
  RESET_BUTTON,
  PRIVACY_LOCK,
  DEAD_LOCK,
  CYCLIC_CARD_OR_FINGERPRINT,
  FINGER_VEIN,
  BLE5G,
  NB_AWAKE,
  RECOVER_CYCLE_PASSCODE,
  REMOTE_KEY,
  GET_ACCESSORY_ELECTRIC_QUANTITY,
  SOUND_VOLUME_AND_LANGUAGE_SETTING,
  QR_CODE,
  DOOR_SENSOR_STATE,
  PASSAGE_MODE_AUTO_UNLOCK_SETTING,
  DOOR_SENSOR,
  DOOR_SENSOR_ALERT,
  SENSITIVITY,
  FACE,
  CPU_CARD,
  WIFI_LOCK,
  WIFI_LOCK_STATIC_IP,
  PASSCODE_KEY_NUMBER,
  STAND_ALONE_ACTIVATION,
  DOUBLE_AUTH,
  AUTHORIZED_UNLOCK,
  GATEWAY_AUTHORIZED_UNLOCK,
  NO_EKEY_UNLOCK,
  ZHI_AN_PHOTO_FACE,
  PALM_VEIN,
  WIFI_AREA,
  XIAO_CAO_CAMERA,
  RESET_LOCK_BY_CODE,
  THIRD_PARTY_BLUETOOTH_DEVICE,
  AUTO_SET_ANGLE,
  MANUAL_SET_ANGLE,
  CONTROL_LATCH_BOLT,
  AUTO_SET_UNLOCK_DIRECTION,
  IC_CARD_SECURITY_SETTING,
  WIFI_POWER_SAVING_TIME,
  MULTI_FUNCTION_KEYPAD,
  DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT,
  PUBLIC_MODE,
  LOW_BATTERY_AUTO_UNLOCK,
  MOTOR_DRIVE_TIME,
  MODIFY_FEATURE_VALUE,
  MODIFY_LOCK_NAME_PREFIX,
  AUTH_CODE,
  UNAUTHORIZED_ATTEMPT_ALARM,
  POWER_SAVER_SUPPORT_WIFI,
  BLUETOOTH_ADVERTISING_SETTING,
  WORKING_MODE,
  SUPPLIER_CODE,
  CAT_ONE,
  FORCED_OPENING_DOOR_ALARM,
  ZHI_AN_FACE_FEATURE_SECOND_GENERATION,
  SUPPORT_DEAD_LOCKING,
  WORKING_TIME,
  CUSTOM_QRCODE,
  SECURITY_M1CARD,
  YI_SHENG_PHOTO_FACE
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTLockFunctionEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTFaceState {
  CAN_START_ADD,
  ERROR
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTFaceStateEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated enum from Pigeon that represents data sent in messages.*/
export enum TTFaceErrorCode {
  NORMAL,
  NO_FACE_DETECTED,
  TOO_CLOSE_TO_THE_TOP,
  TOO_CLOSE_TO_THE_BOTTOM,
  TOO_CLOSE_TO_THE_LEFT,
  TOO_CLOSE_TO_THE_RIGHT,
  TOO_FAR_AWAY,
  TOO_CLOSE,
  EYEBROWS_COVERED,
  EYES_COVERED,
  FACE_COVERED,
  FACE_DIRECTION,
  EYE_OPENING_DETECTED,
  EYES_CLOSED_STATUS,
  FAILED_TO_DETECT_EYE,
  NEED_TURN_HEAD_TO_LEFT,
  NEED_TURN_HEAD_TO_RIGHT,
  NEED_RAISE_HEAD,
  NEED_LOWER_HEAD,
  NEED_TILT_HEAD_TO_LEFT,
  NEED_TILT_HEAD_TO_RIGHT
}

/* Generated enum Companion class from Pigeon that represents data sent 
   in messages.Do not delete otherwise enum type data transfer will be failed*/
export class TTFaceErrorCodeEnum {
  index: string|null = null;
	constructor(index: string){
    this.index = index;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTLockVersion {
  private protocolType?: number;

  public setProtocolType(protocolType:number):void {
    this.protocolType = protocolType;
  }

  getProtocolType(): number | undefined{
    return this.protocolType;
  }

  private protocolVersion?: number;

  public setProtocolVersion(protocolVersion:number):void {
    this.protocolVersion = protocolVersion;
  }

  getProtocolVersion(): number | undefined{
    return this.protocolVersion;
  }

  private scene?: number;

  public setScene(scene:number):void {
    this.scene = scene;
  }

  getScene(): number | undefined{
    return this.scene;
  }

  private groupId?: number;

  public setGroupId(groupId:number):void {
    this.groupId = groupId;
  }

  getGroupId(): number | undefined{
    return this.groupId;
  }

  private orgId?: number;

  public setOrgId(orgId:number):void {
    this.orgId = orgId;
  }

  getOrgId(): number | undefined{
    return this.orgId;
  }

  constructor(protocolType?: number, protocolVersion?: number, scene?: number, groupId?: number, orgId?: number) {
    this.protocolType = protocolType;
    this.protocolVersion = protocolVersion;
    this.scene = scene;
    this.groupId = groupId;
    this.orgId = orgId;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.protocolType !==undefined){
      arr.push(this.protocolType);
    }
    if(this.protocolVersion !==undefined){
      arr.push(this.protocolVersion);
    }
    if(this.scene !==undefined){
      arr.push(this.scene);
    }
    if(this.groupId !==undefined){
      arr.push(this.groupId);
    }
    if(this.orgId !==undefined){
      arr.push(this.orgId);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockVersion {
    let pigeonResult: TTLockVersion = new TTLockVersion();
    let protocolType: Object = arr[0];
    pigeonResult.setProtocolType(protocolType as number);
    let protocolVersion: Object = arr[1];
    pigeonResult.setProtocolVersion(protocolVersion as number);
    let scene: Object = arr[2];
    pigeonResult.setScene(scene as number);
    let groupId: Object = arr[3];
    pigeonResult.setGroupId(groupId as number);
    let orgId: Object = arr[4];
    pigeonResult.setOrgId(orgId as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTLockInitParams {
  private lockMac?: string;

  public setLockMac(lockMac:string):void {
    this.lockMac = lockMac;
  }

  getLockMac(): string | undefined{
    return this.lockMac;
  }

  private lockVersion?: TTLockVersion;

  public setLockVersion(lockVersion:TTLockVersion):void {
    this.lockVersion = lockVersion;
  }

  getLockVersion(): TTLockVersion | undefined{
    return this.lockVersion;
  }

  private isInited?: boolean;

  public setIsInited(isInited:boolean):void {
    this.isInited = isInited;
  }

  getIsInited(): boolean | undefined{
    return this.isInited;
  }

  private clientPara?: string;

  public setClientPara(clientPara:string):void {
    this.clientPara = clientPara;
  }

  getClientPara(): string | undefined{
    return this.clientPara;
  }

  private hotelInfo?: string;

  public setHotelInfo(hotelInfo:string):void {
    this.hotelInfo = hotelInfo;
  }

  getHotelInfo(): string | undefined{
    return this.hotelInfo;
  }

  private buildingNumber?: number;

  public setBuildingNumber(buildingNumber:number):void {
    this.buildingNumber = buildingNumber;
  }

  getBuildingNumber(): number | undefined{
    return this.buildingNumber;
  }

  private floorNumber?: number;

  public setFloorNumber(floorNumber:number):void {
    this.floorNumber = floorNumber;
  }

  getFloorNumber(): number | undefined{
    return this.floorNumber;
  }

  constructor(lockMac?: string, lockVersion?: TTLockVersion, isInited?: boolean, clientPara?: string, hotelInfo?: string, buildingNumber?: number, floorNumber?: number) {
    this.lockMac = lockMac;
    this.lockVersion = lockVersion;
    this.isInited = isInited;
    this.clientPara = clientPara;
    this.hotelInfo = hotelInfo;
    this.buildingNumber = buildingNumber;
    this.floorNumber = floorNumber;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.lockMac !==undefined){
      arr.push(this.lockMac);
    }
    if(this.lockVersion !==undefined){
      arr.push(this.lockVersion);
    }
    if(this.isInited !==undefined){
      arr.push(this.isInited);
    }
    if(this.clientPara !==undefined){
      arr.push(this.clientPara);
    }
    if(this.hotelInfo !==undefined){
      arr.push(this.hotelInfo);
    }
    if(this.buildingNumber !==undefined){
      arr.push(this.buildingNumber);
    }
    if(this.floorNumber !==undefined){
      arr.push(this.floorNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockInitParams {
    let pigeonResult: TTLockInitParams = new TTLockInitParams();
    let lockMac: Object = arr[0];
    pigeonResult.setLockMac(lockMac as string);
    let lockVersion: Object = arr[1];
    pigeonResult.setLockVersion(lockVersion as TTLockVersion);
    let isInited: Object = arr[2];
    pigeonResult.setIsInited(isInited as boolean);
    let clientPara: Object = arr[3];
    pigeonResult.setClientPara(clientPara as string);
    let hotelInfo: Object = arr[4];
    pigeonResult.setHotelInfo(hotelInfo as string);
    let buildingNumber: Object = arr[5];
    pigeonResult.setBuildingNumber(buildingNumber as number);
    let floorNumber: Object = arr[6];
    pigeonResult.setFloorNumber(floorNumber as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTGatewayInitParams {
  private type?: number;

  public setType(type:number):void {
    this.type = type;
  }

  getType(): number | undefined{
    return this.type;
  }

  private ttlockUid?: number;

  public setTtlockUid(ttlockUid:number):void {
    this.ttlockUid = ttlockUid;
  }

  getTtlockUid(): number | undefined{
    return this.ttlockUid;
  }

  private gatewayName?: string;

  public setGatewayName(gatewayName:string):void {
    this.gatewayName = gatewayName;
  }

  getGatewayName(): string | undefined{
    return this.gatewayName;
  }

  private ttlockLoginPassword?: string;

  public setTtlockLoginPassword(ttlockLoginPassword:string):void {
    this.ttlockLoginPassword = ttlockLoginPassword;
  }

  getTtlockLoginPassword(): string | undefined{
    return this.ttlockLoginPassword;
  }

  private wifi?: string;

  public setWifi(wifi:string):void {
    this.wifi = wifi;
  }

  getWifi(): string | undefined{
    return this.wifi;
  }

  private wifiPassword?: string;

  public setWifiPassword(wifiPassword:string):void {
    this.wifiPassword = wifiPassword;
  }

  getWifiPassword(): string | undefined{
    return this.wifiPassword;
  }

  private serverIp?: string;

  public setServerIp(serverIp:string):void {
    this.serverIp = serverIp;
  }

  getServerIp(): string | undefined{
    return this.serverIp;
  }

  private serverPort?: string;

  public setServerPort(serverPort:string):void {
    this.serverPort = serverPort;
  }

  getServerPort(): string | undefined{
    return this.serverPort;
  }

  private companyId?: number;

  public setCompanyId(companyId:number):void {
    this.companyId = companyId;
  }

  getCompanyId(): number | undefined{
    return this.companyId;
  }

  private branchId?: number;

  public setBranchId(branchId:number):void {
    this.branchId = branchId;
  }

  getBranchId(): number | undefined{
    return this.branchId;
  }

  constructor(type?: number, ttlockUid?: number, gatewayName?: string, ttlockLoginPassword?: string, wifi?: string, wifiPassword?: string, serverIp?: string, serverPort?: string, companyId?: number, branchId?: number) {
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

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.type !==undefined){
      arr.push(this.type);
    }
    if(this.ttlockUid !==undefined){
      arr.push(this.ttlockUid);
    }
    if(this.gatewayName !==undefined){
      arr.push(this.gatewayName);
    }
    if(this.ttlockLoginPassword !==undefined){
      arr.push(this.ttlockLoginPassword);
    }
    if(this.wifi !==undefined){
      arr.push(this.wifi);
    }
    if(this.wifiPassword !==undefined){
      arr.push(this.wifiPassword);
    }
    if(this.serverIp !==undefined){
      arr.push(this.serverIp);
    }
    if(this.serverPort !==undefined){
      arr.push(this.serverPort);
    }
    if(this.companyId !==undefined){
      arr.push(this.companyId);
    }
    if(this.branchId !==undefined){
      arr.push(this.branchId);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTGatewayInitParams {
    let pigeonResult: TTGatewayInitParams = new TTGatewayInitParams();
    let type: Object = arr[0];
    pigeonResult.setType(type as number);
    let ttlockUid: Object = arr[1];
    pigeonResult.setTtlockUid(ttlockUid as number);
    let gatewayName: Object = arr[2];
    pigeonResult.setGatewayName(gatewayName as string);
    let ttlockLoginPassword: Object = arr[3];
    pigeonResult.setTtlockLoginPassword(ttlockLoginPassword as string);
    let wifi: Object = arr[4];
    pigeonResult.setWifi(wifi as string);
    let wifiPassword: Object = arr[5];
    pigeonResult.setWifiPassword(wifiPassword as string);
    let serverIp: Object = arr[6];
    pigeonResult.setServerIp(serverIp as string);
    let serverPort: Object = arr[7];
    pigeonResult.setServerPort(serverPort as string);
    let companyId: Object = arr[8];
    pigeonResult.setCompanyId(companyId as number);
    let branchId: Object = arr[9];
    pigeonResult.setBranchId(branchId as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTIpSetting {
  private type?: number;

  public setType(type:number):void {
    this.type = type;
  }

  getType(): number | undefined{
    return this.type;
  }

  private ipAddress?: string;

  public setIpAddress(ipAddress:string):void {
    this.ipAddress = ipAddress;
  }

  getIpAddress(): string | undefined{
    return this.ipAddress;
  }

  private subnetMask?: string;

  public setSubnetMask(subnetMask:string):void {
    this.subnetMask = subnetMask;
  }

  getSubnetMask(): string | undefined{
    return this.subnetMask;
  }

  private router?: string;

  public setRouter(router:string):void {
    this.router = router;
  }

  getRouter(): string | undefined{
    return this.router;
  }

  private preferredDns?: string;

  public setPreferredDns(preferredDns:string):void {
    this.preferredDns = preferredDns;
  }

  getPreferredDns(): string | undefined{
    return this.preferredDns;
  }

  private alternateDns?: string;

  public setAlternateDns(alternateDns:string):void {
    this.alternateDns = alternateDns;
  }

  getAlternateDns(): string | undefined{
    return this.alternateDns;
  }

  constructor(type?: number, ipAddress?: string, subnetMask?: string, router?: string, preferredDns?: string, alternateDns?: string) {
    this.type = type;
    this.ipAddress = ipAddress;
    this.subnetMask = subnetMask;
    this.router = router;
    this.preferredDns = preferredDns;
    this.alternateDns = alternateDns;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.type !==undefined){
      arr.push(this.type);
    }
    if(this.ipAddress !==undefined){
      arr.push(this.ipAddress);
    }
    if(this.subnetMask !==undefined){
      arr.push(this.subnetMask);
    }
    if(this.router !==undefined){
      arr.push(this.router);
    }
    if(this.preferredDns !==undefined){
      arr.push(this.preferredDns);
    }
    if(this.alternateDns !==undefined){
      arr.push(this.alternateDns);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTIpSetting {
    let pigeonResult: TTIpSetting = new TTIpSetting();
    let type: Object = arr[0];
    pigeonResult.setType(type as number);
    let ipAddress: Object = arr[1];
    pigeonResult.setIpAddress(ipAddress as string);
    let subnetMask: Object = arr[2];
    pigeonResult.setSubnetMask(subnetMask as string);
    let router: Object = arr[3];
    pigeonResult.setRouter(router as string);
    let preferredDns: Object = arr[4];
    pigeonResult.setPreferredDns(preferredDns as string);
    let alternateDns: Object = arr[5];
    pigeonResult.setAlternateDns(alternateDns as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTCycleModel {
  private weekDay?: number;

  public setWeekDay(weekDay:number):void {
    this.weekDay = weekDay;
  }

  getWeekDay(): number | undefined{
    return this.weekDay;
  }

  private startTime?: number;

  public setStartTime(startTime:number):void {
    this.startTime = startTime;
  }

  getStartTime(): number | undefined{
    return this.startTime;
  }

  private endTime?: number;

  public setEndTime(endTime:number):void {
    this.endTime = endTime;
  }

  getEndTime(): number | undefined{
    return this.endTime;
  }

  constructor(weekDay?: number, startTime?: number, endTime?: number) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.weekDay !==undefined){
      arr.push(this.weekDay);
    }
    if(this.startTime !==undefined){
      arr.push(this.startTime);
    }
    if(this.endTime !==undefined){
      arr.push(this.endTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTCycleModel {
    let pigeonResult: TTCycleModel = new TTCycleModel();
    let weekDay: Object = arr[0];
    pigeonResult.setWeekDay(weekDay as number);
    let startTime: Object = arr[1];
    pigeonResult.setStartTime(startTime as number);
    let endTime: Object = arr[2];
    pigeonResult.setEndTime(endTime as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class ControlLockResult {
  private lockTime?: number;

  public setLockTime(lockTime:number):void {
    this.lockTime = lockTime;
  }

  getLockTime(): number | undefined{
    return this.lockTime;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private uniqueId?: number;

  public setUniqueId(uniqueId:number):void {
    this.uniqueId = uniqueId;
  }

  getUniqueId(): number | undefined{
    return this.uniqueId;
  }

  private lockData?: string;

  public setLockData(lockData:string):void {
    this.lockData = lockData;
  }

  getLockData(): string | undefined{
    return this.lockData;
  }

  constructor(lockTime?: number, electricQuantity?: number, uniqueId?: number, lockData?: string) {
    this.lockTime = lockTime;
    this.electricQuantity = electricQuantity;
    this.uniqueId = uniqueId;
    this.lockData = lockData;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.lockTime !==undefined){
      arr.push(this.lockTime);
    }
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.uniqueId !==undefined){
      arr.push(this.uniqueId);
    }
    if(this.lockData !==undefined){
      arr.push(this.lockData);
    }
    return arr;
  }

  static fromList(arr: Object[]): ControlLockResult {
    let pigeonResult: ControlLockResult = new ControlLockResult();
    let lockTime: Object = arr[0];
    pigeonResult.setLockTime(lockTime as number);
    let electricQuantity: Object = arr[1];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let uniqueId: Object = arr[2];
    pigeonResult.setUniqueId(uniqueId as number);
    let lockData: Object = arr[3];
    pigeonResult.setLockData(lockData as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AutoLockingTime {
  private currentTime?: number;

  public setCurrentTime(currentTime:number):void {
    this.currentTime = currentTime;
  }

  getCurrentTime(): number | undefined{
    return this.currentTime;
  }

  private minTime?: number;

  public setMinTime(minTime:number):void {
    this.minTime = minTime;
  }

  getMinTime(): number | undefined{
    return this.minTime;
  }

  private maxTime?: number;

  public setMaxTime(maxTime:number):void {
    this.maxTime = maxTime;
  }

  getMaxTime(): number | undefined{
    return this.maxTime;
  }

  constructor(currentTime?: number, minTime?: number, maxTime?: number) {
    this.currentTime = currentTime;
    this.minTime = minTime;
    this.maxTime = maxTime;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.currentTime !==undefined){
      arr.push(this.currentTime);
    }
    if(this.minTime !==undefined){
      arr.push(this.minTime);
    }
    if(this.maxTime !==undefined){
      arr.push(this.maxTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): AutoLockingTime {
    let pigeonResult: AutoLockingTime = new AutoLockingTime();
    let currentTime: Object = arr[0];
    pigeonResult.setCurrentTime(currentTime as number);
    let minTime: Object = arr[1];
    pigeonResult.setMinTime(minTime as number);
    let maxTime: Object = arr[2];
    pigeonResult.setMaxTime(maxTime as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTWifiInfoModel {
  private wifiMac?: string;

  public setWifiMac(wifiMac:string):void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string | undefined{
    return this.wifiMac;
  }

  private wifiRssi?: number;

  public setWifiRssi(wifiRssi:number):void {
    this.wifiRssi = wifiRssi;
  }

  getWifiRssi(): number | undefined{
    return this.wifiRssi;
  }

  constructor(wifiMac?: string, wifiRssi?: number) {
    this.wifiMac = wifiMac;
    this.wifiRssi = wifiRssi;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wifiMac !==undefined){
      arr.push(this.wifiMac);
    }
    if(this.wifiRssi !==undefined){
      arr.push(this.wifiRssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWifiInfoModel {
    let pigeonResult: TTWifiInfoModel = new TTWifiInfoModel();
    let wifiMac: Object = arr[0];
    pigeonResult.setWifiMac(wifiMac as string);
    let wifiRssi: Object = arr[1];
    pigeonResult.setWifiRssi(wifiRssi as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class CameraLockWifiResult {
  private serialNumber?: string;

  public setSerialNumber(serialNumber:string):void {
    this.serialNumber = serialNumber;
  }

  getSerialNumber(): string | undefined{
    return this.serialNumber;
  }

  private wifiName?: string;

  public setWifiName(wifiName:string):void {
    this.wifiName = wifiName;
  }

  getWifiName(): string | undefined{
    return this.wifiName;
  }

  constructor(serialNumber?: string, wifiName?: string) {
    this.serialNumber = serialNumber;
    this.wifiName = wifiName;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.serialNumber !==undefined){
      arr.push(this.serialNumber);
    }
    if(this.wifiName !==undefined){
      arr.push(this.wifiName);
    }
    return arr;
  }

  static fromList(arr: Object[]): CameraLockWifiResult {
    let pigeonResult: CameraLockWifiResult = new CameraLockWifiResult();
    let serialNumber: Object = arr[0];
    pigeonResult.setSerialNumber(serialNumber as string);
    let wifiName: Object = arr[1];
    pigeonResult.setWifiName(wifiName as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTLockSystemModel {
  private modelNum?: string;

  public setModelNum(modelNum:string):void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision:string):void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision:string):void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private nbOperator?: string;

  public setNbOperator(nbOperator:string):void {
    this.nbOperator = nbOperator;
  }

  getNbOperator(): string | undefined{
    return this.nbOperator;
  }

  private nbNodeId?: string;

  public setNbNodeId(nbNodeId:string):void {
    this.nbNodeId = nbNodeId;
  }

  getNbNodeId(): string | undefined{
    return this.nbNodeId;
  }

  private nbCardNumber?: string;

  public setNbCardNumber(nbCardNumber:string):void {
    this.nbCardNumber = nbCardNumber;
  }

  getNbCardNumber(): string | undefined{
    return this.nbCardNumber;
  }

  private nbRssi?: string;

  public setNbRssi(nbRssi:string):void {
    this.nbRssi = nbRssi;
  }

  getNbRssi(): string | undefined{
    return this.nbRssi;
  }

  private lockData?: string;

  public setLockData(lockData:string):void {
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

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.modelNum !==undefined){
      arr.push(this.modelNum);
    }
    if(this.hardwareRevision !==undefined){
      arr.push(this.hardwareRevision);
    }
    if(this.firmwareRevision !==undefined){
      arr.push(this.firmwareRevision);
    }
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.nbOperator !==undefined){
      arr.push(this.nbOperator);
    }
    if(this.nbNodeId !==undefined){
      arr.push(this.nbNodeId);
    }
    if(this.nbCardNumber !==undefined){
      arr.push(this.nbCardNumber);
    }
    if(this.nbRssi !==undefined){
      arr.push(this.nbRssi);
    }
    if(this.lockData !==undefined){
      arr.push(this.lockData);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockSystemModel {
    let pigeonResult: TTLockSystemModel = new TTLockSystemModel();
    let modelNum: Object = arr[0];
    pigeonResult.setModelNum(modelNum as string);
    let hardwareRevision: Object = arr[1];
    pigeonResult.setHardwareRevision(hardwareRevision as string);
    let firmwareRevision: Object = arr[2];
    pigeonResult.setFirmwareRevision(firmwareRevision as string);
    let electricQuantity: Object = arr[3];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let nbOperator: Object = arr[4];
    pigeonResult.setNbOperator(nbOperator as string);
    let nbNodeId: Object = arr[5];
    pigeonResult.setNbNodeId(nbNodeId as string);
    let nbCardNumber: Object = arr[6];
    pigeonResult.setNbCardNumber(nbCardNumber as string);
    let nbRssi: Object = arr[7];
    pigeonResult.setNbRssi(nbRssi as string);
    let lockData: Object = arr[8];
    pigeonResult.setLockData(lockData as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AccessoryElectricQuantityResult {
  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private updateDate?: number;

  public setUpdateDate(updateDate:number):void {
    this.updateDate = updateDate;
  }

  getUpdateDate(): number | undefined{
    return this.updateDate;
  }

  constructor(electricQuantity?: number, updateDate?: number) {
    this.electricQuantity = electricQuantity;
    this.updateDate = updateDate;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.updateDate !==undefined){
      arr.push(this.updateDate);
    }
    return arr;
  }

  static fromList(arr: Object[]): AccessoryElectricQuantityResult {
    let pigeonResult: AccessoryElectricQuantityResult = new AccessoryElectricQuantityResult();
    let electricQuantity: Object = arr[0];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let updateDate: Object = arr[1];
    pigeonResult.setUpdateDate(updateDate as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTLockScanModel {
  private lockName?: string;

  public setLockName(lockName:string):void {
    this.lockName = lockName;
  }

  getLockName(): string | undefined{
    return this.lockName;
  }

  private lockMac?: string;

  public setLockMac(lockMac:string):void {
    this.lockMac = lockMac;
  }

  getLockMac(): string | undefined{
    return this.lockMac;
  }

  private isInited?: boolean;

  public setIsInited(isInited:boolean):void {
    this.isInited = isInited;
  }

  getIsInited(): boolean | undefined{
    return this.isInited;
  }

  private isAllowUnlock?: boolean;

  public setIsAllowUnlock(isAllowUnlock:boolean):void {
    this.isAllowUnlock = isAllowUnlock;
  }

  getIsAllowUnlock(): boolean | undefined{
    return this.isAllowUnlock;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private lockVersion?: TTLockVersion;

  public setLockVersion(lockVersion:TTLockVersion):void {
    this.lockVersion = lockVersion;
  }

  getLockVersion(): TTLockVersion | undefined{
    return this.lockVersion;
  }

  private lockSwitchState?: TTLockSwitchState;

  public setLockSwitchState(lockSwitchState:TTLockSwitchState):void {
    this.lockSwitchState = lockSwitchState;
  }

  getLockSwitchState(): TTLockSwitchState | undefined{
    return this.lockSwitchState;
  }

  private rssi?: number;

  public setRssi(rssi:number):void {
    this.rssi = rssi;
  }

  getRssi(): number | undefined{
    return this.rssi;
  }

  private oneMeterRssi?: number;

  public setOneMeterRssi(oneMeterRssi:number):void {
    this.oneMeterRssi = oneMeterRssi;
  }

  getOneMeterRssi(): number | undefined{
    return this.oneMeterRssi;
  }

  private timestamp?: number;

  public setTimestamp(timestamp:number):void {
    this.timestamp = timestamp;
  }

  getTimestamp(): number | undefined{
    return this.timestamp;
  }

  constructor(lockName?: string, lockMac?: string, isInited?: boolean, isAllowUnlock?: boolean, electricQuantity?: number, lockVersion?: TTLockVersion, lockSwitchState?: TTLockSwitchState, rssi?: number, oneMeterRssi?: number, timestamp?: number) {
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

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.lockName !==undefined){
      arr.push(this.lockName);
    }
    if(this.lockMac !==undefined){
      arr.push(this.lockMac);
    }
    if(this.isInited !==undefined){
      arr.push(this.isInited);
    }
    if(this.isAllowUnlock !==undefined){
      arr.push(this.isAllowUnlock);
    }
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.lockVersion !==undefined){
      arr.push(this.lockVersion);
    }
    if(this.lockSwitchState !==undefined){
      const lockSwitchStateStr = TTLockSwitchState[this.lockSwitchState as number];
      arr.push(new TTLockSwitchStateEnum(lockSwitchStateStr));
    }
    if(this.rssi !==undefined){
      arr.push(this.rssi);
    }
    if(this.oneMeterRssi !==undefined){
      arr.push(this.oneMeterRssi);
    }
    if(this.timestamp !==undefined){
      arr.push(this.timestamp);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTLockScanModel {
    let pigeonResult: TTLockScanModel = new TTLockScanModel();
    let lockName: Object = arr[0];
    pigeonResult.setLockName(lockName as string);
    let lockMac: Object = arr[1];
    pigeonResult.setLockMac(lockMac as string);
    let isInited: Object = arr[2];
    pigeonResult.setIsInited(isInited as boolean);
    let isAllowUnlock: Object = arr[3];
    pigeonResult.setIsAllowUnlock(isAllowUnlock as boolean);
    let electricQuantity: Object = arr[4];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let lockVersion: Object = arr[5];
    pigeonResult.setLockVersion(lockVersion as TTLockVersion);
    const lockSwitchStateStr: string = arr[6]! as string;
    pigeonResult.setLockSwitchState(TTLockSwitchState[lockSwitchStateStr]);
    let rssi: Object = arr[7];
    pigeonResult.setRssi(rssi as number);
    let oneMeterRssi: Object = arr[8];
    pigeonResult.setOneMeterRssi(oneMeterRssi as number);
    let timestamp: Object = arr[9];
    pigeonResult.setTimestamp(timestamp as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTGatewayScanModel {
  private gatewayName?: string;

  public setGatewayName(gatewayName:string):void {
    this.gatewayName = gatewayName;
  }

  getGatewayName(): string | undefined{
    return this.gatewayName;
  }

  private gatewayMac?: string;

  public setGatewayMac(gatewayMac:string):void {
    this.gatewayMac = gatewayMac;
  }

  getGatewayMac(): string | undefined{
    return this.gatewayMac;
  }

  private rssi?: number;

  public setRssi(rssi:number):void {
    this.rssi = rssi;
  }

  getRssi(): number | undefined{
    return this.rssi;
  }

  private isDfuMode?: boolean;

  public setIsDfuMode(isDfuMode:boolean):void {
    this.isDfuMode = isDfuMode;
  }

  getIsDfuMode(): boolean | undefined{
    return this.isDfuMode;
  }

  private type?: TTGatewayType;

  public setType(type:TTGatewayType):void {
    this.type = type;
  }

  getType(): TTGatewayType | undefined{
    return this.type;
  }

  constructor(gatewayName?: string, gatewayMac?: string, rssi?: number, isDfuMode?: boolean, type?: TTGatewayType) {
    this.gatewayName = gatewayName;
    this.gatewayMac = gatewayMac;
    this.rssi = rssi;
    this.isDfuMode = isDfuMode;
    this.type = type;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.gatewayName !==undefined){
      arr.push(this.gatewayName);
    }
    if(this.gatewayMac !==undefined){
      arr.push(this.gatewayMac);
    }
    if(this.rssi !==undefined){
      arr.push(this.rssi);
    }
    if(this.isDfuMode !==undefined){
      arr.push(this.isDfuMode);
    }
    if(this.type !==undefined){
      const typeStr = TTGatewayType[this.type as number];
      arr.push(new TTGatewayTypeEnum(typeStr));
    }
    return arr;
  }

  static fromList(arr: Object[]): TTGatewayScanModel {
    let pigeonResult: TTGatewayScanModel = new TTGatewayScanModel();
    let gatewayName: Object = arr[0];
    pigeonResult.setGatewayName(gatewayName as string);
    let gatewayMac: Object = arr[1];
    pigeonResult.setGatewayMac(gatewayMac as string);
    let rssi: Object = arr[2];
    pigeonResult.setRssi(rssi as number);
    let isDfuMode: Object = arr[3];
    pigeonResult.setIsDfuMode(isDfuMode as boolean);
    const typeStr: string = arr[4]! as string;
    pigeonResult.setType(TTGatewayType[typeStr]);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class GatewayDeviceInfo {
  private modelNum?: string;

  public setModelNum(modelNum:string):void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision:string):void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision:string):void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  private networkMac?: string;

  public setNetworkMac(networkMac:string):void {
    this.networkMac = networkMac;
  }

  getNetworkMac(): string | undefined{
    return this.networkMac;
  }

  constructor(modelNum?: string, hardwareRevision?: string, firmwareRevision?: string, networkMac?: string) {
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
    this.networkMac = networkMac;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.modelNum !==undefined){
      arr.push(this.modelNum);
    }
    if(this.hardwareRevision !==undefined){
      arr.push(this.hardwareRevision);
    }
    if(this.firmwareRevision !==undefined){
      arr.push(this.firmwareRevision);
    }
    if(this.networkMac !==undefined){
      arr.push(this.networkMac);
    }
    return arr;
  }

  static fromList(arr: Object[]): GatewayDeviceInfo {
    let pigeonResult: GatewayDeviceInfo = new GatewayDeviceInfo();
    let modelNum: Object = arr[0];
    pigeonResult.setModelNum(modelNum as string);
    let hardwareRevision: Object = arr[1];
    pigeonResult.setHardwareRevision(hardwareRevision as string);
    let firmwareRevision: Object = arr[2];
    pigeonResult.setFirmwareRevision(firmwareRevision as string);
    let networkMac: Object = arr[3];
    pigeonResult.setNetworkMac(networkMac as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTRemoteAccessoryScanModel {
  private name?: string;

  public setName(name:string):void {
    this.name = name;
  }

  getName(): string | undefined{
    return this.name;
  }

  private mac?: string;

  public setMac(mac:string):void {
    this.mac = mac;
  }

  getMac(): string | undefined{
    return this.mac;
  }

  private rssi?: number;

  public setRssi(rssi:number):void {
    this.rssi = rssi;
  }

  getRssi(): number | undefined{
    return this.rssi;
  }

  private scanTime?: number;

  public setScanTime(scanTime:number):void {
    this.scanTime = scanTime;
  }

  getScanTime(): number | undefined{
    return this.scanTime;
  }

  private isMultifunctionalKeypad?: boolean;

  public setIsMultifunctionalKeypad(isMultifunctionalKeypad:boolean):void {
    this.isMultifunctionalKeypad = isMultifunctionalKeypad;
  }

  getIsMultifunctionalKeypad(): boolean | undefined{
    return this.isMultifunctionalKeypad;
  }

  private advertisementData?: Map<string, Object>;

  public setAdvertisementData(advertisementData:Map<string, Object>):void {
    this.advertisementData = advertisementData;
  }

  getAdvertisementData(): Map<string, Object> | undefined{
    return this.advertisementData;
  }

  constructor(name?: string, mac?: string, rssi?: number, scanTime?: number, isMultifunctionalKeypad?: boolean, advertisementData?: Map<string, Object>) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
    this.scanTime = scanTime;
    this.isMultifunctionalKeypad = isMultifunctionalKeypad;
    this.advertisementData = advertisementData;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.name !==undefined){
      arr.push(this.name);
    }
    if(this.mac !==undefined){
      arr.push(this.mac);
    }
    if(this.rssi !==undefined){
      arr.push(this.rssi);
    }
    if(this.scanTime !==undefined){
      arr.push(this.scanTime);
    }
    if(this.isMultifunctionalKeypad !==undefined){
      arr.push(this.isMultifunctionalKeypad);
    }
    if(this.advertisementData !==undefined){
      arr.push(this.advertisementData);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTRemoteAccessoryScanModel {
    let pigeonResult: TTRemoteAccessoryScanModel = new TTRemoteAccessoryScanModel();
    let name: Object = arr[0];
    pigeonResult.setName(name as string);
    let mac: Object = arr[1];
    pigeonResult.setMac(mac as string);
    let rssi: Object = arr[2];
    pigeonResult.setRssi(rssi as number);
    let scanTime: Object = arr[3];
    pigeonResult.setScanTime(scanTime as number);
    let isMultifunctionalKeypad: Object = arr[4];
    pigeonResult.setIsMultifunctionalKeypad(isMultifunctionalKeypad as boolean);
    let advertisementData: Object = arr[5];
    pigeonResult.setAdvertisementData(advertisementData as Map<string, Object>);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTStandaloneDoorSensorScanModel {
  private name?: string;

  public setName(name:string):void {
    this.name = name;
  }

  getName(): string | undefined{
    return this.name;
  }

  private mac?: string;

  public setMac(mac:string):void {
    this.mac = mac;
  }

  getMac(): string | undefined{
    return this.mac;
  }

  private rssi?: number;

  public setRssi(rssi:number):void {
    this.rssi = rssi;
  }

  getRssi(): number | undefined{
    return this.rssi;
  }

  private scanTime?: number;

  public setScanTime(scanTime:number):void {
    this.scanTime = scanTime;
  }

  getScanTime(): number | undefined{
    return this.scanTime;
  }

  constructor(name?: string, mac?: string, rssi?: number, scanTime?: number) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
    this.scanTime = scanTime;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.name !==undefined){
      arr.push(this.name);
    }
    if(this.mac !==undefined){
      arr.push(this.mac);
    }
    if(this.rssi !==undefined){
      arr.push(this.rssi);
    }
    if(this.scanTime !==undefined){
      arr.push(this.scanTime);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTStandaloneDoorSensorScanModel {
    let pigeonResult: TTStandaloneDoorSensorScanModel = new TTStandaloneDoorSensorScanModel();
    let name: Object = arr[0];
    pigeonResult.setName(name as string);
    let mac: Object = arr[1];
    pigeonResult.setMac(mac as string);
    let rssi: Object = arr[2];
    pigeonResult.setRssi(rssi as number);
    let scanTime: Object = arr[3];
    pigeonResult.setScanTime(scanTime as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTStandaloneDoorSensorInfo {
  private doorSensorData?: string;

  public setDoorSensorData(doorSensorData:string):void {
    this.doorSensorData = doorSensorData;
  }

  getDoorSensorData(): string | undefined{
    return this.doorSensorData;
  }

  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private featureValue?: string;

  public setFeatureValue(featureValue:string):void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string | undefined{
    return this.featureValue;
  }

  private wifiMac?: string;

  public setWifiMac(wifiMac:string):void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string | undefined{
    return this.wifiMac;
  }

  private modelNum?: string;

  public setModelNum(modelNum:string):void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision:string):void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision:string):void {
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

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.doorSensorData !==undefined){
      arr.push(this.doorSensorData);
    }
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.featureValue !==undefined){
      arr.push(this.featureValue);
    }
    if(this.wifiMac !==undefined){
      arr.push(this.wifiMac);
    }
    if(this.modelNum !==undefined){
      arr.push(this.modelNum);
    }
    if(this.hardwareRevision !==undefined){
      arr.push(this.hardwareRevision);
    }
    if(this.firmwareRevision !==undefined){
      arr.push(this.firmwareRevision);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTStandaloneDoorSensorInfo {
    let pigeonResult: TTStandaloneDoorSensorInfo = new TTStandaloneDoorSensorInfo();
    let doorSensorData: Object = arr[0];
    pigeonResult.setDoorSensorData(doorSensorData as string);
    let electricQuantity: Object = arr[1];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let featureValue: Object = arr[2];
    pigeonResult.setFeatureValue(featureValue as string);
    let wifiMac: Object = arr[3];
    pigeonResult.setWifiMac(wifiMac as string);
    let modelNum: Object = arr[4];
    pigeonResult.setModelNum(modelNum as string);
    let hardwareRevision: Object = arr[5];
    pigeonResult.setHardwareRevision(hardwareRevision as string);
    let firmwareRevision: Object = arr[6];
    pigeonResult.setFirmwareRevision(firmwareRevision as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTMeterScanModel {
  private name?: string;

  public setName(name:string):void {
    this.name = name;
  }

  getName(): string | undefined{
    return this.name;
  }

  private mac?: string;

  public setMac(mac:string):void {
    this.mac = mac;
  }

  getMac(): string | undefined{
    return this.mac;
  }

  private rssi?: number;

  public setRssi(rssi:number):void {
    this.rssi = rssi;
  }

  getRssi(): number | undefined{
    return this.rssi;
  }

  constructor(name?: string, mac?: string, rssi?: number) {
    this.name = name;
    this.mac = mac;
    this.rssi = rssi;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.name !==undefined){
      arr.push(this.name);
    }
    if(this.mac !==undefined){
      arr.push(this.mac);
    }
    if(this.rssi !==undefined){
      arr.push(this.rssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTMeterScanModel {
    let pigeonResult: TTMeterScanModel = new TTMeterScanModel();
    let name: Object = arr[0];
    pigeonResult.setName(name as string);
    let mac: Object = arr[1];
    pigeonResult.setMac(mac as string);
    let rssi: Object = arr[2];
    pigeonResult.setRssi(rssi as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTWaterMeterInitResult {
  private waterMeterId?: string;

  public setWaterMeterId(waterMeterId:string):void {
    this.waterMeterId = waterMeterId;
  }

  getWaterMeterId(): string | undefined{
    return this.waterMeterId;
  }

  private featureValue?: string;

  public setFeatureValue(featureValue:string):void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string | undefined{
    return this.featureValue;
  }

  constructor(waterMeterId?: string, featureValue?: string) {
    this.waterMeterId = waterMeterId;
    this.featureValue = featureValue;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.waterMeterId !==undefined){
      arr.push(this.waterMeterId);
    }
    if(this.featureValue !==undefined){
      arr.push(this.featureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWaterMeterInitResult {
    let pigeonResult: TTWaterMeterInitResult = new TTWaterMeterInitResult();
    let waterMeterId: Object = arr[0];
    pigeonResult.setWaterMeterId(waterMeterId as string);
    let featureValue: Object = arr[1];
    pigeonResult.setFeatureValue(featureValue as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTElectricMeterInitResult {
  private electricMeterId?: string;

  public setElectricMeterId(electricMeterId:string):void {
    this.electricMeterId = electricMeterId;
  }

  getElectricMeterId(): string | undefined{
    return this.electricMeterId;
  }

  private featureValue?: string;

  public setFeatureValue(featureValue:string):void {
    this.featureValue = featureValue;
  }

  getFeatureValue(): string | undefined{
    return this.featureValue;
  }

  constructor(electricMeterId?: string, featureValue?: string) {
    this.electricMeterId = electricMeterId;
    this.featureValue = featureValue;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.electricMeterId !==undefined){
      arr.push(this.electricMeterId);
    }
    if(this.featureValue !==undefined){
      arr.push(this.featureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTElectricMeterInitResult {
    let pigeonResult: TTElectricMeterInitResult = new TTElectricMeterInitResult();
    let electricMeterId: Object = arr[0];
    pigeonResult.setElectricMeterId(electricMeterId as string);
    let featureValue: Object = arr[1];
    pigeonResult.setFeatureValue(featureValue as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class TTWifiScanEntry {
  private wifiMac?: string;

  public setWifiMac(wifiMac:string):void {
    this.wifiMac = wifiMac;
  }

  getWifiMac(): string | undefined{
    return this.wifiMac;
  }

  private wifiRssi?: number;

  public setWifiRssi(wifiRssi:number):void {
    this.wifiRssi = wifiRssi;
  }

  getWifiRssi(): number | undefined{
    return this.wifiRssi;
  }

  private bssid?: string;

  public setBssid(bssid:string):void {
    this.bssid = bssid;
  }

  getBssid(): string | undefined{
    return this.bssid;
  }

  private ssid?: string;

  public setSsid(ssid:string):void {
    this.ssid = ssid;
  }

  getSsid(): string | undefined{
    return this.ssid;
  }

  private wifiName?: string;

  public setWifiName(wifiName:string):void {
    this.wifiName = wifiName;
  }

  getWifiName(): string | undefined{
    return this.wifiName;
  }

  private name?: string;

  public setName(name:string):void {
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

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.wifiMac !==undefined){
      arr.push(this.wifiMac);
    }
    if(this.wifiRssi !==undefined){
      arr.push(this.wifiRssi);
    }
    if(this.bssid !==undefined){
      arr.push(this.bssid);
    }
    if(this.ssid !==undefined){
      arr.push(this.ssid);
    }
    if(this.wifiName !==undefined){
      arr.push(this.wifiName);
    }
    if(this.name !==undefined){
      arr.push(this.name);
    }
    return arr;
  }

  static fromList(arr: Object[]): TTWifiScanEntry {
    let pigeonResult: TTWifiScanEntry = new TTWifiScanEntry();
    let wifiMac: Object = arr[0];
    pigeonResult.setWifiMac(wifiMac as string);
    let wifiRssi: Object = arr[1];
    pigeonResult.setWifiRssi(wifiRssi as number);
    let bssid: Object = arr[2];
    pigeonResult.setBssid(bssid as string);
    let ssid: Object = arr[3];
    pigeonResult.setSsid(ssid as string);
    let wifiName: Object = arr[4];
    pigeonResult.setWifiName(wifiName as string);
    let name: Object = arr[5];
    pigeonResult.setName(name as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class RemoteKeypadInitResult {
  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private wirelessKeypadFeatureValue?: string;

  public setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue:string):void {
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  getWirelessKeypadFeatureValue(): string | undefined{
    return this.wirelessKeypadFeatureValue;
  }

  constructor(electricQuantity?: number, wirelessKeypadFeatureValue?: string) {
    this.electricQuantity = electricQuantity;
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.wirelessKeypadFeatureValue !==undefined){
      arr.push(this.wirelessKeypadFeatureValue);
    }
    return arr;
  }

  static fromList(arr: Object[]): RemoteKeypadInitResult {
    let pigeonResult: RemoteKeypadInitResult = new RemoteKeypadInitResult();
    let electricQuantity: Object = arr[0];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let wirelessKeypadFeatureValue: Object = arr[1];
    pigeonResult.setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class MultifunctionalKeypadInitResult {
  private electricQuantity?: number;

  public setElectricQuantity(electricQuantity:number):void {
    this.electricQuantity = electricQuantity;
  }

  getElectricQuantity(): number | undefined{
    return this.electricQuantity;
  }

  private wirelessKeypadFeatureValue?: string;

  public setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue:string):void {
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
  }

  getWirelessKeypadFeatureValue(): string | undefined{
    return this.wirelessKeypadFeatureValue;
  }

  private slotNumber?: number;

  public setSlotNumber(slotNumber:number):void {
    this.slotNumber = slotNumber;
  }

  getSlotNumber(): number | undefined{
    return this.slotNumber;
  }

  private slotLimit?: number;

  public setSlotLimit(slotLimit:number):void {
    this.slotLimit = slotLimit;
  }

  getSlotLimit(): number | undefined{
    return this.slotLimit;
  }

  private modelNum?: string;

  public setModelNum(modelNum:string):void {
    this.modelNum = modelNum;
  }

  getModelNum(): string | undefined{
    return this.modelNum;
  }

  private hardwareRevision?: string;

  public setHardwareRevision(hardwareRevision:string):void {
    this.hardwareRevision = hardwareRevision;
  }

  getHardwareRevision(): string | undefined{
    return this.hardwareRevision;
  }

  private firmwareRevision?: string;

  public setFirmwareRevision(firmwareRevision:string):void {
    this.firmwareRevision = firmwareRevision;
  }

  getFirmwareRevision(): string | undefined{
    return this.firmwareRevision;
  }

  constructor(electricQuantity?: number, wirelessKeypadFeatureValue?: string, slotNumber?: number, slotLimit?: number, modelNum?: string, hardwareRevision?: string, firmwareRevision?: string) {
    this.electricQuantity = electricQuantity;
    this.wirelessKeypadFeatureValue = wirelessKeypadFeatureValue;
    this.slotNumber = slotNumber;
    this.slotLimit = slotLimit;
    this.modelNum = modelNum;
    this.hardwareRevision = hardwareRevision;
    this.firmwareRevision = firmwareRevision;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.electricQuantity !==undefined){
      arr.push(this.electricQuantity);
    }
    if(this.wirelessKeypadFeatureValue !==undefined){
      arr.push(this.wirelessKeypadFeatureValue);
    }
    if(this.slotNumber !==undefined){
      arr.push(this.slotNumber);
    }
    if(this.slotLimit !==undefined){
      arr.push(this.slotLimit);
    }
    if(this.modelNum !==undefined){
      arr.push(this.modelNum);
    }
    if(this.hardwareRevision !==undefined){
      arr.push(this.hardwareRevision);
    }
    if(this.firmwareRevision !==undefined){
      arr.push(this.firmwareRevision);
    }
    return arr;
  }

  static fromList(arr: Object[]): MultifunctionalKeypadInitResult {
    let pigeonResult: MultifunctionalKeypadInitResult = new MultifunctionalKeypadInitResult();
    let electricQuantity: Object = arr[0];
    pigeonResult.setElectricQuantity(electricQuantity as number);
    let wirelessKeypadFeatureValue: Object = arr[1];
    pigeonResult.setWirelessKeypadFeatureValue(wirelessKeypadFeatureValue as string);
    let slotNumber: Object = arr[2];
    pigeonResult.setSlotNumber(slotNumber as number);
    let slotLimit: Object = arr[3];
    pigeonResult.setSlotLimit(slotLimit as number);
    let modelNum: Object = arr[4];
    pigeonResult.setModelNum(modelNum as string);
    let hardwareRevision: Object = arr[5];
    pigeonResult.setHardwareRevision(hardwareRevision as string);
    let firmwareRevision: Object = arr[6];
    pigeonResult.setFirmwareRevision(firmwareRevision as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class WaterMeterDeviceInfo {
  private catOneCardNumber?: string;

  public setCatOneCardNumber(catOneCardNumber:string):void {
    this.catOneCardNumber = catOneCardNumber;
  }

  getCatOneCardNumber(): string | undefined{
    return this.catOneCardNumber;
  }

  private catOneImsi?: string;

  public setCatOneImsi(catOneImsi:string):void {
    this.catOneImsi = catOneImsi;
  }

  getCatOneImsi(): string | undefined{
    return this.catOneImsi;
  }

  private catOneNodeId?: string;

  public setCatOneNodeId(catOneNodeId:string):void {
    this.catOneNodeId = catOneNodeId;
  }

  getCatOneNodeId(): string | undefined{
    return this.catOneNodeId;
  }

  private catOneOperator?: string;

  public setCatOneOperator(catOneOperator:string):void {
    this.catOneOperator = catOneOperator;
  }

  getCatOneOperator(): string | undefined{
    return this.catOneOperator;
  }

  private catOneRssi?: number;

  public setCatOneRssi(catOneRssi:number):void {
    this.catOneRssi = catOneRssi;
  }

  getCatOneRssi(): number | undefined{
    return this.catOneRssi;
  }

  constructor(catOneCardNumber?: string, catOneImsi?: string, catOneNodeId?: string, catOneOperator?: string, catOneRssi?: number) {
    this.catOneCardNumber = catOneCardNumber;
    this.catOneImsi = catOneImsi;
    this.catOneNodeId = catOneNodeId;
    this.catOneOperator = catOneOperator;
    this.catOneRssi = catOneRssi;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.catOneCardNumber !==undefined){
      arr.push(this.catOneCardNumber);
    }
    if(this.catOneImsi !==undefined){
      arr.push(this.catOneImsi);
    }
    if(this.catOneNodeId !==undefined){
      arr.push(this.catOneNodeId);
    }
    if(this.catOneOperator !==undefined){
      arr.push(this.catOneOperator);
    }
    if(this.catOneRssi !==undefined){
      arr.push(this.catOneRssi);
    }
    return arr;
  }

  static fromList(arr: Object[]): WaterMeterDeviceInfo {
    let pigeonResult: WaterMeterDeviceInfo = new WaterMeterDeviceInfo();
    let catOneCardNumber: Object = arr[0];
    pigeonResult.setCatOneCardNumber(catOneCardNumber as string);
    let catOneImsi: Object = arr[1];
    pigeonResult.setCatOneImsi(catOneImsi as string);
    let catOneNodeId: Object = arr[2];
    pigeonResult.setCatOneNodeId(catOneNodeId as string);
    let catOneOperator: Object = arr[3];
    pigeonResult.setCatOneOperator(catOneOperator as string);
    let catOneRssi: Object = arr[4];
    pigeonResult.setCatOneRssi(catOneRssi as number);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AddCardEvent {
  private isProgress?: boolean;

  public setIsProgress(isProgress:boolean):void {
    this.isProgress = isProgress;
  }

  getIsProgress(): boolean | undefined{
    return this.isProgress;
  }

  private cardNumber?: string;

  public setCardNumber(cardNumber:string):void {
    this.cardNumber = cardNumber;
  }

  getCardNumber(): string | undefined{
    return this.cardNumber;
  }

  constructor(isProgress?: boolean, cardNumber?: string) {
    this.isProgress = isProgress;
    this.cardNumber = cardNumber;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.isProgress !==undefined){
      arr.push(this.isProgress);
    }
    if(this.cardNumber !==undefined){
      arr.push(this.cardNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddCardEvent {
    let pigeonResult: AddCardEvent = new AddCardEvent();
    let isProgress: Object = arr[0];
    pigeonResult.setIsProgress(isProgress as boolean);
    let cardNumber: Object = arr[1];
    pigeonResult.setCardNumber(cardNumber as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AddFingerprintEvent {
  private isProgress?: boolean;

  public setIsProgress(isProgress:boolean):void {
    this.isProgress = isProgress;
  }

  getIsProgress(): boolean | undefined{
    return this.isProgress;
  }

  private currentCount?: number;

  public setCurrentCount(currentCount:number):void {
    this.currentCount = currentCount;
  }

  getCurrentCount(): number | undefined{
    return this.currentCount;
  }

  private totalCount?: number;

  public setTotalCount(totalCount:number):void {
    this.totalCount = totalCount;
  }

  getTotalCount(): number | undefined{
    return this.totalCount;
  }

  private fingerprintNumber?: string;

  public setFingerprintNumber(fingerprintNumber:string):void {
    this.fingerprintNumber = fingerprintNumber;
  }

  getFingerprintNumber(): string | undefined{
    return this.fingerprintNumber;
  }

  constructor(isProgress?: boolean, currentCount?: number, totalCount?: number, fingerprintNumber?: string) {
    this.isProgress = isProgress;
    this.currentCount = currentCount;
    this.totalCount = totalCount;
    this.fingerprintNumber = fingerprintNumber;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.isProgress !==undefined){
      arr.push(this.isProgress);
    }
    if(this.currentCount !==undefined){
      arr.push(this.currentCount);
    }
    if(this.totalCount !==undefined){
      arr.push(this.totalCount);
    }
    if(this.fingerprintNumber !==undefined){
      arr.push(this.fingerprintNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddFingerprintEvent {
    let pigeonResult: AddFingerprintEvent = new AddFingerprintEvent();
    let isProgress: Object = arr[0];
    pigeonResult.setIsProgress(isProgress as boolean);
    let currentCount: Object = arr[1];
    pigeonResult.setCurrentCount(currentCount as number);
    let totalCount: Object = arr[2];
    pigeonResult.setTotalCount(totalCount as number);
    let fingerprintNumber: Object = arr[3];
    pigeonResult.setFingerprintNumber(fingerprintNumber as string);
    return pigeonResult;
  }
}

/* Generated class from Pigeon that represents data sent in messages.*/
export class AddFaceEvent {
  private isProgress?: boolean;

  public setIsProgress(isProgress:boolean):void {
    this.isProgress = isProgress;
  }

  getIsProgress(): boolean | undefined{
    return this.isProgress;
  }

  private state?: TTFaceState;

  public setState(state:TTFaceState):void {
    this.state = state;
  }

  getState(): TTFaceState | undefined{
    return this.state;
  }

  private errorCode?: TTFaceErrorCode;

  public setErrorCode(errorCode:TTFaceErrorCode):void {
    this.errorCode = errorCode;
  }

  getErrorCode(): TTFaceErrorCode | undefined{
    return this.errorCode;
  }

  private faceNumber?: string;

  public setFaceNumber(faceNumber:string):void {
    this.faceNumber = faceNumber;
  }

  getFaceNumber(): string | undefined{
    return this.faceNumber;
  }

  constructor(isProgress?: boolean, state?: TTFaceState, errorCode?: TTFaceErrorCode, faceNumber?: string) {
    this.isProgress = isProgress;
    this.state = state;
    this.errorCode = errorCode;
    this.faceNumber = faceNumber;
  }

  toList(): Object[] {
    let arr: Object[] = new Array();
    if(this.isProgress !==undefined){
      arr.push(this.isProgress);
    }
    if(this.state !==undefined){
      const stateStr = TTFaceState[this.state as number];
      arr.push(new TTFaceStateEnum(stateStr));
    }
    if(this.errorCode !==undefined){
      const errorCodeStr = TTFaceErrorCode[this.errorCode as number];
      arr.push(new TTFaceErrorCodeEnum(errorCodeStr));
    }
    if(this.faceNumber !==undefined){
      arr.push(this.faceNumber);
    }
    return arr;
  }

  static fromList(arr: Object[]): AddFaceEvent {
    let pigeonResult: AddFaceEvent = new AddFaceEvent();
    let isProgress: Object = arr[0];
    pigeonResult.setIsProgress(isProgress as boolean);
    const stateStr: string = arr[1]! as string;
    pigeonResult.setState(TTFaceState[stateStr]);
    const errorCodeStr: string = arr[2]! as string;
    pigeonResult.setErrorCode(TTFaceErrorCode[errorCodeStr]);
    let faceNumber: Object = arr[3];
    pigeonResult.setFaceNumber(faceNumber as string);
    return pigeonResult;
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
        return value == null ? null : TTBluetoothState[value as number];
      }
      case this.getByte(130): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPasscodeType[value as number];
      }
      case this.getByte(131): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTOperateRecordType[value as number];
      }
      case this.getByte(132): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTControlAction[value as number];
      }
      case this.getByte(133): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockSwitchState[value as number];
      }
      case this.getByte(134): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPassageModeType[value as number];
      }
      case this.getByte(135): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockConfig[value as number];
      }
      case this.getByte(136): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockDirection[value as number];
      }
      case this.getByte(137): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTSoundVolumeType[value as number];
      }
      case this.getByte(138): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTSensitivityValue[value as number];
      }
      case this.getByte(139): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockError[value as number];
      }
      case this.getByte(140): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTErrorDevice[value as number];
      }
      case this.getByte(141): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLiftWorkActivateType[value as number];
      }
      case this.getByte(142): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTPowerSaverWorkType[value as number];
      }
      case this.getByte(143): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayType[value as number];
      }
      case this.getByte(144): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayConnectStatus[value as number];
      }
      case this.getByte(145): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTGatewayError[value as number];
      }
      case this.getByte(146): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTRemoteAccessoryError[value as number];
      }
      case this.getByte(147): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTMultifunctionalKeypadError[value as number];
      }
      case this.getByte(148): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTRemoteAccessory[value as number];
      }
      case this.getByte(149): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTIpSettingType[value as number];
      }
      case this.getByte(150): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTNbAwakeMode[value as number];
      }
      case this.getByte(151): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTNbAwakeTimeType[value as number];
      }
      case this.getByte(152): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTLockFunction[value as number];
      }
      case this.getByte(153): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTFaceState[value as number];
      }
      case this.getByte(154): {
        let value: Object= super.readValue(buffer);
        return value == null ? null : TTFaceErrorCode[value as number];
      }
      case this.getByte(155):
        return TTLockVersion.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(156):
        return TTLockInitParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(157):
        return TTGatewayInitParams.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(158):
        return TTIpSetting.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(159):
        return TTCycleModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(160):
        return ControlLockResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(161):
        return AutoLockingTime.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(162):
        return TTWifiInfoModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(163):
        return CameraLockWifiResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(164):
        return TTLockSystemModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(165):
        return AccessoryElectricQuantityResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(166):
        return TTLockScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(167):
        return TTGatewayScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(168):
        return GatewayDeviceInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(169):
        return TTRemoteAccessoryScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(170):
        return TTStandaloneDoorSensorScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(171):
        return TTStandaloneDoorSensorInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(172):
        return TTMeterScanModel.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(173):
        return TTWaterMeterInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(174):
        return TTElectricMeterInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(175):
        return TTWifiScanEntry.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(176):
        return RemoteKeypadInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(177):
        return MultifunctionalKeypadInitResult.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(178):
        return WaterMeterDeviceInfo.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(179):
        return AddCardEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(180):
        return AddFingerprintEvent.fromList(super.readValue(buffer) as Object[]);
      case this.getByte(181):
        return AddFaceEvent.fromList(super.readValue(buffer) as Object[]);
      default:
        return super.readValueOfType(type, buffer);
    }
  }

  writeValue(stream: ByteBuffer , value: ESObject): ESObject{
    if (value instanceof TTBluetoothStateEnum) {
      stream.writeUint8(this.getByte(129));
      this.writeValue(stream, value == null ? null : TTBluetoothState[value.index as string]);
    } else if (value instanceof TTPasscodeTypeEnum) {
      stream.writeUint8(this.getByte(130));
      this.writeValue(stream, value == null ? null : TTPasscodeType[value.index as string]);
    } else if (value instanceof TTOperateRecordTypeEnum) {
      stream.writeUint8(this.getByte(131));
      this.writeValue(stream, value == null ? null : TTOperateRecordType[value.index as string]);
    } else if (value instanceof TTControlActionEnum) {
      stream.writeUint8(this.getByte(132));
      this.writeValue(stream, value == null ? null : TTControlAction[value.index as string]);
    } else if (value instanceof TTLockSwitchStateEnum) {
      stream.writeUint8(this.getByte(133));
      this.writeValue(stream, value == null ? null : TTLockSwitchState[value.index as string]);
    } else if (value instanceof TTPassageModeTypeEnum) {
      stream.writeUint8(this.getByte(134));
      this.writeValue(stream, value == null ? null : TTPassageModeType[value.index as string]);
    } else if (value instanceof TTLockConfigEnum) {
      stream.writeUint8(this.getByte(135));
      this.writeValue(stream, value == null ? null : TTLockConfig[value.index as string]);
    } else if (value instanceof TTLockDirectionEnum) {
      stream.writeUint8(this.getByte(136));
      this.writeValue(stream, value == null ? null : TTLockDirection[value.index as string]);
    } else if (value instanceof TTSoundVolumeTypeEnum) {
      stream.writeUint8(this.getByte(137));
      this.writeValue(stream, value == null ? null : TTSoundVolumeType[value.index as string]);
    } else if (value instanceof TTSensitivityValueEnum) {
      stream.writeUint8(this.getByte(138));
      this.writeValue(stream, value == null ? null : TTSensitivityValue[value.index as string]);
    } else if (value instanceof TTLockErrorEnum) {
      stream.writeUint8(this.getByte(139));
      this.writeValue(stream, value == null ? null : TTLockError[value.index as string]);
    } else if (value instanceof TTErrorDeviceEnum) {
      stream.writeUint8(this.getByte(140));
      this.writeValue(stream, value == null ? null : TTErrorDevice[value.index as string]);
    } else if (value instanceof TTLiftWorkActivateTypeEnum) {
      stream.writeUint8(this.getByte(141));
      this.writeValue(stream, value == null ? null : TTLiftWorkActivateType[value.index as string]);
    } else if (value instanceof TTPowerSaverWorkTypeEnum) {
      stream.writeUint8(this.getByte(142));
      this.writeValue(stream, value == null ? null : TTPowerSaverWorkType[value.index as string]);
    } else if (value instanceof TTGatewayTypeEnum) {
      stream.writeUint8(this.getByte(143));
      this.writeValue(stream, value == null ? null : TTGatewayType[value.index as string]);
    } else if (value instanceof TTGatewayConnectStatusEnum) {
      stream.writeUint8(this.getByte(144));
      this.writeValue(stream, value == null ? null : TTGatewayConnectStatus[value.index as string]);
    } else if (value instanceof TTGatewayErrorEnum) {
      stream.writeUint8(this.getByte(145));
      this.writeValue(stream, value == null ? null : TTGatewayError[value.index as string]);
    } else if (value instanceof TTRemoteAccessoryErrorEnum) {
      stream.writeUint8(this.getByte(146));
      this.writeValue(stream, value == null ? null : TTRemoteAccessoryError[value.index as string]);
    } else if (value instanceof TTMultifunctionalKeypadErrorEnum) {
      stream.writeUint8(this.getByte(147));
      this.writeValue(stream, value == null ? null : TTMultifunctionalKeypadError[value.index as string]);
    } else if (value instanceof TTRemoteAccessoryEnum) {
      stream.writeUint8(this.getByte(148));
      this.writeValue(stream, value == null ? null : TTRemoteAccessory[value.index as string]);
    } else if (value instanceof TTIpSettingTypeEnum) {
      stream.writeUint8(this.getByte(149));
      this.writeValue(stream, value == null ? null : TTIpSettingType[value.index as string]);
    } else if (value instanceof TTNbAwakeModeEnum) {
      stream.writeUint8(this.getByte(150));
      this.writeValue(stream, value == null ? null : TTNbAwakeMode[value.index as string]);
    } else if (value instanceof TTNbAwakeTimeTypeEnum) {
      stream.writeUint8(this.getByte(151));
      this.writeValue(stream, value == null ? null : TTNbAwakeTimeType[value.index as string]);
    } else if (value instanceof TTLockFunctionEnum) {
      stream.writeUint8(this.getByte(152));
      this.writeValue(stream, value == null ? null : TTLockFunction[value.index as string]);
    } else if (value instanceof TTFaceStateEnum) {
      stream.writeUint8(this.getByte(153));
      this.writeValue(stream, value == null ? null : TTFaceState[value.index as string]);
    } else if (value instanceof TTFaceErrorCodeEnum) {
      stream.writeUint8(this.getByte(154));
      this.writeValue(stream, value == null ? null : TTFaceErrorCode[value.index as string]);
    } else if (value instanceof TTLockVersion) {
      stream.writeUint8(this.getByte(155));
      this.writeValue(stream, (value as TTLockVersion).toList());
    } else if (value instanceof TTLockInitParams) {
      stream.writeUint8(this.getByte(156));
      this.writeValue(stream, (value as TTLockInitParams).toList());
    } else if (value instanceof TTGatewayInitParams) {
      stream.writeUint8(this.getByte(157));
      this.writeValue(stream, (value as TTGatewayInitParams).toList());
    } else if (value instanceof TTIpSetting) {
      stream.writeUint8(this.getByte(158));
      this.writeValue(stream, (value as TTIpSetting).toList());
    } else if (value instanceof TTCycleModel) {
      stream.writeUint8(this.getByte(159));
      this.writeValue(stream, (value as TTCycleModel).toList());
    } else if (value instanceof ControlLockResult) {
      stream.writeUint8(this.getByte(160));
      this.writeValue(stream, (value as ControlLockResult).toList());
    } else if (value instanceof AutoLockingTime) {
      stream.writeUint8(this.getByte(161));
      this.writeValue(stream, (value as AutoLockingTime).toList());
    } else if (value instanceof TTWifiInfoModel) {
      stream.writeUint8(this.getByte(162));
      this.writeValue(stream, (value as TTWifiInfoModel).toList());
    } else if (value instanceof CameraLockWifiResult) {
      stream.writeUint8(this.getByte(163));
      this.writeValue(stream, (value as CameraLockWifiResult).toList());
    } else if (value instanceof TTLockSystemModel) {
      stream.writeUint8(this.getByte(164));
      this.writeValue(stream, (value as TTLockSystemModel).toList());
    } else if (value instanceof AccessoryElectricQuantityResult) {
      stream.writeUint8(this.getByte(165));
      this.writeValue(stream, (value as AccessoryElectricQuantityResult).toList());
    } else if (value instanceof TTLockScanModel) {
      stream.writeUint8(this.getByte(166));
      this.writeValue(stream, (value as TTLockScanModel).toList());
    } else if (value instanceof TTGatewayScanModel) {
      stream.writeUint8(this.getByte(167));
      this.writeValue(stream, (value as TTGatewayScanModel).toList());
    } else if (value instanceof GatewayDeviceInfo) {
      stream.writeUint8(this.getByte(168));
      this.writeValue(stream, (value as GatewayDeviceInfo).toList());
    } else if (value instanceof TTRemoteAccessoryScanModel) {
      stream.writeUint8(this.getByte(169));
      this.writeValue(stream, (value as TTRemoteAccessoryScanModel).toList());
    } else if (value instanceof TTStandaloneDoorSensorScanModel) {
      stream.writeUint8(this.getByte(170));
      this.writeValue(stream, (value as TTStandaloneDoorSensorScanModel).toList());
    } else if (value instanceof TTStandaloneDoorSensorInfo) {
      stream.writeUint8(this.getByte(171));
      this.writeValue(stream, (value as TTStandaloneDoorSensorInfo).toList());
    } else if (value instanceof TTMeterScanModel) {
      stream.writeUint8(this.getByte(172));
      this.writeValue(stream, (value as TTMeterScanModel).toList());
    } else if (value instanceof TTWaterMeterInitResult) {
      stream.writeUint8(this.getByte(173));
      this.writeValue(stream, (value as TTWaterMeterInitResult).toList());
    } else if (value instanceof TTElectricMeterInitResult) {
      stream.writeUint8(this.getByte(174));
      this.writeValue(stream, (value as TTElectricMeterInitResult).toList());
    } else if (value instanceof TTWifiScanEntry) {
      stream.writeUint8(this.getByte(175));
      this.writeValue(stream, (value as TTWifiScanEntry).toList());
    } else if (value instanceof RemoteKeypadInitResult) {
      stream.writeUint8(this.getByte(176));
      this.writeValue(stream, (value as RemoteKeypadInitResult).toList());
    } else if (value instanceof MultifunctionalKeypadInitResult) {
      stream.writeUint8(this.getByte(177));
      this.writeValue(stream, (value as MultifunctionalKeypadInitResult).toList());
    } else if (value instanceof WaterMeterDeviceInfo) {
      stream.writeUint8(this.getByte(178));
      this.writeValue(stream, (value as WaterMeterDeviceInfo).toList());
    } else if (value instanceof AddCardEvent) {
      stream.writeUint8(this.getByte(179));
      this.writeValue(stream, (value as AddCardEvent).toList());
    } else if (value instanceof AddFingerprintEvent) {
      stream.writeUint8(this.getByte(180));
      this.writeValue(stream, (value as AddFingerprintEvent).toList());
    } else if (value instanceof AddFaceEvent) {
      stream.writeUint8(this.getByte(181));
      this.writeValue(stream, (value as AddFaceEvent).toList());
    } else {
      super.writeValue(stream, value);
    }
  }
}


export interface Result<T> {
  success( result: T ): void;

  error( error: Error): void;
}
/* Generated abstract class from Pigeon that represents a handler of messages from Flutter.*/
export abstract class TTLockHostApi {
  /* 在订阅锁相关 EventChannel（如 lockScanWifi、lockAddCard）前设置 lockData，比依赖其它接口副作用更可靠。*/
  abstract setEventLockData(lockData: string ): void;

  abstract getBluetoothState(): TTBluetoothState;

  abstract initLock(params: TTLockInitParams , result: Result<string>): void;

  abstract resetLock(lockData: string , result: Result<void>): void;

  abstract resetEkey(lockData: string , result: Result<string>): void;

  abstract resetLockByCode(lockMac: string , resetCode: string , result: Result<void>): void;

  abstract verifyLock(lockMac: string , result: Result<void>): void;

  abstract controlLock(lockData: string , action: TTControlAction , result: Result<ControlLockResult>): void;

  abstract getLockSwitchState(lockData: string , result: Result<TTLockSwitchState>): void;

  abstract supportFunction(function: TTLockFunction , lockData: string ): boolean;

  abstract createCustomPasscode(passcode: string , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract modifyPasscode(passcodeOrigin: string , passcodeNew: string , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract deletePasscode(passcode: string , lockData: string , result: Result<void>): void;

  abstract resetPasscode(lockData: string , result: Result<string>): void;

  abstract getAdminPasscode(lockData: string , result: Result<string>): void;

  abstract setErasePasscode(erasePasscode: string , lockData: string ): void;

  abstract getAllValidPasscodes(lockData: string , result: Result<Array<Map<string, Object>>>): void;

  abstract recoverPasscode(passcode: string , passcodeNew: string , type: TTPasscodeType , startDate: number , endDate: number , cycleType: number , lockData: string , result: Result<void>): void;

  abstract modifyAdminPasscode(adminPasscode: string , lockData: string , result: Result<string>): void;

  abstract getPasscodeVerificationParams(lockData: string , result: Result<string>): void;

  abstract modifyCardValidityPeriod(cardNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract deleteCard(cardNumber: string , lockData: string , result: Result<void>): void;

  abstract getAllValidCards(lockData: string , result: Result<Array<Map<string, Object>>>): void;

  abstract clearAllCards(lockData: string , result: Result<void>): void;

  abstract recoverCard(cardNumber: string , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract reportLossCard(cardNumber: string , lockData: string , result: Result<void>): void;

  abstract modifyFingerprintValidityPeriod(fingerprintNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract deleteFingerprint(fingerprintNumber: string , lockData: string , result: Result<void>): void;

  abstract getAllValidFingerprints(lockData: string , result: Result<Array<Map<string, Object>>>): void;

  abstract clearAllFingerprints(lockData: string , result: Result<void>): void;

  abstract modifyFace(faceNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract addFaceData(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , faceFeatureData: string , lockData: string , result: Result<string>): void;

  abstract deleteFace(faceNumber: string , lockData: string , result: Result<void>): void;

  abstract clearFace(lockData: string , result: Result<void>): void;

  abstract setLockTime(timestamp: number , lockData: string , result: Result<void>): void;

  abstract getLockTime(lockData: string , result: Result<number>): void;

  abstract setLockWorkingTime(startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract getLockOperateRecord(type: TTOperateRecordType , lockData: string , result: Result<string>): void;

  abstract getLockPower(lockData: string , result: Result<number>): void;

  abstract getLockSystemInfo(lockData: string , result: Result<TTLockSystemModel>): void;

  abstract getLockFeatureValue(lockData: string , result: Result<string>): void;

  abstract getAutoLockingPeriodicTime(lockData: string , result: Result<AutoLockingTime>): void;

  abstract setAutoLockingPeriodicTime(seconds: number , lockData: string , result: Result<void>): void;

  abstract getRemoteUnlockSwitchState(lockData: string , result: Result<boolean>): void;

  abstract setRemoteUnlockSwitchState(isOn: boolean , lockData: string , result: Result<string>): void;

  abstract getLockConfig(config: TTLockConfig , lockData: string , result: Result<boolean>): void;

  abstract setLockConfig(config: TTLockConfig , isOn: boolean , lockData: string , result: Result<void>): void;

  abstract getLockDirection(lockData: string , result: Result<TTLockDirection>): void;

  abstract setLockDirection(direction: TTLockDirection , lockData: string , result: Result<void>): void;

  abstract addPassageMode(type: TTPassageModeType , weekly: Array<number> , monthly: Array<number> , startTime: number , endTime: number , lockData: string , result: Result<void>): void;

  abstract clearAllPassageModes(lockData: string , result: Result<void>): void;

  abstract activateLift(floors: string , lockData: string , result: Result<ControlLockResult>): void;

  abstract setLiftControlable(floors: string , lockData: string , result: Result<void>): void;

  abstract setLiftWorkMode(type: TTLiftWorkActivateType , lockData: string , result: Result<void>): void;

  abstract setPowerSaverWorkMode(type: TTPowerSaverWorkType , lockData: string , result: Result<void>): void;

  abstract setPowerSaverControlableLock(lockMac: string , lockData: string , result: Result<void>): void;

  abstract setHotel(hotelInfo: string , buildingNumber: number , floorNumber: number , lockData: string , result: Result<void>): void;

  abstract setHotelCardSector(sector: string , lockData: string , result: Result<void>): void;

  abstract getLockVersion(lockMac: string , result: Result<TTLockVersion>): void;

  abstract setNBServerAddress(ip: string , port: string , lockData: string , result: Result<number>): void;

  abstract configWifi(wifiName: string , wifiPassword: string , lockData: string , result: Result<void>): void;

  abstract configServer(ip: string , port: string , lockData: string , result: Result<void>): void;

  abstract getWifiInfo(lockData: string , result: Result<TTWifiInfoModel>): void;

  abstract configIp(ipSetting: TTIpSetting , lockData: string , result: Result<void>): void;

  abstract configCameraLockWifi(wifiName: string , wifiPassword: string , lockData: string , result: Result<CameraLockWifiResult>): void;

  abstract setSoundVolume(type: TTSoundVolumeType , lockData: string , result: Result<void>): void;

  abstract getSoundVolume(lockData: string , result: Result<TTSoundVolumeType>): void;

  abstract setSensitivity(value: TTSensitivityValue , lockData: string , result: Result<void>): void;

  abstract setRemoteKeyValidDate(remoteKeyMac: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract addRemoteKey(remoteKeyMac: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string , result: Result<void>): void;

  abstract deleteRemoteKey(remoteKeyMac: string , lockData: string , result: Result<void>): void;

  abstract clearRemoteKey(lockData: string , result: Result<void>): void;

  abstract getRemoteAccessoryElectricQuantity(accessory: TTRemoteAccessory , mac: string , lockData: string , result: Result<AccessoryElectricQuantityResult>): void;

  abstract addDoorSensor(doorSensorMac: string , lockData: string , result: Result<void>): void;

  abstract deleteDoorSensor(lockData: string , result: Result<void>): void;

  abstract setDoorSensorAlertTime(alertTime: number , lockData: string , result: Result<void>): void;
  /** The codec used by TTLockHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTLockHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTLockHostApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setEventLockData", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.setEventLockData(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getBluetoothState", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let res: Array<Object> = [];
              try {
                let output: TTBluetoothStateEnum = new TTBluetoothStateEnum(api!.getBluetoothState(args[0] as TTBluetoothState).toString());
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.initLock", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetLock", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetEkey", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetLockByCode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.verifyLock", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.controlLock", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<ControlLockResult>{
                    success(result: ControlLockResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<ControlLockResult> = new ResultImp();

              api!.controlLock(args[0] as string, args[1] as TTControlAction, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockSwitchState", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockSwitchState>{
                    success(result: TTLockSwitchState): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockSwitchState> = new ResultImp();

              api!.getLockSwitchState(new stringEnum(args[0] as string), resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.supportFunction", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.supportFunction(args[0] as TTLockFunction, args[1] as string);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.createCustomPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyPasscode(args[0] as string, args[1] as string, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deletePasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.resetPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAdminPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setErasePasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.setErasePasscode(args[0] as string, args[1] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidPasscodes", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Array<Map<string, Object>>>{
                    success(result: Array<Map<string, Object>>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<Map<string, Object>>> = new ResultImp();

              api!.getAllValidPasscodes(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.recoverPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.recoverPasscode(args[0] as string, args[1] as string, args[2] as TTPasscodeType, args[3] as number, args[4] as number, args[5] as number, args[6] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyAdminPasscode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.modifyAdminPasscode(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getPasscodeVerificationParams", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyCardValidityPeriod", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyCardValidityPeriod(args[0] as string, args[1] as Array<TTCycleModel>, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteCard", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidCards", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Array<Map<string, Object>>>{
                    success(result: Array<Map<string, Object>>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<Map<string, Object>>> = new ResultImp();

              api!.getAllValidCards(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllCards", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.recoverCard", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.reportLossCard", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyFingerprintValidityPeriod", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyFingerprintValidityPeriod(args[0] as string, args[1] as Array<TTCycleModel>, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteFingerprint", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAllValidFingerprints", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Array<Map<string, Object>>>{
                    success(result: Array<Map<string, Object>>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Array<Map<string, Object>>> = new ResultImp();

              api!.getAllValidFingerprints(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllFingerprints", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.modifyFace", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.modifyFace(args[0] as string, args[1] as Array<TTCycleModel>, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addFaceData", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.addFaceData(args[0] as Array<TTCycleModel>, args[1] as number, args[2] as number, args[3] as string, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteFace", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearFace", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockWorkingTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockOperateRecord", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getLockOperateRecord(args[0] as TTOperateRecordType, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockPower", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockSystemInfo", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockFeatureValue", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getAutoLockingPeriodicTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<AutoLockingTime>{
                    success(result: AutoLockingTime): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setAutoLockingPeriodicTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getRemoteUnlockSwitchState", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<boolean>{
                    success(result: boolean): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setRemoteUnlockSwitchState", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockConfig", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<boolean>{
                    success(result: boolean): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<boolean> = new ResultImp();

              api!.getLockConfig(args[0] as TTLockConfig, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockConfig", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockConfig(args[0] as TTLockConfig, args[1] as boolean, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockDirection", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockDirection>{
                    success(result: TTLockDirection): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTLockDirection> = new ResultImp();

              api!.getLockDirection(new stringEnum(args[0] as string), resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLockDirection", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLockDirection(args[0] as TTLockDirection, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addPassageMode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.addPassageMode(args[0] as TTPassageModeType, args[1] as Array<number>, args[2] as Array<number>, args[3] as number, args[4] as number, args[5] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearAllPassageModes", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.activateLift", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<ControlLockResult>{
                    success(result: ControlLockResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLiftControlable", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setLiftWorkMode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setLiftWorkMode(args[0] as TTLiftWorkActivateType, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setPowerSaverWorkMode", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setPowerSaverWorkMode(args[0] as TTPowerSaverWorkType, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setPowerSaverControlableLock", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setHotel", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setHotelCardSector", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getLockVersion", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockVersion>{
                    success(result: TTLockVersion): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setNBServerAddress", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<number>{
                    success(result: number): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configWifi", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configServer", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getWifiInfo", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTWifiInfoModel>{
                    success(result: TTWifiInfoModel): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configIp", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.configCameraLockWifi", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<CameraLockWifiResult>{
                    success(result: CameraLockWifiResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setSoundVolume", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setSoundVolume(args[0] as TTSoundVolumeType, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getSoundVolume", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTSoundVolumeType>{
                    success(result: TTSoundVolumeType): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTSoundVolumeType> = new ResultImp();

              api!.getSoundVolume(new stringEnum(args[0] as string), resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setSensitivity", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setSensitivity(args[0] as TTSensitivityValue, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setRemoteKeyValidDate", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.setRemoteKeyValidDate(args[0] as string, args[1] as Array<TTCycleModel>, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addRemoteKey", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.addRemoteKey(args[0] as string, args[1] as Array<TTCycleModel>, args[2] as number, args[3] as number, args[4] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteRemoteKey", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.clearRemoteKey", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.getRemoteAccessoryElectricQuantity", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<AccessoryElectricQuantityResult>{
                    success(result: AccessoryElectricQuantityResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<AccessoryElectricQuantityResult> = new ResultImp();

              api!.getRemoteAccessoryElectricQuantity(args[0] as TTRemoteAccessory, args[1] as string, args[2] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.addDoorSensor", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.deleteDoorSensor", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTLockHostApi.setDoorSensorAlertTime", TTLockHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
  /* 在订阅 gatewayGetNearbyWifi 等流前设置网关 MAC。*/
  abstract setEventGatewayMac(mac: string ): void;

  abstract connect(mac: string , result: Result<TTGatewayConnectStatus>): void;

  abstract disconnect(mac: string ): void;

  abstract init(params: TTGatewayInitParams , result: Result<GatewayDeviceInfo>): void;

  abstract configIp(mac: string , ipSetting: TTIpSetting , result: Result<void>): void;

  abstract configApn(mac: string , apn: string , result: Result<void>): void;

  abstract getNetworkMac(result: Result<string>): void;

  abstract enterUpgradeMode(mac: string ): void;
  /** The codec used by TTGatewayHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTGatewayHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTGatewayHostApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.setEventGatewayMac", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.setEventGatewayMac(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.connect", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTGatewayConnectStatus>{
                    success(result: TTGatewayConnectStatus): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTGatewayConnectStatus> = new ResultImp();

              api!.connect(new stringEnum(args[0] as string), resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.disconnect", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.disconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.init", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<GatewayDeviceInfo>{
                    success(result: GatewayDeviceInfo): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<GatewayDeviceInfo> = new ResultImp();

              api!.init(args[0] as TTGatewayInitParams, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.configIp", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.configApn", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.getNetworkMac", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<string> = new ResultImp();

              api!.getNetworkMac(resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTGatewayHostApi.enterUpgradeMode", TTGatewayHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.enterUpgradeMode(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
  /* 在订阅键盘相关 EventChannel（accessoryAddKeypadFingerprint / accessoryAddKeypadCard）前设置键盘 MAC 及是否为多功能键盘。*/
  abstract setEventKeypadMac(mac: string , isMultifunctional: boolean ): void;

  abstract initRemoteKey(mac: string , lockData: string , result: Result<TTLockSystemModel>): void;

  abstract initRemoteKeypad(mac: string , lockMac: string , result: Result<RemoteKeypadInitResult>): void;

  abstract initMultifunctionalKeypad(mac: string , lockData: string , result: Result<MultifunctionalKeypadInitResult>): void;

  abstract getStoredLocks(mac: string , result: Result<Array<string>>): void;

  abstract deleteStoredLock(mac: string , slotNumber: number , result: Result<void>): void;

  abstract initDoorSensor(mac: string , lockData: string , result: Result<TTLockSystemModel>): void;

  abstract standaloneDoorSensorInit(mac: string , info: Map<string, Object> , result: Result<TTStandaloneDoorSensorInfo>): void;

  abstract standaloneDoorSensorReadFeatureValue(mac: string , result: Result<string>): void;

  abstract standaloneDoorSensorIsSupportFunction(featureValue: string , function: number ): boolean;

  abstract waterMeterConfigServer(url: string , clientId: string , accessToken: string ): void;

  abstract waterMeterConnect(mac: string , result: Result<void>): void;

  abstract waterMeterDisconnect(mac: string ): void;

  abstract waterMeterInit(params: Map<string, Object> , result: Result<TTWaterMeterInitResult>): void;

  abstract waterMeterDelete(waterMeterId: string , result: Result<void>): void;

  abstract waterMeterSetPowerOnOff(waterMeterId: string , isOn: boolean , result: Result<void>): void;

  abstract waterMeterSetRemainderM3(waterMeterId: string , remainderM3: number , result: Result<void>): void;

  abstract waterMeterClearRemainderM3(waterMeterId: string , result: Result<void>): void;

  abstract waterMeterReadData(waterMeterId: string , result: Result<Map<string, Object>>): void;

  abstract waterMeterSetPayMode(waterMeterId: string , payMode: number , result: Result<void>): void;

  abstract waterMeterCharge(waterMeterId: string , amount: number , result: Result<void>): void;

  abstract waterMeterSetTotalUsage(waterMeterId: string , totalM3: number , result: Result<void>): void;

  abstract waterMeterGetFeatureValue(waterMeterId: string , result: Result<string>): void;

  abstract waterMeterGetDeviceInfo(waterMeterId: string , result: Result<WaterMeterDeviceInfo>): void;

  abstract waterMeterIsSupportFunction(featureValue: string , function: number ): boolean;

  abstract waterMeterConfigApn(apn: string , result: Result<void>): void;

  abstract waterMeterConfigMeterServer(ip: string , port: string , result: Result<void>): void;

  abstract waterMeterReset(waterMeterId: string , result: Result<void>): void;

  abstract electricMeterConfigServer(url: string , clientId: string , accessToken: string ): void;

  abstract electricMeterConnect(mac: string , result: Result<void>): void;

  abstract electricMeterDisconnect(mac: string ): void;

  abstract electricMeterInit(params: Map<string, Object> , result: Result<TTElectricMeterInitResult>): void;

  abstract electricMeterDelete(electricMeterId: string , result: Result<void>): void;

  abstract electricMeterSetPowerOnOff(electricMeterId: string , isOn: boolean , result: Result<void>): void;

  abstract electricMeterSetRemainderKwh(electricMeterId: string , remainderKwh: number , result: Result<void>): void;

  abstract electricMeterClearRemainderKwh(electricMeterId: string , result: Result<void>): void;

  abstract electricMeterReadData(electricMeterId: string , result: Result<Map<string, Object>>): void;

  abstract electricMeterSetPayMode(electricMeterId: string , payMode: number , result: Result<void>): void;

  abstract electricMeterCharge(electricMeterId: string , amount: number , result: Result<void>): void;

  abstract electricMeterSetMaxPower(electricMeterId: string , maxPower: number , result: Result<void>): void;

  abstract electricMeterGetFeatureValue(electricMeterId: string , result: Result<string>): void;

  abstract electricMeterIsSupportFunction(featureValue: string , function: number ): boolean;
  /** The codec used by TTAccessoryHostApi. */
  static getCodec(): MessageCodec<Object>{
    return PigeonCodec.INSTANCE;
  }
  /*Sets up an instance of `TTAccessoryHostApi` to handle messages through the `binaryMessenger`.*/
  static setup(binaryMessenger: BinaryMessenger, api: TTAccessoryHostApi | null): void {
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.setEventKeypadMac", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.setEventKeypadMac(args[0] as string, args[1] as boolean);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initRemoteKey", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initRemoteKeypad", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<RemoteKeypadInitResult>{
                    success(result: RemoteKeypadInitResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initMultifunctionalKeypad", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<MultifunctionalKeypadInitResult>{
                    success(result: MultifunctionalKeypadInitResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.getStoredLocks", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Array<string>>{
                    success(result: Array<string>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.deleteStoredLock", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.initDoorSensor", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTLockSystemModel>{
                    success(result: TTLockSystemModel): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorInit", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTStandaloneDoorSensorInfo>{
                    success(result: TTStandaloneDoorSensorInfo): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTStandaloneDoorSensorInfo> = new ResultImp();

              api!.standaloneDoorSensorInit(args[0] as string, args[1] as Map<string, Object>, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorReadFeatureValue", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.standaloneDoorSensorIsSupportFunction", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.standaloneDoorSensorIsSupportFunction(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigServer", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.waterMeterConfigServer(args[0] as string, args[1] as string, args[2] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConnect", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterDisconnect", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.waterMeterDisconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterInit", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTWaterMeterInitResult>{
                    success(result: TTWaterMeterInitResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTWaterMeterInitResult> = new ResultImp();

              api!.waterMeterInit(args[0] as Map<string, Object>, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterDelete", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetPowerOnOff", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetRemainderM3", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterClearRemainderM3", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterReadData", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Map<string, Object>>{
                    success(result: Map<string, Object>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Map<string, Object>> = new ResultImp();

              api!.waterMeterReadData(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetPayMode", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterSetPayMode(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterCharge", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterCharge(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterSetTotalUsage", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterGetFeatureValue", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterGetDeviceInfo", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<WaterMeterDeviceInfo>{
                    success(result: WaterMeterDeviceInfo): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterIsSupportFunction", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.waterMeterIsSupportFunction(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigApn", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterConfigApn(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterConfigMeterServer", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.waterMeterConfigMeterServer(args[0] as string, args[1] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.waterMeterReset", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConfigServer", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.electricMeterConfigServer(args[0] as string, args[1] as string, args[2] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterConnect", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterDisconnect", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                api!.electricMeterDisconnect(args[0] as string);
                res.push(null);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterInit", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<TTElectricMeterInitResult>{
                    success(result: TTElectricMeterInitResult): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<TTElectricMeterInitResult> = new ResultImp();

              api!.electricMeterInit(args[0] as Map<string, Object>, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterDelete", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetPowerOnOff", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetRemainderKwh", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterClearRemainderKwh", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterReadData", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<Map<string, Object>>{
                    success(result: Map<string, Object>): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<Map<string, Object>> = new ResultImp();

              api!.electricMeterReadData(args[0] as string, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetPayMode", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterSetPayMode(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterCharge", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
                      reply.reply(wrappedError);
                    }
              }
              let resultCallback: Result<void> = new ResultImp();

              api!.electricMeterCharge(args[0] as string, args[1] as number, resultCallback);
            } });
      } else {
        channel.setMessageHandler(null);
      }
    }
    {
      let channel: BasicMessageChannel<Object> =
          new BasicMessageChannel(
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterSetMaxPower", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<void>{
                    success(result: void): void {
                      let res: Array<Object> = [];
                      res.push(null);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterGetFeatureValue", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              class ResultImp implements Result<string>{
                    success(result: string): void {
                      let res: Array<Object> = [];
                      res.push(result);
                      reply.reply(res);
                    }

                    error(error: Error): void {
                      let wrappedError: Array<Object> = wrapError(error);
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
              binaryMessenger, "dev.flutter.pigeon.ttlock_flutter.TTAccessoryHostApi.electricMeterIsSupportFunction", TTAccessoryHostApi.getCodec());
      if (api != null) {
        channel.setMessageHandler({
            onMessage(message: Object ,reply: Reply<Object> ) {
              let args: Array<Object> = message as Array<Object>;
              let res: Array<Object> = [];
              try {
                let output: boolean = api!.electricMeterIsSupportFunction(args[0] as string, args[1] as number);
                res.push(output);
              }
 catch (error) {
                let wrappedError: Array<Object> = wrapError(error);
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
