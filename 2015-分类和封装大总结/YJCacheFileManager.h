//
//  YJCacheFileManager.h
//  小技巧
//
//  Created by  jason on 15/12/28.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJCacheFileManager : NSObject

/**
 *  获取缓存路径
 *
 *  @return 缓存路径
 */
+ (NSString *)CachesDirectoryPath;
/**
 *  获取缓存路径大小
 *
 *  @param path 路径
 *
 *  @return 缓存的大小
 */
+ (unsigned long long)folderSizeAtPath:(NSString *)path;

/**
 *  清除缓存
 *
 *  @param path 需要清除缓存的路径
 */
+ (void)clearCache:(NSString *)path;
@end
