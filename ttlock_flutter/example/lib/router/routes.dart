import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/auth/presentation/screen/login_screen.dart';
import 'package:ttlock_flutter_demo/features/auth/presentation/screen/register_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_enroll_method_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/screen/face_photo_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/palm_vein_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/screen/palm_vein_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/screen/palm_vein_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/screen/palm_vein_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/screen/palm_vein_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/screen/palm_vein_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_get_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/screen/passcode_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_add_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_list_screen.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_args.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_add_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_list_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/door_sensor_args.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/door_sensor_add_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/door_sensor_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/door_sensor_records_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_add_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_alert_config_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_door_sensor_records_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_list_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_user_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_wifi_config_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/standalone_door_sensor_args.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_unbind_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/wireless_keypad_add_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/wireless_keypad_add_type_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/wireless_keypad_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/wireless_keypad_list_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_args.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_list_screen.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_send_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/gateway_args.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_add_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_list_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/screen/group_add_sheet.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/screen/group_manage_screen.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/screen/group_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/screen/lock_group_picker_sheet.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/screen/home_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_building_sheet.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_lock_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_lock_list_screen.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_sector_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_auto_lock_time_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_door_not_closed_alert_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_clear_records_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_nb_register_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_open_direction_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_passage_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_working_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_unauthorized_alert_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_records_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_sound_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_sensitivity_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_bluetooth_advertising_interval_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_light_time_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_motor_torque_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_latch_bolt_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_info_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_time_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_admin_passcode_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_scan_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_settings_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/wifi_lock_network_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/wifi_lock_config_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_transfer_sheet.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/screen/lift_controlable_floors_screen.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/screen/lift_screen.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/screen/lift_work_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/screen/power_switch_controlable_lock_screen.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/screen/power_switch_work_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_connection_confirm_args.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/screen/meter_connection_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_add_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_cat_one_apn_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_cat_one_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_clear_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_remainder_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_reset_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_list_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_operation_records_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_pay_mode_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_price_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_recharge_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_settings_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_total_usage_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_usage_records_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_add_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_cat_one_apn_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_cat_one_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_clear_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_remainder_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_reset_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_list_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_max_power_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_operation_records_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_pay_mode_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_price_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_recharge_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_settings_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_usage_records_screen.dart';
import 'package:ttlock_flutter_demo/features/mine/presentation/screen/config_screen.dart';
import 'package:ttlock_flutter_demo/features/mine/presentation/screen/mine_screen.dart';
import 'package:ttlock_flutter_demo/features/other_devices/presentation/screen/other_devices_screen.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/router/shell/main_shell.dart';

part 'routes.g.dart';

