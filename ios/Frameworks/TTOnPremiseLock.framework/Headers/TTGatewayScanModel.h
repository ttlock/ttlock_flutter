//
//  TTGatewayScanModel.h
//  TTLockSourceCodeDemo
//
//  Created by 王娟娟 on 2019/4/27.
//  Copyright © 2019 Sciener. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

typedef NS_ENUM(NSInteger,TTGatewayType) {
	TTGateWayTypeG2 = 2,
	TTGateWayTypeG3,
	TTGateWayTypeG4,
};

@interface TTGatewayScanModel : NSObject

@property (nonatomic, strong) NSString *gatewayName;
@property (nonatomic, strong) NSString *gatewayMac;
@property (nonatomic, assign) BOOL isDfuMode;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, assign) NSInteger RSSI;
@property (nonatomic, assign) TTGatewayType type;

@end


