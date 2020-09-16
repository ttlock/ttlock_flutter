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


#define command_init_lock @"initLock"
#define command_reset_lock @"resetLock"

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


#define command_get_lock_automatic_locking_periodic_time @"getLockAutomaticLockingPeriodicTime"
#define command_set_lock_automatic_locking_periodic_time @"setLockAutomaticLockingPeriodicTime"


#define command_get_lock_remote_unlock_switch_state @"getLockRemoteUnlockSwitchState"
#define command_set_lock_remote_unlock_switch_state @"setLockRemoteUnlockSwitchState"

#define command_get_lock_config @"getLockConfig"
#define command_set_lock_config @"setLockConfig"

#define command_get_all_passage_modes @"getAllPassageModes"
#define command_add_passage_mode @"addPassageMode"
#define command_clear_all_passage_modes @"clearAllPassageModes"

#define command_function_support @"functionSupport"

#pragma mark - 网关指令
#define command_start_scan_gateway @"startScanGateway"
#define command_stop_scan_gateway @"stopScanGateway"
#define command_connect_gateway @"connectGateway"
#define command_disconnect_gateway @"disconnectGateway"
#define command_get_surround_wifi @"getSurroundWifi"
#define command_init_gateway @"initGateway"