abstract final class RoutePaths {
  static const login = '/login';
  static const register = '/register';
  static const home = '/';
  static const otherDevices = '/devices';
  static const mine = '/mine';
  static const hotelLockList = '/hotel/locks';
  static const hotelLockDetail = '/hotel/locks/detail/:lockId';
  static const hotelSectorSheet = '/hotel/locks/sector';
  static const hotelBuildingSheet = '/hotel/locks/building';
  static const config = '/config';
  static const scan = '/scan';
  static const groups = '/groups';
  static const lockDetail = '/lock/:lockId';
  static const lockRecords = '/lock/:lockId/records';
  static const lockLift = '/lock/:lockId/lift';
  static const lockLiftWorkMode = '/lock/:lockId/lift/work-mode';
  static const lockLiftControlable = '/lock/:lockId/lift/controlable';
  static const lockPowerSwitchWorkMode = '/lock/:lockId/power-switch/work-mode';
  static const lockPowerSwitchControlable =
      '/lock/:lockId/power-switch/controlable';
  static const lockSettings = '/lock/:lockId/settings';
  static const lockWifi = '/lock/:lockId/wifi';
  static const lockWifiNetworkSheet = '/lock/:lockId/wifi/network';
  static const lockRename = '/lock/rename';
  static const lockTransfer = '/lock/transfer';
  static const lockDeleteConfirm = '/lock/delete-confirm';
  static const lockClearRecordsConfirm = '/lock/clear-records-confirm';
  static const lockGroupPicker = '/lock/group-picker';
  static const lockAutoLockTime = '/lock/auto-lock-time';
  static const lockDoorNotClosedAlert = '/lock/door-not-closed-alert';
  static const lockSound = '/lock/sound';
  static const lockSensitivity = '/lock/sensitivity';
  static const lockLightTime = '/lock/light-time';
  static const lockMotorTorque = '/lock/motor-torque';
  static const lockLatchBolt = '/lock/latch-bolt';
  static const lockBluetoothAdvertisingInterval =
      '/lock/:lockId/bluetooth-advertising-interval';
  static const lockTime = '/lock/:lockId/time';
  static const lockInfo = '/lock/:lockId/info';
  static const lockAdminPasscode = '/lock/:lockId/admin-passcode';
  static const lockOpenDirection = '/lock/open-direction';
  static const lockPassageMode = '/lock/passage-mode';
  static const lockWorkingMode = '/lock/working-mode';
  static const lockUnauthorizedAttempt = '/lock/unauthorized-attempt';
  static const lockNbRegister = '/lock/nb-register';
  static const groupAdd = '/groups/add';
  static const groupRename = '/groups/rename';
  static const ekeyList = '/lock/:lockId/ekeys';
  static const ekeySend = '/lock/ekey-send';
  static const ekeyDetail = '/lock/ekey-detail';
  static const ekeyChangePeriod = '/lock/ekey-change-period';
  static const ekeyDeleteConfirm = '/lock/ekey-delete-confirm';
  static const passcodeList = '/lock/:lockId/passcodes';
  static const passcodeGet = '/lock/passcode-get';
  static const passcodeAdd = '/lock/passcode-add';
  static const passcodeDetail = '/lock/passcode-detail';
  static const passcodeChangePeriod = '/lock/passcode-change-period';
  static const passcodeDeleteConfirm = '/lock/passcode-delete-confirm';
  static const cardList = '/lock/:lockId/cards';
  static const cardAdd = '/lock/card-add';
  static const cardDetail = '/lock/card-detail';
  static const cardChangePeriod = '/lock/card-change-period';
  static const cardDeleteConfirm = '/lock/card-delete-confirm';
  static const fingerprintList = '/lock/:lockId/fingerprints';
  static const fingerprintAdd = '/lock/fingerprint-add';
  static const fingerprintDetail = '/lock/fingerprint-detail';
  static const fingerprintChangePeriod = '/lock/fingerprint-change-period';
  static const fingerprintDeleteConfirm = '/lock/fingerprint-delete-confirm';
  static const faceList = '/lock/:lockId/faces';
  static const faceAdd = '/lock/face-add';
  static const faceEnrollMethod = '/lock/face-enroll-method';
  static const facePhotoAdd = '/lock/face-photo-add';
  static const faceDetail = '/lock/face-detail';
  static const faceChangePeriod = '/lock/face-change-period';
  static const faceDeleteConfirm = '/lock/face-delete-confirm';
  static const palmVeinList = '/lock/:lockId/palm-veins';
  static const palmVeinAdd = '/lock/palm-vein-add';
  static const palmVeinDetail = '/lock/palm-vein-detail';
  static const palmVeinChangePeriod = '/lock/palm-vein-change-period';
  static const palmVeinDeleteConfirm = '/lock/palm-vein-delete-confirm';
  static const qrCodeList = '/lock/:lockId/qr-codes';
  static const qrCodeAdd = '/lock/qr-code-add';
  static const qrCodeDetail = '/lock/qr-code-detail';
  static const qrCodeChangePeriod = '/lock/qr-code-change-period';
  static const qrCodeDeleteConfirm = '/lock/qr-code-delete-confirm';
  static const remoteList = '/lock/:lockId/remotes';
  static const remoteAdd = '/lock/remote-add';
  static const remoteDetail = '/lock/remote-detail';
  static const remoteChangePeriod = '/lock/remote-change-period';
  static const remoteDeleteConfirm = '/lock/remote-delete-confirm';
  static const recurringScheduleSheet = '/lock/recurring-schedule-sheet';
  static const doorSensorAdd = '/lock/door-sensor-add';
  static const doorSensorDetail = '/lock/door-sensor-detail';
  static const doorSensorRecords = '/lock/door-sensor-records/:lockId';
  static const wirelessKeypadList = '/lock/:lockId/keypads';
  static const wirelessKeypadAddType = '/lock/keypad-add-type';
  static const wirelessKeypadAdd = '/lock/keypad-add';
  static const wirelessKeypadDetail = '/lock/keypad-detail';
  static const keypadRename = '/lock/keypad-rename';
  static const keypadUnbindConfirm = '/lock/keypad-unbind-confirm';
  static const gatewayList = '/devices/gateways';
  static const gatewayAdd = '/devices/gateways/add';
  static const gatewayDetail = '/devices/gateways/detail';
  static const gatewayRename = '/devices/gateways/rename';
  static const gatewayDeleteConfirm = '/devices/gateways/delete-confirm';
  static const waterMeterList = '/devices/water-meters';
  static const waterMeterAdd = '/devices/water-meters/add';
  static const waterMeterDetail = '/devices/water-meters/detail/:meterId';
  static const waterMeterRecharge = '/devices/water-meters/recharge';
  static const waterMeterRename = '/devices/water-meters/rename';
  static const waterMeterDeleteConfirm = '/devices/water-meters/delete-confirm';
  static const waterMeterOperationRecords =
      '/devices/water-meters/operation-records/:meterId';
  static const waterMeterUsageRecords =
      '/devices/water-meters/usage-records/:meterId';
  static const waterMeterPrice = '/devices/water-meters/price';
  static const waterMeterPayMode = '/devices/water-meters/pay-mode';
  static const waterMeterTotalUsage = '/devices/water-meters/total-usage';
  static const waterMeterClearConfirm = '/devices/water-meters/clear-confirm';
  static const waterMeterRemainder = '/devices/water-meters/remainder';
  static const waterMeterResetConfirm = '/devices/water-meters/reset-confirm';
  static const waterMeterSettings = '/devices/water-meters/settings/:meterId';
  static const waterMeterCatOne = '/devices/water-meters/cat-one/:meterId';
  static const waterMeterCatOneConfig = '/devices/water-meters/cat-one-config';
  static const electricMeterList = '/devices/electric-meters';
  static const electricMeterAdd = '/devices/electric-meters/add';
  static const electricMeterDetail = '/devices/electric-meters/detail/:meterId';
  static const electricMeterRecharge = '/devices/electric-meters/recharge';
  static const electricMeterRename = '/devices/electric-meters/rename';
  static const electricMeterMaxPower = '/devices/electric-meters/max-power';
  static const electricMeterDeleteConfirm =
      '/devices/electric-meters/delete-confirm';
  static const electricMeterOperationRecords =
      '/devices/electric-meters/operation-records/:meterId';
  static const electricMeterUsageRecords =
      '/devices/electric-meters/usage-records/:meterId';
  static const electricMeterPrice = '/devices/electric-meters/price';
  static const electricMeterPayMode = '/devices/electric-meters/pay-mode';
  static const electricMeterClearConfirm =
      '/devices/electric-meters/clear-confirm';
  static const electricMeterRemainder = '/devices/electric-meters/remainder';
  static const electricMeterResetConfirm =
      '/devices/electric-meters/reset-confirm';
  static const electricMeterSettings =
      '/devices/electric-meters/settings/:meterId';
  static const electricMeterCatOne =
      '/devices/electric-meters/cat-one/:meterId';
  static const electricMeterCatOneConfig =
      '/devices/electric-meters/cat-one-config';
  static const meterConnectionConfirm = '/devices/meters/connection-confirm';
  static const standaloneDoorSensorAdd = '/devices/standalone-door-sensors/add';
  static const standaloneDoorSensorList = '/devices/standalone-door-sensors';
  static const standaloneDoorSensorDetail =
      '/devices/standalone-door-sensors/detail';
  static const standaloneDoorSensorRename =
      '/devices/standalone-door-sensors/rename';
  static const standaloneDoorSensorDeleteConfirm =
      '/devices/standalone-door-sensors/delete-confirm';
  static const standaloneDoorSensorAlertConfig =
      '/devices/standalone-door-sensors/alert-config';
  static const standaloneDoorSensorWifiConfig =
      '/devices/standalone-door-sensors/wifi-config';
  static const standaloneDoorSensorUsers =
      '/devices/standalone-door-sensors/users';
  static const standaloneDoorSensorRecords =
      '/devices/standalone-door-sensors/records/:doorSensorId';
}

@TypedGoRoute<LoginRoute>(path: RoutePaths.login)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const LoginScreen());
}

@TypedGoRoute<RegisterRoute>(path: RoutePaths.register)
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const RegisterScreen());
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class OtherDevicesBranch extends StatefulShellBranchData {
  const OtherDevicesBranch();
}

class MineBranch extends StatefulShellBranchData {
  const MineBranch();
}

@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: RoutePaths.home)],
    ),
    TypedStatefulShellBranch<OtherDevicesBranch>(
      routes: [TypedGoRoute<OtherDevicesRoute>(path: RoutePaths.otherDevices)],
    ),
    TypedStatefulShellBranch<MineBranch>(
      routes: [TypedGoRoute<MineRoute>(path: RoutePaths.mine)],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => MainShell(shell: navigationShell);
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const HomeScreen());
}

class OtherDevicesRoute extends GoRouteData with $OtherDevicesRoute {
  const OtherDevicesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const OtherDevicesScreen());
}

class MineRoute extends GoRouteData with $MineRoute {
  const MineRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const MineScreen());
}

@TypedGoRoute<ConfigRoute>(path: RoutePaths.config)
class ConfigRoute extends GoRouteData with $ConfigRoute {
  const ConfigRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ConfigScreen());
}

@TypedGoRoute<LockScanRoute>(path: RoutePaths.scan)
class LockScanRoute extends GoRouteData with $LockScanRoute {
  const LockScanRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const LockScanScreen());
}

