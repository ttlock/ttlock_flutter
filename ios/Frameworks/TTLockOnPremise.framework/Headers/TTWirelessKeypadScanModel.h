

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTWirelessKeypadScanModel : NSObject

@property (nonatomic, strong) NSString *keypadName;
@property (nonatomic, strong) NSString *keypadMac;
@property (nonatomic, assign) NSInteger RSSI;

@end

NS_ASSUME_NONNULL_END
