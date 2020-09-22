
//
//  TTBlocks.h
//  TTLockSourceCodeDemo
//
//  Created by Jinbo Lu on 2019/4/11.
//  Copyright © 2019 Sciener. All rights reserved.
//



#ifndef TTBlocks_h
#define TTBlocks_h

#import "TTMacros.h"


@class TTScanModel;
@class TTSystemInfoModel;

typedef void(^TTScanBlock)(TTScanModel *scanModel);
typedef void(^TTBluetoothStateBlock)(TTBluetoothState state);

typedef void(^TTFailedBlock)(TTError errorCode, NSString *errorMsg);
typedef void(^TTSucceedBlock)(void);
typedef void(^TTInitLockSucceedBlock)(NSString *lockData);
typedef void(^TTControlLockSucceedBlock)(long long lockTime, NSInteger electricQuantity, long long uniqueId);
typedef void(^TTResetEkeySucceedBlock)(NSString *lockData);
typedef void(^TTGetAdminPasscodeSucceedBlock)(NSString *adminPasscode);
typedef void(^TTModifyAdminPasscodeSucceedBlock)(NSString *lockData);
typedef void(^TTResetPasscodesSucceedBlock)(NSString *lockData);
typedef void(^TTGetPasscodeVerificationParamsSucceedBlock)(NSString *lockData);

typedef void(^TTGetElectricQuantitySucceedBlock)(NSInteger electricQuantity);
typedef void(^TTGetLockOperateRecordSucceedBlock)(NSString *operateRecord);

typedef void(^TTGetFeatureValueSucceedBlock)(NSString *lockData);
typedef void(^TTGetLockTimeSucceedBlock)(long long lockTimestamp);
typedef void(^TTGetLockVersionSucceedBlock)(NSDictionary *lockVersion);
typedef void(^TTGetLockSystemSucceedBlock)(TTSystemInfoModel *systemModel);
typedef void(^TTGetLockAllPasscodeSucceedBlock)(NSString *passcodes);
typedef void(^TTGetLockPasscodeDataSucceedBlock)(NSString *passcodeData);
typedef void(^TTGetAutomaticLockingPeriodicTimeSucceedBlock)(int currentTime, int minTime, int maxTime);

typedef void(^TTAddICProgressBlock)(TTAddICState state);
typedef void(^TTAddICSucceedBlock)(NSString *cardNumber);
typedef void(^TTGetAllICCardsSucceedBlock)(NSString *allICCardsJsonString);

typedef void(^TTAddFingerprintProgressBlock)(int currentCount, int totalCount);
typedef void(^TTAddFingerprintSucceedBlock)(NSString *fingerprintNumber);
typedef void(^TTGetAllFingerprintsSucceedBlock)(NSString *allFingerprintsJsonString);

typedef void(^TTGetSwitchStateSuccessBlock)(BOOL isOn);
typedef void(^TTGetLockStatusSuccessBlock)(TTLockSwitchState state);

typedef void(^TTGetPassageModelSuccessBlock)(NSString *passageModes);

typedef void(^TTSetRemoteUnlockSwitchSuccessBlock) (NSString *lockData);
typedef void(^TTGetLightTimeSuccessBlock) (int time);
typedef void(^TTSetLockConfigSuccessBlock) (TTLockConfigType type);
typedef void(^TTGetLockConfigSuccessBlock) (TTLockConfigType type,BOOL isOn);

typedef void(^TTActivateElevatorSuccessdBlock)(long long lockTime, NSInteger electricQuantity, long long uniqueId);

typedef void(^TTGetHotelDataSuccessdBlock)(NSDictionary *hotelData);


typedef void(^TTGetSpecialValueSucceedBlock)(long long specialValue) __attribute__((deprecated("SDK3.1.0,Use TTGetFeatureValueSucceedBlock")));

#endif /* TTBlocks_h */