@TypedGoRoute<LockRenameSheetRoute>(path: RoutePaths.lockRename)
class LockRenameSheetRoute extends GoRouteData with $LockRenameSheetRoute {
  const LockRenameSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockRenameSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockTransferSheetRoute>(path: RoutePaths.lockTransfer)
class LockTransferSheetRoute extends GoRouteData with $LockTransferSheetRoute {
  const LockTransferSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockTransferSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockDeleteConfirmSheetRoute>(path: RoutePaths.lockDeleteConfirm)
class LockDeleteConfirmSheetRoute extends GoRouteData
    with $LockDeleteConfirmSheetRoute {
  const LockDeleteConfirmSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockDeleteConfirmSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockClearRecordsConfirmSheetRoute>(
  path: RoutePaths.lockClearRecordsConfirm,
)
class LockClearRecordsConfirmSheetRoute extends GoRouteData
    with $LockClearRecordsConfirmSheetRoute {
  const LockClearRecordsConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const LockClearRecordsConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockGroupPickerSheetRoute>(path: RoutePaths.lockGroupPicker)
class LockGroupPickerSheetRoute extends GoRouteData
    with $LockGroupPickerSheetRoute {
  const LockGroupPickerSheetRoute({this.groupId});
  final int? groupId;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockGroupPickerSheet(groupId: groupId));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockAutoLockTimeSheetRoute>(path: RoutePaths.lockAutoLockTime)
class LockAutoLockTimeSheetRoute extends GoRouteData
    with $LockAutoLockTimeSheetRoute {
  const LockAutoLockTimeSheetRoute({this.$extra, this.step = 5});
  final AutoLockingTime? $extra;
  final int step;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockAutoLockTimeSheet(autoLockingTime: $extra, step: step),
  );
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockDoorNotClosedAlertSheetRoute>(
  path: RoutePaths.lockDoorNotClosedAlert,
)
class LockDoorNotClosedAlertSheetRoute extends GoRouteData
    with $LockDoorNotClosedAlertSheetRoute {
  const LockDoorNotClosedAlertSheetRoute({
    required this.$extra,
    this.initialSeconds = 0,
  });
  final LockEntity $extra;
  final int initialSeconds;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockDoorNotClosedAlertSheet(lock: $extra, initialSeconds: initialSeconds),
  );
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockSoundSheetRoute>(path: RoutePaths.lockSound)
class LockSoundSheetRoute extends GoRouteData with $LockSoundSheetRoute {
  const LockSoundSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockSoundSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockSensitivitySheetRoute>(path: RoutePaths.lockSensitivity)
class LockSensitivitySheetRoute extends GoRouteData
    with $LockSensitivitySheetRoute {
  const LockSensitivitySheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockSensitivitySheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockLightTimeSheetRoute>(path: RoutePaths.lockLightTime)
class LockLightTimeSheetRoute extends GoRouteData
    with $LockLightTimeSheetRoute {
  const LockLightTimeSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockLightTimeSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockBluetoothAdvertisingIntervalRoute>(
  path: RoutePaths.lockBluetoothAdvertisingInterval,
)
class LockBluetoothAdvertisingIntervalRoute extends GoRouteData
    with $LockBluetoothAdvertisingIntervalRoute {
  const LockBluetoothAdvertisingIntervalRoute({
    required this.lockId,
    this.$extra,
  });
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockBluetoothAdvertisingIntervalScreen(
      lock: $extra ?? LockEntity(lockId: lockId),
    ),
  );
}

@TypedGoRoute<LockMotorTorqueSheetRoute>(path: RoutePaths.lockMotorTorque)
class LockMotorTorqueSheetRoute extends GoRouteData
    with $LockMotorTorqueSheetRoute {
  const LockMotorTorqueSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const LockMotorTorqueSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockLatchBoltSheetRoute>(path: RoutePaths.lockLatchBolt)
class LockLatchBoltSheetRoute extends GoRouteData
    with $LockLatchBoltSheetRoute {
  const LockLatchBoltSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const LockLatchBoltSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockTimeRoute>(path: RoutePaths.lockTime)
class LockTimeRoute extends GoRouteData with $LockTimeRoute {
  const LockTimeRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockTimeScreen(lock: $extra ?? LockEntity(lockId: lockId)),
  );
}

@TypedGoRoute<LockInfoRoute>(path: RoutePaths.lockInfo)
class LockInfoRoute extends GoRouteData with $LockInfoRoute {
  const LockInfoRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockInfoScreen(lock: $extra ?? LockEntity(lockId: lockId)),
  );
}

@TypedGoRoute<LockAdminPasscodeRoute>(path: RoutePaths.lockAdminPasscode)
class LockAdminPasscodeRoute extends GoRouteData with $LockAdminPasscodeRoute {
  const LockAdminPasscodeRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LockAdminPasscodeScreen(lock: $extra ?? LockEntity(lockId: lockId)),
  );
}

@TypedGoRoute<LockOpenDirectionSheetRoute>(path: RoutePaths.lockOpenDirection)
class LockOpenDirectionSheetRoute extends GoRouteData
    with $LockOpenDirectionSheetRoute {
  const LockOpenDirectionSheetRoute({required this.$extra});
  final LockOpenDirectionArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockOpenDirectionSheet(args: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockPassageModeSheetRoute>(path: RoutePaths.lockPassageMode)
class LockPassageModeSheetRoute extends GoRouteData
    with $LockPassageModeSheetRoute {
  const LockPassageModeSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockPassageModeScreen(lock: $extra));
}

@TypedGoRoute<LockWorkingModeSheetRoute>(path: RoutePaths.lockWorkingMode)
class LockWorkingModeSheetRoute extends GoRouteData
    with $LockWorkingModeSheetRoute {
  const LockWorkingModeSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockWorkingModeScreen(lock: $extra));
}

@TypedGoRoute<LockUnauthorizedAttemptSheetRoute>(
  path: RoutePaths.lockUnauthorizedAttempt,
)
class LockUnauthorizedAttemptSheetRoute extends GoRouteData
    with $LockUnauthorizedAttemptSheetRoute {
  const LockUnauthorizedAttemptSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockUnauthorizedAlertScreen(lock: $extra));
}

@TypedGoRoute<LockNbRegisterSheetRoute>(path: RoutePaths.lockNbRegister)
class LockNbRegisterSheetRoute extends GoRouteData
    with $LockNbRegisterSheetRoute {
  const LockNbRegisterSheetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockNbRegisterSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<LockRecordsRoute>(path: RoutePaths.lockRecords)
class LockRecordsRoute extends GoRouteData with $LockRecordsRoute {
  const LockRecordsRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockRecordsScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<LiftRoute>(path: RoutePaths.lockLift)
class LiftRoute extends GoRouteData with $LiftRoute {
  const LiftRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LiftScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<LiftWorkModeRoute>(path: RoutePaths.lockLiftWorkMode)
class LiftWorkModeRoute extends GoRouteData with $LiftWorkModeRoute {
  const LiftWorkModeRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LiftWorkModeScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<LiftControlableFloorsRoute>(path: RoutePaths.lockLiftControlable)
class LiftControlableFloorsRoute extends GoRouteData
    with $LiftControlableFloorsRoute {
  const LiftControlableFloorsRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    LiftControlableFloorsScreen(lockId: lockId, lock: $extra),
  );
}

@TypedGoRoute<PowerSwitchWorkModeRoute>(
  path: RoutePaths.lockPowerSwitchWorkMode,
)
class PowerSwitchWorkModeRoute extends GoRouteData
    with $PowerSwitchWorkModeRoute {
  const PowerSwitchWorkModeRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    PowerSwitchWorkModeScreen(lockId: lockId, lock: $extra),
  );
}

@TypedGoRoute<PowerSwitchControlableLockRoute>(
  path: RoutePaths.lockPowerSwitchControlable,
)
class PowerSwitchControlableLockRoute extends GoRouteData
    with $PowerSwitchControlableLockRoute {
  const PowerSwitchControlableLockRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    PowerSwitchControlableLockScreen(lockId: lockId, lock: $extra),
  );
}

@TypedGoRoute<LockSettingsRoute>(path: RoutePaths.lockSettings)
class LockSettingsRoute extends GoRouteData with $LockSettingsRoute {
  const LockSettingsRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockSettingsScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<LockWifiRoute>(path: RoutePaths.lockWifi)
class LockWifiRoute extends GoRouteData with $LockWifiRoute {
  const LockWifiRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WifiLockConfigScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<LockWifiNetworkSheetRoute>(path: RoutePaths.lockWifiNetworkSheet)
class LockWifiNetworkSheetRoute extends GoRouteData
    with $LockWifiNetworkSheetRoute {
  const LockWifiNetworkSheetRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final lock = $extra;
    if (lock == null) return const SizedBox.shrink();
    return withRouteBackGuard(WifiLockNetworkSheet(lockId: lockId, lock: lock));
  }

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<GroupManageRoute>(path: RoutePaths.groups)
class GroupManageRoute extends GoRouteData with $GroupManageRoute {
  const GroupManageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const GroupManageScreen());
}

@TypedGoRoute<GroupAddSheetRoute>(path: RoutePaths.groupAdd)
class GroupAddSheetRoute extends GoRouteData with $GroupAddSheetRoute {
  const GroupAddSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const GroupAddSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<GroupRenameSheetRoute>(path: RoutePaths.groupRename)
class GroupRenameSheetRoute extends GoRouteData with $GroupRenameSheetRoute {
  const GroupRenameSheetRoute({required this.$extra});
  final GroupEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(GroupRenameSheet(group: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<EkeyListRoute>(path: RoutePaths.ekeyList)
class EkeyListRoute extends GoRouteData with $EkeyListRoute {
  const EkeyListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(EkeyListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<EkeySendRoute>(path: RoutePaths.ekeySend)
class EkeySendRoute extends GoRouteData with $EkeySendRoute {
  const EkeySendRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(EkeySendScreen(lock: $extra));
}

@TypedGoRoute<EkeyDetailRoute>(path: RoutePaths.ekeyDetail)
class EkeyDetailRoute extends GoRouteData with $EkeyDetailRoute {
  const EkeyDetailRoute({required this.$extra});
  final EkeyDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(EkeyDetailScreen(args: $extra));
}

@TypedGoRoute<EkeyChangePeriodSheetRoute>(path: RoutePaths.ekeyChangePeriod)
class EkeyChangePeriodSheetRoute extends GoRouteData
    with $EkeyChangePeriodSheetRoute {
  const EkeyChangePeriodSheetRoute({required this.$extra});
  final KeyEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(EkeyChangePeriodSheet(keyEntity: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<EkeyDeleteConfirmSheetRoute>(path: RoutePaths.ekeyDeleteConfirm)
class EkeyDeleteConfirmSheetRoute extends GoRouteData
    with $EkeyDeleteConfirmSheetRoute {
  const EkeyDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const EkeyDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<PasscodeListRoute>(path: RoutePaths.passcodeList)
class PasscodeListRoute extends GoRouteData with $PasscodeListRoute {
  const PasscodeListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PasscodeListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<PasscodeGetRoute>(path: RoutePaths.passcodeGet)
class PasscodeGetRoute extends GoRouteData with $PasscodeGetRoute {
  const PasscodeGetRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PasscodeGetScreen(lock: $extra));
}

@TypedGoRoute<PasscodeAddRoute>(path: RoutePaths.passcodeAdd)
class PasscodeAddRoute extends GoRouteData with $PasscodeAddRoute {
  const PasscodeAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PasscodeAddScreen(lock: $extra));
}

@TypedGoRoute<PasscodeDetailRoute>(path: RoutePaths.passcodeDetail)
class PasscodeDetailRoute extends GoRouteData with $PasscodeDetailRoute {
  const PasscodeDetailRoute({required this.$extra});
  final PasscodeDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PasscodeDetailScreen(args: $extra));
}

@TypedGoRoute<PasscodeChangePeriodSheetRoute>(
  path: RoutePaths.passcodeChangePeriod,
)
class PasscodeChangePeriodSheetRoute extends GoRouteData
    with $PasscodeChangePeriodSheetRoute {
  const PasscodeChangePeriodSheetRoute({required this.$extra});
  final KeyboardPwdEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PasscodeChangePeriodSheet(pwd: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<PasscodeDeleteConfirmSheetRoute>(
  path: RoutePaths.passcodeDeleteConfirm,
)
class PasscodeDeleteConfirmSheetRoute extends GoRouteData
    with $PasscodeDeleteConfirmSheetRoute {
  const PasscodeDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const PasscodeDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<CardListRoute>(path: RoutePaths.cardList)
class CardListRoute extends GoRouteData with $CardListRoute {
  const CardListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(CardListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<CardAddRoute>(path: RoutePaths.cardAdd)
class CardAddRoute extends GoRouteData with $CardAddRoute {
  const CardAddRoute({required this.$extra, this.keypadMac});
  final LockEntity $extra;

  /// 无注解 → go_router_builder 自动识别为 query 参数。
  final String? keypadMac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(CardAddScreen(lock: $extra, keypadMac: keypadMac));
}

@TypedGoRoute<CardDetailRoute>(path: RoutePaths.cardDetail)
class CardDetailRoute extends GoRouteData with $CardDetailRoute {
  const CardDetailRoute({required this.$extra});
  final CardDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(CardDetailScreen(args: $extra));
}

@TypedGoRoute<CardChangePeriodSheetRoute>(path: RoutePaths.cardChangePeriod)
class CardChangePeriodSheetRoute extends GoRouteData
    with $CardChangePeriodSheetRoute {
  const CardChangePeriodSheetRoute({required this.$extra});
  final IdentityCardEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(CardChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<CardDeleteConfirmSheetRoute>(path: RoutePaths.cardDeleteConfirm)
class CardDeleteConfirmSheetRoute extends GoRouteData
    with $CardDeleteConfirmSheetRoute {
  const CardDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const CardDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<FingerprintListRoute>(path: RoutePaths.fingerprintList)
class FingerprintListRoute extends GoRouteData with $FingerprintListRoute {
  const FingerprintListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FingerprintListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<FingerprintAddRoute>(path: RoutePaths.fingerprintAdd)
class FingerprintAddRoute extends GoRouteData with $FingerprintAddRoute {
  const FingerprintAddRoute({required this.$extra, this.keypadMac});
  final LockEntity $extra;

  /// 无注解 → go_router_builder 自动识别为 query 参数。
  final String? keypadMac;

  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    FingerprintAddScreen(lock: $extra, keypadMac: keypadMac),
  );
}

@TypedGoRoute<FingerprintDetailRoute>(path: RoutePaths.fingerprintDetail)
class FingerprintDetailRoute extends GoRouteData with $FingerprintDetailRoute {
  const FingerprintDetailRoute({required this.$extra});
  final FingerprintDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FingerprintDetailScreen(args: $extra));
}

@TypedGoRoute<FingerprintChangePeriodSheetRoute>(
  path: RoutePaths.fingerprintChangePeriod,
)
class FingerprintChangePeriodSheetRoute extends GoRouteData
    with $FingerprintChangePeriodSheetRoute {
  const FingerprintChangePeriodSheetRoute({required this.$extra});
  final FingerprintEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FingerprintChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<FingerprintDeleteConfirmSheetRoute>(
  path: RoutePaths.fingerprintDeleteConfirm,
)
class FingerprintDeleteConfirmSheetRoute extends GoRouteData
    with $FingerprintDeleteConfirmSheetRoute {
  const FingerprintDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const FingerprintDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<FaceListRoute>(path: RoutePaths.faceList)
class FaceListRoute extends GoRouteData with $FaceListRoute {
  const FaceListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FaceListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<FaceAddRoute>(path: RoutePaths.faceAdd)
class FaceAddRoute extends GoRouteData with $FaceAddRoute {
  const FaceAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FaceAddScreen(lock: $extra));
}

@TypedGoRoute<FaceEnrollMethodRoute>(path: RoutePaths.faceEnrollMethod)
class FaceEnrollMethodRoute extends GoRouteData with $FaceEnrollMethodRoute {
  const FaceEnrollMethodRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FaceEnrollMethodSheet(lock: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<FacePhotoAddRoute>(path: RoutePaths.facePhotoAdd)
class FacePhotoAddRoute extends GoRouteData with $FacePhotoAddRoute {
  const FacePhotoAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FacePhotoAddScreen(lock: $extra));
}

@TypedGoRoute<FaceDetailRoute>(path: RoutePaths.faceDetail)
class FaceDetailRoute extends GoRouteData with $FaceDetailRoute {
  const FaceDetailRoute({required this.$extra});
  final FaceDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FaceDetailScreen(args: $extra));
}

@TypedGoRoute<FaceChangePeriodSheetRoute>(path: RoutePaths.faceChangePeriod)
class FaceChangePeriodSheetRoute extends GoRouteData
    with $FaceChangePeriodSheetRoute {
  const FaceChangePeriodSheetRoute({required this.$extra});
  final FaceEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(FaceChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<FaceDeleteConfirmSheetRoute>(path: RoutePaths.faceDeleteConfirm)
class FaceDeleteConfirmSheetRoute extends GoRouteData
    with $FaceDeleteConfirmSheetRoute {
  const FaceDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const FaceDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<PalmVeinListRoute>(path: RoutePaths.palmVeinList)
class PalmVeinListRoute extends GoRouteData with $PalmVeinListRoute {
  const PalmVeinListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PalmVeinListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<PalmVeinAddRoute>(path: RoutePaths.palmVeinAdd)
class PalmVeinAddRoute extends GoRouteData with $PalmVeinAddRoute {
  const PalmVeinAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PalmVeinAddScreen(lock: $extra));
}

@TypedGoRoute<PalmVeinDetailRoute>(path: RoutePaths.palmVeinDetail)
class PalmVeinDetailRoute extends GoRouteData with $PalmVeinDetailRoute {
  const PalmVeinDetailRoute({required this.$extra});
  final PalmVeinDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PalmVeinDetailScreen(args: $extra));
}

@TypedGoRoute<PalmVeinChangePeriodSheetRoute>(
  path: RoutePaths.palmVeinChangePeriod,
)
class PalmVeinChangePeriodSheetRoute extends GoRouteData
    with $PalmVeinChangePeriodSheetRoute {
  const PalmVeinChangePeriodSheetRoute({required this.$extra});
  final PalmVeinEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(PalmVeinChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<PalmVeinDeleteConfirmSheetRoute>(
  path: RoutePaths.palmVeinDeleteConfirm,
)
class PalmVeinDeleteConfirmSheetRoute extends GoRouteData
    with $PalmVeinDeleteConfirmSheetRoute {
  const PalmVeinDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const PalmVeinDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<QrCodeListRoute>(path: RoutePaths.qrCodeList)
class QrCodeListRoute extends GoRouteData with $QrCodeListRoute {
  const QrCodeListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(QrCodeListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<QrCodeAddRoute>(path: RoutePaths.qrCodeAdd)
class QrCodeAddRoute extends GoRouteData with $QrCodeAddRoute {
  const QrCodeAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(QrCodeAddScreen(lock: $extra));
}

@TypedGoRoute<QrCodeDetailRoute>(path: RoutePaths.qrCodeDetail)
class QrCodeDetailRoute extends GoRouteData with $QrCodeDetailRoute {
  const QrCodeDetailRoute({required this.$extra});
  final QrCodeDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(QrCodeDetailScreen(args: $extra));
}

@TypedGoRoute<QrCodeChangePeriodSheetRoute>(path: RoutePaths.qrCodeChangePeriod)
class QrCodeChangePeriodSheetRoute extends GoRouteData
    with $QrCodeChangePeriodSheetRoute {
  const QrCodeChangePeriodSheetRoute({required this.$extra});
  final QrCodeEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(QrCodeChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<QrCodeDeleteConfirmSheetRoute>(
  path: RoutePaths.qrCodeDeleteConfirm,
)
class QrCodeDeleteConfirmSheetRoute extends GoRouteData
    with $QrCodeDeleteConfirmSheetRoute {
  const QrCodeDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const QrCodeDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<RemoteListRoute>(path: RoutePaths.remoteList)
class RemoteListRoute extends GoRouteData with $RemoteListRoute {
  const RemoteListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(RemoteListScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<RemoteAddRoute>(path: RoutePaths.remoteAdd)
class RemoteAddRoute extends GoRouteData with $RemoteAddRoute {
  const RemoteAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(RemoteAddScreen(lock: $extra));
}

@TypedGoRoute<RemoteDetailRoute>(path: RoutePaths.remoteDetail)
class RemoteDetailRoute extends GoRouteData with $RemoteDetailRoute {
  const RemoteDetailRoute({required this.$extra});
  final RemoteDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(RemoteDetailScreen(args: $extra));
}

@TypedGoRoute<RemoteChangePeriodSheetRoute>(path: RoutePaths.remoteChangePeriod)
class RemoteChangePeriodSheetRoute extends GoRouteData
    with $RemoteChangePeriodSheetRoute {
  const RemoteChangePeriodSheetRoute({required this.$extra});
  final RemoteEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(RemoteChangePeriodSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<RemoteDeleteConfirmSheetRoute>(
  path: RoutePaths.remoteDeleteConfirm,
)
class RemoteDeleteConfirmSheetRoute extends GoRouteData
    with $RemoteDeleteConfirmSheetRoute {
  const RemoteDeleteConfirmSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const RemoteDeleteConfirmSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<RecurringScheduleSheetRoute>(
  path: RoutePaths.recurringScheduleSheet,
)
class RecurringScheduleSheetRoute extends GoRouteData
    with $RecurringScheduleSheetRoute {
  const RecurringScheduleSheetRoute({this.$extra});
  final CyclicSchedule? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(RecurringScheduleSheet(initial: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<DoorSensorAddRoute>(path: RoutePaths.doorSensorAdd)
class DoorSensorAddRoute extends GoRouteData with $DoorSensorAddRoute {
  const DoorSensorAddRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(DoorSensorAddScreen(lock: $extra));
}

@TypedGoRoute<DoorSensorDetailRoute>(path: RoutePaths.doorSensorDetail)
class DoorSensorDetailRoute extends GoRouteData with $DoorSensorDetailRoute {
  const DoorSensorDetailRoute({required this.$extra});
  final DoorSensorDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(DoorSensorDetailScreen(args: $extra));
}

@TypedGoRoute<DoorSensorRecordsRoute>(path: RoutePaths.doorSensorRecords)
class DoorSensorRecordsRoute extends GoRouteData with $DoorSensorRecordsRoute {
  const DoorSensorRecordsRoute({required this.lockId});
  final int lockId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(DoorSensorRecordsScreen(lockId: lockId));
}

@TypedGoRoute<StandaloneDoorSensorAddRoute>(
  path: RoutePaths.standaloneDoorSensorAdd,
)
class StandaloneDoorSensorAddRoute extends GoRouteData
    with $StandaloneDoorSensorAddRoute {
  const StandaloneDoorSensorAddRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const StandaloneDoorSensorAddScreen());
}

@TypedGoRoute<StandaloneDoorSensorListRoute>(
  path: RoutePaths.standaloneDoorSensorList,
)
class StandaloneDoorSensorListRoute extends GoRouteData
    with $StandaloneDoorSensorListRoute {
  const StandaloneDoorSensorListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const StandaloneDoorSensorListScreen());
}

@TypedGoRoute<StandaloneDoorSensorDetailRoute>(
  path: RoutePaths.standaloneDoorSensorDetail,
)
class StandaloneDoorSensorDetailRoute extends GoRouteData
    with $StandaloneDoorSensorDetailRoute {
  const StandaloneDoorSensorDetailRoute({required this.$extra});
  final StandaloneDoorSensorDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorDetailScreen(args: $extra));
}

@TypedGoRoute<StandaloneDoorSensorRenameSheetRoute>(
  path: RoutePaths.standaloneDoorSensorRename,
)
class StandaloneDoorSensorRenameSheetRoute extends GoRouteData
    with $StandaloneDoorSensorRenameSheetRoute {
  const StandaloneDoorSensorRenameSheetRoute({required this.$extra});
  final StandaloneDoorSensorEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorRenameSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<StandaloneDoorSensorDeleteConfirmSheetRoute>(
  path: RoutePaths.standaloneDoorSensorDeleteConfirm,
)
class StandaloneDoorSensorDeleteConfirmSheetRoute extends GoRouteData
    with $StandaloneDoorSensorDeleteConfirmSheetRoute {
  const StandaloneDoorSensorDeleteConfirmSheetRoute({required this.$extra});
  final StandaloneDoorSensorEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorDeleteConfirmSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<StandaloneDoorSensorAlertConfigSheetRoute>(
  path: RoutePaths.standaloneDoorSensorAlertConfig,
)
class StandaloneDoorSensorAlertConfigSheetRoute extends GoRouteData
    with $StandaloneDoorSensorAlertConfigSheetRoute {
  const StandaloneDoorSensorAlertConfigSheetRoute({required this.$extra});
  final StandaloneDoorSensorEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorAlertConfigSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<StandaloneDoorSensorWifiConfigSheetRoute>(
  path: RoutePaths.standaloneDoorSensorWifiConfig,
)
class StandaloneDoorSensorWifiConfigSheetRoute extends GoRouteData
    with $StandaloneDoorSensorWifiConfigSheetRoute {
  const StandaloneDoorSensorWifiConfigSheetRoute({required this.$extra});
  final StandaloneDoorSensorEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorWifiConfigSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<StandaloneDoorSensorUserSheetRoute>(
  path: RoutePaths.standaloneDoorSensorUsers,
)
class StandaloneDoorSensorUserSheetRoute extends GoRouteData
    with $StandaloneDoorSensorUserSheetRoute {
  const StandaloneDoorSensorUserSheetRoute({required this.$extra});
  final StandaloneDoorSensorEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(StandaloneDoorSensorUserSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<StandaloneDoorSensorRecordsRoute>(
  path: RoutePaths.standaloneDoorSensorRecords,
)
class StandaloneDoorSensorRecordsRoute extends GoRouteData
    with $StandaloneDoorSensorRecordsRoute {
  const StandaloneDoorSensorRecordsRoute({required this.doorSensorId});
  final int doorSensorId;

  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    StandaloneDoorSensorRecordsScreen(doorSensorId: doorSensorId),
  );
}

@TypedGoRoute<WirelessKeypadListRoute>(path: RoutePaths.wirelessKeypadList)
class WirelessKeypadListRoute extends GoRouteData
    with $WirelessKeypadListRoute {
  const WirelessKeypadListRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    WirelessKeypadListScreen(lockId: lockId, lock: $extra),
  );
}

@TypedGoRoute<WirelessKeypadAddTypeRoute>(
  path: RoutePaths.wirelessKeypadAddType,
)
class WirelessKeypadAddTypeRoute extends GoRouteData
    with $WirelessKeypadAddTypeRoute {
  const WirelessKeypadAddTypeRoute({required this.$extra});
  final LockEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WirelessKeypadAddTypeScreen(lock: $extra));
}

@TypedGoRoute<WirelessKeypadAddRoute>(path: RoutePaths.wirelessKeypadAdd)
class WirelessKeypadAddRoute extends GoRouteData with $WirelessKeypadAddRoute {
  const WirelessKeypadAddRoute({required this.$extra});
  final WirelessKeypadAddArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WirelessKeypadAddScreen(args: $extra));
}

@TypedGoRoute<WirelessKeypadDetailRoute>(path: RoutePaths.wirelessKeypadDetail)
class WirelessKeypadDetailRoute extends GoRouteData
    with $WirelessKeypadDetailRoute {
  const WirelessKeypadDetailRoute({required this.$extra});
  final WirelessKeypadDetailArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WirelessKeypadDetailScreen(args: $extra));
}

@TypedGoRoute<KeypadRenameSheetRoute>(path: RoutePaths.keypadRename)
class KeypadRenameSheetRoute extends GoRouteData with $KeypadRenameSheetRoute {
  const KeypadRenameSheetRoute({required this.$extra});
  final KeypadRenameArgs $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(KeypadRenameSheet(args: $extra));

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<KeypadUnbindConfirmRoute>(path: RoutePaths.keypadUnbindConfirm)
class KeypadUnbindConfirmRoute extends GoRouteData
    with $KeypadUnbindConfirmRoute {
  const KeypadUnbindConfirmRoute({required this.$extra});
  final KeypadUnbindArgs $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(KeypadUnbindConfirmSheet(args: $extra));

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<GatewayListRoute>(path: RoutePaths.gatewayList)
class GatewayListRoute extends GoRouteData with $GatewayListRoute {
  const GatewayListRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const GatewayListScreen());
}

@TypedGoRoute<GatewayAddRoute>(path: RoutePaths.gatewayAdd)
class GatewayAddRoute extends GoRouteData with $GatewayAddRoute {
  const GatewayAddRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const GatewayAddScreen());
}

@TypedGoRoute<GatewayDetailRoute>(path: RoutePaths.gatewayDetail)
class GatewayDetailRoute extends GoRouteData with $GatewayDetailRoute {
  const GatewayDetailRoute({required this.$extra});
  final GatewayEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    GatewayDetailScreen(args: GatewayDetailArgs(gateway: $extra)),
  );
}

@TypedGoRoute<GatewayRenameSheetRoute>(path: RoutePaths.gatewayRename)
class GatewayRenameSheetRoute extends GoRouteData
    with $GatewayRenameSheetRoute {
  const GatewayRenameSheetRoute({required this.$extra});
  final GatewayEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(GatewayRenameSheet(gateway: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<GatewayDeleteConfirmSheetRoute>(
  path: RoutePaths.gatewayDeleteConfirm,
)
class GatewayDeleteConfirmSheetRoute extends GoRouteData
    with $GatewayDeleteConfirmSheetRoute {
  const GatewayDeleteConfirmSheetRoute({required this.$extra});
  final GatewayEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(GatewayDeleteConfirmSheet(gateway: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterListRoute>(path: RoutePaths.waterMeterList)
class WaterMeterListRoute extends GoRouteData with $WaterMeterListRoute {
  const WaterMeterListRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const WaterMeterListScreen());
}

@TypedGoRoute<WaterMeterAddRoute>(path: RoutePaths.waterMeterAdd)
class WaterMeterAddRoute extends GoRouteData with $WaterMeterAddRoute {
  const WaterMeterAddRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const WaterMeterAddScreen());
}

@TypedGoRoute<WaterMeterDetailRoute>(path: RoutePaths.waterMeterDetail)
class WaterMeterDetailRoute extends GoRouteData with $WaterMeterDetailRoute {
  const WaterMeterDetailRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterDetailScreen(meterId: meterId));
}

@TypedGoRoute<WaterMeterRechargeSheetRoute>(path: RoutePaths.waterMeterRecharge)
class WaterMeterRechargeSheetRoute extends GoRouteData
    with $WaterMeterRechargeSheetRoute {
  const WaterMeterRechargeSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterRechargeSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterRenameSheetRoute>(path: RoutePaths.waterMeterRename)
class WaterMeterRenameSheetRoute extends GoRouteData
    with $WaterMeterRenameSheetRoute {
  const WaterMeterRenameSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterRenameSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterDeleteConfirmSheetRoute>(
  path: RoutePaths.waterMeterDeleteConfirm,
)
class WaterMeterDeleteConfirmSheetRoute extends GoRouteData
    with $WaterMeterDeleteConfirmSheetRoute {
  const WaterMeterDeleteConfirmSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterDeleteConfirmSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterOperationRecordsRoute>(
  path: RoutePaths.waterMeterOperationRecords,
)
class WaterMeterOperationRecordsRoute extends GoRouteData
    with $WaterMeterOperationRecordsRoute {
  const WaterMeterOperationRecordsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterOperationRecordsScreen(meterId: meterId));
}

@TypedGoRoute<WaterMeterUsageRecordsRoute>(
  path: RoutePaths.waterMeterUsageRecords,
)
class WaterMeterUsageRecordsRoute extends GoRouteData
    with $WaterMeterUsageRecordsRoute {
  const WaterMeterUsageRecordsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterUsageRecordsScreen(meterId: meterId));
}

@TypedGoRoute<WaterMeterPriceSheetRoute>(path: RoutePaths.waterMeterPrice)
class WaterMeterPriceSheetRoute extends GoRouteData
    with $WaterMeterPriceSheetRoute {
  const WaterMeterPriceSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterPriceSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterPayModeSheetRoute>(path: RoutePaths.waterMeterPayMode)
class WaterMeterPayModeSheetRoute extends GoRouteData
    with $WaterMeterPayModeSheetRoute {
  const WaterMeterPayModeSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterPayModeSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterTotalUsageSheetRoute>(
  path: RoutePaths.waterMeterTotalUsage,
)
class WaterMeterTotalUsageSheetRoute extends GoRouteData
    with $WaterMeterTotalUsageSheetRoute {
  const WaterMeterTotalUsageSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterTotalUsageSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterClearConfirmDialogRoute>(
  path: RoutePaths.waterMeterClearConfirm,
)
class WaterMeterClearConfirmDialogRoute extends GoRouteData
    with $WaterMeterClearConfirmDialogRoute {
  const WaterMeterClearConfirmDialogRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const WaterMeterClearConfirmDialog());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.dialog(context, state);
}

@TypedGoRoute<WaterMeterRemainderSheetRoute>(
  path: RoutePaths.waterMeterRemainder,
)
class WaterMeterRemainderSheetRoute extends GoRouteData
    with $WaterMeterRemainderSheetRoute {
  const WaterMeterRemainderSheetRoute({required this.$extra});
  final WaterMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterRemainderSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<WaterMeterResetConfirmDialogRoute>(
  path: RoutePaths.waterMeterResetConfirm,
)
class WaterMeterResetConfirmDialogRoute extends GoRouteData
    with $WaterMeterResetConfirmDialogRoute {
  const WaterMeterResetConfirmDialogRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const WaterMeterResetConfirmDialog());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.dialog(context, state);
}

@TypedGoRoute<WaterMeterSettingsRoute>(path: RoutePaths.waterMeterSettings)
class WaterMeterSettingsRoute extends GoRouteData
    with $WaterMeterSettingsRoute {
  const WaterMeterSettingsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterSettingsScreen(meterId: meterId));
}

@TypedGoRoute<WaterMeterCatOneRoute>(path: RoutePaths.waterMeterCatOne)
class WaterMeterCatOneRoute extends GoRouteData with $WaterMeterCatOneRoute {
  const WaterMeterCatOneRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(WaterMeterCatOneScreen(meterId: meterId));
}

@TypedGoRoute<WaterMeterCatOneApnSheetRoute>(
  path: RoutePaths.waterMeterCatOneConfig,
)
class WaterMeterCatOneApnSheetRoute extends GoRouteData
    with $WaterMeterCatOneApnSheetRoute {
  const WaterMeterCatOneApnSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const WaterMeterCatOneApnSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterListRoute>(path: RoutePaths.electricMeterList)
class ElectricMeterListRoute extends GoRouteData with $ElectricMeterListRoute {
  const ElectricMeterListRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ElectricMeterListScreen());
}

@TypedGoRoute<ElectricMeterAddRoute>(path: RoutePaths.electricMeterAdd)
class ElectricMeterAddRoute extends GoRouteData with $ElectricMeterAddRoute {
  const ElectricMeterAddRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ElectricMeterAddScreen());
}

@TypedGoRoute<ElectricMeterDetailRoute>(path: RoutePaths.electricMeterDetail)
class ElectricMeterDetailRoute extends GoRouteData
    with $ElectricMeterDetailRoute {
  const ElectricMeterDetailRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterDetailScreen(meterId: meterId));
}

@TypedGoRoute<ElectricMeterRechargeSheetRoute>(
  path: RoutePaths.electricMeterRecharge,
)
class ElectricMeterRechargeSheetRoute extends GoRouteData
    with $ElectricMeterRechargeSheetRoute {
  const ElectricMeterRechargeSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterRechargeSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterRenameSheetRoute>(
  path: RoutePaths.electricMeterRename,
)
class ElectricMeterRenameSheetRoute extends GoRouteData
    with $ElectricMeterRenameSheetRoute {
  const ElectricMeterRenameSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterRenameSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterMaxPowerSheetRoute>(
  path: RoutePaths.electricMeterMaxPower,
)
class ElectricMeterMaxPowerSheetRoute extends GoRouteData
    with $ElectricMeterMaxPowerSheetRoute {
  const ElectricMeterMaxPowerSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterMaxPowerSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterDeleteConfirmSheetRoute>(
  path: RoutePaths.electricMeterDeleteConfirm,
)
class ElectricMeterDeleteConfirmSheetRoute extends GoRouteData
    with $ElectricMeterDeleteConfirmSheetRoute {
  const ElectricMeterDeleteConfirmSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterDeleteConfirmSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterOperationRecordsRoute>(
  path: RoutePaths.electricMeterOperationRecords,
)
class ElectricMeterOperationRecordsRoute extends GoRouteData
    with $ElectricMeterOperationRecordsRoute {
  const ElectricMeterOperationRecordsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterOperationRecordsScreen(meterId: meterId));
}

@TypedGoRoute<ElectricMeterUsageRecordsRoute>(
  path: RoutePaths.electricMeterUsageRecords,
)
class ElectricMeterUsageRecordsRoute extends GoRouteData
    with $ElectricMeterUsageRecordsRoute {
  const ElectricMeterUsageRecordsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterUsageRecordsScreen(meterId: meterId));
}

@TypedGoRoute<ElectricMeterPriceSheetRoute>(path: RoutePaths.electricMeterPrice)
class ElectricMeterPriceSheetRoute extends GoRouteData
    with $ElectricMeterPriceSheetRoute {
  const ElectricMeterPriceSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterPriceSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterPayModeSheetRoute>(
  path: RoutePaths.electricMeterPayMode,
)
class ElectricMeterPayModeSheetRoute extends GoRouteData
    with $ElectricMeterPayModeSheetRoute {
  const ElectricMeterPayModeSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterPayModeSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterClearConfirmDialogRoute>(
  path: RoutePaths.electricMeterClearConfirm,
)
class ElectricMeterClearConfirmDialogRoute extends GoRouteData
    with $ElectricMeterClearConfirmDialogRoute {
  const ElectricMeterClearConfirmDialogRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ElectricMeterClearConfirmDialog());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.dialog(context, state);
}

@TypedGoRoute<ElectricMeterRemainderSheetRoute>(
  path: RoutePaths.electricMeterRemainder,
)
class ElectricMeterRemainderSheetRoute extends GoRouteData
    with $ElectricMeterRemainderSheetRoute {
  const ElectricMeterRemainderSheetRoute({required this.$extra});
  final ElectricMeterEntity $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterRemainderSheet(item: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<ElectricMeterResetConfirmDialogRoute>(
  path: RoutePaths.electricMeterResetConfirm,
)
class ElectricMeterResetConfirmDialogRoute extends GoRouteData
    with $ElectricMeterResetConfirmDialogRoute {
  const ElectricMeterResetConfirmDialogRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ElectricMeterResetConfirmDialog());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.dialog(context, state);
}

@TypedGoRoute<ElectricMeterSettingsRoute>(
  path: RoutePaths.electricMeterSettings,
)
class ElectricMeterSettingsRoute extends GoRouteData
    with $ElectricMeterSettingsRoute {
  const ElectricMeterSettingsRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterSettingsScreen(meterId: meterId));
}

@TypedGoRoute<ElectricMeterCatOneRoute>(path: RoutePaths.electricMeterCatOne)
class ElectricMeterCatOneRoute extends GoRouteData
    with $ElectricMeterCatOneRoute {
  const ElectricMeterCatOneRoute({required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(ElectricMeterCatOneScreen(meterId: meterId));
}

@TypedGoRoute<ElectricMeterCatOneApnSheetRoute>(
  path: RoutePaths.electricMeterCatOneConfig,
)
class ElectricMeterCatOneApnSheetRoute extends GoRouteData
    with $ElectricMeterCatOneApnSheetRoute {
  const ElectricMeterCatOneApnSheetRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const ElectricMeterCatOneApnSheet());
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

/// 表计连接成功后的二次确认弹窗（水/电表共用，仅文案不同）。
@TypedGoRoute<MeterConnectionConfirmRoute>(
  path: RoutePaths.meterConnectionConfirm,
)
class MeterConnectionConfirmRoute extends GoRouteData
    with $MeterConnectionConfirmRoute {
  const MeterConnectionConfirmRoute({required this.$extra});
  final MeterConnectionConfirmArgs $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(MeterConnectionConfirmDialog(args: $extra));
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.dialog(context, state);
}

/// Must be registered after all static `/lock/...` routes so paths like
/// `/lock/ekey-send` are not captured by `:lockId` and int-parsed.
@TypedGoRoute<LockDetailRoute>(path: RoutePaths.lockDetail)
class LockDetailRoute extends GoRouteData with $LockDetailRoute {
  const LockDetailRoute({required this.lockId, this.$extra});
  final int lockId;
  final LockEntity? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(LockDetailScreen(lockId: lockId, lock: $extra));
}

@TypedGoRoute<HotelLocksRoute>(path: RoutePaths.hotelLockList)
class HotelLocksRoute extends GoRouteData with $HotelLocksRoute {
  const HotelLocksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(const HotelLockListScreen());
}

@TypedGoRoute<HotelLockDetailRoute>(path: RoutePaths.hotelLockDetail)
class HotelLockDetailRoute extends GoRouteData with $HotelLockDetailRoute {
  const HotelLockDetailRoute({
    required this.lockId,
    this.$extra,
    this.hotelType = 1,
  });
  final int lockId;
  final HotelLockEntity? $extra;

  /// 列表筛选类型：1-酒店锁、2-梯控、3-取电（与 `listByHotel` 一致）。
  final int hotelType;

  @override
  Widget build(BuildContext context, GoRouterState state) => withRouteBackGuard(
    HotelLockDetailScreen(
      lockId: lockId,
      hotelLock: $extra,
      hotelType: hotelType,
    ),
  );
}

@TypedGoRoute<HotelSectorRoute>(path: RoutePaths.hotelSectorSheet)
class HotelSectorRoute extends GoRouteData with $HotelSectorRoute {
  const HotelSectorRoute({required this.$extra});
  final HotelLockEntity $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(HotelSectorSheet(hotelLock: $extra));

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}

@TypedGoRoute<HotelBuildingRoute>(path: RoutePaths.hotelBuildingSheet)
class HotelBuildingRoute extends GoRouteData with $HotelBuildingRoute {
  const HotelBuildingRoute({required this.$extra});
  final HotelLockEntity $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      withRouteBackGuard(HotelBuildingSheet(hotelLock: $extra));

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) =>
      GoTransitions.bottomSheet(context, state);
}
