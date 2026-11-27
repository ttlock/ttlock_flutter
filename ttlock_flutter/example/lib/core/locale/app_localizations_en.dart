// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TTLock Open Platform Demo';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Log out';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get register => 'Register';

  @override
  String get mine => 'Mine';

  @override
  String get devices => 'Other Devices';

  @override
  String get gatewayEntry => 'Gateway';

  @override
  String get gatewayEntrySubtitle => 'Manage and add gateways';

  @override
  String get waterMeterEntry => 'Water meter';

  @override
  String get waterMeterEntrySubtitle => 'BLE + cloud management';

  @override
  String get electricMeterEntry => 'Electric meter';

  @override
  String get electricMeterEntrySubtitle => 'BLE + cloud management';

  @override
  String get locks => 'Locks';

  @override
  String get config => 'Open Platform Config';

  @override
  String get about => 'About';

  @override
  String get site => 'Site';

  @override
  String get siteCn => 'China';

  @override
  String get siteOverseas => 'Overseas';

  @override
  String get clientId => 'Client ID';

  @override
  String get clientSecret => 'Client Secret';

  @override
  String get save => 'Save';

  @override
  String get saveSuccess => 'Saved';

  @override
  String get loading => 'Processing…';

  @override
  String get configLocalHint =>
      'Settings are stored on this device. config.json supplies defaults.';

  @override
  String get configSetupHint =>
      'Enter your Open Platform Client ID and Client Secret to continue.';

  @override
  String get configCredentialsRequired =>
      'Please enter Client ID and Client Secret';

  @override
  String get uidLabel => 'UID';

  @override
  String get commonRetry => 'Retry';

  @override
  String get errorNetwork =>
      'Network connection failed. Please try again later.';

  @override
  String get errorHttp => 'Service error (HTTP)';

  @override
  String get errorParse => 'Failed to parse data';

  @override
  String get errorUnknown => 'Unknown error. Please try again later.';

  @override
  String get errorBle => 'Bluetooth operation failed, please retry';

  @override
  String get bluetoothNotOn => 'Bluetooth is off, please enable it and retry';

  @override
  String get bluetoothPermissionDenied =>
      'Bluetooth permission denied. Enable it in Settings and retry';

  @override
  String get usernameRequired => 'Please enter the receiver username';

  @override
  String get bleUnreachable =>
      'Please move closer to the lock or use a gateway';

  @override
  String get permanentPeriodReadonly => 'Permanent validity cannot be changed';

  @override
  String get invalidCyclicSchedule =>
      'Please complete recurring weekdays and times';

  @override
  String get remoteRequired => 'Please select a remote';

  @override
  String get photoFaceNeedsGateway =>
      'This lock requires a gateway to enroll face by photo';

  @override
  String get unsupportedLockScene =>
      'This device type is not supported for adding yet';

  @override
  String get lockAlreadyInitialized => 'This lock is already initialized';

  @override
  String get addLock => 'Add Lock';

  @override
  String get noLocks => 'No locks yet. Tap + to add one.';

  @override
  String get locksTab => 'Locks';

  @override
  String get unlock => 'Unlock';

  @override
  String get lockBtn => 'Lock';

  @override
  String get battery => 'Battery';

  @override
  String get lockIdLabel => 'Lock ID';

  @override
  String get macLabel => 'MAC';

  @override
  String get records => 'Records';

  @override
  String get settings => 'Settings';

  @override
  String get wifiInfo => 'WiFi Info';

  @override
  String get wifiPowerSaving => 'WiFi power saving';

  @override
  String get doorNotClosedAlert => 'Door not closed alert';

  @override
  String get workingMode => 'Working mode';

  @override
  String get workingModeAllDay => 'Work all day';

  @override
  String get workingModeAllDayOff => 'Off all day';

  @override
  String get workingModeCustom => 'Custom';

  @override
  String get workingModeNeedsGateway =>
      'Changing working mode requires a gateway';

  @override
  String get unauthorizedAttempt => 'Unauthorized attempt alert';

  @override
  String get unauthorizedAttemptCount => 'Failure count';

  @override
  String get unauthorizedAttemptLockTime => 'Lockout duration';

  @override
  String get unauthorizedAttemptNeedsGateway =>
      'Changing unauthorized attempt alert requires a gateway';

  @override
  String get unauthorizedAttemptInvalidCount => 'Failure count must be 0–50';

  @override
  String get unauthorizedAttemptInvalidLockTime =>
      'Lockout duration must be 0–900 seconds';

  @override
  String get groups => 'Groups';

  @override
  String get noGroups => 'No groups yet';

  @override
  String get groupLockCount => 'locks';

  @override
  String get noGroup => 'Ungrouped';

  @override
  String get addGroup => 'Add group';

  @override
  String get groupNameHint => 'Enter group name';

  @override
  String get operating => 'Working…';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonSave => 'Save';

  @override
  String get scanning => 'Scanning nearby locks…';

  @override
  String get addingLock => 'Adding';

  @override
  String get rename => 'Rename';

  @override
  String get renameHint => 'Enter lock name';

  @override
  String get lockDetail => 'Lock Detail';

  @override
  String get gatewayOnline => 'Gateway online';

  @override
  String get incompleteLockData => 'Incomplete data';

  @override
  String get noRecords => 'No records';

  @override
  String get clearRecords => 'Clear records';

  @override
  String get clearRecordsConfirmMessage =>
      'Clear all unlock records for this lock? This cannot be undone.';

  @override
  String get syncOffline => 'Sync offline records';

  @override
  String get recordAll => 'All';

  @override
  String get recordPasscode => 'Passcode';

  @override
  String get recordCard => 'IC card';

  @override
  String get recordFingerprint => 'Fingerprint';

  @override
  String get recordFace => 'Face';

  @override
  String get recordQr => 'QR code';

  @override
  String get recordRemote => 'Remote';

  @override
  String get recordIdLabel => 'Record ID';

  @override
  String get recordTypeBluetoothUnlock => 'Unlock by app';

  @override
  String get recordTypePasscodeUnlock => 'Unlock by passcode';

  @override
  String get recordTypeParkingLockRise => 'Rise the lock (parking lock)';

  @override
  String get recordTypeParkingLockLower => 'Lower the lock (parking lock)';

  @override
  String get recordTypeCardUnlock => 'Unlock by IC card';

  @override
  String get recordTypeFingerprintUnlock => 'Unlock by fingerprint';

  @override
  String get recordTypeWristbandUnlock => 'Unlock by wrist strap';

  @override
  String get recordTypeMechanicalKeyUnlock => 'Unlock by mechanical key';

  @override
  String get recordTypeBluetoothLock => 'Lock by app';

  @override
  String get recordTypeGatewayUnlock => 'Unlock by gateway';

  @override
  String get recordTypeIllegalUnlock => 'Force applied on the lock';

  @override
  String get recordTypeDoorSensorClosed => 'Door sensor closed';

  @override
  String get recordTypeDoorSensorOpen => 'Door sensor open';

  @override
  String get recordTypeOpenFromInside => 'Open from inside';

  @override
  String get recordTypeFingerprintLock => 'Lock by fingerprint';

  @override
  String get recordTypePasscodeLock => 'Lock by passcode';

  @override
  String get recordTypeCardLock => 'Lock by IC card';

  @override
  String get recordTypeMechanicalKeyLock => 'Lock by mechanical key';

  @override
  String get recordTypeAppButtonControl => 'Control lock with APP button';

  @override
  String get recordTypeLocalMail => 'Received new local mail';

  @override
  String get recordTypeRemoteMail => 'Received new other cities\' mail';

  @override
  String get recordTypeTamperAlert => 'Tamper alert';

  @override
  String get recordTypeAutoLock => 'Auto lock';

  @override
  String get recordTypeUnlockButton => 'Unlock by unlock key';

  @override
  String get recordTypeLockButton => 'Lock by lock key';

  @override
  String get recordTypeSystemLocked => 'System locked';

  @override
  String get recordTypeHotelCardUnlock => 'Unlock by hotel card';

  @override
  String get recordTypeHighTemperatureUnlock =>
      'Unlocked due to high temperature';

  @override
  String get recordTypeDeletedCardUnlock => 'Try to unlock with a deleted card';

  @override
  String get recordTypeAppDeadLock => 'Dead lock with APP';

  @override
  String get recordTypePasscodeDeadLock => 'Dead lock with passcode';

  @override
  String get recordTypeCarLeft => 'The car left (parking lock)';

  @override
  String get recordTypeRemoteControl => 'Remote control lock or unlock';

  @override
  String get recordTypeQrUnlockSuccess => 'Unlock with QR code success';

  @override
  String get recordTypeQrUnlockExpired => 'Unlock with QR code failed, expired';

  @override
  String get recordTypeDoubleLockOn => 'Double locked';

  @override
  String get recordTypeDoubleLockOff => 'Cancel double lock';

  @override
  String get recordTypeQrLockSuccess => 'Lock with QR code success';

  @override
  String get recordTypeQrUnlockDoubleLocked =>
      'QR unlock failed, double locked';

  @override
  String get recordTypePassageModeAutoUnlock => 'Auto unlock at passage mode';

  @override
  String get recordTypeDoorUnclosedAlarm => 'Door unclosed alarm';

  @override
  String get recordTypeUnlockTimeout => 'Failed to unlock';

  @override
  String get recordTypeLockTimeout => 'Failed to lock';

  @override
  String get recordTypeFaceUnlockSuccess => 'Face unlock success';

  @override
  String get recordTypeFaceUnlockDoubleLocked =>
      'Face unlock failed - double locked';

  @override
  String get recordTypeFaceLock => 'Lock with face';

  @override
  String get recordTypeFaceUnlockExpired =>
      'Face unlock failed - expired or ineffective';

  @override
  String get recordTypeAppGrantUnlock => 'Unlocked by App granting';

  @override
  String get recordTypeGatewayGrantUnlock => 'Unlocked by remote granting';

  @override
  String get recordTypeDualAuthBluetooth =>
      'Dual auth Bluetooth unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthPasscode =>
      'Dual auth passcode unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthFingerprint =>
      'Dual auth fingerprint unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthCard =>
      'Dual auth IC card unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthFace =>
      'Dual auth face unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthRemote =>
      'Dual auth remote unlock verified, waiting for second user';

  @override
  String get recordTypeDualAuthPalmVein =>
      'Dual auth palm vein unlock verified, waiting for second user';

  @override
  String get recordTypePalmVeinUnlockSuccess => 'Palm vein unlock success';

  @override
  String get recordTypePalmVeinUnlockDoubleLocked =>
      'Palm vein unlock failed - double locked';

  @override
  String get recordTypePalmVeinLock => 'Lock with palm vein';

  @override
  String get recordTypePalmVeinUnlockExpired =>
      'Palm vein unlock failed - expired or ineffective';

  @override
  String get recordTypeAdminPasscodeUnlock => 'Administrator password unlock';

  @override
  String get deleteLock => 'Delete lock';

  @override
  String get transfer => 'Transfer';

  @override
  String get receiverUsername => 'Receiver username';

  @override
  String get changeGroup => 'Change group';

  @override
  String get autoLockTime => 'Auto-lock time';

  @override
  String get autoLockOff => 'Off';

  @override
  String get secondsUnit => 's';

  @override
  String get sound => 'Sound';

  @override
  String get soundUnknown => 'Unknown';

  @override
  String get soundVolume => 'Volume';

  @override
  String soundVolumeLevel(int level) {
    return 'Volume $level';
  }

  @override
  String get privacyLock => 'Privacy lock';

  @override
  String get tamperAlert => 'Tamper alert';

  @override
  String get resetButton => 'Reset button';

  @override
  String get remoteUnlock => 'Remote unlock';

  @override
  String get doubleAuth => 'Two-factor authentication';

  @override
  String get openDirection => 'Unlock direction';

  @override
  String get openDirectionLeft => 'Left';

  @override
  String get openDirectionRight => 'Right';

  @override
  String get passageMode => 'Passage mode';

  @override
  String get passageModeAllDay => 'All day';

  @override
  String get passageModeAutoUnlock => 'Auto-unlock in passage mode';

  @override
  String get passageModeStartTime => 'Start time';

  @override
  String get passageModeEndTime => 'End time';

  @override
  String get passageModeNeedWeekdays => 'Select at least one weekday';

  @override
  String get passageModeInvalidTime => 'End time must be after start time';

  @override
  String get weekMon => 'Mon';

  @override
  String get weekTue => 'Tue';

  @override
  String get weekWed => 'Wed';

  @override
  String get weekThu => 'Thu';

  @override
  String get weekFri => 'Fri';

  @override
  String get weekSat => 'Sat';

  @override
  String get weekSun => 'Sun';

  @override
  String get refreshSystemInfo => 'Refresh system info';

  @override
  String get lockInfo => 'Lock info';

  @override
  String get refreshFromLock => 'Refresh from lock';

  @override
  String get systemInfoSection => 'System info';

  @override
  String get lockAliasLabel => 'Alias';

  @override
  String get lockNameLabel => 'Lock name';

  @override
  String get featureValueLabel => 'Feature value';

  @override
  String get hasGatewayLabel => 'Gateway';

  @override
  String get initDateLabel => 'Init date';

  @override
  String get modelNum => 'Model';

  @override
  String get hardwareRevision => 'Hardware revision';

  @override
  String get firmwareRevision => 'Firmware revision';

  @override
  String get syncSettingsFromLock => 'Sync settings from lock';

  @override
  String get refreshBattery => 'Refresh battery';

  @override
  String get syncDate => 'Sync time';

  @override
  String get checkUpgrade => 'Check firmware';

  @override
  String get upgradeNone => 'Up to date';

  @override
  String get upgradeAvailable => 'Upgrade available';

  @override
  String get nbRegister => 'NB register';

  @override
  String get nbNodeId => 'NB Node ID';

  @override
  String get nbCardNumber => 'NB card number';

  @override
  String get nbOperator => 'NB operator';

  @override
  String get nbRssi => 'NB RSSI';

  @override
  String get wifiIp => 'IP';

  @override
  String get wifiSubnetMask => 'Subnet Mask';

  @override
  String get wifiDefaultGateway => 'Default Gateway';

  @override
  String get wifiMacLabel => 'WiFi MAC';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get eKey => 'E-Key';

  @override
  String get sendEkey => 'Send eKey';

  @override
  String get liftTitle => 'Lift Control';

  @override
  String get liftEntry => 'Lift';

  @override
  String get liftFloorsHint => 'Select floors to activate';

  @override
  String get liftActivate => 'Activate';

  @override
  String get liftActivateEntry => 'Activate floors';

  @override
  String get liftActivateSuccess => 'Floors activated';

  @override
  String get liftActivateFailed => 'Failed to activate floors';

  @override
  String get liftRemoteFailedBleFallback =>
      'Remote unavailable, floors activated via BLE and lock data refreshed';

  @override
  String get liftBleActivatedSyncFailed =>
      'Floors activated via Bluetooth, but failed to refresh lock data';

  @override
  String get liftWorkMode => 'Work mode';

  @override
  String get liftWorkModeAllFloors => 'All floors';

  @override
  String get liftWorkModeAllFloorsHint => 'Card unlocks all linked floors';

  @override
  String get liftWorkModeSpecificFloors => 'Specific floors';

  @override
  String get liftWorkModeSpecificFloorsHint =>
      'Card unlocks floors encoded on the card';

  @override
  String get liftWorkModeSuccess => 'Work mode saved';

  @override
  String get liftControlableFloors => 'Linked floors';

  @override
  String get liftControlableFloorsHint => 'Select floors this lift can control';

  @override
  String get liftControlableFloorsSuccess => 'Linked floors saved';

  @override
  String get powerSwitchWorkMode => 'Work mode';

  @override
  String get powerSwitchWorkModeAllCards => 'Any card';

  @override
  String get powerSwitchWorkModeAllCardsHint => 'Any card can switch power on';

  @override
  String get powerSwitchWorkModeHotelCard => 'Hotel card';

  @override
  String get powerSwitchWorkModeHotelCardHint =>
      'Only this hotel\'s cards can switch power on';

  @override
  String get powerSwitchWorkModeRoomCard => 'Room card';

  @override
  String get powerSwitchWorkModeRoomCardHint =>
      'Only room cards can switch power on';

  @override
  String get powerSwitchWorkModeSuccess => 'Work mode saved';

  @override
  String get powerSwitchControlableLock => 'Linked lock';

  @override
  String get powerSwitchControlableLockSuccess => 'Linked lock saved';

  @override
  String get powerSwitchNoHotelLocks => 'No hotel locks to link';

  @override
  String get powerSwitchHotelLocksLoadFailed => 'Failed to load hotel locks';

  @override
  String get passcode => 'Passcode';

  @override
  String get getPasscode => 'Get passcode';

  @override
  String get customPasscode => 'Custom passcode';

  @override
  String get icCard => 'IC Card';

  @override
  String get fingerprint => 'Fingerprint';

  @override
  String get face => 'Face';

  @override
  String get palmVein => 'Palm vein';

  @override
  String get qrCode => 'QR code';

  @override
  String get addQrCode => 'Add QR code';

  @override
  String get qrCodeContent => 'QR content';

  @override
  String get refreshQrCodeData => 'Refresh QR data';

  @override
  String get remote => 'Remote';

  @override
  String get addRemote => 'Add remote';

  @override
  String get remoteName => 'Remote name';

  @override
  String get remoteMac => 'Remote MAC';

  @override
  String get accessories => 'Accessories';

  @override
  String get wirelessKeypad => 'Wireless keypad';

  @override
  String get addWirelessKeypad => 'Add wireless keypad';

  @override
  String get noWirelessKeypads => 'No wireless keypads yet';

  @override
  String get wirelessKeypadName => 'Keypad name';

  @override
  String get deleteWirelessKeypad => 'Delete wireless keypad';

  @override
  String get deleteWirelessKeypadConfirm => 'Delete this wireless keypad?';

  @override
  String get keypadTypeNormal => 'Standard keypad';

  @override
  String get keypadTypeMulti => 'Multifunctional keypad';

  @override
  String get keypadTypeNormalHint => 'Passcode unlock';

  @override
  String get keypadTypeMultiHint => 'Passcode + IC card + fingerprint';

  @override
  String get keypadTypeLabel => 'Keypad type';

  @override
  String get keypadSlot => 'Slot';

  @override
  String get keypadGuideNormal =>
      'First add: enter *529# on the keypad to activate. Second add: enter *529#previous lock admin passcode#, then scan nearby.';

  @override
  String get keypadGuideMulti =>
      'Enter admin settings to enable pairing. Binding uses one lock slot.';

  @override
  String get scanningKeypads => 'Scanning nearby keypads…';

  @override
  String get noKeypadsScanned =>
      'No matching keypads found. Move closer and retry.';

  @override
  String get doorSensor => 'Door sensor';

  @override
  String get addDoorSensor => 'Add door sensor';

  @override
  String get deleteDoorSensor => 'Delete door sensor';

  @override
  String get deleteDoorSensorConfirm => 'Unbind and delete this door sensor?';

  @override
  String get doorSensorName => 'Door sensor name';

  @override
  String get doorSensorUnbound => 'Not added';

  @override
  String get doorSensorAlertHint => 'Not set';

  @override
  String get scanningDoorSensors => 'Scanning nearby door sensors…';

  @override
  String get noDoorSensorsScanned =>
      'No door sensors found. Move closer and retry.';

  @override
  String get doorSensorAlreadyBound => 'This lock already has a door sensor';

  @override
  String get scanningRemotes => 'Scanning nearby remotes…';

  @override
  String get startScan => 'Scan';

  @override
  String get noRemotesScanned => 'No remotes found. Move closer and retry.';

  @override
  String get noEkeys => 'No eKeys yet';

  @override
  String get noPasscodes => 'No passcodes yet';

  @override
  String get noCards => 'No IC cards yet';

  @override
  String get noFingerprints => 'No fingerprints yet';

  @override
  String get noFaces => 'No faces yet';

  @override
  String get noPalmVeins => 'No palm veins yet';

  @override
  String get noQrCodes => 'No QR codes yet';

  @override
  String get noRemotes => 'No remotes yet';

  @override
  String get keyName => 'Key name';

  @override
  String get authorizedAdmin => 'Authorize as admin';

  @override
  String get freeze => 'Freeze';

  @override
  String get unfreeze => 'Unfreeze';

  @override
  String get authorize => 'Authorize';

  @override
  String get unauthorize => 'Revoke authorization';

  @override
  String get validityPeriod => 'Validity period';

  @override
  String get permanent => 'Permanent';

  @override
  String get limited => 'Timed';

  @override
  String get once => 'One-time';

  @override
  String get recurring => 'Recurring';

  @override
  String get recurringMode => 'Recurring mode';

  @override
  String get recurringDaily => 'Daily';

  @override
  String get recurringWorkday => 'Weekdays';

  @override
  String get recurringWeekend => 'Weekend';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get startTimeOfDay => 'Start time of day';

  @override
  String get endTimeOfDay => 'End time of day';

  @override
  String get selectRecurringDays => 'Select recurring weekdays';

  @override
  String get endTimeMustAfterStart => 'End time must be after start time';

  @override
  String get startDate => 'Start time';

  @override
  String get endDate => 'End time';

  @override
  String get waitingTapCard => 'Please tap the card on the lock';

  @override
  String collectingFingerprint(int current, int total) {
    return 'Press fingerprint $current/$total';
  }

  @override
  String get collectingFace => 'Face the lock camera';

  @override
  String get faceEnrollOnLock => 'Enroll on lock';

  @override
  String get faceEnrollByPhoto => 'Use photo';

  @override
  String get facePhotoPickTitle => 'Choose face photo';

  @override
  String get facePhotoFromGallery => 'From gallery';

  @override
  String get facePhotoFromCamera => 'Take photo';

  @override
  String get facePhotoHint =>
      'Front-facing, even lighting, single person, no obstruction';

  @override
  String get facePhotoTooLarge => 'Photo too large. Compress to under 2MB';

  @override
  String get facePhotoExtracting => 'Extracting feature data';

  @override
  String get collectingPalmVein => 'Place palm over the sensor';

  @override
  String get enrollSuccess => 'Enrolled successfully';

  @override
  String get copyLink => 'Copy link';

  @override
  String get linkCopied => 'Copied';

  @override
  String get unlockLink => 'Remote unlock link';

  @override
  String get deleteConfirm => 'Delete?';

  @override
  String get passcodeHint => '4–9 digits';

  @override
  String get nameHint => 'Name (optional)';

  @override
  String get passcodeName => 'Passcode name';

  @override
  String get changePasscode => 'Change passcode';

  @override
  String get copyPasscode => 'Copy passcode';

  @override
  String get cardName => 'Card name';

  @override
  String get fingerprintName => 'Fingerprint name';

  @override
  String get faceName => 'Face name';

  @override
  String get palmVeinName => 'Palm vein name';

  @override
  String get startEnroll => 'Start enrollment';

  @override
  String get enrollCancelHint =>
      'Canceling does not stop the lock. Stay near it until it times out.';

  @override
  String get keypadCardEnrollHint => 'Hold the card near the wireless keypad';

  @override
  String get keypadFingerprintEnrollHint =>
      'Press any key to wake the keypad. When the blue breathing light is on, place your finger.';

  @override
  String get cardPendingRegister =>
      'Card is on the lock but not registered to cloud';

  @override
  String get fingerprintPendingRegister =>
      'Fingerprint is on the lock but not registered to cloud';

  @override
  String get pendingRegisterRetry => 'Retry registration';

  @override
  String get faceLockProgressGuide =>
      'Please face the door lock camera and follow the voice prompts to complete the capture';

  @override
  String get faceLockRetryAdd => 'Re-add';

  @override
  String get faceEnrollSuccess => 'Face added successfully';

  @override
  String get errorFirmwareFaceNoFaceDetected => 'No face detected';

  @override
  String get errorFirmwareFaceTooClose => 'Face too close';

  @override
  String get errorFirmwareFaceTooFarAway => 'Face too far';

  @override
  String get errorFirmwareFaceFaceCovered => 'Face occluded';

  @override
  String get palmVeinLockProgressGuide =>
      'Please place your palm on the lock sensor and follow the voice prompts to complete the capture';

  @override
  String get palmVeinLockRetryAdd => 'Re-add';

  @override
  String get palmVeinEnrollSuccess => 'Palm vein added successfully';

  @override
  String get errorFirmwarePalmVeinNoPalmDetected => 'No palm vein detected';

  @override
  String get errorFirmwarePalmVeinPosition =>
      'Palm position unclear, adjust it';

  @override
  String get errorFirmwarePalmVeinAngle => 'Adjust the palm angle';

  @override
  String get errorFirmwarePalmVeinBlocked => 'Palm occluded';

  @override
  String get errorFirmwarePalmVeinBlur => 'Keep your palm steady';

  @override
  String get errorFirmwarePalmVeinBack => 'Face your palm toward the lock';

  @override
  String get gatewayTitle => 'Gateways';

  @override
  String get gatewayAdd => 'Add Gateway';

  @override
  String get gatewayScanHint => 'Scanning for nearby gateways…';

  @override
  String get gatewayNoDevice =>
      'No gateways found. Make sure the gateway is powered on and near your phone';

  @override
  String get gatewayConnecting => 'Connecting to gateway…';

  @override
  String get gatewayWifiHint => 'Fetching nearby Wi-Fi networks…';

  @override
  String get gatewayNoWifi => 'No Wi-Fi networks found';

  @override
  String get gatewayWifiPassword => 'Wi-Fi Password';

  @override
  String get gatewayAccountPassword => 'Account Password';

  @override
  String get gatewayAccountPasswordHint => 'Enter your app login password';

  @override
  String get gatewayInitializing => 'Initializing gateway, please wait…';

  @override
  String get gatewayConfirmingHint =>
      'Confirming gateway registration, this may take a few minutes…';

  @override
  String get gatewayAddDone => 'Gateway added';

  @override
  String get gatewayInitFailed => 'Gateway initialization failed';

  @override
  String get gatewayInitNotConfirmed =>
      'Gateway is not yet registered, please try again later';

  @override
  String get gatewayUserUidMissing =>
      'Login session invalid. Please log in and try again';

  @override
  String get gatewayConnectFailed => 'Failed to connect to gateway';

  @override
  String get gatewayRename => 'Rename Gateway';

  @override
  String get gatewayDeleteConfirm => 'Delete Gateway';

  @override
  String get gatewayDeleteConfirmMessage =>
      'Deleting will unbind this gateway from all locks. Continue?';

  @override
  String get gatewayEmpty => 'No gateways yet';

  @override
  String get gatewayNameLabel => 'Gateway Name';

  @override
  String get gatewayVersion => 'Firmware Version';

  @override
  String get gatewayNetworkName => 'Network Name';

  @override
  String get gatewayNetworkMac => 'Network MAC';

  @override
  String get gatewayLockCount => 'Bound Locks';

  @override
  String get waterMeterTitle => 'Water meter';

  @override
  String get waterMeterAdd => 'Add Water Meter';

  @override
  String get waterMeterScanHint => 'Scanning for nearby water meters…';

  @override
  String get waterMeterNoDevice =>
      'No water meters found. Make sure the meter is powered on and near your phone';

  @override
  String get waterMeterSubmitting => 'Adding water meter, please wait…';

  @override
  String get waterMeterApnTitle => 'Configure APN';

  @override
  String get waterMeterApnHint =>
      'This is a 4G (Cat.1) water meter. Outside China the carrier APN must be set before the server address is written.';

  @override
  String get waterMeterApnLabel => 'APN';

  @override
  String get waterMeterConfiguring => 'Configuring server, please wait…';

  @override
  String get waterMeterConnecting =>
      'Connecting to the water meter, please wait…';

  @override
  String get waterMeterAwaitConfirm => 'Waiting for confirmation…';

  @override
  String get waterMeterConnectionConfirm =>
      'Make sure the red light on the meter screen is blinking, then tap Confirm to continue.';

  @override
  String get waterMeterAddDone => 'Water meter added';

  @override
  String get waterMeterName => 'Water Meter Name';

  @override
  String get waterMeterPayMode => 'Pay Mode';

  @override
  String get waterMeterPayModeEnergy => 'Energy mode';

  @override
  String get waterMeterPayModePrepaid => 'Prepaid';

  @override
  String get waterMeterPrice => 'Unit Price';

  @override
  String get waterMeterPriceUnit => '¥/t';

  @override
  String get waterMeterTotal => 'Total Usage';

  @override
  String get waterMeterRemainder => 'Remaining';

  @override
  String get waterMeterPowerSwitch => 'Power Switch';

  @override
  String get waterMeterRecharge => 'Recharge';

  @override
  String get waterMeterRechargeAmount => 'Recharge Amount';

  @override
  String get waterMeterRechargeM3 => 'Water volume';

  @override
  String get waterMeterRechargeDone => 'Recharge successful';

  @override
  String get waterMeterRecords => 'Records';

  @override
  String get waterMeterRename => 'Rename';

  @override
  String get waterMeterDeleteConfirm => 'Delete Water Meter';

  @override
  String get waterMeterDeleteConfirmMessage =>
      'Deleting is irreversible. Continue?';

  @override
  String get waterMeterDeleteSuccess => 'Deleted';

  @override
  String get waterMeterEmpty => 'No water meters yet';

  @override
  String get electricMeterTitle => 'Electric meter';

  @override
  String get electricMeterAdd => 'Add Electric Meter';

  @override
  String get electricMeterScanHint => 'Scanning for nearby electric meters…';

  @override
  String get electricMeterNoDevice =>
      'No electric meters found. Make sure the meter is powered on and near your phone';

  @override
  String get electricMeterSubmitting => 'Adding electric meter, please wait…';

  @override
  String get electricMeterApnTitle => 'Configure APN';

  @override
  String get electricMeterApnHint =>
      'This is a 4G (Cat.1) electric meter. Outside China the carrier APN must be set before the server address is written.';

  @override
  String get electricMeterApnLabel => 'APN';

  @override
  String get electricMeterConfiguring => 'Configuring server, please wait…';

  @override
  String get electricMeterConnecting =>
      'Connecting to the electric meter, please wait…';

  @override
  String get electricMeterAwaitConfirm => 'Waiting for confirmation…';

  @override
  String get electricMeterConnectionConfirm =>
      'Make sure the red light on the meter screen is blinking alternately, then tap Confirm to continue.';

  @override
  String get electricMeterAddDone => 'Electric meter added';

  @override
  String get electricMeterName => 'Electric Meter Name';

  @override
  String get electricMeterPayMode => 'Pay Mode';

  @override
  String get electricMeterPayModeEnergy => 'Energy mode';

  @override
  String get electricMeterPayModePrepaid => 'Prepaid';

  @override
  String get electricMeterPrice => 'Unit Price';

  @override
  String get electricMeterPriceUnit => '¥/kWh';

  @override
  String get electricMeterTotal => 'Total Usage';

  @override
  String get electricMeterRemainder => 'Remaining';

  @override
  String get electricMeterMaxPower => 'Max Power';

  @override
  String get electricMeterMaxPowerHint => 'Enter max power';

  @override
  String get electricMeterMaxPowerDone => 'Max power updated';

  @override
  String get electricMeterPowerSwitch => 'Power Switch';

  @override
  String get electricMeterRecharge => 'Recharge';

  @override
  String get electricMeterRechargeAmount => 'Recharge Amount';

  @override
  String get electricMeterRechargeKwh => 'Recharge kWh';

  @override
  String get electricMeterRechargeDone => 'Recharge successful';

  @override
  String get electricMeterRecords => 'Records';

  @override
  String get electricMeterRename => 'Rename';

  @override
  String get electricMeterEmpty => 'No electric meters yet';

  @override
  String get electricMeterDeleteConfirm => 'Delete electric meter';

  @override
  String get electricMeterDeleteConfirmMessage =>
      'This electric meter cannot be restored after deletion. Delete it?';

  @override
  String get meterSettings => 'Device settings';

  @override
  String get meterOperationRecords => 'Operation records';

  @override
  String get meterUsageRecordsElectric => 'Electricity usage';

  @override
  String get meterUsageRecordsWater => 'Water usage';

  @override
  String get meterInfo => 'Device info';

  @override
  String get meterCatOne => '4G network';

  @override
  String get meterCatOneUnconfigured =>
      'This meter\'s 4G module is not configured yet';

  @override
  String get meterFirmware => 'Firmware';

  @override
  String get meterReadData => 'Read meter';

  @override
  String get meterClear => 'Clear';

  @override
  String get meterClearConfirmTitle => 'Clear this meter?';

  @override
  String get meterClearConfirmBody =>
      'This clears the meter\'s remaining balance and cannot be undone.';

  @override
  String get electricMeterPriceEdit => 'Electricity price';

  @override
  String get waterMeterPriceEdit => 'Water price';

  @override
  String get meterPayModeEdit => 'Billing mode';

  @override
  String get meterTotalUsageEdit => 'Total usage';

  @override
  String get meterNearbyRequired =>
      'Stay near the device to complete this action.';

  @override
  String get meterRecordTypeRecharge => 'Recharge';

  @override
  String get meterRecordTypePowerOff => 'Power off';

  @override
  String get meterRecordTypePowerOn => 'Power on';

  @override
  String get meterRecordTypeRead => 'Meter read';

  @override
  String get meterRecordTypePrice => 'Price changed';

  @override
  String get meterRecordTypeClear => 'Cleared';

  @override
  String get meterRecordTypePaying => 'Recharging';

  @override
  String get meterDateTypeDay => 'Day';

  @override
  String get meterDateTypeMonth => 'Month';

  @override
  String get meterDateTypeYear => 'Year';

  @override
  String get meterUnitKwh => 'kWh';

  @override
  String get meterUnitTon => 't';

  @override
  String get meterUnitKw => 'kW';

  @override
  String get meterEmptyRecords => 'No records';

  @override
  String get meterCatOneRssiGrade => 'Signal';

  @override
  String get meterCatOneRssiUnknown => 'Unknown';

  @override
  String get meterCatOneRssiPoor => 'Weak';

  @override
  String get meterCatOneRssiMedium => 'Fair';

  @override
  String get meterCatOneRssiStrong => 'Strong';

  @override
  String get meterCatOneNodeId => 'Module ID';

  @override
  String get meterCatOneCardNumber => 'Card number';

  @override
  String get meterCatOneOperator => 'Carrier';

  @override
  String get meterCatOneImsi => 'IMSI';

  @override
  String get meterCatOneApn => 'APN';

  @override
  String get meterCatOneOverseaCard => 'Overseas card';

  @override
  String get meterCatOneYes => 'Yes';

  @override
  String get meterCatOneNo => 'No';

  @override
  String get meterCatOneConfigureServer => 'Configure server';

  @override
  String get meterCatOneReconfigure => 'Reconfigure';

  @override
  String get meterCatOneNeedNearby =>
      'Stay near the device to configure the server.';

  @override
  String get meterCatOneUnavailable => '4G network info is unavailable';

  @override
  String get meterCatOneApnSheetTitle => 'Configure APN';

  @override
  String get meterCatOneApnSheetHint =>
      'For overseas use, enter the carrier APN before writing the server address.';

  @override
  String get meterCatOneApnLabel => 'APN';

  @override
  String get meterOps => 'Actions';

  @override
  String get meterNumber => 'Meter number';

  @override
  String get meterMac => 'MAC';

  @override
  String get meterModelNum => 'Model';

  @override
  String get meterHardwareRevision => 'Hardware revision';

  @override
  String get meterFirmwareRevision => 'Firmware revision';

  @override
  String get meterFeatureValue => 'Feature value';

  @override
  String get meterSyncDate => 'Last meter read';

  @override
  String get meterGroupName => 'Group';

  @override
  String get meterFirmwareCurrent => 'Current version';

  @override
  String get meterFirmwareLatest => 'Latest version';

  @override
  String get meterFirmwareNeedUpgrade => 'An update is available';

  @override
  String get meterFirmwareUpToDate => 'Up to date';

  @override
  String get meterFirmwareUnavailable => 'Firmware info unavailable';

  @override
  String get meterPriceHint => 'Enter the unit price';

  @override
  String get meterPriceInvalid => 'Enter a unit price greater than 0';

  @override
  String get meterPayModeSwitchTitle => 'Billing mode';

  @override
  String get meterTotalUsageHint => 'Enter the total usage';

  @override
  String get meterTotalUsageInvalid => 'Enter total usage greater than 0';

  @override
  String get meterAddSuccessTitle => 'Added';

  @override
  String get meterAddSuccessNameLabel => 'Name (optional)';

  @override
  String get meterAddSuccessApnLabel => 'APN (required)';

  @override
  String get meterAddSuccessApnHint =>
      'This is a 4G (Cat.1) meter; an APN is required for overseas use.';

  @override
  String get meterAddSuccessDone => 'Done';

  @override
  String get meterAddSuccessCatOneHint =>
      '4G setup did not finish — retry later from the 4G network page.';

  @override
  String get meterRecordTypeAll => 'All';

  @override
  String get meterRecordTypeWaterOff => 'Water off';

  @override
  String get meterRecordTypeWaterOn => 'Water on';

  @override
  String get meterRecordTypeClearRemainder => 'Remaining balance cleared';

  @override
  String get meterRecordTypeClearRemainderWater => 'Remaining balance cleared';

  @override
  String get meterRecordTypePayModeSwitch => 'Billing type changed';

  @override
  String get meterRecordTypePowerOnOff => 'Power switched';

  @override
  String get meterRecordTypePowerOnOffWater => 'Water switched';

  @override
  String get meterRecordTypeSetTotalUsage => 'Total usage set';

  @override
  String get standaloneDoorSensorTitle => 'Standalone door sensor';

  @override
  String get addStandaloneDoorSensor => 'Add Standalone Door Sensor';

  @override
  String get standaloneDoorSensorEmpty => 'No standalone door sensors yet';

  @override
  String get standaloneDoorScanningDevice =>
      'Scanning for nearby standalone door sensors…';

  @override
  String get standaloneDoorScanHint =>
      'Scanning for nearby standalone door sensors…';

  @override
  String get standaloneDoorNoDevice =>
      'No standalone door sensors found. Make sure the device is powered on and near your phone';

  @override
  String get standaloneDoorDeviceName => 'Device Name';

  @override
  String get standaloneDoorWifiName => 'Wi-Fi Name';

  @override
  String get standaloneDoorWifiPassword => 'Wi-Fi Password';

  @override
  String get standaloneDoorInitializing =>
      'Adding standalone door sensor, please wait…';

  @override
  String get standaloneDoorAddFailed => 'Failed to add standalone door sensor';

  @override
  String get standaloneDoorUnbound => 'Not added';

  @override
  String get standaloneDoorState => 'Status';

  @override
  String get standaloneDoorClosed => 'Closed';

  @override
  String get standaloneDoorOpen => 'Open';

  @override
  String get standaloneDoorUnknown => 'Unknown';

  @override
  String get standaloneDoorWifiMac => 'Wi-Fi MAC';

  @override
  String get standaloneDoorFeatureValue => 'Feature Value';

  @override
  String get standaloneDoorFirmware => 'Firmware Version';

  @override
  String get standaloneDoorNumber => 'Device Number';

  @override
  String get standaloneDoorRename => 'Rename';

  @override
  String get standaloneDoorDeleteConfirm => 'Delete Door Sensor';

  @override
  String get standaloneDoorDeleteConfirmMessage =>
      'Deleting is irreversible. Continue?';

  @override
  String get standaloneDoorAlertConfig => 'Alert Config';

  @override
  String get standaloneDoorWifiConfig => 'Wi-Fi Reconfiguration';

  @override
  String get standaloneDoorWifiRepowerHint =>
      'Please power-cycle the standalone door sensor, then continue with Wi-Fi setup.';

  @override
  String get standaloneDoorUserManage => 'User Management';

  @override
  String get standaloneDoorNotCloseAlert => 'Not-closed Alert';

  @override
  String get standaloneDoorLongTimeNotOpenAlert => 'Long-time-not-open Alert';

  @override
  String get standaloneDoorNotCloseSecondLabel =>
      'Not-closed alert delay (seconds)';

  @override
  String get standaloneDoorNotOpenDayLabel => 'Long-time-not-open alert (days)';

  @override
  String get standaloneDoorAddUser => 'Add User';

  @override
  String get standaloneDoorAddUserAccountHint => 'Enter account';

  @override
  String get standaloneDoorAddUserHint => 'Enter name';

  @override
  String get standaloneDoorUserListEmpty => 'No users yet';

  @override
  String get wifiConfig => 'Network';

  @override
  String get wifiConfigHint =>
      'Pick the WiFi the lock should join and enter its password. The lock connects to the server once configured.';

  @override
  String get currentNetwork => 'Current network';

  @override
  String get wifiNetwork => 'WiFi network';

  @override
  String get notSelected => 'Not selected';

  @override
  String get selectWifiNetwork => 'Select WiFi';

  @override
  String get noAvailableWifi => 'No WiFi found';

  @override
  String get rescan => 'Rescan';

  @override
  String get wifiPasswordLabel => 'WiFi password';

  @override
  String get pleaseSelectWifiNetwork => 'Please select a WiFi network first';

  @override
  String get pleaseEnterWifiPasswordLabel => 'Please enter the WiFi password';

  @override
  String get missingLockDataCannotScanWifi =>
      'Missing lock data; cannot scan WiFi';

  @override
  String get missingLockDataCannotConfigWifi =>
      'Missing lock data; cannot configure network';

  @override
  String get powerSavingMode => 'Power saving mode';

  @override
  String get advancedSettings => 'Advanced settings';

  @override
  String get staticIpConfigDnsConfig => 'Static IP and DNS configuration';

  @override
  String get useStaticIp => 'Use static IP';

  @override
  String get staticIpAddress => 'IP address';

  @override
  String get staticIpAddressExample => 'e.g. 192.168.1.50';

  @override
  String get subnetMask => 'Subnet mask';

  @override
  String get subnetMaskExample => 'e.g. 255.255.255.0';

  @override
  String get defaultGateway => 'Default gateway';

  @override
  String get defaultGatewayExample => 'e.g. 192.168.1.1';

  @override
  String get useCustomDns => 'Custom DNS';

  @override
  String get preferredDns => 'Preferred DNS';

  @override
  String get alternateDnsOptional => 'Alternate DNS (optional)';

  @override
  String get staticIpAddressFormatIncorrect => 'Invalid IP address';

  @override
  String get subnetMaskFormatIncorrect => 'Invalid subnet mask';

  @override
  String get defaultGatewayFormatIncorrect => 'Invalid default gateway';

  @override
  String get preferredDnsFormatIncorrect => 'Invalid preferred DNS';

  @override
  String get alternateDnsFormatIncorrect => 'Invalid alternate DNS';

  @override
  String get wifiConfigSuccess => 'Network configured';

  @override
  String get startConfig => 'Start setup';

  @override
  String get hotelTitle => 'Hotel';

  @override
  String get hotelLockTypeHotel => 'Hotel lock';

  @override
  String get hotelLockTypeLift => 'Lift';

  @override
  String get hotelLockTypePower => 'Power switch';

  @override
  String get hotelEmptyTitle => 'No hotel locks under this account';

  @override
  String get hotelEmptyBody =>
      'This list only shows locks added in the TTHotel app, or locks created by this app with hotel info written at initialization.';

  @override
  String get hotelUnassigned => 'Unassigned';

  @override
  String get hotelSearchHint => 'Search lock alias';

  @override
  String get hotelLoadFailed => 'Failed to load';

  @override
  String get hotelRetry => 'Retry';

  @override
  String get hotelNotSupported => 'Not supported';

  @override
  String get cardEncoderUnavailable =>
      'Hotel info unavailable (a hotel must be created)';

  @override
  String get hotelCloudPending => 'Not synced to cloud';

  @override
  String get hotelBuildingFloor => 'Building / Floor';

  @override
  String get hotelSector => 'Card sector';

  @override
  String get hotelSectorHint =>
      'Select the sectors (1-10) this lock reads hotel cards from';

  @override
  String get hotelSectorSave => 'Save';

  @override
  String get hotelWriteBuildingFloor => 'Write building/floor';

  @override
  String get hotelBuildingNumber => 'Building number';

  @override
  String get hotelFloorNumber => 'Floor number';

  @override
  String get hotelIcKey => 'IC key';

  @override
  String get hotelGetIcKey => 'Get';

  @override
  String get hotelCopySuccess => 'Copied';

  @override
  String get hotelOpenLockDetail => 'Open lock detail';

  @override
  String get hotelAlias => 'Alias';

  @override
  String get hotelCloudRetry => 'Retry sync';

  @override
  String get hotelInitDate => 'Initialized at';

  @override
  String get hotelGroupName => 'Group';

  @override
  String get hotelMac => 'MAC';

  @override
  String get hotelElectricQuantity => 'Battery';

  @override
  String get enrollTimeout => 'No card or fingerprint detected, please retry';

  @override
  String get keypadSlots => 'Slots';

  @override
  String keypadSlotLabel(int slot) {
    return 'Slot $slot';
  }

  @override
  String get keypadSlotEmpty => 'Unbound';

  @override
  String get keypadSlotMine => 'This lock';

  @override
  String keypadSlotLimit(int limit) {
    return 'Up to $limit locks';
  }

  @override
  String get keypadSlotsUnavailable =>
      'Slot info unavailable (permission on the locks bound to this keypad is required)';

  @override
  String keypadSlotsLoadFailed(String reason) {
    return 'Failed to load slots: $reason';
  }

  @override
  String get keypadUnbindFromLock => 'Unbind';

  @override
  String get keypadUnbindConfirm =>
      'Enter *529# on the keypad first, then confirm to unbind this lock from the keypad.';

  @override
  String get keypadCloudPending => 'Keypad unbound, not synced to cloud';

  @override
  String get keypadCloudRetry => 'Retry sync';

  @override
  String get keypadEnrollCard => 'Enroll card';

  @override
  String get keypadEnrollFingerprint => 'Enroll fingerprint';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get veryHigh => 'Very high';

  @override
  String get extreme => 'Extreme';

  @override
  String get off => 'Off';

  @override
  String get on => 'On';

  @override
  String get sensitivity => 'Sensitivity';

  @override
  String get sensitivityOff => 'Off';

  @override
  String get lightTime => 'Light duration';

  @override
  String get lightTimeHint => 'Light duration in seconds';

  @override
  String get bluetoothAdvertisingInterval => 'Bluetooth advertising interval';

  @override
  String get bluetoothAdvertisingIntervalCurrent => 'Current interval';

  @override
  String get bluetoothAdvertisingIntervalUnknown =>
      'Unable to read advertising interval';

  @override
  String get bluetoothAdvertisingIntervalPick => 'Select advertising interval';

  @override
  String get bluetoothAdvertisingIntervalSetSuccess =>
      'Advertising interval updated';

  @override
  String get motorTorque => 'Motor torque';

  @override
  String motorTorqueLevel(int level) {
    return 'Level $level';
  }

  @override
  String get latchBolt => 'Latch bolt';

  @override
  String get latchBoltHint => 'Latch hold time in seconds; valid range 2–10';

  @override
  String get latchBoltDriveLevelHint =>
      'Drive level; valid range 1–20; 0 = no control';

  @override
  String get latchBoltDriveLevelNoControl => 'No control';

  @override
  String get latchBoltKeepTimeHint =>
      'Latch hold time in seconds; valid range 2–10';

  @override
  String get lockTime => 'Lock time';

  @override
  String get lockTimeCurrent => 'Current lock time';

  @override
  String get lockTimeUnknown => 'Unable to read lock time';

  @override
  String get lockTimeCalibrate => 'Calibrate lock time';

  @override
  String get lockTimeCalibrateSuccess => 'Lock time calibrated';

  @override
  String get adminPasscode => 'Admin passcode';

  @override
  String get adminPasscodeCurrent => 'Current admin passcode';

  @override
  String get adminPasscodeNew => 'New admin passcode';

  @override
  String get adminPasscodeHint => 'Enter 4–9 digits';

  @override
  String get adminPasscodeModify => 'Change admin passcode';

  @override
  String get adminPasscodeModifySuccess => 'Admin passcode updated';

  @override
  String get adminPasscodeLoadFailed => 'Failed to read admin passcode';

  @override
  String get gatewayUseStaticIp => 'Use static IP (optional)';

  @override
  String get gatewayUseApn => 'Configure APN (optional)';

  @override
  String get gatewayApn => 'APN';

  @override
  String get gatewayApnHint => 'Cellular gateway APN, e.g. cmnet';

  @override
  String get meterSetRemainder => 'Set remaining';

  @override
  String get meterSetRemainderHint => 'Enter remaining usage';

  @override
  String get meterReset => 'Factory reset';

  @override
  String get meterResetConfirmTitle => 'Factory reset?';

  @override
  String get meterResetConfirmBody =>
      'This will reset the meter and cannot be undone.';

  @override
  String get meterRefreshFeatureValue => 'Refresh feature value';
}
