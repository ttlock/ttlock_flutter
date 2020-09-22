//
//  TTUtil.h
//  TTLockDemo
//
//  Created by 王娟娟 on 2019/4/22.
//  Copyright © 2019 wjj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTMacros.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTUtil : NSObject

+ (BOOL)lockSpecialValue:(long long)specialValue suportFunction:(TTLockSpecialFunction)function;

+ (BOOL)lockFeatureValue:(NSString *)lockData suportFunction:(TTLockFeatureValue)function;

+ (TTLockType)getLockTypeWithLockVersion:(NSDictionary *)lockVersion;

@end

NS_ASSUME_NONNULL_END
