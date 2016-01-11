//
//  NSString+YJMD5.m
//  常用正则表达式NSString
//
//  Created by  jason on 15/11/23.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "NSString+YJMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YJMD5)

+(NSString*)stringToMD5From:(NSString*)sourceString {

    
    const char* cStr = [sourceString UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    
    return [ret lowercaseString];

}
@end
