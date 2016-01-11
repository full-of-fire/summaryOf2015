//
//  YJGuideViewController.h
//  Account
//
//  Created by  jason on 15/11/9.
//  Copyright © 2015年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJGuideViewController : UIViewController

/**
 *  图片数组
 */
@property(nonatomic, strong) NSArray *imagesArray;

/**
 *  根视图
 */
@property(nonatomic, strong) UIViewController *rootViewController;
// 是否需要引导页面
+(BOOL)isNeedGuide;
@end
