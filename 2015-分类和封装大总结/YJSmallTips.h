//
//  YJSmallTips.h
//  小技巧
//
//  Created by  jason on 15/12/28.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define StartTime NSDate *startTime = [NSDate date]; //开始时间
#define EndTime NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]); //结束时间


@interface YJSmallTips : NSObject

/**
 *  颜色转为图片
 *
 *  @param color 颜色
 *
 *  @return UIImage
 */
+(UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  跳转到appStore评分
 */
+(void)goToAppStore;

/**
 *  获取系统当前语言环境
 *
 *  @return 当前语言
 */
+(NSString*)currentLanguage;
@end
