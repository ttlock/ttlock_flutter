//
//  TtlockPluginConfig.h
//  Runner
//
//  Created by Jinbo Lu on 2020/7/23.
//

#import "TtlockModel.h"


#define TTLOCK_CHANNEL_COMMAND @"com.ttlock/command/ttlock"
#define TTLOCK_CHANNEL_LISTEN @"com.ttlock/listen/ttlock"


#define command_setup_plugin @"setupPlugin"


#define command_start_scan_lock @"startScanLock"
#define command_stop_scan_lock @"stopScanLock"

#define command_get_bluetooth_state @"getBluetoothState"
#define command_get_blutetooth_scan_state @"getBluetoothScanState"

#define command_get_lock_version @"getLockVersion"


#define command_init_lock @"initLock"
#define command_reset_lock @"resetLock"
#define command_reset_lock_by_code @"resetLockByCode"

#define command_control_lock @"controlLock"
#define command_reset_ekey @"resetEkey"

#define command_create_custom_passcode @"createCustomPasscode"
#define command_modify_passcode @"modifyPasscode"
#define command_delete_passcode @"deletePasscode"
#define command_reset_passcodes @"resetPasscodes"

#define command_add_ic_card @"addCard"
#define command_modify_ic_card @"modifyIcCard"
#define command_delete_ic_card @"deleteIcCard"
#define command_clear_all_ic_card @"clearAllIcCard"


#define command_add_fingerprint @"addFingerprint"
#define command_modify_fingerprint @"modifyFingerprint"
#define command_delete_fingerprint @"deleteFingerprint"
#define command_clear_all_fingerprint @"clearAllFingerprint"


#define command_modify_admin_passcode @"modifyAdminPasscode"


#define command_set_lock_time @"setLockTime"
#define command_get_lock_time @"getLockTime"
#define command_get_lock_operate_record @"getLockOperateRecord"
#define command_get_lock_power @"getLockPower"
#define command_get_lock_version @"getLockVersion"
#define command_get_lock_switch_state @"getLockSwitchState"

#define command_get_lock_sound_value @"getLockSoundWithSoundVolume"
#define command_set_lock_sound_value @"setLockSoundWithSoundVolume"


#define command_get_lock_automatic_locking_periodic_time @"getLockAutomaticLockingPeriodicTime"
#define command_set_lock_automatic_locking_periodic_time @"setLockAutomaticLockingPeriodicTime"


#define command_get_lock_remote_unlock_switch_state @"getLockRemoteUnlockSwitchState"
#define command_set_lock_remote_unlock_switch_state @"setLockRemoteUnlockSwitchState"

#define command_get_lock_config @"getLockConfig"
#define command_set_lock_config @"setLockConfig"

#define command_get_lock_direction @"getLockDirection"
#define command_set_lock_direction @"setLockDirection"

#define command_get_all_passage_modes @"getAllPassageModes"
#define command_add_passage_mode @"addPassageMode"
#define command_clear_all_passage_modes @"clearAllPassageModes"

#define command_function_support @"functionSupport"

#define command_set_lock_enter_upgrade_mode @"setLockEnterUpgradeMode"

#define command_verify_lock @"verifyLock"

#pragma mark - 网关指令
#define command_start_scan_gateway @"startScanGateway"
#define command_stop_scan_gateway @"stopScanGateway"
#define command_connect_gateway @"connectGateway"
#define command_disconnect_gateway @"disconnectGateway"
#define command_get_surround_wifi @"getSurroundWifi"
#define command_init_gateway @"initGateway"
#define command_config_gateway_ip @"gatewayConfigIp"
#define command_upgrade_gateway @"upgradeGateway"
#define command_gateway_config_apn @"gatewayConfigApn"


#pragma mark - 梯控
#define command_active_lift_floors @"activateLiftFloors"
#define command_set_lift_controlable_floors @"setLiftControlableFloors"
#define command_set_lift_work_mode @"setLiftWorkMode"

#pragma mark - 取电开关
#define command_set_power_saver_work_mode @"setPowerSaverWorkMode"
#define command_set_power_saver_controlable @"setPowerSaverControlable"

#pragma mark - NB锁
#define command_set_nb_awake_modes @"setNBAwakeModes"
#define command_get_nb_awake_modes @"getNBAwakeModes"
#define command_set_nb_awake_times @"setNBAwakeTimes"
#define command_get_nb_awake_times @"getNBAwakeTimes"

