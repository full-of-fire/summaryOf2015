//
//  YJNetWorkRequest.m
//  Hotel
//
//  Created by  jason on 15/12/3.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJNetWorkRequest.h"
#import "AFNetworking.h"
#import "YJMBProgressTool.h"
#import "MBProgressHUD.h"


#define YJFileBoundary @"test"  //文件分割符
#define YJNewLine @"\r\n" // 换行符
#define YJEncode(str) [str dataUsingEncoding:NSUTF8StringEncoding] //将字符串转为Data

/**
 *  外网url
 */
//static NSString *mainUrl=@"http://112.74.198.109:8080/fangke/";
/**
 *  内网url
 */

//static NSString *mainUrl=@"http://192.168.1.230:8080/fangke/";



/**
 *  岫盺url
 */
static NSString *mainUrl=@"http://192.168.1.119:8080/fangke/";


@implementation YJNetWorkRequest


+ (void)reach
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable ) {
            
            [YJMBProgressTool showMessage:@"网络连接不可用"];
            return;
        }
        //        NSLog(@"%d",netWorkState);
    }];
}

+(void)netWorkRequestGetWithName:(NSString *)name parameters:(NSDictionary *)parameter forCompleteBlock:(Block)block {

    
    // 先检测网络连接，如果不可用直接return
    [self reach];

    
    MBProgressHUD *mb = [[MBProgressHUD alloc] init];
    mb.mode = MBProgressHUDModeIndeterminate;
    
  UIWindow *window =  [[UIApplication  sharedApplication].windows lastObject];
    
    [window addSubview:mb];
    [mb show:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
        manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *url = [NSString stringWithFormat:@"%@%@",mainUrl,name];
    
    
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
 
        [mb hide:YES];
    
        
        NSDictionary *dict = responseObject;
        block(nil,dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
        
        
        DLog(@"%@",error);
        [YJMBProgressTool showMessage:@"网络错误,请检查你的服务器"];
        
        [mb hide:YES];
    }];
    
    
}
+(void)netWorkRequestPostWithName:(NSString *)name parameters:(NSDictionary *)parameter forCompleteBlock:(Block)block {

    // 先检测网络连接，如果不可用直接return
    [self reach];
    
    
    MBProgressHUD *mb = [[MBProgressHUD alloc] init];
    mb.mode = MBProgressHUDModeIndeterminate;
    
    UIWindow *window =  [[UIApplication  sharedApplication].windows lastObject];
    
    [window addSubview:mb];
    [mb show:YES];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *url = [NSString stringWithFormat:@"%@%@",mainUrl,name];
    
 
    
    DLog(@"%@",url);
    
    [manager POST:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [mb hide:YES];
        NSDictionary *dict = responseObject;
        block(nil,dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,nil);
        
        [mb hide:YES];
         DLog(@"%@",error);
        [YJMBProgressTool showMessage:@"网络错误,请检查你的服务器"];
    
    }];
    
    
}



+(NSString *)MIMEType:(NSURL *)url
{
    // 1.创建一个请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 2.发送请求（返回响应）
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    // 3.获得MIMEType
    return response.MIMEType;
}

+(void)netWorkRequestUpload:(NSString *)filename mimeType:(NSString *)mimeType fileData:(NSData *)fileData params:(NSDictionary *)params forCompleteBlock:(Block)block

{
    // 1.请求路径
    NSURL *url = [NSURL URLWithString:@"http://192.168.15.172:8080/MJServer/upload"];
    
    // 2.创建一个POST请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    // 3.设置请求体
    NSMutableData *body = [NSMutableData data];
    
    // 3.1.文件参数
    [body appendData:YJEncode(@"--")];
    [body appendData:YJEncode(YJFileBoundary)];
    [body appendData:YJEncode(YJNewLine)];
    
    NSString *disposition = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"", filename];
    [body appendData:YJEncode(disposition)];
    [body appendData:YJEncode(YJNewLine)];
    
    NSString *type = [NSString stringWithFormat:@"Content-Type: %@", mimeType];
    [body appendData:YJEncode(type)];
    [body appendData:YJEncode(YJNewLine)];
    
    [body appendData:YJEncode(YJNewLine)];
    [body appendData:fileData];
    [body appendData:YJEncode(YJNewLine)];
    
    // 3.2.非文件参数
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [body appendData:YJEncode(@"--")];
        [body appendData:YJEncode(YJFileBoundary)];
        [body appendData:YJEncode(YJNewLine)];
        
        NSString *disposition = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"", key];
        [body appendData:YJEncode(disposition)];
        [body appendData:YJEncode(YJNewLine)];
        
        [body appendData:YJEncode(YJNewLine)];
        [body appendData:YJEncode([obj description])];
        [body appendData:YJEncode(YJNewLine)];
    }];
    
    // 3.3.结束标记
    [body appendData:YJEncode(@"--")];
    [body appendData:YJEncode(YJFileBoundary)];
    [body appendData:YJEncode(@"--")];
    [body appendData:YJEncode(YJNewLine)];
    
    request.HTTPBody = body;
    
    // 4.设置请求头(告诉服务器这次传给你的是文件数据，告诉服务器现在发送的是一个文件上传请求)
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", YJNewLine];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // 5.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", dict);
        
        block(nil,dict);
        
    }];
    
    
}

@end
