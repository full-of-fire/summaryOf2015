//
//  YJScrollTitle.h
//  滚动标题
//
//  Created by  jason on 15/11/25.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJScrollTitleDelegate ;

@interface YJScrollTitle : UIView

/**
 *  标题数组
 */
@property(nonatomic, strong) NSArray *titlesArray;

@property(nonatomic, assign) id<YJScrollTitleDelegate> delegate;

@end

@protocol YJScrollTitleDelegate <NSObject>


@end