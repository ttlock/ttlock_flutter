//
//  TtlockModel.m
//  Runner
//
//  Created by Jinbo Lu on 2020/7/24.
//

#import "TtlockModel.h"
#import <objc/runtime.h>

@implementation TtlockModel
+ (TtlockModel *)modelWithDict:(NSDictionary *)dict{
    TtlockModel *model = [TtlockModel new];
    u_int count;
    objc_property_t *properties = class_copyPropertyList(self, &count);
    for (int i = 0; i<count; i++) {
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        NSObject *value = dict[propertyName];
        if ([value isKindOfClass:NSNull.class]) {
            continue;
        }
        [model setValue:value forKey:propertyName];
    }
    free(properties);
    
    return model;
}

- (NSDictionary *)toDictionary{
    NSMutableDictionary *dict = @{}.mutableCopy;
    u_int count;
    objc_property_t *properties = class_copyPropertyList(self.class, &count);
    for (int i = 0; i<count; i++) {
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [self valueForKey:propertyName];
        if (value != nil) {
            dict[propertyName] = value;
        }
    }
    free(properties);
    
    return dict;
}


@end
