

#import <Foundation/Foundation.h>
#import "TTGatewayScanModel.h"
#import "TTSystemInfoModel.h"

@interface TTGatewayMacro : NSObject

#pragma mark --- G2
typedef NS_ENUM(NSInteger, TTGatewayConnectStatus){
    TTGatewayConnectTimeout,
    TTGatewayConnectSuccess,
    TTGatewayConnectFail,
};

typedef NS_ENUM(NSInteger, TTGatewayStatus){
    TTGatewaySuccess = 0,
    TTGatewayFail = 1,
    TTGatewayWrongSSID = 3,
    TTGatewayWrongWifiPassword = 4,
    TTGatewayInvalidCommand = 6,
	TTGatewayTimeout = 7,
	TTGatewayNoSIM = 8,
	TTGatewayNoPlugCable = 9,
    TTGatewayWrongCRC = -1,
    TTGatewayWrongAeskey = -2,
    TTGatewayNotConnect = -3,
    TTGatewayDisconnect = -4,
    TTGatewayFailConfigRouter = -5,
    TTGatewayFailConfigServer = -6,
    TTGatewayFailConfigAccount = -7,
    TTGatewayFailConfigIP = -8,
    TTGatewayFailInvaildIP = -9,
};

typedef void(^TTGatewayScanBlock)(TTGatewayScanModel *model);
typedef void(^TTGatewayConnectBlock)(TTGatewayConnectStatus connectStatus);
//wifiArr: [{"SSID":"ssid"}]
typedef void(^TTGatewayScanWiFiBlock)(BOOL isFinished, NSArray *WiFiArr,TTGatewayStatus status);
typedef void(^TTGatewayBlock)(TTGatewayStatus status);
typedef void(^TTInitializeGatewayBlock)(TTSystemInfoModel *systemInfoModel,TTGatewayStatus status);

@end


