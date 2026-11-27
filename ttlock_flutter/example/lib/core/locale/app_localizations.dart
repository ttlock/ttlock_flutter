import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'locale/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In zh, this message translates to:
  /// **'TTLock 开放平台 Demo'**
  String get appName;

  /// No description provided for @login.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get logout;

  /// No description provided for @username.
  ///
  /// In zh, this message translates to:
  /// **'账号'**
  String get username;

  /// No description provided for @password.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get password;

  /// No description provided for @register.
  ///
  /// In zh, this message translates to:
  /// **'注册'**
  String get register;

  /// No description provided for @mine.
  ///
  /// In zh, this message translates to:
  /// **'我的'**
  String get mine;

  /// No description provided for @devices.
  ///
  /// In zh, this message translates to:
  /// **'其他设备'**
  String get devices;

  /// No description provided for @gatewayEntry.
  ///
  /// In zh, this message translates to:
  /// **'网关'**
  String get gatewayEntry;

  /// No description provided for @gatewayEntrySubtitle.
  ///
  /// In zh, this message translates to:
  /// **'管理并添加网关'**
  String get gatewayEntrySubtitle;

  /// No description provided for @waterMeterEntry.
  ///
  /// In zh, this message translates to:
  /// **'水表'**
  String get waterMeterEntry;

  /// No description provided for @waterMeterEntrySubtitle.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙 + 云端管理'**
  String get waterMeterEntrySubtitle;

  /// No description provided for @electricMeterEntry.
  ///
  /// In zh, this message translates to:
  /// **'电表'**
  String get electricMeterEntry;

  /// No description provided for @electricMeterEntrySubtitle.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙 + 云端管理'**
  String get electricMeterEntrySubtitle;

  /// No description provided for @locks.
  ///
  /// In zh, this message translates to:
  /// **'锁'**
  String get locks;

  /// No description provided for @config.
  ///
  /// In zh, this message translates to:
  /// **'开放平台配置'**
  String get config;

  /// No description provided for @about.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get about;

  /// No description provided for @site.
  ///
  /// In zh, this message translates to:
  /// **'站点'**
  String get site;

  /// No description provided for @siteCn.
  ///
  /// In zh, this message translates to:
  /// **'中国站'**
  String get siteCn;

  /// No description provided for @siteOverseas.
  ///
  /// In zh, this message translates to:
  /// **'境外站'**
  String get siteOverseas;

  /// No description provided for @clientId.
  ///
  /// In zh, this message translates to:
  /// **'Client ID'**
  String get clientId;

  /// No description provided for @clientSecret.
  ///
  /// In zh, this message translates to:
  /// **'Client Secret'**
  String get clientSecret;

  /// No description provided for @save.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get save;

  /// No description provided for @saveSuccess.
  ///
  /// In zh, this message translates to:
  /// **'保存成功'**
  String get saveSuccess;

  /// No description provided for @loading.
  ///
  /// In zh, this message translates to:
  /// **'处理中…'**
  String get loading;

  /// No description provided for @configLocalHint.
  ///
  /// In zh, this message translates to:
  /// **'配置存于本机，config.json 为默认值'**
  String get configLocalHint;

  /// No description provided for @configSetupHint.
  ///
  /// In zh, this message translates to:
  /// **'首次使用请填写开放平台 Client ID 与 Client Secret，保存后继续登录'**
  String get configSetupHint;

  /// No description provided for @configCredentialsRequired.
  ///
  /// In zh, this message translates to:
  /// **'请填写 Client ID 与 Client Secret'**
  String get configCredentialsRequired;

  /// No description provided for @uidLabel.
  ///
  /// In zh, this message translates to:
  /// **'UID'**
  String get uidLabel;

  /// No description provided for @commonRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试'**
  String get commonRetry;

  /// No description provided for @errorNetwork.
  ///
  /// In zh, this message translates to:
  /// **'网络连接失败，请稍后重试'**
  String get errorNetwork;

  /// No description provided for @errorHttp.
  ///
  /// In zh, this message translates to:
  /// **'服务异常（HTTP）'**
  String get errorHttp;

  /// No description provided for @errorParse.
  ///
  /// In zh, this message translates to:
  /// **'数据解析失败'**
  String get errorParse;

  /// No description provided for @errorUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知错误，请稍后重试'**
  String get errorUnknown;

  /// No description provided for @errorBle.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙操作失败，请重试'**
  String get errorBle;

  /// No description provided for @bluetoothNotOn.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙未开启，请开启后重试'**
  String get bluetoothNotOn;

  /// No description provided for @bluetoothPermissionDenied.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙权限未授予，请在系统设置中开启后重试'**
  String get bluetoothPermissionDenied;

  /// No description provided for @usernameRequired.
  ///
  /// In zh, this message translates to:
  /// **'请输入接收方账号'**
  String get usernameRequired;

  /// No description provided for @bleUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'请靠近锁或通过网关操作'**
  String get bleUnreachable;

  /// No description provided for @permanentPeriodReadonly.
  ///
  /// In zh, this message translates to:
  /// **'永久有效期不可修改'**
  String get permanentPeriodReadonly;

  /// No description provided for @invalidCyclicSchedule.
  ///
  /// In zh, this message translates to:
  /// **'请完善循环星期与时段'**
  String get invalidCyclicSchedule;

  /// No description provided for @remoteRequired.
  ///
  /// In zh, this message translates to:
  /// **'请选择遥控'**
  String get remoteRequired;

  /// No description provided for @photoFaceNeedsGateway.
  ///
  /// In zh, this message translates to:
  /// **'该锁照片人脸需通过网关下发，请先连接网关'**
  String get photoFaceNeedsGateway;

  /// No description provided for @unsupportedLockScene.
  ///
  /// In zh, this message translates to:
  /// **'暂不支持添加此类型设备'**
  String get unsupportedLockScene;

  /// No description provided for @lockAlreadyInitialized.
  ///
  /// In zh, this message translates to:
  /// **'该锁已被初始化，请直接使用'**
  String get lockAlreadyInitialized;

  /// No description provided for @addLock.
  ///
  /// In zh, this message translates to:
  /// **'添加锁'**
  String get addLock;

  /// No description provided for @noLocks.
  ///
  /// In zh, this message translates to:
  /// **'还没有锁，点击右下角添加'**
  String get noLocks;

  /// No description provided for @locksTab.
  ///
  /// In zh, this message translates to:
  /// **'锁'**
  String get locksTab;

  /// No description provided for @unlock.
  ///
  /// In zh, this message translates to:
  /// **'开锁'**
  String get unlock;

  /// No description provided for @lockBtn.
  ///
  /// In zh, this message translates to:
  /// **'上锁'**
  String get lockBtn;

  /// No description provided for @battery.
  ///
  /// In zh, this message translates to:
  /// **'电量'**
  String get battery;

  /// No description provided for @lockIdLabel.
  ///
  /// In zh, this message translates to:
  /// **'锁ID'**
  String get lockIdLabel;

  /// No description provided for @macLabel.
  ///
  /// In zh, this message translates to:
  /// **'MAC'**
  String get macLabel;

  /// No description provided for @records.
  ///
  /// In zh, this message translates to:
  /// **'操作记录'**
  String get records;

  /// No description provided for @settings.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get settings;

  /// No description provided for @wifiInfo.
  ///
  /// In zh, this message translates to:
  /// **'WiFi 信息'**
  String get wifiInfo;

  /// No description provided for @wifiPowerSaving.
  ///
  /// In zh, this message translates to:
  /// **'WiFi 省电'**
  String get wifiPowerSaving;

  /// No description provided for @doorNotClosedAlert.
  ///
  /// In zh, this message translates to:
  /// **'门未关报警'**
  String get doorNotClosedAlert;

  /// No description provided for @workingMode.
  ///
  /// In zh, this message translates to:
  /// **'工作模式'**
  String get workingMode;

  /// No description provided for @workingModeAllDay.
  ///
  /// In zh, this message translates to:
  /// **'全天工作'**
  String get workingModeAllDay;

  /// No description provided for @workingModeAllDayOff.
  ///
  /// In zh, this message translates to:
  /// **'全天不工作'**
  String get workingModeAllDayOff;

  /// No description provided for @workingModeCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get workingModeCustom;

  /// No description provided for @workingModeNeedsGateway.
  ///
  /// In zh, this message translates to:
  /// **'修改工作模式需要网关'**
  String get workingModeNeedsGateway;

  /// No description provided for @unauthorizedAttempt.
  ///
  /// In zh, this message translates to:
  /// **'非法尝试告警'**
  String get unauthorizedAttempt;

  /// No description provided for @unauthorizedAttemptCount.
  ///
  /// In zh, this message translates to:
  /// **'失败次数'**
  String get unauthorizedAttemptCount;

  /// No description provided for @unauthorizedAttemptLockTime.
  ///
  /// In zh, this message translates to:
  /// **'锁定时长'**
  String get unauthorizedAttemptLockTime;

  /// No description provided for @unauthorizedAttemptNeedsGateway.
  ///
  /// In zh, this message translates to:
  /// **'修改非法尝试告警需要网关'**
  String get unauthorizedAttemptNeedsGateway;

  /// No description provided for @unauthorizedAttemptInvalidCount.
  ///
  /// In zh, this message translates to:
  /// **'失败次数须为 0–50'**
  String get unauthorizedAttemptInvalidCount;

  /// No description provided for @unauthorizedAttemptInvalidLockTime.
  ///
  /// In zh, this message translates to:
  /// **'锁定时长须为 0–900 秒'**
  String get unauthorizedAttemptInvalidLockTime;

  /// No description provided for @groups.
  ///
  /// In zh, this message translates to:
  /// **'分组'**
  String get groups;

  /// No description provided for @noGroups.
  ///
  /// In zh, this message translates to:
  /// **'还没有分组'**
  String get noGroups;

  /// No description provided for @groupLockCount.
  ///
  /// In zh, this message translates to:
  /// **'把锁'**
  String get groupLockCount;

  /// No description provided for @noGroup.
  ///
  /// In zh, this message translates to:
  /// **'未分组'**
  String get noGroup;

  /// No description provided for @addGroup.
  ///
  /// In zh, this message translates to:
  /// **'添加分组'**
  String get addGroup;

  /// No description provided for @groupNameHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入分组名称'**
  String get groupNameHint;

  /// No description provided for @operating.
  ///
  /// In zh, this message translates to:
  /// **'操作中…'**
  String get operating;

  /// No description provided for @commonCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get commonCancel;

  /// No description provided for @commonConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get commonConfirm;

  /// No description provided for @commonSave.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get commonSave;

  /// No description provided for @scanning.
  ///
  /// In zh, this message translates to:
  /// **'正在扫描附近的锁…'**
  String get scanning;

  /// No description provided for @addingLock.
  ///
  /// In zh, this message translates to:
  /// **'正在添加'**
  String get addingLock;

  /// No description provided for @rename.
  ///
  /// In zh, this message translates to:
  /// **'重命名'**
  String get rename;

  /// No description provided for @renameHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入锁名称'**
  String get renameHint;

  /// No description provided for @lockDetail.
  ///
  /// In zh, this message translates to:
  /// **'锁详情'**
  String get lockDetail;

  /// No description provided for @gatewayOnline.
  ///
  /// In zh, this message translates to:
  /// **'网关在线'**
  String get gatewayOnline;

  /// No description provided for @incompleteLockData.
  ///
  /// In zh, this message translates to:
  /// **'数据不完整'**
  String get incompleteLockData;

  /// No description provided for @noRecords.
  ///
  /// In zh, this message translates to:
  /// **'暂无操作记录'**
  String get noRecords;

  /// No description provided for @clearRecords.
  ///
  /// In zh, this message translates to:
  /// **'清空记录'**
  String get clearRecords;

  /// No description provided for @clearRecordsConfirmMessage.
  ///
  /// In zh, this message translates to:
  /// **'确定清空该锁的全部开锁记录？此操作不可撤销。'**
  String get clearRecordsConfirmMessage;

  /// No description provided for @syncOffline.
  ///
  /// In zh, this message translates to:
  /// **'同步离线记录'**
  String get syncOffline;

  /// No description provided for @recordAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get recordAll;

  /// No description provided for @recordPasscode.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get recordPasscode;

  /// No description provided for @recordCard.
  ///
  /// In zh, this message translates to:
  /// **'IC卡'**
  String get recordCard;

  /// No description provided for @recordFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'指纹'**
  String get recordFingerprint;

  /// No description provided for @recordFace.
  ///
  /// In zh, this message translates to:
  /// **'人脸'**
  String get recordFace;

  /// No description provided for @recordQr.
  ///
  /// In zh, this message translates to:
  /// **'二维码'**
  String get recordQr;

  /// No description provided for @recordRemote.
  ///
  /// In zh, this message translates to:
  /// **'遥控'**
  String get recordRemote;

  /// No description provided for @recordIdLabel.
  ///
  /// In zh, this message translates to:
  /// **'记录ID'**
  String get recordIdLabel;

  /// No description provided for @recordTypeBluetoothUnlock.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙开锁'**
  String get recordTypeBluetoothUnlock;

  /// No description provided for @recordTypePasscodeUnlock.
  ///
  /// In zh, this message translates to:
  /// **'密码开锁'**
  String get recordTypePasscodeUnlock;

  /// No description provided for @recordTypeParkingLockRise.
  ///
  /// In zh, this message translates to:
  /// **'车位锁升'**
  String get recordTypeParkingLockRise;

  /// No description provided for @recordTypeParkingLockLower.
  ///
  /// In zh, this message translates to:
  /// **'车位锁降'**
  String get recordTypeParkingLockLower;

  /// No description provided for @recordTypeCardUnlock.
  ///
  /// In zh, this message translates to:
  /// **'IC卡开锁'**
  String get recordTypeCardUnlock;

  /// No description provided for @recordTypeFingerprintUnlock.
  ///
  /// In zh, this message translates to:
  /// **'指纹开锁'**
  String get recordTypeFingerprintUnlock;

  /// No description provided for @recordTypeWristbandUnlock.
  ///
  /// In zh, this message translates to:
  /// **'手环开锁'**
  String get recordTypeWristbandUnlock;

  /// No description provided for @recordTypeMechanicalKeyUnlock.
  ///
  /// In zh, this message translates to:
  /// **'机械钥匙开锁'**
  String get recordTypeMechanicalKeyUnlock;

  /// No description provided for @recordTypeBluetoothLock.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙闭锁'**
  String get recordTypeBluetoothLock;

  /// No description provided for @recordTypeGatewayUnlock.
  ///
  /// In zh, this message translates to:
  /// **'网关开锁'**
  String get recordTypeGatewayUnlock;

  /// No description provided for @recordTypeIllegalUnlock.
  ///
  /// In zh, this message translates to:
  /// **'非法开锁'**
  String get recordTypeIllegalUnlock;

  /// No description provided for @recordTypeDoorSensorClosed.
  ///
  /// In zh, this message translates to:
  /// **'门磁合上（关门）'**
  String get recordTypeDoorSensorClosed;

  /// No description provided for @recordTypeDoorSensorOpen.
  ///
  /// In zh, this message translates to:
  /// **'门磁打开（开门）'**
  String get recordTypeDoorSensorOpen;

  /// No description provided for @recordTypeOpenFromInside.
  ///
  /// In zh, this message translates to:
  /// **'从内部打开门'**
  String get recordTypeOpenFromInside;

  /// No description provided for @recordTypeFingerprintLock.
  ///
  /// In zh, this message translates to:
  /// **'指纹关锁'**
  String get recordTypeFingerprintLock;

  /// No description provided for @recordTypePasscodeLock.
  ///
  /// In zh, this message translates to:
  /// **'密码关锁'**
  String get recordTypePasscodeLock;

  /// No description provided for @recordTypeCardLock.
  ///
  /// In zh, this message translates to:
  /// **'IC卡关锁'**
  String get recordTypeCardLock;

  /// No description provided for @recordTypeMechanicalKeyLock.
  ///
  /// In zh, this message translates to:
  /// **'机械钥匙关锁'**
  String get recordTypeMechanicalKeyLock;

  /// No description provided for @recordTypeAppButtonControl.
  ///
  /// In zh, this message translates to:
  /// **'用APP按键控制锁'**
  String get recordTypeAppButtonControl;

  /// No description provided for @recordTypeLocalMail.
  ///
  /// In zh, this message translates to:
  /// **'邮局本地邮件'**
  String get recordTypeLocalMail;

  /// No description provided for @recordTypeRemoteMail.
  ///
  /// In zh, this message translates to:
  /// **'邮局外地邮件'**
  String get recordTypeRemoteMail;

  /// No description provided for @recordTypeTamperAlert.
  ///
  /// In zh, this message translates to:
  /// **'防撬报警'**
  String get recordTypeTamperAlert;

  /// No description provided for @recordTypeAutoLock.
  ///
  /// In zh, this message translates to:
  /// **'超时自动闭锁'**
  String get recordTypeAutoLock;

  /// No description provided for @recordTypeUnlockButton.
  ///
  /// In zh, this message translates to:
  /// **'开锁按键开锁'**
  String get recordTypeUnlockButton;

  /// No description provided for @recordTypeLockButton.
  ///
  /// In zh, this message translates to:
  /// **'闭锁按键闭锁'**
  String get recordTypeLockButton;

  /// No description provided for @recordTypeSystemLocked.
  ///
  /// In zh, this message translates to:
  /// **'系统被锁定'**
  String get recordTypeSystemLocked;

  /// No description provided for @recordTypeHotelCardUnlock.
  ///
  /// In zh, this message translates to:
  /// **'酒店卡开锁'**
  String get recordTypeHotelCardUnlock;

  /// No description provided for @recordTypeHighTemperatureUnlock.
  ///
  /// In zh, this message translates to:
  /// **'高温开锁'**
  String get recordTypeHighTemperatureUnlock;

  /// No description provided for @recordTypeDeletedCardUnlock.
  ///
  /// In zh, this message translates to:
  /// **'用已删除的卡开锁'**
  String get recordTypeDeletedCardUnlock;

  /// No description provided for @recordTypeAppDeadLock.
  ///
  /// In zh, this message translates to:
  /// **'用APP锁定锁'**
  String get recordTypeAppDeadLock;

  /// No description provided for @recordTypePasscodeDeadLock.
  ///
  /// In zh, this message translates to:
  /// **'用密码锁定锁'**
  String get recordTypePasscodeDeadLock;

  /// No description provided for @recordTypeCarLeft.
  ///
  /// In zh, this message translates to:
  /// **'车离开'**
  String get recordTypeCarLeft;

  /// No description provided for @recordTypeRemoteControl.
  ///
  /// In zh, this message translates to:
  /// **'遥控开、闭锁'**
  String get recordTypeRemoteControl;

  /// No description provided for @recordTypeQrUnlockSuccess.
  ///
  /// In zh, this message translates to:
  /// **'二维码开锁成功'**
  String get recordTypeQrUnlockSuccess;

  /// No description provided for @recordTypeQrUnlockExpired.
  ///
  /// In zh, this message translates to:
  /// **'二维码开锁失败，过期'**
  String get recordTypeQrUnlockExpired;

  /// No description provided for @recordTypeDoubleLockOn.
  ///
  /// In zh, this message translates to:
  /// **'开启反锁'**
  String get recordTypeDoubleLockOn;

  /// No description provided for @recordTypeDoubleLockOff.
  ///
  /// In zh, this message translates to:
  /// **'关闭反锁'**
  String get recordTypeDoubleLockOff;

  /// No description provided for @recordTypeQrLockSuccess.
  ///
  /// In zh, this message translates to:
  /// **'二维码闭锁成功'**
  String get recordTypeQrLockSuccess;

  /// No description provided for @recordTypeQrUnlockDoubleLocked.
  ///
  /// In zh, this message translates to:
  /// **'二维码开锁失败，门已反锁'**
  String get recordTypeQrUnlockDoubleLocked;

  /// No description provided for @recordTypePassageModeAutoUnlock.
  ///
  /// In zh, this message translates to:
  /// **'常开时间段自动开锁'**
  String get recordTypePassageModeAutoUnlock;

  /// No description provided for @recordTypeDoorUnclosedAlarm.
  ///
  /// In zh, this message translates to:
  /// **'门未关报警'**
  String get recordTypeDoorUnclosedAlarm;

  /// No description provided for @recordTypeUnlockTimeout.
  ///
  /// In zh, this message translates to:
  /// **'开锁超时'**
  String get recordTypeUnlockTimeout;

  /// No description provided for @recordTypeLockTimeout.
  ///
  /// In zh, this message translates to:
  /// **'闭锁超时'**
  String get recordTypeLockTimeout;

  /// No description provided for @recordTypeFaceUnlockSuccess.
  ///
  /// In zh, this message translates to:
  /// **'3D人脸开锁成功'**
  String get recordTypeFaceUnlockSuccess;

  /// No description provided for @recordTypeFaceUnlockDoubleLocked.
  ///
  /// In zh, this message translates to:
  /// **'3D人脸开锁失败-门反锁了'**
  String get recordTypeFaceUnlockDoubleLocked;

  /// No description provided for @recordTypeFaceLock.
  ///
  /// In zh, this message translates to:
  /// **'3D人脸闭锁'**
  String get recordTypeFaceLock;

  /// No description provided for @recordTypeFaceUnlockExpired.
  ///
  /// In zh, this message translates to:
  /// **'3D人脸开门失败—已过期或者未生效'**
  String get recordTypeFaceUnlockExpired;

  /// No description provided for @recordTypeAppGrantUnlock.
  ///
  /// In zh, this message translates to:
  /// **'App授权按键开锁成功'**
  String get recordTypeAppGrantUnlock;

  /// No description provided for @recordTypeGatewayGrantUnlock.
  ///
  /// In zh, this message translates to:
  /// **'网关授权按键开锁成功'**
  String get recordTypeGatewayGrantUnlock;

  /// No description provided for @recordTypeDualAuthBluetooth.
  ///
  /// In zh, this message translates to:
  /// **'双重认证蓝牙开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthBluetooth;

  /// No description provided for @recordTypeDualAuthPasscode.
  ///
  /// In zh, this message translates to:
  /// **'双重认证密码开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthPasscode;

  /// No description provided for @recordTypeDualAuthFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'双重认证指纹开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthFingerprint;

  /// No description provided for @recordTypeDualAuthCard.
  ///
  /// In zh, this message translates to:
  /// **'双重认证IC卡开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthCard;

  /// No description provided for @recordTypeDualAuthFace.
  ///
  /// In zh, this message translates to:
  /// **'双重认证人脸开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthFace;

  /// No description provided for @recordTypeDualAuthRemote.
  ///
  /// In zh, this message translates to:
  /// **'双重认证遥控开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthRemote;

  /// No description provided for @recordTypeDualAuthPalmVein.
  ///
  /// In zh, this message translates to:
  /// **'双重认证掌静脉开锁验证成功，等待第二用户'**
  String get recordTypeDualAuthPalmVein;

  /// No description provided for @recordTypePalmVeinUnlockSuccess.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉开锁成功'**
  String get recordTypePalmVeinUnlockSuccess;

  /// No description provided for @recordTypePalmVeinUnlockDoubleLocked.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉开锁失败-门反锁了'**
  String get recordTypePalmVeinUnlockDoubleLocked;

  /// No description provided for @recordTypePalmVeinLock.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉闭锁'**
  String get recordTypePalmVeinLock;

  /// No description provided for @recordTypePalmVeinUnlockExpired.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉开门失败—已过期或者未生效'**
  String get recordTypePalmVeinUnlockExpired;

  /// No description provided for @recordTypeAdminPasscodeUnlock.
  ///
  /// In zh, this message translates to:
  /// **'管理员密码开锁'**
  String get recordTypeAdminPasscodeUnlock;

  /// No description provided for @deleteLock.
  ///
  /// In zh, this message translates to:
  /// **'删除锁'**
  String get deleteLock;

  /// No description provided for @transfer.
  ///
  /// In zh, this message translates to:
  /// **'转让'**
  String get transfer;

  /// No description provided for @receiverUsername.
  ///
  /// In zh, this message translates to:
  /// **'接收方账号'**
  String get receiverUsername;

  /// No description provided for @changeGroup.
  ///
  /// In zh, this message translates to:
  /// **'设置分组'**
  String get changeGroup;

  /// No description provided for @autoLockTime.
  ///
  /// In zh, this message translates to:
  /// **'自动闭锁'**
  String get autoLockTime;

  /// No description provided for @autoLockOff.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get autoLockOff;

  /// No description provided for @secondsUnit.
  ///
  /// In zh, this message translates to:
  /// **'秒'**
  String get secondsUnit;

  /// No description provided for @sound.
  ///
  /// In zh, this message translates to:
  /// **'声音'**
  String get sound;

  /// No description provided for @soundUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get soundUnknown;

  /// No description provided for @soundVolume.
  ///
  /// In zh, this message translates to:
  /// **'音量'**
  String get soundVolume;

  /// No description provided for @soundVolumeLevel.
  ///
  /// In zh, this message translates to:
  /// **'音量 {level}'**
  String soundVolumeLevel(int level);

  /// No description provided for @privacyLock.
  ///
  /// In zh, this message translates to:
  /// **'反锁'**
  String get privacyLock;

  /// No description provided for @tamperAlert.
  ///
  /// In zh, this message translates to:
  /// **'防撬报警'**
  String get tamperAlert;

  /// No description provided for @resetButton.
  ///
  /// In zh, this message translates to:
  /// **'重置键'**
  String get resetButton;

  /// No description provided for @remoteUnlock.
  ///
  /// In zh, this message translates to:
  /// **'远程开锁'**
  String get remoteUnlock;

  /// No description provided for @doubleAuth.
  ///
  /// In zh, this message translates to:
  /// **'双重认证'**
  String get doubleAuth;

  /// No description provided for @openDirection.
  ///
  /// In zh, this message translates to:
  /// **'开门方向'**
  String get openDirection;

  /// No description provided for @openDirectionLeft.
  ///
  /// In zh, this message translates to:
  /// **'左开'**
  String get openDirectionLeft;

  /// No description provided for @openDirectionRight.
  ///
  /// In zh, this message translates to:
  /// **'右开'**
  String get openDirectionRight;

  /// No description provided for @passageMode.
  ///
  /// In zh, this message translates to:
  /// **'常开模式'**
  String get passageMode;

  /// No description provided for @passageModeAllDay.
  ///
  /// In zh, this message translates to:
  /// **'全天常开'**
  String get passageModeAllDay;

  /// No description provided for @passageModeAutoUnlock.
  ///
  /// In zh, this message translates to:
  /// **'常开自动开锁'**
  String get passageModeAutoUnlock;

  /// No description provided for @passageModeStartTime.
  ///
  /// In zh, this message translates to:
  /// **'开始时间'**
  String get passageModeStartTime;

  /// No description provided for @passageModeEndTime.
  ///
  /// In zh, this message translates to:
  /// **'结束时间'**
  String get passageModeEndTime;

  /// No description provided for @passageModeNeedWeekdays.
  ///
  /// In zh, this message translates to:
  /// **'请选择至少一个星期'**
  String get passageModeNeedWeekdays;

  /// No description provided for @passageModeInvalidTime.
  ///
  /// In zh, this message translates to:
  /// **'结束时间必须晚于开始时间'**
  String get passageModeInvalidTime;

  /// No description provided for @weekMon.
  ///
  /// In zh, this message translates to:
  /// **'一'**
  String get weekMon;

  /// No description provided for @weekTue.
  ///
  /// In zh, this message translates to:
  /// **'二'**
  String get weekTue;

  /// No description provided for @weekWed.
  ///
  /// In zh, this message translates to:
  /// **'三'**
  String get weekWed;

  /// No description provided for @weekThu.
  ///
  /// In zh, this message translates to:
  /// **'四'**
  String get weekThu;

  /// No description provided for @weekFri.
  ///
  /// In zh, this message translates to:
  /// **'五'**
  String get weekFri;

  /// No description provided for @weekSat.
  ///
  /// In zh, this message translates to:
  /// **'六'**
  String get weekSat;

  /// No description provided for @weekSun.
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get weekSun;

  /// No description provided for @refreshSystemInfo.
  ///
  /// In zh, this message translates to:
  /// **'刷新系统信息'**
  String get refreshSystemInfo;

  /// No description provided for @lockInfo.
  ///
  /// In zh, this message translates to:
  /// **'锁信息'**
  String get lockInfo;

  /// No description provided for @refreshFromLock.
  ///
  /// In zh, this message translates to:
  /// **'从锁刷新'**
  String get refreshFromLock;

  /// No description provided for @systemInfoSection.
  ///
  /// In zh, this message translates to:
  /// **'系统信息'**
  String get systemInfoSection;

  /// No description provided for @lockAliasLabel.
  ///
  /// In zh, this message translates to:
  /// **'锁别名'**
  String get lockAliasLabel;

  /// No description provided for @lockNameLabel.
  ///
  /// In zh, this message translates to:
  /// **'锁名称'**
  String get lockNameLabel;

  /// No description provided for @featureValueLabel.
  ///
  /// In zh, this message translates to:
  /// **'特征值'**
  String get featureValueLabel;

  /// No description provided for @hasGatewayLabel.
  ///
  /// In zh, this message translates to:
  /// **'网关'**
  String get hasGatewayLabel;

  /// No description provided for @initDateLabel.
  ///
  /// In zh, this message translates to:
  /// **'初始化时间'**
  String get initDateLabel;

  /// No description provided for @modelNum.
  ///
  /// In zh, this message translates to:
  /// **'型号'**
  String get modelNum;

  /// No description provided for @hardwareRevision.
  ///
  /// In zh, this message translates to:
  /// **'硬件版本'**
  String get hardwareRevision;

  /// No description provided for @firmwareRevision.
  ///
  /// In zh, this message translates to:
  /// **'固件版本'**
  String get firmwareRevision;

  /// No description provided for @syncSettingsFromLock.
  ///
  /// In zh, this message translates to:
  /// **'从锁同步设置'**
  String get syncSettingsFromLock;

  /// No description provided for @refreshBattery.
  ///
  /// In zh, this message translates to:
  /// **'刷新电量'**
  String get refreshBattery;

  /// No description provided for @syncDate.
  ///
  /// In zh, this message translates to:
  /// **'同步时间'**
  String get syncDate;

  /// No description provided for @checkUpgrade.
  ///
  /// In zh, this message translates to:
  /// **'检查固件'**
  String get checkUpgrade;

  /// No description provided for @upgradeNone.
  ///
  /// In zh, this message translates to:
  /// **'已是最新'**
  String get upgradeNone;

  /// No description provided for @upgradeAvailable.
  ///
  /// In zh, this message translates to:
  /// **'有可用升级'**
  String get upgradeAvailable;

  /// No description provided for @nbRegister.
  ///
  /// In zh, this message translates to:
  /// **'NB 注册'**
  String get nbRegister;

  /// No description provided for @nbNodeId.
  ///
  /// In zh, this message translates to:
  /// **'NB Node ID'**
  String get nbNodeId;

  /// No description provided for @nbCardNumber.
  ///
  /// In zh, this message translates to:
  /// **'NB 卡号'**
  String get nbCardNumber;

  /// No description provided for @nbOperator.
  ///
  /// In zh, this message translates to:
  /// **'NB 运营商'**
  String get nbOperator;

  /// No description provided for @nbRssi.
  ///
  /// In zh, this message translates to:
  /// **'NB RSSI'**
  String get nbRssi;

  /// No description provided for @wifiIp.
  ///
  /// In zh, this message translates to:
  /// **'IP'**
  String get wifiIp;

  /// No description provided for @wifiSubnetMask.
  ///
  /// In zh, this message translates to:
  /// **'子网掩码'**
  String get wifiSubnetMask;

  /// No description provided for @wifiDefaultGateway.
  ///
  /// In zh, this message translates to:
  /// **'默认网关'**
  String get wifiDefaultGateway;

  /// No description provided for @wifiMacLabel.
  ///
  /// In zh, this message translates to:
  /// **'WiFi MAC'**
  String get wifiMacLabel;

  /// No description provided for @online.
  ///
  /// In zh, this message translates to:
  /// **'在线'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In zh, this message translates to:
  /// **'离线'**
  String get offline;

  /// No description provided for @eKey.
  ///
  /// In zh, this message translates to:
  /// **'电子钥匙'**
  String get eKey;

  /// No description provided for @sendEkey.
  ///
  /// In zh, this message translates to:
  /// **'发送钥匙'**
  String get sendEkey;

  /// No description provided for @liftTitle.
  ///
  /// In zh, this message translates to:
  /// **'梯控'**
  String get liftTitle;

  /// No description provided for @liftEntry.
  ///
  /// In zh, this message translates to:
  /// **'梯控'**
  String get liftEntry;

  /// No description provided for @liftFloorsHint.
  ///
  /// In zh, this message translates to:
  /// **'选择要激活的楼层'**
  String get liftFloorsHint;

  /// No description provided for @liftActivate.
  ///
  /// In zh, this message translates to:
  /// **'激活'**
  String get liftActivate;

  /// No description provided for @liftActivateEntry.
  ///
  /// In zh, this message translates to:
  /// **'楼层激活'**
  String get liftActivateEntry;

  /// No description provided for @liftActivateSuccess.
  ///
  /// In zh, this message translates to:
  /// **'楼层激活成功'**
  String get liftActivateSuccess;

  /// No description provided for @liftActivateFailed.
  ///
  /// In zh, this message translates to:
  /// **'楼层激活失败'**
  String get liftActivateFailed;

  /// No description provided for @liftRemoteFailedBleFallback.
  ///
  /// In zh, this message translates to:
  /// **'远程不可用，已通过蓝牙激活并刷新锁数据'**
  String get liftRemoteFailedBleFallback;

  /// No description provided for @liftBleActivatedSyncFailed.
  ///
  /// In zh, this message translates to:
  /// **'已通过蓝牙激活，但刷新锁数据失败'**
  String get liftBleActivatedSyncFailed;

  /// No description provided for @liftWorkMode.
  ///
  /// In zh, this message translates to:
  /// **'工作模式'**
  String get liftWorkMode;

  /// No description provided for @liftWorkModeAllFloors.
  ///
  /// In zh, this message translates to:
  /// **'全部楼层'**
  String get liftWorkModeAllFloors;

  /// No description provided for @liftWorkModeAllFloorsHint.
  ///
  /// In zh, this message translates to:
  /// **'刷卡可控制全部关联楼层'**
  String get liftWorkModeAllFloorsHint;

  /// No description provided for @liftWorkModeSpecificFloors.
  ///
  /// In zh, this message translates to:
  /// **'指定楼层'**
  String get liftWorkModeSpecificFloors;

  /// No description provided for @liftWorkModeSpecificFloorsHint.
  ///
  /// In zh, this message translates to:
  /// **'刷卡控制卡内数据对应的楼层'**
  String get liftWorkModeSpecificFloorsHint;

  /// No description provided for @liftWorkModeSuccess.
  ///
  /// In zh, this message translates to:
  /// **'工作模式设置成功'**
  String get liftWorkModeSuccess;

  /// No description provided for @liftControlableFloors.
  ///
  /// In zh, this message translates to:
  /// **'关联楼层'**
  String get liftControlableFloors;

  /// No description provided for @liftControlableFloorsHint.
  ///
  /// In zh, this message translates to:
  /// **'选择梯控可控制的楼层'**
  String get liftControlableFloorsHint;

  /// No description provided for @liftControlableFloorsSuccess.
  ///
  /// In zh, this message translates to:
  /// **'关联楼层设置成功'**
  String get liftControlableFloorsSuccess;

  /// No description provided for @powerSwitchWorkMode.
  ///
  /// In zh, this message translates to:
  /// **'工作模式'**
  String get powerSwitchWorkMode;

  /// No description provided for @powerSwitchWorkModeAllCards.
  ///
  /// In zh, this message translates to:
  /// **'全部卡'**
  String get powerSwitchWorkModeAllCards;

  /// No description provided for @powerSwitchWorkModeAllCardsHint.
  ///
  /// In zh, this message translates to:
  /// **'任意卡均可取电'**
  String get powerSwitchWorkModeAllCardsHint;

  /// No description provided for @powerSwitchWorkModeHotelCard.
  ///
  /// In zh, this message translates to:
  /// **'酒店卡'**
  String get powerSwitchWorkModeHotelCard;

  /// No description provided for @powerSwitchWorkModeHotelCardHint.
  ///
  /// In zh, this message translates to:
  /// **'仅本酒店卡可取电'**
  String get powerSwitchWorkModeHotelCardHint;

  /// No description provided for @powerSwitchWorkModeRoomCard.
  ///
  /// In zh, this message translates to:
  /// **'房卡'**
  String get powerSwitchWorkModeRoomCard;

  /// No description provided for @powerSwitchWorkModeRoomCardHint.
  ///
  /// In zh, this message translates to:
  /// **'仅房卡可取电'**
  String get powerSwitchWorkModeRoomCardHint;

  /// No description provided for @powerSwitchWorkModeSuccess.
  ///
  /// In zh, this message translates to:
  /// **'工作模式设置成功'**
  String get powerSwitchWorkModeSuccess;

  /// No description provided for @powerSwitchControlableLock.
  ///
  /// In zh, this message translates to:
  /// **'关联门锁'**
  String get powerSwitchControlableLock;

  /// No description provided for @powerSwitchControlableLockSuccess.
  ///
  /// In zh, this message translates to:
  /// **'关联门锁设置成功'**
  String get powerSwitchControlableLockSuccess;

  /// No description provided for @powerSwitchNoHotelLocks.
  ///
  /// In zh, this message translates to:
  /// **'暂无酒店锁可关联'**
  String get powerSwitchNoHotelLocks;

  /// No description provided for @powerSwitchHotelLocksLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载酒店锁列表失败'**
  String get powerSwitchHotelLocksLoadFailed;

  /// No description provided for @passcode.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get passcode;

  /// No description provided for @getPasscode.
  ///
  /// In zh, this message translates to:
  /// **'获取密码'**
  String get getPasscode;

  /// No description provided for @customPasscode.
  ///
  /// In zh, this message translates to:
  /// **'自定义密码'**
  String get customPasscode;

  /// No description provided for @icCard.
  ///
  /// In zh, this message translates to:
  /// **'IC卡'**
  String get icCard;

  /// No description provided for @fingerprint.
  ///
  /// In zh, this message translates to:
  /// **'指纹'**
  String get fingerprint;

  /// No description provided for @face.
  ///
  /// In zh, this message translates to:
  /// **'人脸'**
  String get face;

  /// No description provided for @palmVein.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉'**
  String get palmVein;

  /// No description provided for @qrCode.
  ///
  /// In zh, this message translates to:
  /// **'二维码'**
  String get qrCode;

  /// No description provided for @addQrCode.
  ///
  /// In zh, this message translates to:
  /// **'添加二维码'**
  String get addQrCode;

  /// No description provided for @qrCodeContent.
  ///
  /// In zh, this message translates to:
  /// **'二维码内容'**
  String get qrCodeContent;

  /// No description provided for @refreshQrCodeData.
  ///
  /// In zh, this message translates to:
  /// **'刷新二维码数据'**
  String get refreshQrCodeData;

  /// No description provided for @remote.
  ///
  /// In zh, this message translates to:
  /// **'遥控'**
  String get remote;

  /// No description provided for @addRemote.
  ///
  /// In zh, this message translates to:
  /// **'添加遥控'**
  String get addRemote;

  /// No description provided for @remoteName.
  ///
  /// In zh, this message translates to:
  /// **'遥控名称'**
  String get remoteName;

  /// No description provided for @remoteMac.
  ///
  /// In zh, this message translates to:
  /// **'遥控 MAC'**
  String get remoteMac;

  /// No description provided for @accessories.
  ///
  /// In zh, this message translates to:
  /// **'配件'**
  String get accessories;

  /// No description provided for @wirelessKeypad.
  ///
  /// In zh, this message translates to:
  /// **'无线键盘'**
  String get wirelessKeypad;

  /// No description provided for @addWirelessKeypad.
  ///
  /// In zh, this message translates to:
  /// **'添加无线键盘'**
  String get addWirelessKeypad;

  /// No description provided for @noWirelessKeypads.
  ///
  /// In zh, this message translates to:
  /// **'还没有无线键盘'**
  String get noWirelessKeypads;

  /// No description provided for @wirelessKeypadName.
  ///
  /// In zh, this message translates to:
  /// **'键盘名称'**
  String get wirelessKeypadName;

  /// No description provided for @deleteWirelessKeypad.
  ///
  /// In zh, this message translates to:
  /// **'删除无线键盘'**
  String get deleteWirelessKeypad;

  /// No description provided for @deleteWirelessKeypadConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认删除该无线键盘？'**
  String get deleteWirelessKeypadConfirm;

  /// No description provided for @keypadTypeNormal.
  ///
  /// In zh, this message translates to:
  /// **'普通键盘'**
  String get keypadTypeNormal;

  /// No description provided for @keypadTypeMulti.
  ///
  /// In zh, this message translates to:
  /// **'多功能键盘'**
  String get keypadTypeMulti;

  /// No description provided for @keypadTypeNormalHint.
  ///
  /// In zh, this message translates to:
  /// **'数字键开锁'**
  String get keypadTypeNormalHint;

  /// No description provided for @keypadTypeMultiHint.
  ///
  /// In zh, this message translates to:
  /// **'数字键 + IC卡 + 指纹'**
  String get keypadTypeMultiHint;

  /// No description provided for @keypadTypeLabel.
  ///
  /// In zh, this message translates to:
  /// **'键盘类型'**
  String get keypadTypeLabel;

  /// No description provided for @keypadSlot.
  ///
  /// In zh, this message translates to:
  /// **'槽位'**
  String get keypadSlot;

  /// No description provided for @keypadGuideNormal.
  ///
  /// In zh, this message translates to:
  /// **'首次添加请在键盘上输入 *529# 激活；第二次添加请输入 *529#上一把锁的管理员密码#，然后靠近手机扫描。'**
  String get keypadGuideNormal;

  /// No description provided for @keypadGuideMulti.
  ///
  /// In zh, this message translates to:
  /// **'请先用管理员密码进入设置并开启配对；绑定会占用一个锁槽位。'**
  String get keypadGuideMulti;

  /// No description provided for @scanningKeypads.
  ///
  /// In zh, this message translates to:
  /// **'正在扫描附近键盘…'**
  String get scanningKeypads;

  /// No description provided for @noKeypadsScanned.
  ///
  /// In zh, this message translates to:
  /// **'未发现匹配类型的键盘，请靠近后重试'**
  String get noKeypadsScanned;

  /// No description provided for @doorSensor.
  ///
  /// In zh, this message translates to:
  /// **'门磁'**
  String get doorSensor;

  /// No description provided for @addDoorSensor.
  ///
  /// In zh, this message translates to:
  /// **'添加门磁'**
  String get addDoorSensor;

  /// No description provided for @deleteDoorSensor.
  ///
  /// In zh, this message translates to:
  /// **'删除门磁'**
  String get deleteDoorSensor;

  /// No description provided for @deleteDoorSensorConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认解绑并删除该门磁？'**
  String get deleteDoorSensorConfirm;

  /// No description provided for @doorSensorName.
  ///
  /// In zh, this message translates to:
  /// **'门磁名称'**
  String get doorSensorName;

  /// No description provided for @doorSensorUnbound.
  ///
  /// In zh, this message translates to:
  /// **'未添加'**
  String get doorSensorUnbound;

  /// No description provided for @doorSensorAlertHint.
  ///
  /// In zh, this message translates to:
  /// **'未设置'**
  String get doorSensorAlertHint;

  /// No description provided for @scanningDoorSensors.
  ///
  /// In zh, this message translates to:
  /// **'正在扫描附近门磁…'**
  String get scanningDoorSensors;

  /// No description provided for @noDoorSensorsScanned.
  ///
  /// In zh, this message translates to:
  /// **'未发现门磁，请靠近后重试'**
  String get noDoorSensorsScanned;

  /// No description provided for @doorSensorAlreadyBound.
  ///
  /// In zh, this message translates to:
  /// **'该锁已绑定门磁'**
  String get doorSensorAlreadyBound;

  /// No description provided for @scanningRemotes.
  ///
  /// In zh, this message translates to:
  /// **'正在扫描附近遥控…'**
  String get scanningRemotes;

  /// No description provided for @startScan.
  ///
  /// In zh, this message translates to:
  /// **'扫描'**
  String get startScan;

  /// No description provided for @noRemotesScanned.
  ///
  /// In zh, this message translates to:
  /// **'未发现遥控，请靠近后重试'**
  String get noRemotesScanned;

  /// No description provided for @noEkeys.
  ///
  /// In zh, this message translates to:
  /// **'还没有电子钥匙'**
  String get noEkeys;

  /// No description provided for @noPasscodes.
  ///
  /// In zh, this message translates to:
  /// **'还没有密码'**
  String get noPasscodes;

  /// No description provided for @noCards.
  ///
  /// In zh, this message translates to:
  /// **'还没有 IC 卡'**
  String get noCards;

  /// No description provided for @noFingerprints.
  ///
  /// In zh, this message translates to:
  /// **'还没有指纹'**
  String get noFingerprints;

  /// No description provided for @noFaces.
  ///
  /// In zh, this message translates to:
  /// **'还没有人脸'**
  String get noFaces;

  /// No description provided for @noPalmVeins.
  ///
  /// In zh, this message translates to:
  /// **'还没有掌静脉'**
  String get noPalmVeins;

  /// No description provided for @noQrCodes.
  ///
  /// In zh, this message translates to:
  /// **'还没有二维码'**
  String get noQrCodes;

  /// No description provided for @noRemotes.
  ///
  /// In zh, this message translates to:
  /// **'还没有遥控'**
  String get noRemotes;

  /// No description provided for @keyName.
  ///
  /// In zh, this message translates to:
  /// **'钥匙名称'**
  String get keyName;

  /// No description provided for @authorizedAdmin.
  ///
  /// In zh, this message translates to:
  /// **'授权管理员'**
  String get authorizedAdmin;

  /// No description provided for @freeze.
  ///
  /// In zh, this message translates to:
  /// **'冻结'**
  String get freeze;

  /// No description provided for @unfreeze.
  ///
  /// In zh, this message translates to:
  /// **'解冻'**
  String get unfreeze;

  /// No description provided for @authorize.
  ///
  /// In zh, this message translates to:
  /// **'授权'**
  String get authorize;

  /// No description provided for @unauthorize.
  ///
  /// In zh, this message translates to:
  /// **'取消授权'**
  String get unauthorize;

  /// No description provided for @validityPeriod.
  ///
  /// In zh, this message translates to:
  /// **'有效期'**
  String get validityPeriod;

  /// No description provided for @permanent.
  ///
  /// In zh, this message translates to:
  /// **'永久'**
  String get permanent;

  /// No description provided for @limited.
  ///
  /// In zh, this message translates to:
  /// **'限期'**
  String get limited;

  /// No description provided for @once.
  ///
  /// In zh, this message translates to:
  /// **'单次'**
  String get once;

  /// No description provided for @recurring.
  ///
  /// In zh, this message translates to:
  /// **'循环'**
  String get recurring;

  /// No description provided for @recurringMode.
  ///
  /// In zh, this message translates to:
  /// **'循环方式'**
  String get recurringMode;

  /// No description provided for @recurringDaily.
  ///
  /// In zh, this message translates to:
  /// **'每日'**
  String get recurringDaily;

  /// No description provided for @recurringWorkday.
  ///
  /// In zh, this message translates to:
  /// **'工作日'**
  String get recurringWorkday;

  /// No description provided for @recurringWeekend.
  ///
  /// In zh, this message translates to:
  /// **'周末'**
  String get recurringWeekend;

  /// No description provided for @weekdayMon.
  ///
  /// In zh, this message translates to:
  /// **'周一'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In zh, this message translates to:
  /// **'周二'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In zh, this message translates to:
  /// **'周三'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In zh, this message translates to:
  /// **'周四'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In zh, this message translates to:
  /// **'周五'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In zh, this message translates to:
  /// **'周六'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In zh, this message translates to:
  /// **'周日'**
  String get weekdaySun;

  /// No description provided for @startTimeOfDay.
  ///
  /// In zh, this message translates to:
  /// **'开始时刻'**
  String get startTimeOfDay;

  /// No description provided for @endTimeOfDay.
  ///
  /// In zh, this message translates to:
  /// **'结束时刻'**
  String get endTimeOfDay;

  /// No description provided for @selectRecurringDays.
  ///
  /// In zh, this message translates to:
  /// **'请选择循环星期'**
  String get selectRecurringDays;

  /// No description provided for @endTimeMustAfterStart.
  ///
  /// In zh, this message translates to:
  /// **'结束时刻必须晚于开始时刻'**
  String get endTimeMustAfterStart;

  /// No description provided for @startDate.
  ///
  /// In zh, this message translates to:
  /// **'开始时间'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In zh, this message translates to:
  /// **'结束时间'**
  String get endDate;

  /// No description provided for @waitingTapCard.
  ///
  /// In zh, this message translates to:
  /// **'请在锁上刷卡'**
  String get waitingTapCard;

  /// No description provided for @collectingFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'请按压指纹 {current}/{total}'**
  String collectingFingerprint(int current, int total);

  /// No description provided for @collectingFace.
  ///
  /// In zh, this message translates to:
  /// **'请正对锁摄像头'**
  String get collectingFace;

  /// No description provided for @faceEnrollOnLock.
  ///
  /// In zh, this message translates to:
  /// **'锁上录入'**
  String get faceEnrollOnLock;

  /// No description provided for @faceEnrollByPhoto.
  ///
  /// In zh, this message translates to:
  /// **'使用照片'**
  String get faceEnrollByPhoto;

  /// No description provided for @facePhotoPickTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择人脸照片'**
  String get facePhotoPickTitle;

  /// No description provided for @facePhotoFromGallery.
  ///
  /// In zh, this message translates to:
  /// **'从相册选择'**
  String get facePhotoFromGallery;

  /// No description provided for @facePhotoFromCamera.
  ///
  /// In zh, this message translates to:
  /// **'拍照'**
  String get facePhotoFromCamera;

  /// No description provided for @facePhotoHint.
  ///
  /// In zh, this message translates to:
  /// **'正面、光线均匀、单人、无遮挡'**
  String get facePhotoHint;

  /// No description provided for @facePhotoTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'照片过大，请压缩到 2MB 以内'**
  String get facePhotoTooLarge;

  /// No description provided for @facePhotoExtracting.
  ///
  /// In zh, this message translates to:
  /// **'正在提取特征值'**
  String get facePhotoExtracting;

  /// No description provided for @collectingPalmVein.
  ///
  /// In zh, this message translates to:
  /// **'请将手掌置于感应区'**
  String get collectingPalmVein;

  /// No description provided for @enrollSuccess.
  ///
  /// In zh, this message translates to:
  /// **'录入成功'**
  String get enrollSuccess;

  /// No description provided for @copyLink.
  ///
  /// In zh, this message translates to:
  /// **'复制链接'**
  String get copyLink;

  /// No description provided for @linkCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制'**
  String get linkCopied;

  /// No description provided for @unlockLink.
  ///
  /// In zh, this message translates to:
  /// **'远程开锁链接'**
  String get unlockLink;

  /// No description provided for @deleteConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认删除？'**
  String get deleteConfirm;

  /// No description provided for @passcodeHint.
  ///
  /// In zh, this message translates to:
  /// **'4–9 位数字'**
  String get passcodeHint;

  /// No description provided for @nameHint.
  ///
  /// In zh, this message translates to:
  /// **'名称（可选）'**
  String get nameHint;

  /// No description provided for @passcodeName.
  ///
  /// In zh, this message translates to:
  /// **'密码名称'**
  String get passcodeName;

  /// No description provided for @changePasscode.
  ///
  /// In zh, this message translates to:
  /// **'修改密码'**
  String get changePasscode;

  /// No description provided for @copyPasscode.
  ///
  /// In zh, this message translates to:
  /// **'复制密码'**
  String get copyPasscode;

  /// No description provided for @cardName.
  ///
  /// In zh, this message translates to:
  /// **'卡名称'**
  String get cardName;

  /// No description provided for @fingerprintName.
  ///
  /// In zh, this message translates to:
  /// **'指纹名称'**
  String get fingerprintName;

  /// No description provided for @faceName.
  ///
  /// In zh, this message translates to:
  /// **'人脸名称'**
  String get faceName;

  /// No description provided for @palmVeinName.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉名称'**
  String get palmVeinName;

  /// No description provided for @startEnroll.
  ///
  /// In zh, this message translates to:
  /// **'开始录入'**
  String get startEnroll;

  /// No description provided for @enrollCancelHint.
  ///
  /// In zh, this message translates to:
  /// **'取消后锁仍处于录入模式，请靠近锁等待超时'**
  String get enrollCancelHint;

  /// No description provided for @keypadCardEnrollHint.
  ///
  /// In zh, this message translates to:
  /// **'请将卡片贴近无线键盘'**
  String get keypadCardEnrollHint;

  /// No description provided for @keypadFingerprintEnrollHint.
  ///
  /// In zh, this message translates to:
  /// **'请按任意键激活键盘，等待蓝色呼吸灯亮起后再放下指纹'**
  String get keypadFingerprintEnrollHint;

  /// No description provided for @cardPendingRegister.
  ///
  /// In zh, this message translates to:
  /// **'卡片已录入锁，但云端未登记'**
  String get cardPendingRegister;

  /// No description provided for @fingerprintPendingRegister.
  ///
  /// In zh, this message translates to:
  /// **'指纹已录入锁，但云端未登记'**
  String get fingerprintPendingRegister;

  /// No description provided for @pendingRegisterRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试登记'**
  String get pendingRegisterRetry;

  /// No description provided for @faceLockProgressGuide.
  ///
  /// In zh, this message translates to:
  /// **'请面向门锁摄像头，按语音提示完成采集'**
  String get faceLockProgressGuide;

  /// No description provided for @faceLockRetryAdd.
  ///
  /// In zh, this message translates to:
  /// **'重新添加'**
  String get faceLockRetryAdd;

  /// No description provided for @faceEnrollSuccess.
  ///
  /// In zh, this message translates to:
  /// **'人脸添加成功'**
  String get faceEnrollSuccess;

  /// No description provided for @errorFirmwareFaceNoFaceDetected.
  ///
  /// In zh, this message translates to:
  /// **'未检测到人脸'**
  String get errorFirmwareFaceNoFaceDetected;

  /// No description provided for @errorFirmwareFaceTooClose.
  ///
  /// In zh, this message translates to:
  /// **'人脸距离太近'**
  String get errorFirmwareFaceTooClose;

  /// No description provided for @errorFirmwareFaceTooFarAway.
  ///
  /// In zh, this message translates to:
  /// **'人脸距离太远'**
  String get errorFirmwareFaceTooFarAway;

  /// No description provided for @errorFirmwareFaceFaceCovered.
  ///
  /// In zh, this message translates to:
  /// **'人脸被遮挡'**
  String get errorFirmwareFaceFaceCovered;

  /// No description provided for @palmVeinLockProgressGuide.
  ///
  /// In zh, this message translates to:
  /// **'请将手掌置于锁感应区，按语音提示完成采集'**
  String get palmVeinLockProgressGuide;

  /// No description provided for @palmVeinLockRetryAdd.
  ///
  /// In zh, this message translates to:
  /// **'重新添加'**
  String get palmVeinLockRetryAdd;

  /// No description provided for @palmVeinEnrollSuccess.
  ///
  /// In zh, this message translates to:
  /// **'掌静脉添加成功'**
  String get palmVeinEnrollSuccess;

  /// No description provided for @errorFirmwarePalmVeinNoPalmDetected.
  ///
  /// In zh, this message translates to:
  /// **'未检测到掌静脉'**
  String get errorFirmwarePalmVeinNoPalmDetected;

  /// No description provided for @errorFirmwarePalmVeinPosition.
  ///
  /// In zh, this message translates to:
  /// **'掌部位置不清晰，请调整手掌位置'**
  String get errorFirmwarePalmVeinPosition;

  /// No description provided for @errorFirmwarePalmVeinAngle.
  ///
  /// In zh, this message translates to:
  /// **'请调整手掌角度'**
  String get errorFirmwarePalmVeinAngle;

  /// No description provided for @errorFirmwarePalmVeinBlocked.
  ///
  /// In zh, this message translates to:
  /// **'手掌被遮挡'**
  String get errorFirmwarePalmVeinBlocked;

  /// No description provided for @errorFirmwarePalmVeinBlur.
  ///
  /// In zh, this message translates to:
  /// **'请保持手掌稳定'**
  String get errorFirmwarePalmVeinBlur;

  /// No description provided for @errorFirmwarePalmVeinBack.
  ///
  /// In zh, this message translates to:
  /// **'请将掌心朝向锁'**
  String get errorFirmwarePalmVeinBack;

  /// No description provided for @gatewayTitle.
  ///
  /// In zh, this message translates to:
  /// **'网关'**
  String get gatewayTitle;

  /// No description provided for @gatewayAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加网关'**
  String get gatewayAdd;

  /// No description provided for @gatewayScanHint.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索附近的网关…'**
  String get gatewayScanHint;

  /// No description provided for @gatewayNoDevice.
  ///
  /// In zh, this message translates to:
  /// **'未发现网关，请确认网关已通电并靠近手机'**
  String get gatewayNoDevice;

  /// No description provided for @gatewayConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接网关…'**
  String get gatewayConnecting;

  /// No description provided for @gatewayWifiHint.
  ///
  /// In zh, this message translates to:
  /// **'正在获取网关附近的 Wi-Fi…'**
  String get gatewayWifiHint;

  /// No description provided for @gatewayNoWifi.
  ///
  /// In zh, this message translates to:
  /// **'未发现 Wi-Fi'**
  String get gatewayNoWifi;

  /// No description provided for @gatewayWifiPassword.
  ///
  /// In zh, this message translates to:
  /// **'Wi-Fi 密码'**
  String get gatewayWifiPassword;

  /// No description provided for @gatewayAccountPassword.
  ///
  /// In zh, this message translates to:
  /// **'账号密码'**
  String get gatewayAccountPassword;

  /// No description provided for @gatewayAccountPasswordHint.
  ///
  /// In zh, this message translates to:
  /// **'输入当前 App 的登录密码'**
  String get gatewayAccountPasswordHint;

  /// No description provided for @gatewayInitializing.
  ///
  /// In zh, this message translates to:
  /// **'正在初始化网关，请勿离开…'**
  String get gatewayInitializing;

  /// No description provided for @gatewayConfirmingHint.
  ///
  /// In zh, this message translates to:
  /// **'正在确认网关注册，可能需要几分钟…'**
  String get gatewayConfirmingHint;

  /// No description provided for @gatewayAddDone.
  ///
  /// In zh, this message translates to:
  /// **'网关添加成功'**
  String get gatewayAddDone;

  /// No description provided for @gatewayInitFailed.
  ///
  /// In zh, this message translates to:
  /// **'网关初始化失败'**
  String get gatewayInitFailed;

  /// No description provided for @gatewayInitNotConfirmed.
  ///
  /// In zh, this message translates to:
  /// **'网关尚未在云端注册，请稍后重试'**
  String get gatewayInitNotConfirmed;

  /// No description provided for @gatewayUserUidMissing.
  ///
  /// In zh, this message translates to:
  /// **'登录状态异常，请重新登录后再试'**
  String get gatewayUserUidMissing;

  /// No description provided for @gatewayConnectFailed.
  ///
  /// In zh, this message translates to:
  /// **'网关连接失败'**
  String get gatewayConnectFailed;

  /// No description provided for @gatewayRename.
  ///
  /// In zh, this message translates to:
  /// **'网关改名'**
  String get gatewayRename;

  /// No description provided for @gatewayDeleteConfirm.
  ///
  /// In zh, this message translates to:
  /// **'删除网关'**
  String get gatewayDeleteConfirm;

  /// No description provided for @gatewayDeleteConfirmMessage.
  ///
  /// In zh, this message translates to:
  /// **'删除后将解除该网关与所有锁的绑定，确认删除？'**
  String get gatewayDeleteConfirmMessage;

  /// No description provided for @gatewayEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无网关'**
  String get gatewayEmpty;

  /// No description provided for @gatewayNameLabel.
  ///
  /// In zh, this message translates to:
  /// **'网关名称'**
  String get gatewayNameLabel;

  /// No description provided for @gatewayVersion.
  ///
  /// In zh, this message translates to:
  /// **'固件版本'**
  String get gatewayVersion;

  /// No description provided for @gatewayNetworkName.
  ///
  /// In zh, this message translates to:
  /// **'网络名称'**
  String get gatewayNetworkName;

  /// No description provided for @gatewayNetworkMac.
  ///
  /// In zh, this message translates to:
  /// **'网络 MAC'**
  String get gatewayNetworkMac;

  /// No description provided for @gatewayLockCount.
  ///
  /// In zh, this message translates to:
  /// **'绑定锁数'**
  String get gatewayLockCount;

  /// No description provided for @waterMeterTitle.
  ///
  /// In zh, this message translates to:
  /// **'水表'**
  String get waterMeterTitle;

  /// No description provided for @waterMeterAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加水表'**
  String get waterMeterAdd;

  /// No description provided for @waterMeterScanHint.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索附近的水表…'**
  String get waterMeterScanHint;

  /// No description provided for @waterMeterNoDevice.
  ///
  /// In zh, this message translates to:
  /// **'未发现水表，请确认水表已通电并靠近手机'**
  String get waterMeterNoDevice;

  /// No description provided for @waterMeterSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在添加水表，请勿离开…'**
  String get waterMeterSubmitting;

  /// No description provided for @waterMeterApnTitle.
  ///
  /// In zh, this message translates to:
  /// **'配置 APN'**
  String get waterMeterApnTitle;

  /// No description provided for @waterMeterApnHint.
  ///
  /// In zh, this message translates to:
  /// **'该水表为 4G（Cat.1）表，海外使用须先填写运营商 APN，再写入服务器地址。'**
  String get waterMeterApnHint;

  /// No description provided for @waterMeterApnLabel.
  ///
  /// In zh, this message translates to:
  /// **'APN'**
  String get waterMeterApnLabel;

  /// No description provided for @waterMeterConfiguring.
  ///
  /// In zh, this message translates to:
  /// **'正在配置服务器，请勿离开…'**
  String get waterMeterConfiguring;

  /// No description provided for @waterMeterConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接水表，请勿离开…'**
  String get waterMeterConnecting;

  /// No description provided for @waterMeterAwaitConfirm.
  ///
  /// In zh, this message translates to:
  /// **'等待确认…'**
  String get waterMeterAwaitConfirm;

  /// No description provided for @waterMeterConnectionConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认屏幕红灯闪烁后，点击确认进入下一步'**
  String get waterMeterConnectionConfirm;

  /// No description provided for @waterMeterAddDone.
  ///
  /// In zh, this message translates to:
  /// **'水表添加成功'**
  String get waterMeterAddDone;

  /// No description provided for @waterMeterName.
  ///
  /// In zh, this message translates to:
  /// **'水表名称'**
  String get waterMeterName;

  /// No description provided for @waterMeterPayMode.
  ///
  /// In zh, this message translates to:
  /// **'计费模式'**
  String get waterMeterPayMode;

  /// No description provided for @waterMeterPayModeEnergy.
  ///
  /// In zh, this message translates to:
  /// **'计能模式'**
  String get waterMeterPayModeEnergy;

  /// No description provided for @waterMeterPayModePrepaid.
  ///
  /// In zh, this message translates to:
  /// **'预付费'**
  String get waterMeterPayModePrepaid;

  /// No description provided for @waterMeterPrice.
  ///
  /// In zh, this message translates to:
  /// **'单价'**
  String get waterMeterPrice;

  /// No description provided for @waterMeterPriceUnit.
  ///
  /// In zh, this message translates to:
  /// **'元/吨'**
  String get waterMeterPriceUnit;

  /// No description provided for @waterMeterTotal.
  ///
  /// In zh, this message translates to:
  /// **'累计用量'**
  String get waterMeterTotal;

  /// No description provided for @waterMeterRemainder.
  ///
  /// In zh, this message translates to:
  /// **'剩余用量'**
  String get waterMeterRemainder;

  /// No description provided for @waterMeterPowerSwitch.
  ///
  /// In zh, this message translates to:
  /// **'通断电'**
  String get waterMeterPowerSwitch;

  /// No description provided for @waterMeterRecharge.
  ///
  /// In zh, this message translates to:
  /// **'充值'**
  String get waterMeterRecharge;

  /// No description provided for @waterMeterRechargeAmount.
  ///
  /// In zh, this message translates to:
  /// **'充值金额'**
  String get waterMeterRechargeAmount;

  /// No description provided for @waterMeterRechargeM3.
  ///
  /// In zh, this message translates to:
  /// **'充值水量'**
  String get waterMeterRechargeM3;

  /// No description provided for @waterMeterRechargeDone.
  ///
  /// In zh, this message translates to:
  /// **'充值成功'**
  String get waterMeterRechargeDone;

  /// No description provided for @waterMeterRecords.
  ///
  /// In zh, this message translates to:
  /// **'记录'**
  String get waterMeterRecords;

  /// No description provided for @waterMeterRename.
  ///
  /// In zh, this message translates to:
  /// **'改名'**
  String get waterMeterRename;

  /// No description provided for @waterMeterDeleteConfirm.
  ///
  /// In zh, this message translates to:
  /// **'删除水表'**
  String get waterMeterDeleteConfirm;

  /// No description provided for @waterMeterDeleteConfirmMessage.
  ///
  /// In zh, this message translates to:
  /// **'删除后将无法恢复该水表，确认删除？'**
  String get waterMeterDeleteConfirmMessage;

  /// No description provided for @waterMeterDeleteSuccess.
  ///
  /// In zh, this message translates to:
  /// **'删除成功'**
  String get waterMeterDeleteSuccess;

  /// No description provided for @waterMeterEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无水表'**
  String get waterMeterEmpty;

  /// No description provided for @electricMeterTitle.
  ///
  /// In zh, this message translates to:
  /// **'电表'**
  String get electricMeterTitle;

  /// No description provided for @electricMeterAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加电表'**
  String get electricMeterAdd;

  /// No description provided for @electricMeterScanHint.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索附近的电表…'**
  String get electricMeterScanHint;

  /// No description provided for @electricMeterNoDevice.
  ///
  /// In zh, this message translates to:
  /// **'未发现电表，请确认电表已通电并靠近手机'**
  String get electricMeterNoDevice;

  /// No description provided for @electricMeterSubmitting.
  ///
  /// In zh, this message translates to:
  /// **'正在添加电表，请勿离开…'**
  String get electricMeterSubmitting;

  /// No description provided for @electricMeterApnTitle.
  ///
  /// In zh, this message translates to:
  /// **'配置 APN'**
  String get electricMeterApnTitle;

  /// No description provided for @electricMeterApnHint.
  ///
  /// In zh, this message translates to:
  /// **'该电表为 4G（Cat.1）表，海外使用须先填写运营商 APN，再写入服务器地址。'**
  String get electricMeterApnHint;

  /// No description provided for @electricMeterApnLabel.
  ///
  /// In zh, this message translates to:
  /// **'APN'**
  String get electricMeterApnLabel;

  /// No description provided for @electricMeterConfiguring.
  ///
  /// In zh, this message translates to:
  /// **'正在配置服务器，请勿离开…'**
  String get electricMeterConfiguring;

  /// No description provided for @electricMeterConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接电表，请勿离开…'**
  String get electricMeterConnecting;

  /// No description provided for @electricMeterAwaitConfirm.
  ///
  /// In zh, this message translates to:
  /// **'等待确认…'**
  String get electricMeterAwaitConfirm;

  /// No description provided for @electricMeterConnectionConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认屏幕红灯交替闪烁后，点击确认进入下一步'**
  String get electricMeterConnectionConfirm;

  /// No description provided for @electricMeterAddDone.
  ///
  /// In zh, this message translates to:
  /// **'电表添加成功'**
  String get electricMeterAddDone;

  /// No description provided for @electricMeterName.
  ///
  /// In zh, this message translates to:
  /// **'电表名称'**
  String get electricMeterName;

  /// No description provided for @electricMeterPayMode.
  ///
  /// In zh, this message translates to:
  /// **'计费模式'**
  String get electricMeterPayMode;

  /// No description provided for @electricMeterPayModeEnergy.
  ///
  /// In zh, this message translates to:
  /// **'计能模式'**
  String get electricMeterPayModeEnergy;

  /// No description provided for @electricMeterPayModePrepaid.
  ///
  /// In zh, this message translates to:
  /// **'预付费'**
  String get electricMeterPayModePrepaid;

  /// No description provided for @electricMeterPrice.
  ///
  /// In zh, this message translates to:
  /// **'单价'**
  String get electricMeterPrice;

  /// No description provided for @electricMeterPriceUnit.
  ///
  /// In zh, this message translates to:
  /// **'元/千瓦时'**
  String get electricMeterPriceUnit;

  /// No description provided for @electricMeterTotal.
  ///
  /// In zh, this message translates to:
  /// **'累计用量'**
  String get electricMeterTotal;

  /// No description provided for @electricMeterRemainder.
  ///
  /// In zh, this message translates to:
  /// **'剩余用量'**
  String get electricMeterRemainder;

  /// No description provided for @electricMeterMaxPower.
  ///
  /// In zh, this message translates to:
  /// **'最大功率'**
  String get electricMeterMaxPower;

  /// No description provided for @electricMeterMaxPowerHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入最大功率'**
  String get electricMeterMaxPowerHint;

  /// No description provided for @electricMeterMaxPowerDone.
  ///
  /// In zh, this message translates to:
  /// **'最大功率修改成功'**
  String get electricMeterMaxPowerDone;

  /// No description provided for @electricMeterPowerSwitch.
  ///
  /// In zh, this message translates to:
  /// **'通断电'**
  String get electricMeterPowerSwitch;

  /// No description provided for @electricMeterRecharge.
  ///
  /// In zh, this message translates to:
  /// **'充值'**
  String get electricMeterRecharge;

  /// No description provided for @electricMeterRechargeAmount.
  ///
  /// In zh, this message translates to:
  /// **'充值金额'**
  String get electricMeterRechargeAmount;

  /// No description provided for @electricMeterRechargeKwh.
  ///
  /// In zh, this message translates to:
  /// **'充值电量'**
  String get electricMeterRechargeKwh;

  /// No description provided for @electricMeterRechargeDone.
  ///
  /// In zh, this message translates to:
  /// **'充值成功'**
  String get electricMeterRechargeDone;

  /// No description provided for @electricMeterRecords.
  ///
  /// In zh, this message translates to:
  /// **'记录'**
  String get electricMeterRecords;

  /// No description provided for @electricMeterRename.
  ///
  /// In zh, this message translates to:
  /// **'改名'**
  String get electricMeterRename;

  /// No description provided for @electricMeterEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无电表'**
  String get electricMeterEmpty;

  /// No description provided for @electricMeterDeleteConfirm.
  ///
  /// In zh, this message translates to:
  /// **'删除电表'**
  String get electricMeterDeleteConfirm;

  /// No description provided for @electricMeterDeleteConfirmMessage.
  ///
  /// In zh, this message translates to:
  /// **'删除后将无法恢复该电表，确认删除？'**
  String get electricMeterDeleteConfirmMessage;

  /// No description provided for @meterSettings.
  ///
  /// In zh, this message translates to:
  /// **'设备设置'**
  String get meterSettings;

  /// No description provided for @meterOperationRecords.
  ///
  /// In zh, this message translates to:
  /// **'操作记录'**
  String get meterOperationRecords;

  /// No description provided for @meterUsageRecordsElectric.
  ///
  /// In zh, this message translates to:
  /// **'用电记录'**
  String get meterUsageRecordsElectric;

  /// No description provided for @meterUsageRecordsWater.
  ///
  /// In zh, this message translates to:
  /// **'用水记录'**
  String get meterUsageRecordsWater;

  /// No description provided for @meterInfo.
  ///
  /// In zh, this message translates to:
  /// **'设备信息'**
  String get meterInfo;

  /// No description provided for @meterCatOne.
  ///
  /// In zh, this message translates to:
  /// **'4G 网络'**
  String get meterCatOne;

  /// No description provided for @meterCatOneUnconfigured.
  ///
  /// In zh, this message translates to:
  /// **'该表的 4G 模块尚未配置成功'**
  String get meterCatOneUnconfigured;

  /// No description provided for @meterFirmware.
  ///
  /// In zh, this message translates to:
  /// **'固件升级'**
  String get meterFirmware;

  /// No description provided for @meterReadData.
  ///
  /// In zh, this message translates to:
  /// **'抄表'**
  String get meterReadData;

  /// No description provided for @meterClear.
  ///
  /// In zh, this message translates to:
  /// **'清零'**
  String get meterClear;

  /// No description provided for @meterClearConfirmTitle.
  ///
  /// In zh, this message translates to:
  /// **'确认清零？'**
  String get meterClearConfirmTitle;

  /// No description provided for @meterClearConfirmBody.
  ///
  /// In zh, this message translates to:
  /// **'将清除该表当前的剩余用量，此操作不可撤销。'**
  String get meterClearConfirmBody;

  /// No description provided for @electricMeterPriceEdit.
  ///
  /// In zh, this message translates to:
  /// **'电价调整'**
  String get electricMeterPriceEdit;

  /// No description provided for @waterMeterPriceEdit.
  ///
  /// In zh, this message translates to:
  /// **'水价调整'**
  String get waterMeterPriceEdit;

  /// No description provided for @meterPayModeEdit.
  ///
  /// In zh, this message translates to:
  /// **'计费模式'**
  String get meterPayModeEdit;

  /// No description provided for @meterTotalUsageEdit.
  ///
  /// In zh, this message translates to:
  /// **'总用量调整'**
  String get meterTotalUsageEdit;

  /// No description provided for @meterNearbyRequired.
  ///
  /// In zh, this message translates to:
  /// **'该操作需靠近设备才能完成，请确认已在设备附近。'**
  String get meterNearbyRequired;

  /// No description provided for @meterRecordTypeRecharge.
  ///
  /// In zh, this message translates to:
  /// **'充值'**
  String get meterRecordTypeRecharge;

  /// No description provided for @meterRecordTypePowerOff.
  ///
  /// In zh, this message translates to:
  /// **'断电'**
  String get meterRecordTypePowerOff;

  /// No description provided for @meterRecordTypePowerOn.
  ///
  /// In zh, this message translates to:
  /// **'通电'**
  String get meterRecordTypePowerOn;

  /// No description provided for @meterRecordTypeRead.
  ///
  /// In zh, this message translates to:
  /// **'抄表'**
  String get meterRecordTypeRead;

  /// No description provided for @meterRecordTypePrice.
  ///
  /// In zh, this message translates to:
  /// **'单价修改'**
  String get meterRecordTypePrice;

  /// No description provided for @meterRecordTypeClear.
  ///
  /// In zh, this message translates to:
  /// **'清零'**
  String get meterRecordTypeClear;

  /// No description provided for @meterRecordTypePaying.
  ///
  /// In zh, this message translates to:
  /// **'充值中'**
  String get meterRecordTypePaying;

  /// No description provided for @meterDateTypeDay.
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get meterDateTypeDay;

  /// No description provided for @meterDateTypeMonth.
  ///
  /// In zh, this message translates to:
  /// **'月'**
  String get meterDateTypeMonth;

  /// No description provided for @meterDateTypeYear.
  ///
  /// In zh, this message translates to:
  /// **'年'**
  String get meterDateTypeYear;

  /// No description provided for @meterUnitKwh.
  ///
  /// In zh, this message translates to:
  /// **'千瓦时'**
  String get meterUnitKwh;

  /// No description provided for @meterUnitTon.
  ///
  /// In zh, this message translates to:
  /// **'吨'**
  String get meterUnitTon;

  /// No description provided for @meterUnitKw.
  ///
  /// In zh, this message translates to:
  /// **'千瓦'**
  String get meterUnitKw;

  /// No description provided for @meterEmptyRecords.
  ///
  /// In zh, this message translates to:
  /// **'暂无记录'**
  String get meterEmptyRecords;

  /// No description provided for @meterCatOneRssiGrade.
  ///
  /// In zh, this message translates to:
  /// **'信号等级'**
  String get meterCatOneRssiGrade;

  /// No description provided for @meterCatOneRssiUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get meterCatOneRssiUnknown;

  /// No description provided for @meterCatOneRssiPoor.
  ///
  /// In zh, this message translates to:
  /// **'差'**
  String get meterCatOneRssiPoor;

  /// No description provided for @meterCatOneRssiMedium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get meterCatOneRssiMedium;

  /// No description provided for @meterCatOneRssiStrong.
  ///
  /// In zh, this message translates to:
  /// **'强'**
  String get meterCatOneRssiStrong;

  /// No description provided for @meterCatOneNodeId.
  ///
  /// In zh, this message translates to:
  /// **'模块号'**
  String get meterCatOneNodeId;

  /// No description provided for @meterCatOneCardNumber.
  ///
  /// In zh, this message translates to:
  /// **'卡号'**
  String get meterCatOneCardNumber;

  /// No description provided for @meterCatOneOperator.
  ///
  /// In zh, this message translates to:
  /// **'运营商'**
  String get meterCatOneOperator;

  /// No description provided for @meterCatOneImsi.
  ///
  /// In zh, this message translates to:
  /// **'手机号'**
  String get meterCatOneImsi;

  /// No description provided for @meterCatOneApn.
  ///
  /// In zh, this message translates to:
  /// **'APN'**
  String get meterCatOneApn;

  /// No description provided for @meterCatOneOverseaCard.
  ///
  /// In zh, this message translates to:
  /// **'海外卡'**
  String get meterCatOneOverseaCard;

  /// No description provided for @meterCatOneYes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get meterCatOneYes;

  /// No description provided for @meterCatOneNo.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get meterCatOneNo;

  /// No description provided for @meterCatOneConfigureServer.
  ///
  /// In zh, this message translates to:
  /// **'配置服务器'**
  String get meterCatOneConfigureServer;

  /// No description provided for @meterCatOneReconfigure.
  ///
  /// In zh, this message translates to:
  /// **'重新配置'**
  String get meterCatOneReconfigure;

  /// No description provided for @meterCatOneNeedNearby.
  ///
  /// In zh, this message translates to:
  /// **'配置服务器需靠近设备才能完成，请确认已在设备附近。'**
  String get meterCatOneNeedNearby;

  /// No description provided for @meterCatOneUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'4G 网络信息暂不可用'**
  String get meterCatOneUnavailable;

  /// No description provided for @meterCatOneApnSheetTitle.
  ///
  /// In zh, this message translates to:
  /// **'配置 APN'**
  String get meterCatOneApnSheetTitle;

  /// No description provided for @meterCatOneApnSheetHint.
  ///
  /// In zh, this message translates to:
  /// **'海外使用须填写运营商 APN，再写入服务器地址。'**
  String get meterCatOneApnSheetHint;

  /// No description provided for @meterCatOneApnLabel.
  ///
  /// In zh, this message translates to:
  /// **'APN'**
  String get meterCatOneApnLabel;

  /// No description provided for @meterOps.
  ///
  /// In zh, this message translates to:
  /// **'操作'**
  String get meterOps;

  /// No description provided for @meterNumber.
  ///
  /// In zh, this message translates to:
  /// **'表号'**
  String get meterNumber;

  /// No description provided for @meterMac.
  ///
  /// In zh, this message translates to:
  /// **'MAC'**
  String get meterMac;

  /// No description provided for @meterModelNum.
  ///
  /// In zh, this message translates to:
  /// **'型号'**
  String get meterModelNum;

  /// No description provided for @meterHardwareRevision.
  ///
  /// In zh, this message translates to:
  /// **'硬件版本'**
  String get meterHardwareRevision;

  /// No description provided for @meterFirmwareRevision.
  ///
  /// In zh, this message translates to:
  /// **'固件版本'**
  String get meterFirmwareRevision;

  /// No description provided for @meterFeatureValue.
  ///
  /// In zh, this message translates to:
  /// **'特征值'**
  String get meterFeatureValue;

  /// No description provided for @meterSyncDate.
  ///
  /// In zh, this message translates to:
  /// **'抄表时间'**
  String get meterSyncDate;

  /// No description provided for @meterGroupName.
  ///
  /// In zh, this message translates to:
  /// **'分组'**
  String get meterGroupName;

  /// No description provided for @meterFirmwareCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前版本'**
  String get meterFirmwareCurrent;

  /// No description provided for @meterFirmwareLatest.
  ///
  /// In zh, this message translates to:
  /// **'最新版本'**
  String get meterFirmwareLatest;

  /// No description provided for @meterFirmwareNeedUpgrade.
  ///
  /// In zh, this message translates to:
  /// **'有新版本可升级'**
  String get meterFirmwareNeedUpgrade;

  /// No description provided for @meterFirmwareUpToDate.
  ///
  /// In zh, this message translates to:
  /// **'已是最新版本'**
  String get meterFirmwareUpToDate;

  /// No description provided for @meterFirmwareUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'固件信息暂不可用'**
  String get meterFirmwareUnavailable;

  /// No description provided for @meterPriceHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入单价'**
  String get meterPriceHint;

  /// No description provided for @meterPriceInvalid.
  ///
  /// In zh, this message translates to:
  /// **'请输入大于 0 的单价'**
  String get meterPriceInvalid;

  /// No description provided for @meterPayModeSwitchTitle.
  ///
  /// In zh, this message translates to:
  /// **'计费模式'**
  String get meterPayModeSwitchTitle;

  /// No description provided for @meterTotalUsageHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入总用量'**
  String get meterTotalUsageHint;

  /// No description provided for @meterTotalUsageInvalid.
  ///
  /// In zh, this message translates to:
  /// **'请输入大于 0 的总用量'**
  String get meterTotalUsageInvalid;

  /// No description provided for @meterAddSuccessTitle.
  ///
  /// In zh, this message translates to:
  /// **'添加成功'**
  String get meterAddSuccessTitle;

  /// No description provided for @meterAddSuccessNameLabel.
  ///
  /// In zh, this message translates to:
  /// **'名称（非必填）'**
  String get meterAddSuccessNameLabel;

  /// No description provided for @meterAddSuccessApnLabel.
  ///
  /// In zh, this message translates to:
  /// **'APN（必填）'**
  String get meterAddSuccessApnLabel;

  /// No description provided for @meterAddSuccessApnHint.
  ///
  /// In zh, this message translates to:
  /// **'该表为 4G（Cat.1）表，海外使用须填写运营商 APN。'**
  String get meterAddSuccessApnHint;

  /// No description provided for @meterAddSuccessDone.
  ///
  /// In zh, this message translates to:
  /// **'完成'**
  String get meterAddSuccessDone;

  /// No description provided for @meterAddSuccessCatOneHint.
  ///
  /// In zh, this message translates to:
  /// **'4G 配置未完成，可稍后到「4G 网络」页重试。'**
  String get meterAddSuccessCatOneHint;

  /// No description provided for @meterRecordTypeAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get meterRecordTypeAll;

  /// No description provided for @meterRecordTypeWaterOff.
  ///
  /// In zh, this message translates to:
  /// **'断水'**
  String get meterRecordTypeWaterOff;

  /// No description provided for @meterRecordTypeWaterOn.
  ///
  /// In zh, this message translates to:
  /// **'通水'**
  String get meterRecordTypeWaterOn;

  /// No description provided for @meterRecordTypeClearRemainder.
  ///
  /// In zh, this message translates to:
  /// **'清除剩余电量'**
  String get meterRecordTypeClearRemainder;

  /// No description provided for @meterRecordTypeClearRemainderWater.
  ///
  /// In zh, this message translates to:
  /// **'清除剩余水量'**
  String get meterRecordTypeClearRemainderWater;

  /// No description provided for @meterRecordTypePayModeSwitch.
  ///
  /// In zh, this message translates to:
  /// **'付费类型切换'**
  String get meterRecordTypePayModeSwitch;

  /// No description provided for @meterRecordTypePowerOnOff.
  ///
  /// In zh, this message translates to:
  /// **'通断电'**
  String get meterRecordTypePowerOnOff;

  /// No description provided for @meterRecordTypePowerOnOffWater.
  ///
  /// In zh, this message translates to:
  /// **'通断水'**
  String get meterRecordTypePowerOnOffWater;

  /// No description provided for @meterRecordTypeSetTotalUsage.
  ///
  /// In zh, this message translates to:
  /// **'设置水量'**
  String get meterRecordTypeSetTotalUsage;

  /// No description provided for @standaloneDoorSensorTitle.
  ///
  /// In zh, this message translates to:
  /// **'独立门磁'**
  String get standaloneDoorSensorTitle;

  /// No description provided for @addStandaloneDoorSensor.
  ///
  /// In zh, this message translates to:
  /// **'添加独立门磁'**
  String get addStandaloneDoorSensor;

  /// No description provided for @standaloneDoorSensorEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无独立门磁'**
  String get standaloneDoorSensorEmpty;

  /// No description provided for @standaloneDoorScanningDevice.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索附近的独立门磁…'**
  String get standaloneDoorScanningDevice;

  /// No description provided for @standaloneDoorScanHint.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索附近的独立门磁…'**
  String get standaloneDoorScanHint;

  /// No description provided for @standaloneDoorNoDevice.
  ///
  /// In zh, this message translates to:
  /// **'未发现独立门磁，请确认设备已通电并靠近手机'**
  String get standaloneDoorNoDevice;

  /// No description provided for @standaloneDoorDeviceName.
  ///
  /// In zh, this message translates to:
  /// **'设备名称'**
  String get standaloneDoorDeviceName;

  /// No description provided for @standaloneDoorWifiName.
  ///
  /// In zh, this message translates to:
  /// **'Wi-Fi 名称'**
  String get standaloneDoorWifiName;

  /// No description provided for @standaloneDoorWifiPassword.
  ///
  /// In zh, this message translates to:
  /// **'Wi-Fi 密码'**
  String get standaloneDoorWifiPassword;

  /// No description provided for @standaloneDoorInitializing.
  ///
  /// In zh, this message translates to:
  /// **'正在添加独立门磁，请勿离开…'**
  String get standaloneDoorInitializing;

  /// No description provided for @standaloneDoorAddFailed.
  ///
  /// In zh, this message translates to:
  /// **'独立门磁添加失败'**
  String get standaloneDoorAddFailed;

  /// No description provided for @standaloneDoorUnbound.
  ///
  /// In zh, this message translates to:
  /// **'未添加'**
  String get standaloneDoorUnbound;

  /// No description provided for @standaloneDoorState.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get standaloneDoorState;

  /// No description provided for @standaloneDoorClosed.
  ///
  /// In zh, this message translates to:
  /// **'闭合'**
  String get standaloneDoorClosed;

  /// No description provided for @standaloneDoorOpen.
  ///
  /// In zh, this message translates to:
  /// **'打开'**
  String get standaloneDoorOpen;

  /// No description provided for @standaloneDoorUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get standaloneDoorUnknown;

  /// No description provided for @standaloneDoorWifiMac.
  ///
  /// In zh, this message translates to:
  /// **'Wi-Fi MAC'**
  String get standaloneDoorWifiMac;

  /// No description provided for @standaloneDoorFeatureValue.
  ///
  /// In zh, this message translates to:
  /// **'能力值'**
  String get standaloneDoorFeatureValue;

  /// No description provided for @standaloneDoorFirmware.
  ///
  /// In zh, this message translates to:
  /// **'固件版本'**
  String get standaloneDoorFirmware;

  /// No description provided for @standaloneDoorNumber.
  ///
  /// In zh, this message translates to:
  /// **'设备编号'**
  String get standaloneDoorNumber;

  /// No description provided for @standaloneDoorRename.
  ///
  /// In zh, this message translates to:
  /// **'改名'**
  String get standaloneDoorRename;

  /// No description provided for @standaloneDoorDeleteConfirm.
  ///
  /// In zh, this message translates to:
  /// **'删除独立门磁'**
  String get standaloneDoorDeleteConfirm;

  /// No description provided for @standaloneDoorDeleteConfirmMessage.
  ///
  /// In zh, this message translates to:
  /// **'删除后将无法恢复该独立门磁，确认删除？'**
  String get standaloneDoorDeleteConfirmMessage;

  /// No description provided for @standaloneDoorAlertConfig.
  ///
  /// In zh, this message translates to:
  /// **'告警配置'**
  String get standaloneDoorAlertConfig;

  /// No description provided for @standaloneDoorWifiConfig.
  ///
  /// In zh, this message translates to:
  /// **'Wi-Fi 重配'**
  String get standaloneDoorWifiConfig;

  /// No description provided for @standaloneDoorWifiRepowerHint.
  ///
  /// In zh, this message translates to:
  /// **'请重新给独立门磁通电，通电完成后再继续配网。'**
  String get standaloneDoorWifiRepowerHint;

  /// No description provided for @standaloneDoorUserManage.
  ///
  /// In zh, this message translates to:
  /// **'用户管理'**
  String get standaloneDoorUserManage;

  /// No description provided for @standaloneDoorNotCloseAlert.
  ///
  /// In zh, this message translates to:
  /// **'未关门报警'**
  String get standaloneDoorNotCloseAlert;

  /// No description provided for @standaloneDoorLongTimeNotOpenAlert.
  ///
  /// In zh, this message translates to:
  /// **'久未打开报警'**
  String get standaloneDoorLongTimeNotOpenAlert;

  /// No description provided for @standaloneDoorNotCloseSecondLabel.
  ///
  /// In zh, this message translates to:
  /// **'未关门报警时长（秒）'**
  String get standaloneDoorNotCloseSecondLabel;

  /// No description provided for @standaloneDoorNotOpenDayLabel.
  ///
  /// In zh, this message translates to:
  /// **'久未打开报警（天）'**
  String get standaloneDoorNotOpenDayLabel;

  /// No description provided for @standaloneDoorAddUser.
  ///
  /// In zh, this message translates to:
  /// **'添加用户'**
  String get standaloneDoorAddUser;

  /// No description provided for @standaloneDoorAddUserAccountHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入账号'**
  String get standaloneDoorAddUserAccountHint;

  /// No description provided for @standaloneDoorAddUserHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入姓名'**
  String get standaloneDoorAddUserHint;

  /// No description provided for @standaloneDoorUserListEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无用户'**
  String get standaloneDoorUserListEmpty;

  /// No description provided for @wifiConfig.
  ///
  /// In zh, this message translates to:
  /// **'配置网络'**
  String get wifiConfig;

  /// No description provided for @wifiConfigHint.
  ///
  /// In zh, this message translates to:
  /// **'选择锁要连接的 WiFi 并输入密码，配置完成后锁将自动连接服务器。'**
  String get wifiConfigHint;

  /// No description provided for @currentNetwork.
  ///
  /// In zh, this message translates to:
  /// **'当前网络'**
  String get currentNetwork;

  /// No description provided for @wifiNetwork.
  ///
  /// In zh, this message translates to:
  /// **'WiFi 网络'**
  String get wifiNetwork;

  /// No description provided for @notSelected.
  ///
  /// In zh, this message translates to:
  /// **'未选择'**
  String get notSelected;

  /// No description provided for @selectWifiNetwork.
  ///
  /// In zh, this message translates to:
  /// **'选择 WiFi'**
  String get selectWifiNetwork;

  /// No description provided for @noAvailableWifi.
  ///
  /// In zh, this message translates to:
  /// **'未扫描到可用 WiFi'**
  String get noAvailableWifi;

  /// No description provided for @rescan.
  ///
  /// In zh, this message translates to:
  /// **'重新扫描'**
  String get rescan;

  /// No description provided for @wifiPasswordLabel.
  ///
  /// In zh, this message translates to:
  /// **'WiFi 密码'**
  String get wifiPasswordLabel;

  /// No description provided for @pleaseSelectWifiNetwork.
  ///
  /// In zh, this message translates to:
  /// **'请先选择 WiFi 网络'**
  String get pleaseSelectWifiNetwork;

  /// No description provided for @pleaseEnterWifiPasswordLabel.
  ///
  /// In zh, this message translates to:
  /// **'请输入 WiFi 密码'**
  String get pleaseEnterWifiPasswordLabel;

  /// No description provided for @missingLockDataCannotScanWifi.
  ///
  /// In zh, this message translates to:
  /// **'缺少锁数据，无法扫描 WiFi'**
  String get missingLockDataCannotScanWifi;

  /// No description provided for @missingLockDataCannotConfigWifi.
  ///
  /// In zh, this message translates to:
  /// **'缺少锁数据，无法配置网络'**
  String get missingLockDataCannotConfigWifi;

  /// No description provided for @powerSavingMode.
  ///
  /// In zh, this message translates to:
  /// **'省电模式'**
  String get powerSavingMode;

  /// No description provided for @advancedSettings.
  ///
  /// In zh, this message translates to:
  /// **'高级设置'**
  String get advancedSettings;

  /// No description provided for @staticIpConfigDnsConfig.
  ///
  /// In zh, this message translates to:
  /// **'静态 IP 与 DNS 配置'**
  String get staticIpConfigDnsConfig;

  /// No description provided for @useStaticIp.
  ///
  /// In zh, this message translates to:
  /// **'使用静态 IP'**
  String get useStaticIp;

  /// No description provided for @staticIpAddress.
  ///
  /// In zh, this message translates to:
  /// **'IP 地址'**
  String get staticIpAddress;

  /// No description provided for @staticIpAddressExample.
  ///
  /// In zh, this message translates to:
  /// **'如 192.168.1.50'**
  String get staticIpAddressExample;

  /// No description provided for @subnetMask.
  ///
  /// In zh, this message translates to:
  /// **'子网掩码'**
  String get subnetMask;

  /// No description provided for @subnetMaskExample.
  ///
  /// In zh, this message translates to:
  /// **'如 255.255.255.0'**
  String get subnetMaskExample;

  /// No description provided for @defaultGateway.
  ///
  /// In zh, this message translates to:
  /// **'默认网关'**
  String get defaultGateway;

  /// No description provided for @defaultGatewayExample.
  ///
  /// In zh, this message translates to:
  /// **'如 192.168.1.1'**
  String get defaultGatewayExample;

  /// No description provided for @useCustomDns.
  ///
  /// In zh, this message translates to:
  /// **'自定义 DNS'**
  String get useCustomDns;

  /// No description provided for @preferredDns.
  ///
  /// In zh, this message translates to:
  /// **'首选 DNS'**
  String get preferredDns;

  /// No description provided for @alternateDnsOptional.
  ///
  /// In zh, this message translates to:
  /// **'备用 DNS（可选）'**
  String get alternateDnsOptional;

  /// No description provided for @staticIpAddressFormatIncorrect.
  ///
  /// In zh, this message translates to:
  /// **'IP 地址格式不正确'**
  String get staticIpAddressFormatIncorrect;

  /// No description provided for @subnetMaskFormatIncorrect.
  ///
  /// In zh, this message translates to:
  /// **'子网掩码格式不正确'**
  String get subnetMaskFormatIncorrect;

  /// No description provided for @defaultGatewayFormatIncorrect.
  ///
  /// In zh, this message translates to:
  /// **'默认网关格式不正确'**
  String get defaultGatewayFormatIncorrect;

  /// No description provided for @preferredDnsFormatIncorrect.
  ///
  /// In zh, this message translates to:
  /// **'首选 DNS 格式不正确'**
  String get preferredDnsFormatIncorrect;

  /// No description provided for @alternateDnsFormatIncorrect.
  ///
  /// In zh, this message translates to:
  /// **'备用 DNS 格式不正确'**
  String get alternateDnsFormatIncorrect;

  /// No description provided for @wifiConfigSuccess.
  ///
  /// In zh, this message translates to:
  /// **'网络配置成功'**
  String get wifiConfigSuccess;

  /// No description provided for @startConfig.
  ///
  /// In zh, this message translates to:
  /// **'开始配置'**
  String get startConfig;

  /// No description provided for @hotelTitle.
  ///
  /// In zh, this message translates to:
  /// **'酒店'**
  String get hotelTitle;

  /// No description provided for @hotelLockTypeHotel.
  ///
  /// In zh, this message translates to:
  /// **'酒店锁'**
  String get hotelLockTypeHotel;

  /// No description provided for @hotelLockTypeLift.
  ///
  /// In zh, this message translates to:
  /// **'梯控'**
  String get hotelLockTypeLift;

  /// No description provided for @hotelLockTypePower.
  ///
  /// In zh, this message translates to:
  /// **'取电'**
  String get hotelLockTypePower;

  /// No description provided for @hotelEmptyTitle.
  ///
  /// In zh, this message translates to:
  /// **'该账号下没有酒店锁'**
  String get hotelEmptyTitle;

  /// No description provided for @hotelEmptyBody.
  ///
  /// In zh, this message translates to:
  /// **'酒店锁列表只能显示在「通通酒店」APP 里添加的锁，或本应用初始化时写入了酒店信息的锁。'**
  String get hotelEmptyBody;

  /// No description provided for @hotelUnassigned.
  ///
  /// In zh, this message translates to:
  /// **'未分配'**
  String get hotelUnassigned;

  /// No description provided for @hotelSearchHint.
  ///
  /// In zh, this message translates to:
  /// **'搜索锁别名'**
  String get hotelSearchHint;

  /// No description provided for @hotelLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载失败'**
  String get hotelLoadFailed;

  /// No description provided for @hotelRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试'**
  String get hotelRetry;

  /// No description provided for @hotelNotSupported.
  ///
  /// In zh, this message translates to:
  /// **'不支持'**
  String get hotelNotSupported;

  /// No description provided for @cardEncoderUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'酒店信息不可用（需账号已创建酒店）'**
  String get cardEncoderUnavailable;

  /// No description provided for @hotelCloudPending.
  ///
  /// In zh, this message translates to:
  /// **'云端未同步'**
  String get hotelCloudPending;

  /// No description provided for @hotelBuildingFloor.
  ///
  /// In zh, this message translates to:
  /// **'楼栋/楼层'**
  String get hotelBuildingFloor;

  /// No description provided for @hotelSector.
  ///
  /// In zh, this message translates to:
  /// **'卡扇区'**
  String get hotelSector;

  /// No description provided for @hotelSectorHint.
  ///
  /// In zh, this message translates to:
  /// **'选择该锁读取酒店卡的扇区（1–10）'**
  String get hotelSectorHint;

  /// No description provided for @hotelSectorSave.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get hotelSectorSave;

  /// No description provided for @hotelWriteBuildingFloor.
  ///
  /// In zh, this message translates to:
  /// **'写入楼栋/楼层'**
  String get hotelWriteBuildingFloor;

  /// No description provided for @hotelBuildingNumber.
  ///
  /// In zh, this message translates to:
  /// **'楼栋号'**
  String get hotelBuildingNumber;

  /// No description provided for @hotelFloorNumber.
  ///
  /// In zh, this message translates to:
  /// **'楼层号'**
  String get hotelFloorNumber;

  /// No description provided for @hotelIcKey.
  ///
  /// In zh, this message translates to:
  /// **'IC 密钥'**
  String get hotelIcKey;

  /// No description provided for @hotelGetIcKey.
  ///
  /// In zh, this message translates to:
  /// **'获取'**
  String get hotelGetIcKey;

  /// No description provided for @hotelCopySuccess.
  ///
  /// In zh, this message translates to:
  /// **'已复制'**
  String get hotelCopySuccess;

  /// No description provided for @hotelOpenLockDetail.
  ///
  /// In zh, this message translates to:
  /// **'打开锁详情'**
  String get hotelOpenLockDetail;

  /// No description provided for @hotelAlias.
  ///
  /// In zh, this message translates to:
  /// **'别名'**
  String get hotelAlias;

  /// No description provided for @hotelCloudRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试同步'**
  String get hotelCloudRetry;

  /// No description provided for @hotelInitDate.
  ///
  /// In zh, this message translates to:
  /// **'初始化时间'**
  String get hotelInitDate;

  /// No description provided for @hotelGroupName.
  ///
  /// In zh, this message translates to:
  /// **'分组'**
  String get hotelGroupName;

  /// No description provided for @hotelMac.
  ///
  /// In zh, this message translates to:
  /// **'MAC'**
  String get hotelMac;

  /// No description provided for @hotelElectricQuantity.
  ///
  /// In zh, this message translates to:
  /// **'电量'**
  String get hotelElectricQuantity;

  /// No description provided for @enrollTimeout.
  ///
  /// In zh, this message translates to:
  /// **'未检测到刷卡或指纹，请重试'**
  String get enrollTimeout;

  /// No description provided for @keypadSlots.
  ///
  /// In zh, this message translates to:
  /// **'槽位'**
  String get keypadSlots;

  /// No description provided for @keypadSlotLabel.
  ///
  /// In zh, this message translates to:
  /// **'槽位 {slot}'**
  String keypadSlotLabel(int slot);

  /// No description provided for @keypadSlotEmpty.
  ///
  /// In zh, this message translates to:
  /// **'未绑定'**
  String get keypadSlotEmpty;

  /// No description provided for @keypadSlotMine.
  ///
  /// In zh, this message translates to:
  /// **'本锁'**
  String get keypadSlotMine;

  /// No description provided for @keypadSlotLimit.
  ///
  /// In zh, this message translates to:
  /// **'可绑定 {limit} 把锁'**
  String keypadSlotLimit(int limit);

  /// No description provided for @keypadSlotsUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'无法读取槽位（需对该键盘关联的锁有权限）'**
  String get keypadSlotsUnavailable;

  /// No description provided for @keypadSlotsLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'槽位读取失败：{reason}'**
  String keypadSlotsLoadFailed(String reason);

  /// No description provided for @keypadUnbindFromLock.
  ///
  /// In zh, this message translates to:
  /// **'解除绑定'**
  String get keypadUnbindFromLock;

  /// No description provided for @keypadUnbindConfirm.
  ///
  /// In zh, this message translates to:
  /// **'请先在键盘上输入 *529#，确认后解除本锁与该键盘的绑定。'**
  String get keypadUnbindConfirm;

  /// No description provided for @keypadCloudPending.
  ///
  /// In zh, this message translates to:
  /// **'键盘已解绑，但云端未同步'**
  String get keypadCloudPending;

  /// No description provided for @keypadCloudRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试同步'**
  String get keypadCloudRetry;

  /// No description provided for @keypadEnrollCard.
  ///
  /// In zh, this message translates to:
  /// **'录入卡片'**
  String get keypadEnrollCard;

  /// No description provided for @keypadEnrollFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'录入指纹'**
  String get keypadEnrollFingerprint;

  /// No description provided for @low.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get high;

  /// No description provided for @veryHigh.
  ///
  /// In zh, this message translates to:
  /// **'很高'**
  String get veryHigh;

  /// No description provided for @extreme.
  ///
  /// In zh, this message translates to:
  /// **'最高'**
  String get extreme;

  /// No description provided for @off.
  ///
  /// In zh, this message translates to:
  /// **'关'**
  String get off;

  /// No description provided for @on.
  ///
  /// In zh, this message translates to:
  /// **'开'**
  String get on;

  /// No description provided for @sensitivity.
  ///
  /// In zh, this message translates to:
  /// **'灵敏度'**
  String get sensitivity;

  /// No description provided for @sensitivityOff.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get sensitivityOff;

  /// No description provided for @lightTime.
  ///
  /// In zh, this message translates to:
  /// **'照明时长'**
  String get lightTime;

  /// No description provided for @lightTimeHint.
  ///
  /// In zh, this message translates to:
  /// **'照明持续时间（秒）'**
  String get lightTimeHint;

  /// No description provided for @bluetoothAdvertisingInterval.
  ///
  /// In zh, this message translates to:
  /// **'蓝牙广播间隔'**
  String get bluetoothAdvertisingInterval;

  /// No description provided for @bluetoothAdvertisingIntervalCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前间隔'**
  String get bluetoothAdvertisingIntervalCurrent;

  /// No description provided for @bluetoothAdvertisingIntervalUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未能读取广播间隔'**
  String get bluetoothAdvertisingIntervalUnknown;

  /// No description provided for @bluetoothAdvertisingIntervalPick.
  ///
  /// In zh, this message translates to:
  /// **'选择广播间隔'**
  String get bluetoothAdvertisingIntervalPick;

  /// No description provided for @bluetoothAdvertisingIntervalSetSuccess.
  ///
  /// In zh, this message translates to:
  /// **'广播间隔已设置'**
  String get bluetoothAdvertisingIntervalSetSuccess;

  /// No description provided for @motorTorque.
  ///
  /// In zh, this message translates to:
  /// **'电机扭矩'**
  String get motorTorque;

  /// No description provided for @motorTorqueLevel.
  ///
  /// In zh, this message translates to:
  /// **'等级 {level}'**
  String motorTorqueLevel(int level);

  /// No description provided for @latchBolt.
  ///
  /// In zh, this message translates to:
  /// **'斜舌设置'**
  String get latchBolt;

  /// No description provided for @latchBoltHint.
  ///
  /// In zh, this message translates to:
  /// **'斜舌保持时间（秒），有效范围 2–10'**
  String get latchBoltHint;

  /// No description provided for @latchBoltDriveLevelHint.
  ///
  /// In zh, this message translates to:
  /// **'斜舌回转距离，有效范围 1–20；0 表示不控制'**
  String get latchBoltDriveLevelHint;

  /// No description provided for @latchBoltDriveLevelNoControl.
  ///
  /// In zh, this message translates to:
  /// **'不控制'**
  String get latchBoltDriveLevelNoControl;

  /// No description provided for @latchBoltKeepTimeHint.
  ///
  /// In zh, this message translates to:
  /// **'斜舌保持时间（秒），有效范围 2–10'**
  String get latchBoltKeepTimeHint;

  /// No description provided for @lockTime.
  ///
  /// In zh, this message translates to:
  /// **'锁时间'**
  String get lockTime;

  /// No description provided for @lockTimeCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前锁时间'**
  String get lockTimeCurrent;

  /// No description provided for @lockTimeUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未能读取锁时间'**
  String get lockTimeUnknown;

  /// No description provided for @lockTimeCalibrate.
  ///
  /// In zh, this message translates to:
  /// **'校准锁时间'**
  String get lockTimeCalibrate;

  /// No description provided for @lockTimeCalibrateSuccess.
  ///
  /// In zh, this message translates to:
  /// **'锁时间已校准'**
  String get lockTimeCalibrateSuccess;

  /// No description provided for @adminPasscode.
  ///
  /// In zh, this message translates to:
  /// **'管理员密码'**
  String get adminPasscode;

  /// No description provided for @adminPasscodeCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前管理员密码'**
  String get adminPasscodeCurrent;

  /// No description provided for @adminPasscodeNew.
  ///
  /// In zh, this message translates to:
  /// **'新管理员密码'**
  String get adminPasscodeNew;

  /// No description provided for @adminPasscodeHint.
  ///
  /// In zh, this message translates to:
  /// **'请输入 4–9 位数字'**
  String get adminPasscodeHint;

  /// No description provided for @adminPasscodeModify.
  ///
  /// In zh, this message translates to:
  /// **'修改管理员密码'**
  String get adminPasscodeModify;

  /// No description provided for @adminPasscodeModifySuccess.
  ///
  /// In zh, this message translates to:
  /// **'管理员密码已修改'**
  String get adminPasscodeModifySuccess;

  /// No description provided for @adminPasscodeLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'读取管理员密码失败'**
  String get adminPasscodeLoadFailed;

  /// No description provided for @gatewayUseStaticIp.
  ///
  /// In zh, this message translates to:
  /// **'使用静态 IP（可选）'**
  String get gatewayUseStaticIp;

  /// No description provided for @gatewayUseApn.
  ///
  /// In zh, this message translates to:
  /// **'配置 APN（可选）'**
  String get gatewayUseApn;

  /// No description provided for @gatewayApn.
  ///
  /// In zh, this message translates to:
  /// **'APN'**
  String get gatewayApn;

  /// No description provided for @gatewayApnHint.
  ///
  /// In zh, this message translates to:
  /// **'蜂窝网关接入点，如 cmnet'**
  String get gatewayApnHint;

  /// No description provided for @meterSetRemainder.
  ///
  /// In zh, this message translates to:
  /// **'设置剩余量'**
  String get meterSetRemainder;

  /// No description provided for @meterSetRemainderHint.
  ///
  /// In zh, this message translates to:
  /// **'输入剩余用量'**
  String get meterSetRemainderHint;

  /// No description provided for @meterReset.
  ///
  /// In zh, this message translates to:
  /// **'恢复出厂'**
  String get meterReset;

  /// No description provided for @meterResetConfirmTitle.
  ///
  /// In zh, this message translates to:
  /// **'确认恢复出厂？'**
  String get meterResetConfirmTitle;

  /// No description provided for @meterResetConfirmBody.
  ///
  /// In zh, this message translates to:
  /// **'将重置表计，此操作不可撤销。'**
  String get meterResetConfirmBody;

  /// No description provided for @meterRefreshFeatureValue.
  ///
  /// In zh, this message translates to:
  /// **'刷新特征值'**
  String get meterRefreshFeatureValue;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
