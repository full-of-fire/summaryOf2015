//
//  YJTabBarToolItem.m
//  YJTabBarTool
//
//  Created by  jason on 15/12/11.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJTabBarToolItem.h"

@implementation YJTabBarToolItem

+(YJTabBarToolItem*)itemWithTitle:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage {

    YJTabBarToolItem *button = [self buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    return button;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];

    NSLog(@"%@",self.subviews);
    
    self.titleLabel.frame = CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame  = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20);
}

@end
