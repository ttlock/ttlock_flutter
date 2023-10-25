#import "TtlockFlutterPlugin.h"
#import "TtlockPluginConfig.h"
#import <TTLock/TTLock.h>
#import <TTLock/TTGateway.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, ResultState) {
    ResultStateSuccess,
    ResultStateProgress,
    ResultStateFail,
};

@interface TtlockFlutterPlugin()

@property (nonatomic,strong) FlutterEventSink eventSink;

@end

@implementation TtlockFlutterPlugin


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
 
    //1.初始化接收对象
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:TTLOCK_CHANNEL_COMMAND binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:[self sharedInstance] channel:channel];
    
    //2.初始化发送对象
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:TTLOCK_CHANNEL_LISTEN binaryMessenger:registrar.messenger];
    [eventChannel setStreamHandler:[self sharedInstance]];
}

+ (instancetype)sharedInstance{
    static TtlockFlutterPlugin *instance = nil;
    if (!instance) {
        instance = [[self alloc] init];
        [TTLock setupBluetooth:^(TTBluetoothState state) {
            if (state != TTBluetoothStatePoweredOn) {
                NSLog(@"####### Bluetooth is off or un unauthorized ########");
            }
        }];
    }
    return instance;
}

#pragma mark  - FlutterPlugin
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    __weak TtlockFlutterPlugin *weakSelf = self;
    NSString *command = call.method;
    NSObject *arguments = call.arguments;
    TtlockModel *lockModel = nil;
    if ([arguments isKindOfClass:NSDictionary.class]) {
        lockModel = [TtlockModel modelWithDict:(NSDictionary *)arguments];
    }else if ([arguments isKindOfClass:NSString.class]) {
        lockModel = [TtlockModel new];
        lockModel.lockData = (NSString *)arguments;
    }
    
    if (TTLock.bluetoothState != TTBluetoothStatePoweredOn) {
        NSLog(@"####### Bluetooth is off or un unauthorized ########");
    }
    
    if ([command isEqualToString:command_start_scan_lock]) {
        [TTLock startScan:^(TTScanModel *scanModel) {
            TtlockModel *data = [TtlockModel new];
            data.electricQuantity = @(scanModel.electricQuantity);
            data.lockName = scanModel.lockName;
            data.lockMac = scanModel.lockMac;
            data.isInited = @(scanModel.isInited);
            data.isAllowUnlock = @(scanModel.isAllowUnlock);
            data.lockVersion = scanModel.lockVersion;
            data.lockSwitchState = @(scanModel.lockSwitchState);
            data.rssi = @(scanModel.RSSI);
            data.oneMeterRssi = @(scanModel.oneMeterRSSI);
            
            data.timestamp = @(@(scanModel.date.timeIntervalSince1970 * 1000).longLongValue);
            data.lockSwitchState = @(scanModel.lockSwitchState);
            [weakSelf successCallbackCommand:command data: [data toDictionary]];
        }];
    }else if ([command isEqualToString:command_stop_scan_lock]) {
        [TTLock stopScan];
    }else if ([command isEqualToString:command_get_bluetooth_state]) {
        TTBluetoothState state = [TTLock bluetoothState];
        TtlockModel *data = [TtlockModel new];
        data.state = @(state);
        [self successCallbackCommand:command data:data];
    }else if ([command isEqualToString:command_get_blutetooth_scan_state]) {
        int scanState = [TTLock isScanning];
        TtlockModel *data = [TtlockModel new];
        data.scanState = @(scanState);
        [self successCallbackCommand:command data:data];
    }else if ([command isEqualToString:command_init_lock]) {
        NSDictionary *dict = (NSDictionary *)arguments;
     
        [TTLock initLockWithDict:dict success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_reset_lock]) {
        [TTLock resetLockWithLockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_control_lock]) {
        [TTLock controlLockWithControlAction:lockModel.controlAction.intValue + 1 lockData:lockModel.lockData success:^(long long lockTime, NSInteger electricQuantity, long long uniqueId) {
            TtlockModel *data = [TtlockModel new];
            data.lockTime = @(lockTime);
            data.electricQuantity = @(electricQuantity);
            data.uniqueId = @(uniqueId);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_reset_ekey]){
        [TTLock resetEkeyWithLockData:lockModel.lockData success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];

    }else if ([command isEqualToString:command_create_custom_passcode]) {
         
        [TTLock createCustomPasscode:lockModel.passcode startDate:lockModel.startDate.longLongValue endDate:lockModel.endDate.longLongValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_modify_passcode]) {
        [TTLock modifyPasscode:lockModel.passcodeOrigin
                   newPasscode:lockModel.passcodeNew
                     startDate:lockModel.startDate.longLongValue
                       endDate:lockModel.endDate.longLongValue
                      lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_delete_passcode]) {
        [TTLock deletePasscode:lockModel.passcode lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_reset_passcodes]) {
        [TTLock resetPasscodesWithLockData:lockModel.lockData success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data: data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_add_ic_card]) {
        NSArray *cycleConfigArray = (NSArray *)[self dictFromJsonStr:lockModel.cycleJsonList];
        [TTLock addICCardWithCyclicConfig:cycleConfigArray startDate:lockModel.startDate.longLongValue
                           endDate:lockModel.endDate.longLongValue
                          lockData:lockModel.lockData
                          progress:^(TTAddICState state) {
            TtlockModel *progressData = [TtlockModel new];
            [weakSelf progressCallbackCommand:command data:progressData];
        } success:^(NSString *cardNumber) {
            TtlockModel *successData = [TtlockModel new];
            successData.cardNumber = cardNumber;
            [weakSelf successCallbackCommand:command data:successData];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_modify_ic_card]) {
        NSArray *cycleConfigArray = (NSArray *)[self dictFromJsonStr:lockModel.cycleJsonList];
        [TTLock modifyICCardValidityPeriodWithCyclicConfig:cycleConfigArray cardNumber:lockModel.cardNumber
                                                 startDate:lockModel.startDate.longLongValue
                                                 endDate:lockModel.endDate.longLongValue
                                                lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_delete_ic_card]) {
        [TTLock deleteICCardNumber:lockModel.cardNumber lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_clear_all_ic_card]) {
        [TTLock clearAllICCardsWithLockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_add_fingerprint]) {
        
        NSArray *cycleConfigArray = (NSArray *)[self dictFromJsonStr:lockModel.cycleJsonList];
        [TTLock addFingerprintWithCyclicConfig:cycleConfigArray
                                     startDate:lockModel.startDate.longLongValue
                                       endDate:lockModel.endDate.longLongValue
                                      lockData:lockModel.lockData
                                      progress:^(int currentCount, int totalCount) {
            TtlockModel *progressData = [TtlockModel new];
            progressData.totalCount = @(totalCount);
            progressData.currentCount = @(currentCount);
            [weakSelf progressCallbackCommand:command data:progressData];
        } success:^(NSString *fingerprintNumber) {
            TtlockModel *successData = [TtlockModel new];
            successData.fingerprintNumber = fingerprintNumber;
            [weakSelf successCallbackCommand:command data:successData];
        } failure:^(TTError errorCode, NSString *errorMsg) {
             [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_modify_fingerprint]) {
          NSArray *cycleConfigArray = (NSArray *)[self dictFromJsonStr:lockModel.cycleJsonList];
        [TTLock modifyFingerprintValidityPeriodWithCyclicConfig:cycleConfigArray fingerprintNumber:lockModel.fingerprintNumber startDate:lockModel.startDate.longLongValue endDate:lockModel.endDate.longLongValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_delete_fingerprint]) {
        [TTLock deleteFingerprintNumber:lockModel.fingerprintNumber lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_clear_all_fingerprint]) {
        [TTLock clearAllFingerprintsWithLockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_modify_admin_passcode]) {
        [TTLock modifyAdminPasscode:lockModel.adminPasscode lockData:lockModel.lockData success:^() {
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_lock_time]) {
        [TTLock setLockTimeWithTimestamp:lockModel.timestamp.longLongValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_time]) {
        [TTLock getLockTimeWithLockData:lockModel.lockData success:^(long long lockTimestamp) {
            TtlockModel *data = [TtlockModel new];
            data.timestamp = @(lockTimestamp);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_lock_operate_record]) {
        int logType = lockModel.logType.intValue;
        TTOperateLogType type = logType == 0 ? TTOperateLogTypeLatest :TTOperateLogTypeAll;
        [TTLock getOperationLogWithType:type lockData:lockModel.lockData success:^(NSString *operateRecord) {
            TtlockModel *data = [TtlockModel new];
            data.records = operateRecord;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_lock_power]) {
        [TTLock getElectricQuantityWithLockData:lockModel.lockData success:^(NSInteger electricQuantity) {
            TtlockModel *data = [TtlockModel new];
            data.electricQuantity = @(electricQuantity);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_lock_version]) {
        NSString *lockMac = (NSString *)arguments;
        [TTLock getLockVersionWithLockMac:lockMac success:^(NSDictionary *lockVersion) {
            [weakSelf successCallbackCommand:command data:lockVersion];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_switch_state]) {
        [TTLock getLockSwitchStateWithLockData:lockModel.lockData success:^(TTLockSwitchState lockSwitchState, TTDoorSensorState doorSensorState) {
            TtlockModel *data = [TtlockModel new];
            data.lockSwitchState = @(lockSwitchState);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_lock_automatic_locking_periodic_time]) {
        [TTLock getAutomaticLockingPeriodicTimeWithLockData:lockModel.lockData success:^(int currentTime, int minTime, int maxTime) {
            TtlockModel *data = [TtlockModel new];
            data.maxTime = @(maxTime);
            data.minTime = @(minTime);
            data.currentTime = @(currentTime);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_set_lock_automatic_locking_periodic_time]) {
        [TTLock setAutomaticLockingPeriodicTime:lockModel.currentTime.intValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_remote_unlock_switch_state]) {
        [TTLock getRemoteUnlockSwitchWithLockData:lockModel.lockData success:^(BOOL isOn) {
            TtlockModel *data = [TtlockModel new];
            data.isOn = @(isOn) ;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
        
    }else if ([command isEqualToString:command_set_lock_remote_unlock_switch_state]) {
        BOOL switchOn = lockModel.isOn.boolValue;
        [TTLock setRemoteUnlockSwitchOn:switchOn lockData:lockModel.lockData success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_lock_config]) {
        TTLockConfigType lockConfigType = lockModel.lockConfig.intValue + 1;
        [TTLock getLockConfigWithType:lockConfigType lockData:lockModel.lockData success:^(TTLockConfigType type, BOOL isOn) {
            TtlockModel *data = [TtlockModel new];
            data.isOn = @(isOn);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];

        
    }else if ([command isEqualToString:command_set_lock_config]) {
        BOOL switchOn = lockModel.isOn.intValue;
        TTLockConfigType lockConfigType = lockModel.lockConfig.intValue + 1;
        [TTLock setLockConfigWithType:lockConfigType on:switchOn lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_all_passage_modes]) {
        [TTLock getPassageModesWithLockData:lockModel.lockData success:^(NSString *passageModes) {
            TtlockModel *data = [TtlockModel new];
            data.passageModes = passageModes;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_add_passage_mode]) {
        // startDate  endDate 分钟为单位
        TTPassageModeType type = lockModel.passageModeType.intValue + 1;
        NSArray *weekly = lockModel.weekly;
        NSArray *monthly = lockModel.monthly;
        int startDate = lockModel.startDate.intValue;
        int endDate = lockModel.endDate.intValue;
        NSString *lockData = lockModel.lockData;
        [TTLock configPassageModeWithType:type
                                   weekly:weekly
                                  monthly:monthly
                                startDate:startDate
                                  endDate:endDate
                                 lockData:lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_clear_all_passage_modes]) {
        [TTLock clearPassageModeWithLockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_start_scan_gateway]) {
        [TTGateway startScanGatewayWithBlock:^(TTGatewayScanModel *model) {
            NSMutableDictionary *dict = @{}.mutableCopy;
            dict[@"gatewayMac"] = model.gatewayMac;
            dict[@"gatewayName"] = model.gatewayName;
            dict[@"rssi"] = @(model.RSSI);
            dict[@"isDfuMode"] = @(model.isDfuMode);
            dict[@"type"] = @(model.type-1);
            [weakSelf successCallbackCommand:command data:dict];
        }];
        
    }else if ([command isEqualToString:command_stop_scan_gateway]) {
        [TTGateway stopScanGateway];
        
    }else if ([command isEqualToString:command_get_surround_wifi]) {
        [TTGateway scanWiFiByGatewayWithBlock:^(BOOL isFinished, NSArray *WiFiArr, TTGatewayStatus status) {
            if (status == TTGatewaySuccess) {
                NSMutableArray *wifiList = @[].mutableCopy;
                for (NSDictionary *dict in WiFiArr) {
                    NSMutableDictionary *wifiDict = @{}.mutableCopy;
                    wifiDict[@"wifi"] = dict[@"SSID"];
                    wifiDict[@"rssi"] = dict[@"RSSI"];
                    [wifiList addObject:wifiDict];
                }
                
                NSMutableDictionary *dict = @{}.mutableCopy;
                dict[@"wifiList"] = wifiList;
                dict[@"finished"] = @(isFinished);
                [weakSelf successCallbackCommand:command data:dict];
            }else{
                [weakSelf errorCallbackCommand:command code:status details:nil];
            }
        }];
    }else if ([command isEqualToString:command_connect_gateway]) {
        [TTGateway connectGatewayWithGatewayMac:lockModel.mac block:^(TTGatewayConnectStatus connectStatus) {
            NSMutableDictionary *dict = @{}.mutableCopy;
            dict[@"status"] = @(connectStatus);
            [weakSelf successCallbackCommand:command data:dict];
        }];
    }else if ([command isEqualToString:command_config_gateway_ip]) {
        NSMutableDictionary *dict = [self dictFromJsonStr:lockModel.ipSettingJsonStr];
        [TTGateway configIpWithInfo:dict block:^(TTGatewayStatus status) {
            if (status == TTGatewaySuccess) {
                [weakSelf successCallbackCommand:command data:nil];
            }else{
               [weakSelf errorCallbackCommand:command code:status details:nil];
            }
        }];
    }else if ([command isEqualToString:command_disconnect_gateway]) {
        [TTGateway disconnectGatewayWithGatewayMac:lockModel.mac block:^(TTGatewayStatus status) {
            [weakSelf successCallbackCommand:command data:nil];
        }];
    }else if ([command isEqualToString:command_init_gateway]) {
        NSMutableDictionary *dict = [self dictFromJsonStr:lockModel.addGatewayJsonStr];
        
        TTGatewayType gatewayType = [dict[@"type"] intValue] + 1;
        
        NSMutableDictionary *paramDict = @{}.mutableCopy;
        paramDict[@"SSID"] = dict[@"wifi"];
        paramDict[@"wifiPwd"] = dict[@"wifiPassword"];
        paramDict[@"uid"] = dict[@"ttlockUid"];
        paramDict[@"userPwd"] = dict[@"ttlockLoginPassword"];
        paramDict[@"serverAddress"] = dict[@"serverIp"];
        paramDict[@"portNumber"] = dict[@"serverPort"];
        paramDict[@"gatewayVersion"] = @(gatewayType);
        paramDict[@"companyId"] = dict[@"companyId"];
        paramDict[@"gatewayName"] = dict[@"gatewayName"];
        paramDict[@"branchId"] = dict[@"branchId"];
        if (gatewayType > TTGateWayTypeG2) {
            paramDict[@"SSID"] = @"1";
            paramDict[@"wifiPwd"] = @"1";
        }
        [TTGateway initializeGatewayWithInfoDic:paramDict block:^(TTSystemInfoModel *systemInfoModel, TTGatewayStatus status) {
             if (status == TTGatewaySuccess) {
                 NSMutableDictionary *resultDict = @{}.mutableCopy;
                 resultDict[@"modelNum"] = systemInfoModel.modelNum;
                 resultDict[@"hardwareRevision"] = systemInfoModel.hardwareRevision;
                 resultDict[@"firmwareRevision"] = systemInfoModel.firmwareRevision;
                 [weakSelf successCallbackCommand:command data:resultDict];
             }else{
                [weakSelf errorCallbackCommand:command code:status details:nil];
             }
        }];
    }else if ([command isEqualToString:command_upgrade_gateway]) {
        [TTGateway upgradeGatewayWithGatewayMac:lockModel.mac block:^(TTGatewayStatus status) {
            if (status == TTGatewaySuccess) {
                [weakSelf successCallbackCommand:command data:nil];
            }else{

               [weakSelf errorCallbackCommand:command code:status details:nil];
            }
        }];
    }else if ([command isEqualToString:command_function_support]) {
        NSInteger index = lockModel.supportFunction.integerValue;
                NSArray *functionArray = @[
                    @(TTLockFeatureValuePasscode),
                            @(TTLockFeatureValueICCard),
                            @(TTLockFeatureValueFingerprint),
                            @(TTLockFeatureValueWristband),
                            @(TTLockFeatureValueAutoLock),
                            @(TTLockFeatureValueDeletePasscode),
                            @(TTLockFeatureValueManagePasscode),
                            @(TTLockFeatureValueLocking),
                            @(TTLockFeatureValuePasscodeVisible),
                            @(TTLockFeatureValueGatewayUnlock),
                            @(TTLockFeatureValueLockFreeze),
                            @(TTLockFeatureValueCyclePassword),
                            @(TTLockFeatureValueRemoteUnlockSwicth),
                            @(TTLockFeatureValueAudioSwitch),
                            @(TTLockFeatureValueNBIoT),
                            @(TTLockFeatureValueGetAdminPasscode),
                            @(TTLockFeatureValueHotelCard),
                            @(TTLockFeatureValueNoClock),
                            @(TTLockFeatureValueNoBroadcastInNormal),
                            @(TTLockFeatureValuePassageMode),
                            @(TTLockFeatureValueTurnOffAutoLock),
                            @(TTLockFeatureValueWirelessKeypad),
                            @(TTLockFeatureValueLight),
                            @(TTLockFeatureValueHotelCardBlacklist),
                            @(TTLockFeatureValueIdentityCard),
                            @(TTLockFeatureValueTamperAlert),
                            @(TTLockFeatureValueResetButton),
                            @(TTLockFeatureValuePrivacyLock),
                            @(TTLockFeatureValueDeadLock),
                            @(TTLockFeatureValueCyclicCardOrFingerprint),
                            @(TTLockFeatureValueFingerVein),
                            @(TTLockFeatureValueBle5G),
                            @(TTLockFeatureValueNBAwake),
                            @(TTLockFeatureValueRecoverCyclePasscode),
                            @(TTLockFeatureValueWirelessKeyFob),
                            @(TTLockFeatureValueGetAccessoryElectricQuantity),
                            @(TTLockFeatureValueSoundVolume),
                            @(TTLockFeatureValueQRCode),
                            @(TTLockFeatureValueSensorState),
                            @(TTLockFeatureValuePassageModeAutoUnlock),
                            @(TTLockFeatureValueDoorSensor),
                            @(TTLockFeatureValueDoorSensorAlert),
                            @(TTLockFeatureValueSensitivity),
                            @(TTLockFeatureValueFace),
                            @(TTLockFeatureValueCpuCard),
                            @(TTLockFeatureValueWifiLock),
                            @(TTLockFeatureValueWifiLockStaticIP),
                            @(TTLockFeatureValuePasscodeKeyNumber)
                ];
                
                
                TTLockFeatureValue featureValue = [functionArray[index] intValue];
                bool isSupport = [TTUtil lockFeatureValue:lockModel.lockData suportFunction:featureValue];
                TtlockModel *data = [TtlockModel new];
                data.isSupport = @(isSupport);
                [weakSelf successCallbackCommand:command data:data];
    }
    
    else if ([command isEqualToString:command_active_lift_floors]) {
        [TTLock activateLiftFloors:lockModel.floors lockData:lockModel.lockData success:^(long long lockTime, NSInteger electricQuantity, long long uniqueId) {
            TtlockModel *data = [TtlockModel new];
            data.lockTime = @(lockTime);
            data.electricQuantity = @(electricQuantity);
            data.uniqueId = @(uniqueId);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_lift_controlable_floors]) {
        [TTLock setLiftControlableFloors:lockModel.floors lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_lift_work_mode]) {
        [TTLock setLiftWorkMode:lockModel.liftWorkActiveType.intValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_power_saver_work_mode]) {
        TTPowerSaverWorkMode mode = lockModel.powerSaverType.intValue;
        [TTLock setPowerSaverWorkMode:mode lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_hotel_info]) {
        [TTLock setHotelDataWithHotelInfo:lockModel.hotelInfo buildingNumber:lockModel.buildingNumber.intValue floorNumber:lockModel.floorNumber.intValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_set_hotel_card_sector]) {
        [TTLock setHotelCardSector:lockModel.sector lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_all_valid_passcode]) {
        [TTLock getAllValidPasscodesWithLockData:lockModel.lockData success:^(NSString *passcodes) {
            TtlockModel *data = [TtlockModel new];
            data.passcodeListString = passcodes;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_all_valid_card]) {
        [TTLock getAllValidICCardsWithLockData:lockModel.lockData success:^(NSString *allICCardsJsonString) {
            TtlockModel *data = [TtlockModel new];
            data.cardListString = allICCardsJsonString;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_all_valid_fingerprint]) {
        [TTLock getAllValidFingerprintsWithLockData:lockModel.lockData success:^(NSString *allFingerprintsJsonString) {
            TtlockModel *data = [TtlockModel new];
            data.fingerprintListString = allFingerprintsJsonString;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_system_info]) {
        [TTLock getLockSystemInfoWithLockData:lockModel.lockData success:^(TTSystemInfoModel *systemModel) {
            [weakSelf successCallbackCommand:command data:[weakSelf dicFromObject:systemModel]];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_feature_value]) {
        [TTLock getLockFeatureValueWithLockData:lockModel.lockData success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_power_saver_controlable]) {
        [TTLock setPowerSaverControlableLockWithLockMac:lockModel.lockMac lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_nb_awake_modes]) {
        [TTLock setNBAwakeModes:lockModel.nbAwakeModes lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_nb_awake_modes]) {
        [TTLock getNBAwakeModesWithLockData:lockModel.lockData success:^(NSArray<NSNumber *> *awakeModes) {
            TtlockModel *data = [TtlockModel new];
            data.nbAwakeModes = awakeModes;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_nb_awake_times]) {
        NSMutableArray *awakeTimeArray = @[].mutableCopy;
        for (NSDictionary *dict in lockModel.nbAwakeTimeList) {
            NSMutableDictionary *nbAwakeTimeDict = dict.mutableCopy;
            nbAwakeTimeDict[@"type"] = @([nbAwakeTimeDict[@"type"] intValue] + 1);
            [awakeTimeArray addObject:nbAwakeTimeDict];
        }
        [TTLock setNBAwakeTimes:awakeTimeArray lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
        
    }else if ([command isEqualToString:command_get_nb_awake_times]) {
        [TTLock getNBAwakeTimesWithLockData:lockModel.lockData success:^(NSArray<NSDictionary *> *awakeTimes) {
            TtlockModel *data = [TtlockModel new];
            data.nbAwakeTimeList = awakeTimes;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_recover_password]) {
        [TTLock recoverPasscode:lockModel.passcode
                    newPasscode:lockModel.passcodeNew
                   passcodeType:lockModel.passcodeType.intValue + 1
                      startDate:lockModel.startDate.longLongValue
                        endDate:lockModel.endDate.longLongValue
                      cycleType:lockModel.cycleType.intValue
                       lockData:lockModel.lockData
                        success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    /*else if ([command isEqualToString:command_set_door_sensor_switch]) {
        [TTLock setDoorSensorLockingSwitchOn:lockModel.isOn.boolValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_door_sensor_switch]) {
        [TTLock getDoorSensorLockingSwitchStateWithLockData:lockModel.lockData success:^(BOOL isOn) {
            TtlockModel *data = [TtlockModel new];
            data.isOn = @(isOn);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_door_sensor_state]) {
        [TTLock getDoorSensorStateWithLockData:lockModel.lockData success:^(BOOL isOn) {
            TtlockModel *data = [TtlockModel new];
            data.isOn = @(isOn);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }*/
   else if ([command isEqualToString:command_get_admin_passcode_by_lockdata]) {
        [TTLock getAdminPasscodeWithLockData:lockModel.lockData success:^(NSString *adminPasscode) {
            TtlockModel *data = [TtlockModel new];
            data.adminPasscode = adminPasscode;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_passcode_verification_param]) {
        [TTLock getPasscodeVerificationParamsWithLockData:lockModel.lockData success:^(NSString *lockData) {
            TtlockModel *data = [TtlockModel new];
            data.lockData = lockData;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_nb_server_address]) {
    
        [TTLock setNBServerAddress:lockModel.ip
                        portNumber:lockModel.port
                          lockData:lockModel.lockData
                           success:^(NSInteger electricQuantity) {
            TtlockModel *data = [TtlockModel new];
            data.electricQuantity = @(electricQuantity);
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_v2_lock_admin_erase_passcode]) {
     [TTLock setAdminErasePasscode:lockModel.erasePasscode lockData:lockModel.lockData success:^{
         [weakSelf successCallbackCommand:command data:nil];
     } failure:^(TTError errorCode, NSString *errorMsg) {
         [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
     }];
     }else if ([command isEqualToString:command_recover_card]) {
        NSArray *cycleConfigArray = (NSArray *)[self dictFromJsonStr:lockModel.cycleJsonList];
                cycleConfigArray = cycleConfigArray.count > 0 ? cycleConfigArray : nil;
                [TTLock recoverICCardWithCyclicConfig:cycleConfigArray cardNumber:lockModel.cardNumber
                          startDate:lockModel.startDate.longLongValue endDate:lockModel.endDate.longLongValue
                           lockData:lockModel.lockData success:^(NSString *cardNumber) {
            TtlockModel *data = [TtlockModel new];
            data.cardNumber = cardNumber;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_report_loss_card]) {
        [TTLock reportLossCard:lockModel.cardNumber
                      lockData:lockModel.lockData
                       success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    
    else if ([command isEqualToString:command_get_lock_version]) {
        [TTLock getLockVersionWithLockMac:lockModel.lockMac success:^(NSDictionary *lockVersion) {
            NSError *parseError;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:lockVersion options:NSJSONWritingPrettyPrinted error:&parseError];
            NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            
            TtlockModel *data = [TtlockModel new];
            data.lockVersion = str;
            [weakSelf successCallbackCommand:command data:data];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_scan_wifi]) {
        [TTLock scanWifiWithLockData:lockModel.lockData success:^(BOOL isFinished, NSArray *wifiArr) {
            NSMutableDictionary *dict = @{}.mutableCopy;
            dict[@"wifiList"] = wifiArr;
            dict[@"finished"] = @(isFinished);
            [weakSelf successCallbackCommand:command data:dict];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_config_lock_wifi]) {
        [TTLock configWifiWithSSID:lockModel.wifiName wifiPassword:lockModel.wifiPassword lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_config_lock_wifi_server]) {
        [TTLock configServerWithServerAddress:lockModel.ip portNumber:lockModel.port lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    else if ([command isEqualToString:command_get_lock_wifi_info]) {
        [TTLock getWifiInfoWithLockData:lockModel.lockData success:^(NSString *wifiMac, NSInteger wifiRssi) {
            NSMutableDictionary *dict = @{}.mutableCopy;
            dict[@"wifiMac"] = wifiMac;
            dict[@"wifiRssi"] = @(wifiRssi);
            [weakSelf successCallbackCommand:command data:dict];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    
    else if ([command isEqualToString:command_config_lock_server_ip]) {
        NSDictionary *infoDict = [self dictFromJsonStr:lockModel.ipSettingJsonStr];
        [TTLock configIpWithInfo:infoDict lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_get_lock_sound_value]) {
        NSDictionary *typeMap = @{@(TTSoundVolumeFirstLevel):@0,
                                    @(TTSoundVolumeSecondLevel):@1,
                                    @(TTSoundVolumeThirdLevel):@2,
                                    @(TTSoundVolumeFourthLevel):@3,
                                    @(TTSoundVolumeFifthLevel):@4,
                                    @(TTSoundVolumeOff):@5,
                                    @(TTSoundVolumeOn):@6};
        
        [TTLock getLockSoundWithLockData:lockModel.lockData success:^(TTSoundVolume soundVolume) {
            NSMutableDictionary *dict = @{}.mutableCopy;
            dict[@"soundVolumeType"] = typeMap[@(soundVolume)];
            [weakSelf successCallbackCommand:command data:dict];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_lock_sound_value]) {
        NSDictionary *typeMap = @{@0:@(TTSoundVolumeFirstLevel),
                                     @1:@(TTSoundVolumeSecondLevel),
                                     @2:@(TTSoundVolumeThirdLevel),
                                     @3:@(TTSoundVolumeFourthLevel),
                                     @4:@(TTSoundVolumeFifthLevel),
                                     @5:@(TTSoundVolumeOff),
                                     @6:@(TTSoundVolumeOn)};
        NSNumber * type = typeMap[lockModel.soundVolumeType];
        [TTLock setLockSoundWithSoundVolume:type.intValue lockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }else if ([command isEqualToString:command_set_lock_enter_upgrade_mode]) {
        [TTLock enterUpgradeModeWithLockData:lockModel.lockData success:^{
            [weakSelf successCallbackCommand:command data:nil];
        } failure:^(TTError errorCode, NSString *errorMsg) {
            [weakSelf errorCallbackCommand:command code:errorCode details:errorMsg];
        }];
    }
    
}

- (void)successCallbackCommand:(NSString *)command data:(NSObject *)data {
    [self callbackCommand:command
      resultState: ResultStateSuccess
            data:data
       errorCode:nil
    errorMessage:nil];
}

- (void)progressCallbackCommand:(NSString *)command data:(NSObject *)data {
    [self callbackCommand:command
      resultState:ResultStateProgress
            data:data
       errorCode:nil
    errorMessage:nil];
}

- (void)errorCallbackCommand:(NSString *)command code:(NSInteger)code details:(NSString *)errorMessage {
    [self callbackCommand:command
               resultState:ResultStateFail
                     data:nil
                errorCode:@(code)
             errorMessage:errorMessage];
}

- (void)callbackCommand:(NSString *)command resultState:(ResultState)resultState data:(NSObject *)data errorCode:(NSNumber *)code errorMessage:(NSString *)errorMessage {
    
    NSArray *gatewayCommandArray = @[command_get_surround_wifi,
                                    command_config_gateway_ip,
                                    command_disconnect_gateway,
                                    command_init_gateway,
                                    command_upgrade_gateway
    ];
    
    bool isGatewayStatus = false;
    for (NSString *gatewayStatusCommand in gatewayCommandArray) {
        if([command isEqual:gatewayStatusCommand]){
            isGatewayStatus = true;
            break;
        }
    }
    NSNumber *errorCode = nil;
    if(isGatewayStatus){
        errorCode = @([self getTTGatewayErrorCode:[code integerValue]]);
    }else{
        errorCode = [self getTTLockErrorCode:code];
    }
    
    NSMutableDictionary *resultDict = @{}.mutableCopy;
    resultDict[@"command"] = command;
    resultDict[@"errorMessage"] = errorMessage;
    resultDict[@"errorCode"] = errorCode;
    resultDict[@"resultState"] = @(resultState);
    if (data) {
        if ([data isKindOfClass:TtlockModel.class]) {
            resultDict[@"data"] = [((TtlockModel *)data) toDictionary];
        }else{
            resultDict[@"data"] = data;
        }
    }
    FlutterEventSink eventSink = [TtlockFlutterPlugin sharedInstance].eventSink;
    if (eventSink == nil) {
        NSLog(@"TTLock iOS native errro eventSink is nil");
    }else{
        eventSink(resultDict);
    }
}


#pragma mark  - FlutterStreamHandler
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink{
    _eventSink = eventSink;
    return  nil;
}

- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    return nil;
}



#pragma private
- (NSMutableDictionary *)dictFromJsonStr:(NSString *) jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:nil];
}


- (NSDictionary *)dicFromObject:(NSObject *)object {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([object class], &count);
 
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithUTF8String:cName];
        NSObject *value = [object valueForKey:name];//valueForKey返回的数字和字符串都是对象
 
        if (value == nil) {
            //null
            //[dic setObject:[NSNull null] forKey:name];//这行可以注释掉?????
 
        } else {
            //model
            [dic setObject:value forKey:name];
        }
    }
 
    return [dic copy];

}

- (NSInteger)getTTGatewayErrorCode:(TTGatewayStatus) status{
    NSArray *codeArray =@[@(TTGatewayFail),
                          @(TTGatewayWrongSSID),
                          @(TTGatewayWrongWifiPassword),
                          @(TTGatewayWrongCRC),
                          @(TTGatewayWrongAeskey),
                          @(TTGatewayNotConnect),
                          @(TTGatewayDisconnect),
                          @(TTGatewayFailConfigRouter),
                          @(TTGatewayFailConfigServer),
                          @(TTGatewayFailConfigAccount),
                          @(TTGatewayNoSIM),
                          @(TTGatewayInvalidCommand),
                          @(TTGatewayFailConfigIP),
                          @(TTGatewayFailInvaildIP)
    
    ];
    
    NSInteger errorCode = TTGatewayFail;
    for (int i = 0; i < codeArray.count; i++) {
        if([codeArray[i] intValue] == status){
            errorCode = i;
        }
    }
    return errorCode;
}


- (NSNumber *)getTTLockErrorCode:(NSNumber *) code{
    NSInteger errorCode = TTErrorFail;
    NSArray *codeArray =@[@(TTErrorHadReseted),
                          @(TTErrorCRCError),
                          @(TTErrorNoPermisstion),
                          @(TTErrorWrongAdminCode),
                          @(TTErrorLackOfStorageSpace),
                          @(TTErrorInSettingMode),
                          @(TTErrorNoAdmin),
                          @(TTErrorNotInSettingMode),
                          @(TTErrorWrongDynamicCode),
                          @(TTErrorIsNoPower),
                          @(TTErrorResetPasscode),
                          @(TTErrorUpdatePasscodeIndex) ,
                          @(TTErrorInvalidLockFlagPos),
                          @(TTErrorEkeyExpired),
                          @(TTErrorPasscodeLengthInvalid),
                          @(TTErrorSamePasscodes),
                          @(TTErrorEkeyInactive),
                          @(TTErrorAesKey),
                          @(TTErrorFail),
                          @(TTErrorPasscodeExist),
                          @(TTErrorPasscodeNotExist),
                          @(TTErrorLackOfStorageSpaceWhenAddingPasscodes),
                          @(TTErrorInvalidParaLength) ,
                          @(TTErrorCardNotExist),
                          @(TTErrorFingerprintDuplication),
                          @(TTErrorFingerprintNotExist) ,
                          @(TTErrorInvalidCommand),
                          @(TTErrorInFreezeMode) ,
                          @(TTErrorInvalidClientPara),
                          @(TTErrorLockIsLocked),
                          @(TTErrorRecordNotExist),
                          @(TTErrorBluetoothPoweredOff),
                          @(TTErrorConnectionTimeout),
                          @(TTErrorDisconnection),
                          @(TTErrorLockIsBusy) ,
                          @(TTErrorWrongLockData),
                          @(TTErrorInvalidParameter),
                          @(TTErrorWrongSSID),
                          @(TTErrorWrongWifiPassword)];
    
    for (int i = 0; i < codeArray.count; i++) {
        if([codeArray[i] intValue] == code.intValue){
            errorCode = i;
        }
    }
    return @(errorCode);
}

@end
