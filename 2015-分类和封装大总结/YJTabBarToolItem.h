//
//  YJTabBarToolItem.h
//  YJTabBarTool
//
//  Created by  jason on 15/12/11.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJTabBarToolItem : UIButton

+(YJTabBarToolItem*)itemWithTitle:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage;
@end
