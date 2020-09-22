//
//  TTWirelessKeypadScanModel.h
//  TTLockSourceCodeDemo
//
//  Created by 王娟娟 on 2019/5/14.
//  Copyright © 2019 Sciener. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTWirelessKeypadScanModel : NSObject

@property (nonatomic, strong) NSString *keypadName;
@property (nonatomic, strong) NSString *keypadMac;
@property (nonatomic, assign) NSInteger RSSI;

@end

NS_ASSUME_NONNULL_END
