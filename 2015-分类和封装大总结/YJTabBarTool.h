//
//  YJTabBarTool.h
//  YJTabBarTool
//
//  Created by  jason on 15/12/11.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTabBarToolItem.h"
@class YJTabBarTool;

@protocol YJTabBarToolDelegate <NSObject>

- (void)tabBarTool:(YJTabBarTool*)tabBarTool didSelectedItem:(YJTabBarToolItem*)itme andIndex:(NSInteger)index;

@end
@interface YJTabBarTool : UIView

@property(nonatomic, strong) NSArray *items;

/**
 *  设置被选中中item，默认为零。
 */
@property(nonatomic, assign) NSInteger selectedIndex;


@property(nonatomic, weak) id<YJTabBarToolDelegate> delegate;

@end