#pragma mark - WIFI锁
#define command_scan_wifi @"scanWifi"
#define command_config_lock_wifi @"configWifi"
#define command_config_lock_wifi_server @"configServer"
#define command_get_lock_wifi_info @"getWifiInfo"
#define command_config_lock_server_ip @"configIp"


#pragma mark - 门禁
#define command_set_door_sensor_switch @"setDoorSensorSwitch"
#define command_get_door_sensor_switch @"getDoorSensorSwitch"
#define command_get_door_sensor_state @"getDoorSensorState"


#pragma mark - 无线钥匙
#define command_remote_key_start_scan @"startScanRemoteKey"
#define command_remote_key_stop_scan @"stopScanRemoteKey"
#define command_remote_key_init @"initRemoteKey"
#define command_lock_add_remote_key @"lockAddRemoteKey"
#define command_lock_get_remote_accessory_electric_quantity @"lockGetRemoteAccessoryElectricQuantity"
#define command_lock_modify_remote_key_valid_date @"lockModifyRemoteKeyValidDate"
#define command_lock_delete_remote_key @"lockDeleteRemoteKey"


#pragma mark - 门磁
#define command_door_sensor_start_scan @"doorSensorStartScan"
#define command_door_sensor_stop_scan @"doorSensorStopScan"
#define command_door_sensor_init @"doorSensorInit"
#define command_lock_set_door_sensor_alert_time @"lockSetDoorSensorAlertTime"
#define command_lock_add_door_sensor @"lockAddDoorSensor"
#define command_lock_delete_door_sensor @"lockDeleteDoorSensor"


#pragma mark - 无线键盘
#define command_remote_keypad_start_scan @"remoteKeypadStartScan"
#define command_remote_keypad_stop_scan @"remoteKeypadStopScan"
#define command_remote_keypad_init @"remoteKeypadInit"

#pragma mark - 酒店锁
#define command_set_hotel_card_sector @"setHotelCardSector"
#define command_set_hotel_info @"setHotelInfo"

#pragma mark - 人脸识别
#define command_face_add @"faceAdd"
#define command_face_data_add @"faceDataAdd"
#define command_face_modify @"faceModify"
#define command_face_delete @"faceDelete"
#define command_face_clear @"faceClear"

#define command_get_all_valid_passcode @"getAllValidPasscode"
#define command_get_all_valid_fingerprint @"getAllValidFingerprint"
#define command_get_all_valid_card @"getAllValidIcCard"

#pragma mark - 电表

#define command_electric_meter_config_server @"electricMeterConfigServer"
#define command_electric_meter_start_scan @"electricMeterStartScan"
#define command_electric_meter_stop_scan @"electricMeterStopScan"
#define command_electric_meter_connect @"electricMeterConnect"
#define command_electric_meter_disconnect @"electricMeterDisconnect"
#define command_electric_meter_init @"electricMeterInit"
#define command_electric_meter_delete @"electricMeterDelete"
#define command_electric_meter_set_power_on_off @"electricMeterSetPowerOnOff"
#define command_electric_meter_set_remaining_electricity @"electricMeterSetRemainingElectricity"
#define command_electric_meter_clear_remaining_electricity @"electricMeterClearRemainingElectricity"
#define command_electric_meter_read_data @"electricMeterReadData"
#define command_electric_meter_set_pay_mode @"electricMeterSetPayMode"
#define command_electric_meter_charg @"electricMeterCharg"
#define command_electric_meter_set_max_power @"electricMeterSetMaxPower"
#define command_electric_meter_get_feature_value @"electricMeterGetFeatureValue"
#define command_electric_meter_enter_upgrade_mode @"electricMeterEnterUpgradeMode"









#define command_get_admin_passcode_by_lockdata @"getAdminPasscodeWithLockData"
#define command_set_v2_lock_admin_erase_passcode @"setAdminErasePasscode"
#define command_get_lock_system_info @"getLockSystemInfoWithLockData"
#define command_get_lock_feature_value @"getLockFreatureValue"
#define command_get_passcode_verification_param @"getPasscodeVerificationParamsWithLockData"
#define command_set_nb_server_address @"setNBServerAddress"
#define command_recover_password @"recoverPasscodeWithPasswordType"
#define command_recover_card @"recoverCardWithCardType"
#define command_report_loss_card @"reportLossCard"



