//
//  YJCacheFileManager.m
//  小技巧
//
//  Created by  jason on 15/12/28.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJCacheFileManager.h"

@implementation YJCacheFileManager

// 获取缓存路径
+ (NSString *)CachesDirectoryPath {

  return  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}


// 计算该路径的文件大小
+(unsigned long long)folderSizeAtPath:(NSString *)path {

    unsigned long long folderSize = 0;
    NSFileManager *fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO; // 是否为文件夹
    BOOL exist =  [fileManger fileExistsAtPath:path isDirectory:&isDir];
    
    // 如果文件不存在直接返回
    if (!exist) {
    
        NSLog(@"改文件不存在");
        return folderSize;
    };
    if (isDir) {
        
        NSLog(@"是文件夹");
        // 如果是文件夹(则遍历器所有的子文件)
        NSDirectoryEnumerator *enumerater = [fileManger enumeratorAtPath:path];
        
        for (NSString *subPath in enumerater) {
            // 拼接全路径
            NSString *fullPath = [path stringByAppendingPathComponent:subPath];
            folderSize += [fileManger attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        
        
    }
    else {
        // 只是文件的话
        NSLog(@"不是是文件夹");
        folderSize+=[fileManger attributesOfItemAtPath:path error:nil].fileSize;
    }
    
    return folderSize;
}

// 清除改路径下的缓存
+(void)clearCache:(NSString *)path {

    // 比较耗内存在其他线程中
    NSFileManager *fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO; // 是否为文件夹
    BOOL exist =  [fileManger fileExistsAtPath:path isDirectory:&isDir];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        if (!exist) {
            
            NSLog(@"该文件不存在");
            return ;
        }
        if (isDir) {
            
            // 如果是文件夹(则遍历器所有的子文件)
            NSDirectoryEnumerator *enumerater = [fileManger enumeratorAtPath:path];
            
            for (NSString *subPath in enumerater) {
                // 拼接全路径
                NSString *fullPath = [path stringByAppendingPathComponent:subPath];
                [fileManger removeItemAtPath:fullPath error:nil];
            }
        }
        else {
        
            [fileManger removeItemAtPath:path error:nil];
        }
        
        // 清除成功后回到主线程提示清除成功
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSLog(@"清除成功");
        });
        
        
        
    });
}

@end
