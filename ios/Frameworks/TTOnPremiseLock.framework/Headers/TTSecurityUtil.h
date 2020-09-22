//
//  SecurityUtil.h
//  Smile
//
//  Created by TTLock on 12-11-24.
//  Copyright (c) 2012年 TTLock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTSecurityUtil : NSObject 

#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;
+ (NSData*)decodeBase64WithString:(NSString * )input;

#pragma mark - AES encryption
+(NSData*)encryptAESStr:(NSString*)string keyBytes:(Byte*)key;
+(NSData*)encryptAESData:(NSData*)data keyBytes:(Byte*)key;
+(NSData*)decryptToDataAESData:(NSData*)data keyBytes:(Byte*)key;

+(NSData *)encodeCRC8Password:(NSString *)password;
+(NSString *)decodeCRC8Password:(NSData *)data;

//string -> data
+ (NSData*)encryptAESStr:(NSString*)string key:(NSString *)key;
+(NSData*)encryptAESData:(NSData*)data key:(NSString*)key;
//data -> string
+ (NSString*)decryptAESData:(NSData*)data key:(NSString *)key;
+(NSData*)decryptToDataAESData:(NSData*)data key:(NSString*)key;

/**
 *  admin code
 */
+ (NSString*)encodeAdminPSString:(NSString*)adminPs;
+ (NSString*)decodeAdminPSString:(NSString*)string;
/**
 *  LockKey
 */
+ (NSString*)encodeLockKeyString:(NSString*)string;
+(NSString*)decodeLockKeyString:(NSString*)string;
/**
 *  aeskey
 */
+(NSString*)encodeAeskey:(NSData*)aeskey;
+(NSData*)decodeAeskey:(NSString*)aeskey;

@end
