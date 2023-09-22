//
//  TTWirelessKeyFob.h
//  TTLock
//
//  Created by 王娟娟 on 2021/1/7.
//  Copyright © 2021 TTLock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTWirelessKeyFobScanModel.h"
#import "TTSystemInfoModel.h"

typedef enum {
	TTKeyFobSuccess = 0,
	TTKeyFobFail = 1,
	TTKeyFobWrongCRC = -1,
	TTKeyFobConnectTimeout = -2,
}TTKeyFobStatus;

@interface TTWirelessKeyFob : NSObject

typedef void(^TTKeyFobScanBlock)(TTWirelessKeyFobScanModel *model);
typedef void(^TTNewInitializeKeyFobBlock)(TTKeyFobStatus status,int electricQuantity,TTSystemInfoModel *systemModel);
typedef void(^TTEnterUpgradeModeBlock)(TTKeyFobStatus status);

typedef void(^TTInitializeKeyFobBlock)(TTKeyFobStatus status,int electricQuantity);
typedef void(^TTGetLockSystemInfoBlock)(TTKeyFobStatus status,TTSystemInfoModel *systemModel);

/**
 Start Scan Key Fob
 */
+ (void)startScanWithBlock:(TTKeyFobScanBlock)block;
/**
 Stop Scan
 */
+ (void)stopScan;
/**
 initialize Keyfob
 */
+ (void)newInitializeWithKeyFobMac:(NSString *)keyFobMac
                        lockData:(NSString*)lockData
                          block:(TTNewInitializeKeyFobBlock)block;
/**
 Enter Upgrade Mode
 */
+ (void)enterUpgradeModeWithKeyFobMac:(NSString *)keyFobMac
                             lockData:(NSString*)lockData
                                block:(TTEnterUpgradeModeBlock)block;

+ (void)initializeWithKeyFobMac:(NSString *)keyFobMac
						lockData:(NSString*)lockData
                          block:(TTInitializeKeyFobBlock)block DEPRECATED_MSG_ATTRIBUTE("SDK3.2.6,Use newInitialize");

+ (void)getLockSystemInfoWithKeyFobMac:(NSString *)keyFobMac
                                 block:(TTGetLockSystemInfoBlock)block DEPRECATED_MSG_ATTRIBUTE("SDK3.2.6,Use newInitialize");

@end
