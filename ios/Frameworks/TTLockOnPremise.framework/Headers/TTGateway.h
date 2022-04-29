

#import <Foundation/Foundation.h>
#import "TTGatewayMacro.h"

@interface TTGateway : NSObject
/**
 *  Get the name of the wireless network SSID for the current connection.
    If returned nil, the current mobile phone is not connected to the wireless network
 *  (Need to open location permissions After iOS13).
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

 @param infoDic  @{@"SSID": xxx, @"wifiPwd": xxx, @"uid": xxx ,@"userPwd": xxx, @"gatewayName": xxx, @"gatewayVersion": @2, @"serverAddress":xxx, @"portNumber":xxx}
                 SSID  G2 require, G3 G4 not require
                 wifiPwd  G2 require, G3 G4 not require
                 gatewayName  Cannot exceed 48 bytes, exceeding will be truncated
				 gatewayVersion @2 means G2,@3 means G3,@4 means G4
                 option  @"serverAddress",@"portNumber"
 */
+ (void)initializeGatewayWithInfoDic:(NSDictionary *)infoDic block:(TTInitializeGatewayBlock)block;

/**
 Enter gateway into upgrade mode
 */
+ (void)upgradeGatewayWithGatewayMac:(NSString *)gatewayMac block:(TTGatewayBlock)block;

@end
