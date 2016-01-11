//
//  UIView+YJQuickUIView.h
//  YJQuickUIView
//
//  Created by  jason on 15/11/4.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJQuickUIView)

+(UIButton*)viewOfSystemButtonWithTitle:(NSString*)tiltle  titleColor:(UIColor*)titleColor andFontSize:(CGFloat)fontSize;


+(UIButton*)viewOfCustomButtonWithTitle:(NSString*)title normalImage:(NSString*)normalImage highlightedImage:(NSString*)highlightedImage;


+(UILabel*)viewOfLabelWithText:(NSString*)text textColor:(UIColor*)textColor Alignment:(NSTextAlignment)alignment textFont:(UIFont*)font;

+(UITextField*)viewOfTextFieldWithBorderStyle:(UITextBorderStyle)borderStyle
                                     isClears:(BOOL)isClears clearButtonMode:(UITextFieldViewMode)clearButtonMode isSecure:(BOOL)isSecure;

@end
