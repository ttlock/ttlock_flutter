

#import <Foundation/Foundation.h>

@interface TTSystemInfoModel : NSObject

@property (nonatomic,strong) NSString * modelNum;
@property (nonatomic,strong) NSString * hardwareRevision;
@property (nonatomic,strong) NSString * firmwareRevision;
//NB IOT LOCK
@property (nonatomic,strong) NSString * nbOperator;
@property (nonatomic,strong) NSString * nbNodeId;
@property (nonatomic,strong) NSString * nbCardNumber;
@property (nonatomic,strong) NSString * nbRssi;

@property (nonatomic, strong) NSString *lockData;

@end


