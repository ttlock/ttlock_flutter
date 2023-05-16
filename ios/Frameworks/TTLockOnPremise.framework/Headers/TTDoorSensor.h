//
//  TTDoorSensor.h
//  TTLock
//
//  Created by Juanny on 2021/8/6.
//  Copyright © 2021 TTLock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTSystemInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTDoorSensorScanModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic, assign) NSInteger RSSI;
@property (nonatomic, assign) long long scanTime; //millisecond

@end

@interface TTDoorSensor : NSObject

typedef NS_ENUM (NSInteger, TTDoorSensorError) {
    TTDoorSensorErrorBluetoothPowerOff = 1,
    TTDoorSensorErrorConnectTimeout = 2,
    TTDoorSensorErrorFail = 3,
    TTDoorSensorErrorWrongCRC = 4,
};

typedef void(^TTDoorSensorFailBlock)(TTDoorSensorError error);

typedef void(^TTDoorSensorScanBlock)(TTDoorSensorScanModel *model);

typedef void(^TTDoorSensorInitializeBlock)(int electricQuantity, TTSystemInfoModel *systemModel);

typedef void(^TTDoorSensorEnterUpgradeModeBlock)(void);

+ (void)startScanWithSuccess:(TTDoorSensorScanBlock)success failure:(TTDoorSensorFailBlock)failure;

+ (void)stopScan;

+ (void)initializeWithDoorSensorMac:(NSString *)doorSensorMac
                           lockData:(NSString*)lockData
                            success:(TTDoorSensorInitializeBlock)success
                            failure:(TTDoorSensorFailBlock)failure;

+ (void)enterUpgradeModeWithDoorSensorMac:(NSString *)doorSensorMac
                                 lockData:(NSString*)lockData
                                  success:(TTDoorSensorEnterUpgradeModeBlock)success
                                  failure:(TTDoorSensorFailBlock)failure;

@end




NS_ASSUME_NONNULL_END
