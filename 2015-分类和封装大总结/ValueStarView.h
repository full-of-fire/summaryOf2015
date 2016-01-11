//
//  ValueStarView.h
//  ValueStarView
//
//  Created by  jason on 15/11/16.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ValueStarDelegate <NSObject>

/**
 *  获取被选中星级的个数
 *
 *  @param count 星级个数
 */
- (void)valueStarSelectedStarCount:(int)count;

@end

@interface ValueStarView : UIView

/**
 *  获取评价星级的尺寸
 *
 *  @return CGSize
 */
+(CGSize)valueStarSize;

@property(nonatomic, assign) id<ValueStarDelegate> delegate;

@end
