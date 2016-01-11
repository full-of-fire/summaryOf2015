//
//  YJNetWorkRequest.h
//  Hotel
//
//  Created by  jason on 15/12/3.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block)(NSError *error,id dict);
@interface YJNetWorkRequest : NSObject


+(void)netWorkRequestGetWithName:(NSString *)name parameters:(NSDictionary *)parameter forCompleteBlock:(Block)block;


+(void)netWorkRequestPostWithName:(NSString *)name parameters:(NSDictionary *)parameter forCompleteBlock:(Block)block;


/**
 *  上传文件
 *
 *  @param filename 文件名
 *  @param mimeType mimeType
 *  @param fileData 文件参数
 *  @param params   非文件参数
 *  @param block    回调
 */
+(void)netWorkRequestUpload:(NSString *)filename mimeType:(NSString *)mimeType fileData:(NSData *)fileData params:(NSDictionary *)params forCompleteBlock:(Block)block;


/**
 *  获取MIMEType
 *
 *  @param url 资源路径
 *
 *  @return MIMEType
 */
+(NSString *)MIMEType:(NSURL *)url;

@end
