

#import <Foundation/Foundation.h>
#import "TTWirelessKeypadScanModel.h"

typedef enum {
    TTKeypadSuccess = 0,
    TTKeypadFail = 1,
    TTKeypadWrongCRC = -1,
    TTKeypadConnectTimeout = -2,
    TTKeypadWrongFactorydDate = -3
}TTKeypadStatus;

@interface TTWirelessKeypad : NSObject

typedef void(^TTKeypadScanBlock)(TTWirelessKeypadScanModel *model);

typedef void(^TTInitializeKeypadBlock)(NSString *wirelessKeypadFeatureValue,TTKeypadStatus status,int electricQuantity);

/**
 start Scan Keypad
 */
+ (void)startScanKeypadWithBlock:(TTKeypadScanBlock)block;
/**
 Stop Scan
 */
+ (void)stopScanKeypad;
/**
 initialize Keypad
 */
+ (void)initializeKeypadWithKeypadMac:(NSString *)KeypadMac lockMac:(NSString *)lockMac block:(TTInitializeKeypadBlock)block;

@end


