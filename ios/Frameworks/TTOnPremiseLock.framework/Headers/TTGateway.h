//
//  TTSmartLinkLock.h
//  TTLockDemo
//
//  Created by wjjxx on 17/3/23.
//  Copyright © 2017年 wjj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTGatewayMacro.h"

@interface TTGateway : NSObject
/**
 *  Get the name of the wireless network SSID for the current connection.
    If returned nil, the current mobile phone is not connected to the wireless network.
 */
+ (NSString *)getSSID;

/**
 start Scan Gateway
 */
+ (void)startScanGatewayWithBlock:(TTGatewayScanBlock)block;

/**
 Stop Scan
 */
+ (void)stopScanGateway;

/**
 Connect gateway
 */
+ (void)connectGatewayWithGatewayMac:(NSString *)gatewayMac block:(TTGatewayConnectBlock)block;

/**
 Cancel connect with gateway
 */
+ (void)disconnectGatewayWithGatewayMac:(NSString *)gatewayMac block:(TTGatewayBlock)block;

/**
 Get wifi nearby gateway
 */
+ (void)scanWiFiByGatewayWithBlock:(TTGatewayScanWiFiBlock)block;

/**
 initialize Gateway

 @param infoDic  @{@"SSID": xxx, @"wifiPwd": xxx, @"uid": xxx ,@"userPwd": xxx, @"gatewayName": xxx}

 */
+ (void)initializeGatewayWithInfoDic:(NSDictionary *)infoDic block:(TTInitializeGatewayBlock)block;

/**
 Enter gateway into upgrade mode
 */
+ (void)upgradeGatewayWithGatewayMac:(NSString *)gatewayMac block:(TTGatewayBlock)block;

@end
