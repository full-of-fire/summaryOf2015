//
//  StarView.h
//  评分星级
//
//  Created by yangjie on 15/11/15.
//  Copyright © 2015年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView

@property (nonatomic,copy) NSString * starRank; // 评分星级
+(CGSize)starViewSizeWithStarRank:(CGFloat)starRank;
@end
