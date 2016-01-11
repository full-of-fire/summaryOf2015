//
//  UIBarButtonItem+Extension.h
//  房客
//
//  Created by  jason on 15/12/7.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  @return 返回一个自定义的带图片的itme
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

// 返回一个系统按钮创建的item
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString*)title;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
