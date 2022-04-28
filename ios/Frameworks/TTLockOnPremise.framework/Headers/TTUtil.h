

#import <Foundation/Foundation.h>
#import "TTMacros.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTUtil : NSObject

+ (BOOL)lockFeatureValue:(NSString *)lockData suportFunction:(TTLockFeatureValue)function;

+ (TTLockType)getLockTypeWithLockVersion:(NSDictionary *)lockVersion;

@end

NS_ASSUME_NONNULL_END
