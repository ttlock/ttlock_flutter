//
//  TTGatewayScanModel.h
//  TTLockSourceCodeDemo
//
//  Created by 王娟娟 on 2019/4/27.
//  Copyright © 2019 Sciener. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface TTGatewayScanModel : NSObject

@property (nonatomic, strong) NSString *gatewayName;
@property (nonatomic, strong) NSString *gatewayMac;
@property (nonatomic, assign) BOOL isDfuMode;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, assign) NSInteger RSSI;

@end


