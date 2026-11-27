// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'TTLock 开放平台 Demo';

  @override
  String get login => '登录';

  @override
  String get logout => '退出登录';

  @override
  String get username => '账号';

  @override
  String get password => '密码';

  @override
  String get register => '注册';

  @override
  String get mine => '我的';

  @override
  String get devices => '其他设备';

  @override
  String get gatewayEntry => '网关';

  @override
  String get gatewayEntrySubtitle => '管理并添加网关';

  @override
  String get waterMeterEntry => '水表';

  @override
  String get waterMeterEntrySubtitle => '蓝牙 + 云端管理';

  @override
  String get electricMeterEntry => '电表';

  @override
  String get electricMeterEntrySubtitle => '蓝牙 + 云端管理';

  @override
  String get locks => '锁';

  @override
  String get config => '开放平台配置';

  @override
  String get about => '关于';

  @override
  String get site => '站点';

  @override
  String get siteCn => '中国站';

  @override
  String get siteOverseas => '境外站';

  @override
  String get clientId => 'Client ID';

  @override
  String get clientSecret => 'Client Secret';

  @override
  String get save => '保存';

  @override
  String get saveSuccess => '保存成功';

  @override
  String get loading => '处理中…';

  @override
  String get configLocalHint => '配置存于本机，config.json 为默认值';

  @override
  String get configSetupHint => '首次使用请填写开放平台 Client ID 与 Client Secret，保存后继续登录';

  @override
  String get configCredentialsRequired => '请填写 Client ID 与 Client Secret';

  @override
  String get uidLabel => 'UID';

  @override
  String get commonRetry => '重试';

  @override
  String get errorNetwork => '网络连接失败，请稍后重试';

  @override
  String get errorHttp => '服务异常（HTTP）';

  @override
  String get errorParse => '数据解析失败';

  @override
  String get errorUnknown => '未知错误，请稍后重试';

  @override
  String get errorBle => '蓝牙操作失败，请重试';

  @override
  String get bluetoothNotOn => '蓝牙未开启，请开启后重试';

  @override
  String get bluetoothPermissionDenied => '蓝牙权限未授予，请在系统设置中开启后重试';

  @override
  String get usernameRequired => '请输入接收方账号';

  @override
  String get bleUnreachable => '请靠近锁或通过网关操作';

  @override
  String get permanentPeriodReadonly => '永久有效期不可修改';

  @override
  String get invalidCyclicSchedule => '请完善循环星期与时段';

  @override
  String get remoteRequired => '请选择遥控';

  @override
  String get photoFaceNeedsGateway => '该锁照片人脸需通过网关下发，请先连接网关';

  @override
  String get unsupportedLockScene => '暂不支持添加此类型设备';

  @override
  String get lockAlreadyInitialized => '该锁已被初始化，请直接使用';

  @override
  String get addLock => '添加锁';

  @override
  String get noLocks => '还没有锁，点击右下角添加';

  @override
  String get locksTab => '锁';

  @override
  String get unlock => '开锁';

  @override
  String get lockBtn => '上锁';

  @override
  String get battery => '电量';

  @override
  String get lockIdLabel => '锁ID';

  @override
  String get macLabel => 'MAC';

  @override
  String get records => '操作记录';

  @override
  String get settings => '设置';

  @override
  String get wifiInfo => 'WiFi 信息';

  @override
  String get wifiPowerSaving => 'WiFi 省电';

  @override
  String get doorNotClosedAlert => '门未关报警';

  @override
  String get workingMode => '工作模式';

  @override
  String get workingModeAllDay => '全天工作';

  @override
  String get workingModeAllDayOff => '全天不工作';

  @override
  String get workingModeCustom => '自定义';

  @override
  String get workingModeNeedsGateway => '修改工作模式需要网关';

  @override
  String get unauthorizedAttempt => '非法尝试告警';

  @override
  String get unauthorizedAttemptCount => '失败次数';

  @override
  String get unauthorizedAttemptLockTime => '锁定时长';

  @override
  String get unauthorizedAttemptNeedsGateway => '修改非法尝试告警需要网关';

  @override
  String get unauthorizedAttemptInvalidCount => '失败次数须为 0–50';

  @override
  String get unauthorizedAttemptInvalidLockTime => '锁定时长须为 0–900 秒';

  @override
  String get groups => '分组';

  @override
  String get noGroups => '还没有分组';

  @override
  String get groupLockCount => '把锁';

  @override
  String get noGroup => '未分组';

  @override
  String get addGroup => '添加分组';

  @override
  String get groupNameHint => '请输入分组名称';

  @override
  String get operating => '操作中…';

  @override
  String get commonCancel => '取消';

  @override
  String get commonConfirm => '确定';

  @override
  String get commonSave => '保存';

  @override
  String get scanning => '正在扫描附近的锁…';

  @override
  String get addingLock => '正在添加';

  @override
  String get rename => '重命名';

  @override
  String get renameHint => '请输入锁名称';

  @override
  String get lockDetail => '锁详情';

  @override
  String get gatewayOnline => '网关在线';

  @override
  String get incompleteLockData => '数据不完整';

  @override
  String get noRecords => '暂无操作记录';

  @override
  String get clearRecords => '清空记录';

  @override
  String get clearRecordsConfirmMessage => '确定清空该锁的全部开锁记录？此操作不可撤销。';

  @override
  String get syncOffline => '同步离线记录';

  @override
  String get recordAll => '全部';

  @override
  String get recordPasscode => '密码';

  @override
  String get recordCard => 'IC卡';

  @override
  String get recordFingerprint => '指纹';

  @override
  String get recordFace => '人脸';

  @override
  String get recordQr => '二维码';

  @override
  String get recordRemote => '遥控';

  @override
  String get recordIdLabel => '记录ID';

  @override
  String get recordTypeBluetoothUnlock => '蓝牙开锁';

  @override
  String get recordTypePasscodeUnlock => '密码开锁';

  @override
  String get recordTypeParkingLockRise => '车位锁升';

  @override
  String get recordTypeParkingLockLower => '车位锁降';

  @override
  String get recordTypeCardUnlock => 'IC卡开锁';

  @override
  String get recordTypeFingerprintUnlock => '指纹开锁';

  @override
  String get recordTypeWristbandUnlock => '手环开锁';

  @override
  String get recordTypeMechanicalKeyUnlock => '机械钥匙开锁';

  @override
  String get recordTypeBluetoothLock => '蓝牙闭锁';

  @override
  String get recordTypeGatewayUnlock => '网关开锁';

  @override
  String get recordTypeIllegalUnlock => '非法开锁';

  @override
  String get recordTypeDoorSensorClosed => '门磁合上（关门）';

  @override
  String get recordTypeDoorSensorOpen => '门磁打开（开门）';

  @override
  String get recordTypeOpenFromInside => '从内部打开门';

  @override
  String get recordTypeFingerprintLock => '指纹关锁';

  @override
  String get recordTypePasscodeLock => '密码关锁';

  @override
  String get recordTypeCardLock => 'IC卡关锁';

  @override
  String get recordTypeMechanicalKeyLock => '机械钥匙关锁';

  @override
  String get recordTypeAppButtonControl => '用APP按键控制锁';

  @override
  String get recordTypeLocalMail => '邮局本地邮件';

  @override
  String get recordTypeRemoteMail => '邮局外地邮件';

  @override
  String get recordTypeTamperAlert => '防撬报警';

  @override
  String get recordTypeAutoLock => '超时自动闭锁';

  @override
  String get recordTypeUnlockButton => '开锁按键开锁';

  @override
  String get recordTypeLockButton => '闭锁按键闭锁';

  @override
  String get recordTypeSystemLocked => '系统被锁定';

  @override
  String get recordTypeHotelCardUnlock => '酒店卡开锁';

  @override
  String get recordTypeHighTemperatureUnlock => '高温开锁';

  @override
  String get recordTypeDeletedCardUnlock => '用已删除的卡开锁';

  @override
  String get recordTypeAppDeadLock => '用APP锁定锁';

  @override
  String get recordTypePasscodeDeadLock => '用密码锁定锁';

  @override
  String get recordTypeCarLeft => '车离开';

  @override
  String get recordTypeRemoteControl => '遥控开、闭锁';

  @override
  String get recordTypeQrUnlockSuccess => '二维码开锁成功';

  @override
  String get recordTypeQrUnlockExpired => '二维码开锁失败，过期';

  @override
  String get recordTypeDoubleLockOn => '开启反锁';

  @override
  String get recordTypeDoubleLockOff => '关闭反锁';

  @override
  String get recordTypeQrLockSuccess => '二维码闭锁成功';

  @override
  String get recordTypeQrUnlockDoubleLocked => '二维码开锁失败，门已反锁';

  @override
  String get recordTypePassageModeAutoUnlock => '常开时间段自动开锁';

  @override
  String get recordTypeDoorUnclosedAlarm => '门未关报警';

  @override
  String get recordTypeUnlockTimeout => '开锁超时';

  @override
  String get recordTypeLockTimeout => '闭锁超时';

  @override
  String get recordTypeFaceUnlockSuccess => '3D人脸开锁成功';

  @override
  String get recordTypeFaceUnlockDoubleLocked => '3D人脸开锁失败-门反锁了';

  @override
  String get recordTypeFaceLock => '3D人脸闭锁';

  @override
  String get recordTypeFaceUnlockExpired => '3D人脸开门失败—已过期或者未生效';

  @override
  String get recordTypeAppGrantUnlock => 'App授权按键开锁成功';

  @override
  String get recordTypeGatewayGrantUnlock => '网关授权按键开锁成功';

  @override
  String get recordTypeDualAuthBluetooth => '双重认证蓝牙开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthPasscode => '双重认证密码开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthFingerprint => '双重认证指纹开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthCard => '双重认证IC卡开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthFace => '双重认证人脸开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthRemote => '双重认证遥控开锁验证成功，等待第二用户';

  @override
  String get recordTypeDualAuthPalmVein => '双重认证掌静脉开锁验证成功，等待第二用户';

  @override
  String get recordTypePalmVeinUnlockSuccess => '掌静脉开锁成功';

  @override
  String get recordTypePalmVeinUnlockDoubleLocked => '掌静脉开锁失败-门反锁了';

  @override
  String get recordTypePalmVeinLock => '掌静脉闭锁';

  @override
  String get recordTypePalmVeinUnlockExpired => '掌静脉开门失败—已过期或者未生效';

  @override
  String get recordTypeAdminPasscodeUnlock => '管理员密码开锁';

  @override
  String get deleteLock => '删除锁';

  @override
  String get transfer => '转让';

  @override
  String get receiverUsername => '接收方账号';

  @override
  String get changeGroup => '设置分组';

  @override
  String get autoLockTime => '自动闭锁';

  @override
  String get autoLockOff => '关闭';

  @override
  String get secondsUnit => '秒';

  @override
  String get sound => '声音';

  @override
  String get soundUnknown => '未知';

  @override
  String get soundVolume => '音量';

  @override
  String soundVolumeLevel(int level) {
    return '音量 $level';
  }

  @override
  String get privacyLock => '反锁';

  @override
  String get tamperAlert => '防撬报警';

  @override
  String get resetButton => '重置键';

  @override
  String get remoteUnlock => '远程开锁';

  @override
  String get doubleAuth => '双重认证';

  @override
  String get openDirection => '开门方向';

  @override
  String get openDirectionLeft => '左开';

  @override
  String get openDirectionRight => '右开';

  @override
  String get passageMode => '常开模式';

  @override
  String get passageModeAllDay => '全天常开';

  @override
  String get passageModeAutoUnlock => '常开自动开锁';

  @override
  String get passageModeStartTime => '开始时间';

  @override
  String get passageModeEndTime => '结束时间';

  @override
  String get passageModeNeedWeekdays => '请选择至少一个星期';

  @override
  String get passageModeInvalidTime => '结束时间必须晚于开始时间';

  @override
  String get weekMon => '一';

  @override
  String get weekTue => '二';

  @override
  String get weekWed => '三';

  @override
  String get weekThu => '四';

  @override
  String get weekFri => '五';

  @override
  String get weekSat => '六';

  @override
  String get weekSun => '日';

  @override
  String get refreshSystemInfo => '刷新系统信息';

  @override
  String get lockInfo => '锁信息';

  @override
  String get refreshFromLock => '从锁刷新';

  @override
  String get systemInfoSection => '系统信息';

  @override
  String get lockAliasLabel => '锁别名';

  @override
  String get lockNameLabel => '锁名称';

  @override
  String get featureValueLabel => '特征值';

  @override
  String get hasGatewayLabel => '网关';

  @override
  String get initDateLabel => '初始化时间';

  @override
  String get modelNum => '型号';

  @override
  String get hardwareRevision => '硬件版本';

  @override
  String get firmwareRevision => '固件版本';

  @override
  String get syncSettingsFromLock => '从锁同步设置';

  @override
  String get refreshBattery => '刷新电量';

  @override
  String get syncDate => '同步时间';

  @override
  String get checkUpgrade => '检查固件';

  @override
  String get upgradeNone => '已是最新';

  @override
  String get upgradeAvailable => '有可用升级';

  @override
  String get nbRegister => 'NB 注册';

  @override
  String get nbNodeId => 'NB Node ID';

  @override
  String get nbCardNumber => 'NB 卡号';

  @override
  String get nbOperator => 'NB 运营商';

  @override
  String get nbRssi => 'NB RSSI';

  @override
  String get wifiIp => 'IP';

  @override
  String get wifiSubnetMask => '子网掩码';

  @override
  String get wifiDefaultGateway => '默认网关';

  @override
  String get wifiMacLabel => 'WiFi MAC';

  @override
  String get online => '在线';

  @override
  String get offline => '离线';

  @override
  String get eKey => '电子钥匙';

  @override
  String get sendEkey => '发送钥匙';

  @override
  String get liftTitle => '梯控';

  @override
  String get liftEntry => '梯控';

  @override
  String get liftFloorsHint => '选择要激活的楼层';

  @override
  String get liftActivate => '激活';

  @override
  String get liftActivateEntry => '楼层激活';

  @override
  String get liftActivateSuccess => '楼层激活成功';

  @override
  String get liftActivateFailed => '楼层激活失败';

  @override
  String get liftRemoteFailedBleFallback => '远程不可用，已通过蓝牙激活并刷新锁数据';

  @override
  String get liftBleActivatedSyncFailed => '已通过蓝牙激活，但刷新锁数据失败';

  @override
  String get liftWorkMode => '工作模式';

  @override
  String get liftWorkModeAllFloors => '全部楼层';

  @override
  String get liftWorkModeAllFloorsHint => '刷卡可控制全部关联楼层';

  @override
  String get liftWorkModeSpecificFloors => '指定楼层';

  @override
  String get liftWorkModeSpecificFloorsHint => '刷卡控制卡内数据对应的楼层';

  @override
  String get liftWorkModeSuccess => '工作模式设置成功';

  @override
  String get liftControlableFloors => '关联楼层';

  @override
  String get liftControlableFloorsHint => '选择梯控可控制的楼层';

  @override
  String get liftControlableFloorsSuccess => '关联楼层设置成功';

  @override
  String get powerSwitchWorkMode => '工作模式';

  @override
  String get powerSwitchWorkModeAllCards => '全部卡';

  @override
  String get powerSwitchWorkModeAllCardsHint => '任意卡均可取电';

  @override
  String get powerSwitchWorkModeHotelCard => '酒店卡';

  @override
  String get powerSwitchWorkModeHotelCardHint => '仅本酒店卡可取电';

  @override
  String get powerSwitchWorkModeRoomCard => '房卡';

  @override
  String get powerSwitchWorkModeRoomCardHint => '仅房卡可取电';

  @override
  String get powerSwitchWorkModeSuccess => '工作模式设置成功';

  @override
  String get powerSwitchControlableLock => '关联门锁';

  @override
  String get powerSwitchControlableLockSuccess => '关联门锁设置成功';

  @override
  String get powerSwitchNoHotelLocks => '暂无酒店锁可关联';

  @override
  String get powerSwitchHotelLocksLoadFailed => '加载酒店锁列表失败';

  @override
  String get passcode => '密码';

  @override
  String get getPasscode => '获取密码';

  @override
  String get customPasscode => '自定义密码';

  @override
  String get icCard => 'IC卡';

  @override
  String get fingerprint => '指纹';

  @override
  String get face => '人脸';

  @override
  String get palmVein => '掌静脉';

  @override
  String get qrCode => '二维码';

  @override
  String get addQrCode => '添加二维码';

  @override
  String get qrCodeContent => '二维码内容';

  @override
  String get refreshQrCodeData => '刷新二维码数据';

  @override
  String get remote => '遥控';

  @override
  String get addRemote => '添加遥控';

  @override
  String get remoteName => '遥控名称';

  @override
  String get remoteMac => '遥控 MAC';

  @override
  String get accessories => '配件';

  @override
  String get wirelessKeypad => '无线键盘';

  @override
  String get addWirelessKeypad => '添加无线键盘';

  @override
  String get noWirelessKeypads => '还没有无线键盘';

  @override
  String get wirelessKeypadName => '键盘名称';

  @override
  String get deleteWirelessKeypad => '删除无线键盘';

  @override
  String get deleteWirelessKeypadConfirm => '确认删除该无线键盘？';

  @override
  String get keypadTypeNormal => '普通键盘';

  @override
  String get keypadTypeMulti => '多功能键盘';

  @override
  String get keypadTypeNormalHint => '数字键开锁';

  @override
  String get keypadTypeMultiHint => '数字键 + IC卡 + 指纹';

  @override
  String get keypadTypeLabel => '键盘类型';

  @override
  String get keypadSlot => '槽位';

  @override
  String get keypadGuideNormal =>
      '首次添加请在键盘上输入 *529# 激活；第二次添加请输入 *529#上一把锁的管理员密码#，然后靠近手机扫描。';

  @override
  String get keypadGuideMulti => '请先用管理员密码进入设置并开启配对；绑定会占用一个锁槽位。';

  @override
  String get scanningKeypads => '正在扫描附近键盘…';

  @override
  String get noKeypadsScanned => '未发现匹配类型的键盘，请靠近后重试';

  @override
  String get doorSensor => '门磁';

  @override
  String get addDoorSensor => '添加门磁';

  @override
  String get deleteDoorSensor => '删除门磁';

  @override
  String get deleteDoorSensorConfirm => '确认解绑并删除该门磁？';

  @override
  String get doorSensorName => '门磁名称';

  @override
  String get doorSensorUnbound => '未添加';

  @override
  String get doorSensorAlertHint => '未设置';

  @override
  String get scanningDoorSensors => '正在扫描附近门磁…';

  @override
  String get noDoorSensorsScanned => '未发现门磁，请靠近后重试';

  @override
  String get doorSensorAlreadyBound => '该锁已绑定门磁';

  @override
  String get scanningRemotes => '正在扫描附近遥控…';

  @override
  String get startScan => '扫描';

  @override
  String get noRemotesScanned => '未发现遥控，请靠近后重试';

  @override
  String get noEkeys => '还没有电子钥匙';

  @override
  String get noPasscodes => '还没有密码';

  @override
  String get noCards => '还没有 IC 卡';

  @override
  String get noFingerprints => '还没有指纹';

  @override
  String get noFaces => '还没有人脸';

  @override
  String get noPalmVeins => '还没有掌静脉';

  @override
  String get noQrCodes => '还没有二维码';

  @override
  String get noRemotes => '还没有遥控';

  @override
  String get keyName => '钥匙名称';

  @override
  String get authorizedAdmin => '授权管理员';

  @override
  String get freeze => '冻结';

  @override
  String get unfreeze => '解冻';

  @override
  String get authorize => '授权';

  @override
  String get unauthorize => '取消授权';

  @override
  String get validityPeriod => '有效期';

  @override
  String get permanent => '永久';

  @override
  String get limited => '限期';

  @override
  String get once => '单次';

  @override
  String get recurring => '循环';

  @override
  String get recurringMode => '循环方式';

  @override
  String get recurringDaily => '每日';

  @override
  String get recurringWorkday => '工作日';

  @override
  String get recurringWeekend => '周末';

  @override
  String get weekdayMon => '周一';

  @override
  String get weekdayTue => '周二';

  @override
  String get weekdayWed => '周三';

  @override
  String get weekdayThu => '周四';

  @override
  String get weekdayFri => '周五';

  @override
  String get weekdaySat => '周六';

  @override
  String get weekdaySun => '周日';

  @override
  String get startTimeOfDay => '开始时刻';

  @override
  String get endTimeOfDay => '结束时刻';

  @override
  String get selectRecurringDays => '请选择循环星期';

  @override
  String get endTimeMustAfterStart => '结束时刻必须晚于开始时刻';

  @override
  String get startDate => '开始时间';

  @override
  String get endDate => '结束时间';

  @override
  String get waitingTapCard => '请在锁上刷卡';

  @override
  String collectingFingerprint(int current, int total) {
    return '请按压指纹 $current/$total';
  }

  @override
  String get collectingFace => '请正对锁摄像头';

  @override
  String get faceEnrollOnLock => '锁上录入';

  @override
  String get faceEnrollByPhoto => '使用照片';

  @override
  String get facePhotoPickTitle => '选择人脸照片';

  @override
  String get facePhotoFromGallery => '从相册选择';

  @override
  String get facePhotoFromCamera => '拍照';

  @override
  String get facePhotoHint => '正面、光线均匀、单人、无遮挡';

  @override
  String get facePhotoTooLarge => '照片过大，请压缩到 2MB 以内';

  @override
  String get facePhotoExtracting => '正在提取特征值';

  @override
  String get collectingPalmVein => '请将手掌置于感应区';

  @override
  String get enrollSuccess => '录入成功';

  @override
  String get copyLink => '复制链接';

  @override
  String get linkCopied => '已复制';

  @override
  String get unlockLink => '远程开锁链接';

  @override
  String get deleteConfirm => '确认删除？';

  @override
  String get passcodeHint => '4–9 位数字';

  @override
  String get nameHint => '名称（可选）';

  @override
  String get passcodeName => '密码名称';

  @override
  String get changePasscode => '修改密码';

  @override
  String get copyPasscode => '复制密码';

  @override
  String get cardName => '卡名称';

  @override
  String get fingerprintName => '指纹名称';

  @override
  String get faceName => '人脸名称';

  @override
  String get palmVeinName => '掌静脉名称';

  @override
  String get startEnroll => '开始录入';

  @override
  String get enrollCancelHint => '取消后锁仍处于录入模式，请靠近锁等待超时';

  @override
  String get keypadCardEnrollHint => '请将卡片贴近无线键盘';

  @override
  String get keypadFingerprintEnrollHint => '请按任意键激活键盘，等待蓝色呼吸灯亮起后再放下指纹';

  @override
  String get cardPendingRegister => '卡片已录入锁，但云端未登记';

  @override
  String get fingerprintPendingRegister => '指纹已录入锁，但云端未登记';

  @override
  String get pendingRegisterRetry => '重试登记';

  @override
  String get faceLockProgressGuide => '请面向门锁摄像头，按语音提示完成采集';

  @override
  String get faceLockRetryAdd => '重新添加';

  @override
  String get faceEnrollSuccess => '人脸添加成功';

  @override
  String get errorFirmwareFaceNoFaceDetected => '未检测到人脸';

  @override
  String get errorFirmwareFaceTooClose => '人脸距离太近';

  @override
  String get errorFirmwareFaceTooFarAway => '人脸距离太远';

  @override
  String get errorFirmwareFaceFaceCovered => '人脸被遮挡';

  @override
  String get palmVeinLockProgressGuide => '请将手掌置于锁感应区，按语音提示完成采集';

  @override
  String get palmVeinLockRetryAdd => '重新添加';

  @override
  String get palmVeinEnrollSuccess => '掌静脉添加成功';

  @override
  String get errorFirmwarePalmVeinNoPalmDetected => '未检测到掌静脉';

  @override
  String get errorFirmwarePalmVeinPosition => '掌部位置不清晰，请调整手掌位置';

  @override
  String get errorFirmwarePalmVeinAngle => '请调整手掌角度';

  @override
  String get errorFirmwarePalmVeinBlocked => '手掌被遮挡';

  @override
  String get errorFirmwarePalmVeinBlur => '请保持手掌稳定';

  @override
  String get errorFirmwarePalmVeinBack => '请将掌心朝向锁';

  @override
  String get gatewayTitle => '网关';

  @override
  String get gatewayAdd => '添加网关';

  @override
  String get gatewayScanHint => '正在搜索附近的网关…';

  @override
  String get gatewayNoDevice => '未发现网关，请确认网关已通电并靠近手机';

  @override
  String get gatewayConnecting => '正在连接网关…';

  @override
  String get gatewayWifiHint => '正在获取网关附近的 Wi-Fi…';

  @override
  String get gatewayNoWifi => '未发现 Wi-Fi';

  @override
  String get gatewayWifiPassword => 'Wi-Fi 密码';

  @override
  String get gatewayAccountPassword => '账号密码';

  @override
  String get gatewayAccountPasswordHint => '输入当前 App 的登录密码';

  @override
  String get gatewayInitializing => '正在初始化网关，请勿离开…';

  @override
  String get gatewayConfirmingHint => '正在确认网关注册，可能需要几分钟…';

  @override
  String get gatewayAddDone => '网关添加成功';

  @override
  String get gatewayInitFailed => '网关初始化失败';

  @override
  String get gatewayInitNotConfirmed => '网关尚未在云端注册，请稍后重试';

  @override
  String get gatewayUserUidMissing => '登录状态异常，请重新登录后再试';

  @override
  String get gatewayConnectFailed => '网关连接失败';

  @override
  String get gatewayRename => '网关改名';

  @override
  String get gatewayDeleteConfirm => '删除网关';

  @override
  String get gatewayDeleteConfirmMessage => '删除后将解除该网关与所有锁的绑定，确认删除？';

  @override
  String get gatewayEmpty => '暂无网关';

  @override
  String get gatewayNameLabel => '网关名称';

  @override
  String get gatewayVersion => '固件版本';

  @override
  String get gatewayNetworkName => '网络名称';

  @override
  String get gatewayNetworkMac => '网络 MAC';

  @override
  String get gatewayLockCount => '绑定锁数';

  @override
  String get waterMeterTitle => '水表';

  @override
  String get waterMeterAdd => '添加水表';

  @override
  String get waterMeterScanHint => '正在搜索附近的水表…';

  @override
  String get waterMeterNoDevice => '未发现水表，请确认水表已通电并靠近手机';

  @override
  String get waterMeterSubmitting => '正在添加水表，请勿离开…';

  @override
  String get waterMeterApnTitle => '配置 APN';

  @override
  String get waterMeterApnHint => '该水表为 4G（Cat.1）表，海外使用须先填写运营商 APN，再写入服务器地址。';

  @override
  String get waterMeterApnLabel => 'APN';

  @override
  String get waterMeterConfiguring => '正在配置服务器，请勿离开…';

  @override
  String get waterMeterConnecting => '正在连接水表，请勿离开…';

  @override
  String get waterMeterAwaitConfirm => '等待确认…';

  @override
  String get waterMeterConnectionConfirm => '确认屏幕红灯闪烁后，点击确认进入下一步';

  @override
  String get waterMeterAddDone => '水表添加成功';

  @override
  String get waterMeterName => '水表名称';

  @override
  String get waterMeterPayMode => '计费模式';

  @override
  String get waterMeterPayModeEnergy => '计能模式';

  @override
  String get waterMeterPayModePrepaid => '预付费';

  @override
  String get waterMeterPrice => '单价';

  @override
  String get waterMeterPriceUnit => '元/吨';

  @override
  String get waterMeterTotal => '累计用量';

  @override
  String get waterMeterRemainder => '剩余用量';

  @override
  String get waterMeterPowerSwitch => '通断电';

  @override
  String get waterMeterRecharge => '充值';

  @override
  String get waterMeterRechargeAmount => '充值金额';

  @override
  String get waterMeterRechargeM3 => '充值水量';

  @override
  String get waterMeterRechargeDone => '充值成功';

  @override
  String get waterMeterRecords => '记录';

  @override
  String get waterMeterRename => '改名';

  @override
  String get waterMeterDeleteConfirm => '删除水表';

  @override
  String get waterMeterDeleteConfirmMessage => '删除后将无法恢复该水表，确认删除？';

  @override
  String get waterMeterDeleteSuccess => '删除成功';

  @override
  String get waterMeterEmpty => '暂无水表';

  @override
  String get electricMeterTitle => '电表';

  @override
  String get electricMeterAdd => '添加电表';

  @override
  String get electricMeterScanHint => '正在搜索附近的电表…';

  @override
  String get electricMeterNoDevice => '未发现电表，请确认电表已通电并靠近手机';

  @override
  String get electricMeterSubmitting => '正在添加电表，请勿离开…';

  @override
  String get electricMeterApnTitle => '配置 APN';

  @override
  String get electricMeterApnHint =>
      '该电表为 4G（Cat.1）表，海外使用须先填写运营商 APN，再写入服务器地址。';

  @override
  String get electricMeterApnLabel => 'APN';

  @override
  String get electricMeterConfiguring => '正在配置服务器，请勿离开…';

  @override
  String get electricMeterConnecting => '正在连接电表，请勿离开…';

  @override
  String get electricMeterAwaitConfirm => '等待确认…';

  @override
  String get electricMeterConnectionConfirm => '确认屏幕红灯交替闪烁后，点击确认进入下一步';

  @override
  String get electricMeterAddDone => '电表添加成功';

  @override
  String get electricMeterName => '电表名称';

  @override
  String get electricMeterPayMode => '计费模式';

  @override
  String get electricMeterPayModeEnergy => '计能模式';

  @override
  String get electricMeterPayModePrepaid => '预付费';

  @override
  String get electricMeterPrice => '单价';

  @override
  String get electricMeterPriceUnit => '元/千瓦时';

  @override
  String get electricMeterTotal => '累计用量';

  @override
  String get electricMeterRemainder => '剩余用量';

  @override
  String get electricMeterMaxPower => '最大功率';

  @override
  String get electricMeterMaxPowerHint => '请输入最大功率';

  @override
  String get electricMeterMaxPowerDone => '最大功率修改成功';

  @override
  String get electricMeterPowerSwitch => '通断电';

  @override
  String get electricMeterRecharge => '充值';

  @override
  String get electricMeterRechargeAmount => '充值金额';

  @override
  String get electricMeterRechargeKwh => '充值电量';

  @override
  String get electricMeterRechargeDone => '充值成功';

  @override
  String get electricMeterRecords => '记录';

  @override
  String get electricMeterRename => '改名';

  @override
  String get electricMeterEmpty => '暂无电表';

  @override
  String get electricMeterDeleteConfirm => '删除电表';

  @override
  String get electricMeterDeleteConfirmMessage => '删除后将无法恢复该电表，确认删除？';

  @override
  String get meterSettings => '设备设置';

  @override
  String get meterOperationRecords => '操作记录';

  @override
  String get meterUsageRecordsElectric => '用电记录';

  @override
  String get meterUsageRecordsWater => '用水记录';

  @override
  String get meterInfo => '设备信息';

  @override
  String get meterCatOne => '4G 网络';

  @override
  String get meterCatOneUnconfigured => '该表的 4G 模块尚未配置成功';

  @override
  String get meterFirmware => '固件升级';

  @override
  String get meterReadData => '抄表';

  @override
  String get meterClear => '清零';

  @override
  String get meterClearConfirmTitle => '确认清零？';

  @override
  String get meterClearConfirmBody => '将清除该表当前的剩余用量，此操作不可撤销。';

  @override
  String get electricMeterPriceEdit => '电价调整';

  @override
  String get waterMeterPriceEdit => '水价调整';

  @override
  String get meterPayModeEdit => '计费模式';

  @override
  String get meterTotalUsageEdit => '总用量调整';

  @override
  String get meterNearbyRequired => '该操作需靠近设备才能完成，请确认已在设备附近。';

  @override
  String get meterRecordTypeRecharge => '充值';

  @override
  String get meterRecordTypePowerOff => '断电';

  @override
  String get meterRecordTypePowerOn => '通电';

  @override
  String get meterRecordTypeRead => '抄表';

  @override
  String get meterRecordTypePrice => '单价修改';

  @override
  String get meterRecordTypeClear => '清零';

  @override
  String get meterRecordTypePaying => '充值中';

  @override
  String get meterDateTypeDay => '日';

  @override
  String get meterDateTypeMonth => '月';

  @override
  String get meterDateTypeYear => '年';

  @override
  String get meterUnitKwh => '千瓦时';

  @override
  String get meterUnitTon => '吨';

  @override
  String get meterUnitKw => '千瓦';

  @override
  String get meterEmptyRecords => '暂无记录';

  @override
  String get meterCatOneRssiGrade => '信号等级';

  @override
  String get meterCatOneRssiUnknown => '未知';

  @override
  String get meterCatOneRssiPoor => '差';

  @override
  String get meterCatOneRssiMedium => '中';

  @override
  String get meterCatOneRssiStrong => '强';

  @override
  String get meterCatOneNodeId => '模块号';

  @override
  String get meterCatOneCardNumber => '卡号';

  @override
  String get meterCatOneOperator => '运营商';

  @override
  String get meterCatOneImsi => '手机号';

  @override
  String get meterCatOneApn => 'APN';

  @override
  String get meterCatOneOverseaCard => '海外卡';

  @override
  String get meterCatOneYes => '是';

  @override
  String get meterCatOneNo => '否';

  @override
  String get meterCatOneConfigureServer => '配置服务器';

  @override
  String get meterCatOneReconfigure => '重新配置';

  @override
  String get meterCatOneNeedNearby => '配置服务器需靠近设备才能完成，请确认已在设备附近。';

  @override
  String get meterCatOneUnavailable => '4G 网络信息暂不可用';

  @override
  String get meterCatOneApnSheetTitle => '配置 APN';

  @override
  String get meterCatOneApnSheetHint => '海外使用须填写运营商 APN，再写入服务器地址。';

  @override
  String get meterCatOneApnLabel => 'APN';

  @override
  String get meterOps => '操作';

  @override
  String get meterNumber => '表号';

  @override
  String get meterMac => 'MAC';

  @override
  String get meterModelNum => '型号';

  @override
  String get meterHardwareRevision => '硬件版本';

  @override
  String get meterFirmwareRevision => '固件版本';

  @override
  String get meterFeatureValue => '特征值';

  @override
  String get meterSyncDate => '抄表时间';

  @override
  String get meterGroupName => '分组';

  @override
  String get meterFirmwareCurrent => '当前版本';

  @override
  String get meterFirmwareLatest => '最新版本';

  @override
  String get meterFirmwareNeedUpgrade => '有新版本可升级';

  @override
  String get meterFirmwareUpToDate => '已是最新版本';

  @override
  String get meterFirmwareUnavailable => '固件信息暂不可用';

  @override
  String get meterPriceHint => '请输入单价';

  @override
  String get meterPriceInvalid => '请输入大于 0 的单价';

  @override
  String get meterPayModeSwitchTitle => '计费模式';

  @override
  String get meterTotalUsageHint => '请输入总用量';

  @override
  String get meterTotalUsageInvalid => '请输入大于 0 的总用量';

  @override
  String get meterAddSuccessTitle => '添加成功';

  @override
  String get meterAddSuccessNameLabel => '名称（非必填）';

  @override
  String get meterAddSuccessApnLabel => 'APN（必填）';

  @override
  String get meterAddSuccessApnHint => '该表为 4G（Cat.1）表，海外使用须填写运营商 APN。';

  @override
  String get meterAddSuccessDone => '完成';

  @override
  String get meterAddSuccessCatOneHint => '4G 配置未完成，可稍后到「4G 网络」页重试。';

  @override
  String get meterRecordTypeAll => '全部';

  @override
  String get meterRecordTypeWaterOff => '断水';

  @override
  String get meterRecordTypeWaterOn => '通水';

  @override
  String get meterRecordTypeClearRemainder => '清除剩余电量';

  @override
  String get meterRecordTypeClearRemainderWater => '清除剩余水量';

  @override
  String get meterRecordTypePayModeSwitch => '付费类型切换';

  @override
  String get meterRecordTypePowerOnOff => '通断电';

  @override
  String get meterRecordTypePowerOnOffWater => '通断水';

  @override
  String get meterRecordTypeSetTotalUsage => '设置水量';

  @override
  String get standaloneDoorSensorTitle => '独立门磁';

  @override
  String get addStandaloneDoorSensor => '添加独立门磁';

  @override
  String get standaloneDoorSensorEmpty => '暂无独立门磁';

  @override
  String get standaloneDoorScanningDevice => '正在搜索附近的独立门磁…';

  @override
  String get standaloneDoorScanHint => '正在搜索附近的独立门磁…';

  @override
  String get standaloneDoorNoDevice => '未发现独立门磁，请确认设备已通电并靠近手机';

  @override
  String get standaloneDoorDeviceName => '设备名称';

  @override
  String get standaloneDoorWifiName => 'Wi-Fi 名称';

  @override
  String get standaloneDoorWifiPassword => 'Wi-Fi 密码';

  @override
  String get standaloneDoorInitializing => '正在添加独立门磁，请勿离开…';

  @override
  String get standaloneDoorAddFailed => '独立门磁添加失败';

  @override
  String get standaloneDoorUnbound => '未添加';

  @override
  String get standaloneDoorState => '状态';

  @override
  String get standaloneDoorClosed => '闭合';

  @override
  String get standaloneDoorOpen => '打开';

  @override
  String get standaloneDoorUnknown => '未知';

  @override
  String get standaloneDoorWifiMac => 'Wi-Fi MAC';

  @override
  String get standaloneDoorFeatureValue => '能力值';

  @override
  String get standaloneDoorFirmware => '固件版本';

  @override
  String get standaloneDoorNumber => '设备编号';

  @override
  String get standaloneDoorRename => '改名';

  @override
  String get standaloneDoorDeleteConfirm => '删除独立门磁';

  @override
  String get standaloneDoorDeleteConfirmMessage => '删除后将无法恢复该独立门磁，确认删除？';

  @override
  String get standaloneDoorAlertConfig => '告警配置';

  @override
  String get standaloneDoorWifiConfig => 'Wi-Fi 重配';

  @override
  String get standaloneDoorWifiRepowerHint => '请重新给独立门磁通电，通电完成后再继续配网。';

  @override
  String get standaloneDoorUserManage => '用户管理';

  @override
  String get standaloneDoorNotCloseAlert => '未关门报警';

  @override
  String get standaloneDoorLongTimeNotOpenAlert => '久未打开报警';

  @override
  String get standaloneDoorNotCloseSecondLabel => '未关门报警时长（秒）';

  @override
  String get standaloneDoorNotOpenDayLabel => '久未打开报警（天）';

  @override
  String get standaloneDoorAddUser => '添加用户';

  @override
  String get standaloneDoorAddUserAccountHint => '请输入账号';

  @override
  String get standaloneDoorAddUserHint => '请输入姓名';

  @override
  String get standaloneDoorUserListEmpty => '暂无用户';

  @override
  String get wifiConfig => '配置网络';

  @override
  String get wifiConfigHint => '选择锁要连接的 WiFi 并输入密码，配置完成后锁将自动连接服务器。';

  @override
  String get currentNetwork => '当前网络';

  @override
  String get wifiNetwork => 'WiFi 网络';

  @override
  String get notSelected => '未选择';

  @override
  String get selectWifiNetwork => '选择 WiFi';

  @override
  String get noAvailableWifi => '未扫描到可用 WiFi';

  @override
  String get rescan => '重新扫描';

  @override
  String get wifiPasswordLabel => 'WiFi 密码';

  @override
  String get pleaseSelectWifiNetwork => '请先选择 WiFi 网络';

  @override
  String get pleaseEnterWifiPasswordLabel => '请输入 WiFi 密码';

  @override
  String get missingLockDataCannotScanWifi => '缺少锁数据，无法扫描 WiFi';

  @override
  String get missingLockDataCannotConfigWifi => '缺少锁数据，无法配置网络';

  @override
  String get powerSavingMode => '省电模式';

  @override
  String get advancedSettings => '高级设置';

  @override
  String get staticIpConfigDnsConfig => '静态 IP 与 DNS 配置';

  @override
  String get useStaticIp => '使用静态 IP';

  @override
  String get staticIpAddress => 'IP 地址';

  @override
  String get staticIpAddressExample => '如 192.168.1.50';

  @override
  String get subnetMask => '子网掩码';

  @override
  String get subnetMaskExample => '如 255.255.255.0';

  @override
  String get defaultGateway => '默认网关';

  @override
  String get defaultGatewayExample => '如 192.168.1.1';

  @override
  String get useCustomDns => '自定义 DNS';

  @override
  String get preferredDns => '首选 DNS';

  @override
  String get alternateDnsOptional => '备用 DNS（可选）';

  @override
  String get staticIpAddressFormatIncorrect => 'IP 地址格式不正确';

  @override
  String get subnetMaskFormatIncorrect => '子网掩码格式不正确';

  @override
  String get defaultGatewayFormatIncorrect => '默认网关格式不正确';

  @override
  String get preferredDnsFormatIncorrect => '首选 DNS 格式不正确';

  @override
  String get alternateDnsFormatIncorrect => '备用 DNS 格式不正确';

  @override
  String get wifiConfigSuccess => '网络配置成功';

  @override
  String get startConfig => '开始配置';

  @override
  String get hotelTitle => '酒店';

  @override
  String get hotelLockTypeHotel => '酒店锁';

  @override
  String get hotelLockTypeLift => '梯控';

  @override
  String get hotelLockTypePower => '取电';

  @override
  String get hotelEmptyTitle => '该账号下没有酒店锁';

  @override
  String get hotelEmptyBody => '酒店锁列表只能显示在「通通酒店」APP 里添加的锁，或本应用初始化时写入了酒店信息的锁。';

  @override
  String get hotelUnassigned => '未分配';

  @override
  String get hotelSearchHint => '搜索锁别名';

  @override
  String get hotelLoadFailed => '加载失败';

  @override
  String get hotelRetry => '重试';

  @override
  String get hotelNotSupported => '不支持';

  @override
  String get cardEncoderUnavailable => '酒店信息不可用（需账号已创建酒店）';

  @override
  String get hotelCloudPending => '云端未同步';

  @override
  String get hotelBuildingFloor => '楼栋/楼层';

  @override
  String get hotelSector => '卡扇区';

  @override
  String get hotelSectorHint => '选择该锁读取酒店卡的扇区（1–10）';

  @override
  String get hotelSectorSave => '保存';

  @override
  String get hotelWriteBuildingFloor => '写入楼栋/楼层';

  @override
  String get hotelBuildingNumber => '楼栋号';

  @override
  String get hotelFloorNumber => '楼层号';

  @override
  String get hotelIcKey => 'IC 密钥';

  @override
  String get hotelGetIcKey => '获取';

  @override
  String get hotelCopySuccess => '已复制';

  @override
  String get hotelOpenLockDetail => '打开锁详情';

  @override
  String get hotelAlias => '别名';

  @override
  String get hotelCloudRetry => '重试同步';

  @override
  String get hotelInitDate => '初始化时间';

  @override
  String get hotelGroupName => '分组';

  @override
  String get hotelMac => 'MAC';

  @override
  String get hotelElectricQuantity => '电量';

  @override
  String get enrollTimeout => '未检测到刷卡或指纹，请重试';

  @override
  String get keypadSlots => '槽位';

  @override
  String keypadSlotLabel(int slot) {
    return '槽位 $slot';
  }

  @override
  String get keypadSlotEmpty => '未绑定';

  @override
  String get keypadSlotMine => '本锁';

  @override
  String keypadSlotLimit(int limit) {
    return '可绑定 $limit 把锁';
  }

  @override
  String get keypadSlotsUnavailable => '无法读取槽位（需对该键盘关联的锁有权限）';

  @override
  String keypadSlotsLoadFailed(String reason) {
    return '槽位读取失败：$reason';
  }

  @override
  String get keypadUnbindFromLock => '解除绑定';

  @override
  String get keypadUnbindConfirm => '请先在键盘上输入 *529#，确认后解除本锁与该键盘的绑定。';

  @override
  String get keypadCloudPending => '键盘已解绑，但云端未同步';

  @override
  String get keypadCloudRetry => '重试同步';

  @override
  String get keypadEnrollCard => '录入卡片';

  @override
  String get keypadEnrollFingerprint => '录入指纹';

  @override
  String get low => '低';

  @override
  String get medium => '中';

  @override
  String get high => '高';

  @override
  String get veryHigh => '很高';

  @override
  String get extreme => '最高';

  @override
  String get off => '关';

  @override
  String get on => '开';

  @override
  String get sensitivity => '灵敏度';

  @override
  String get sensitivityOff => '关闭';

  @override
  String get lightTime => '照明时长';

  @override
  String get lightTimeHint => '照明持续时间（秒）';

  @override
  String get bluetoothAdvertisingInterval => '蓝牙广播间隔';

  @override
  String get bluetoothAdvertisingIntervalCurrent => '当前间隔';

  @override
  String get bluetoothAdvertisingIntervalUnknown => '未能读取广播间隔';

  @override
  String get bluetoothAdvertisingIntervalPick => '选择广播间隔';

  @override
  String get bluetoothAdvertisingIntervalSetSuccess => '广播间隔已设置';

  @override
  String get motorTorque => '电机扭矩';

  @override
  String motorTorqueLevel(int level) {
    return '等级 $level';
  }

  @override
  String get latchBolt => '斜舌设置';

  @override
  String get latchBoltHint => '斜舌保持时间（秒），有效范围 2–10';

  @override
  String get latchBoltDriveLevelHint => '斜舌回转距离，有效范围 1–20；0 表示不控制';

  @override
  String get latchBoltDriveLevelNoControl => '不控制';

  @override
  String get latchBoltKeepTimeHint => '斜舌保持时间（秒），有效范围 2–10';

  @override
  String get lockTime => '锁时间';

  @override
  String get lockTimeCurrent => '当前锁时间';

  @override
  String get lockTimeUnknown => '未能读取锁时间';

  @override
  String get lockTimeCalibrate => '校准锁时间';

  @override
  String get lockTimeCalibrateSuccess => '锁时间已校准';

  @override
  String get adminPasscode => '管理员密码';

  @override
  String get adminPasscodeCurrent => '当前管理员密码';

  @override
  String get adminPasscodeNew => '新管理员密码';

  @override
  String get adminPasscodeHint => '请输入 4–9 位数字';

  @override
  String get adminPasscodeModify => '修改管理员密码';

  @override
  String get adminPasscodeModifySuccess => '管理员密码已修改';

  @override
  String get adminPasscodeLoadFailed => '读取管理员密码失败';

  @override
  String get gatewayUseStaticIp => '使用静态 IP（可选）';

  @override
  String get gatewayUseApn => '配置 APN（可选）';

  @override
  String get gatewayApn => 'APN';

  @override
  String get gatewayApnHint => '蜂窝网关接入点，如 cmnet';

  @override
  String get meterSetRemainder => '设置剩余量';

  @override
  String get meterSetRemainderHint => '输入剩余用量';

  @override
  String get meterReset => '恢复出厂';

  @override
  String get meterResetConfirmTitle => '确认恢复出厂？';

  @override
  String get meterResetConfirmBody => '将重置表计，此操作不可撤销。';

  @override
  String get meterRefreshFeatureValue => '刷新特征值';
}
