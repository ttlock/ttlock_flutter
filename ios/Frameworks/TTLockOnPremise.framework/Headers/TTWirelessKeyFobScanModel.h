//
//  TTWirelessKeyFobScanModel.h
//  TTLock
//
//  Created by 王娟娟 on 2021/1/7.
//  Copyright © 2021 TTLock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTWirelessKeyFobScanModel : NSObject

@property (nonatomic, strong) NSString *keyFobName;
@property (nonatomic, strong) NSString *keyFobMac;
@property (nonatomic, assign) NSInteger RSSI;

@end

NS_ASSUME_NONNULL_END
