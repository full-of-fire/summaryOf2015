//
//  UIView+YJQuickUIView.m
//  YJQuickUIView
//
//  Created by  jason on 15/11/4.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "UIView+YJQuickUIView.h"

@implementation UIView (YJQuickUIView)

+(UIButton*)viewOfSystemButtonWithTitle:(NSString*)tiltle  titleColor:(UIColor*)titleColor andFontSize:(CGFloat)fontSize{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:tiltle forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font =[UIFont systemFontOfSize:fontSize];
    

    return button;
}


+(UIButton*)viewOfCustomButtonWithTitle:(NSString*)title normalImage:(NSString*)normalImage highlightedImage:(NSString*)highlightedImage {

    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    
    return button;
    
}

+(UILabel*)viewOfLabelWithText:(NSString*)text textColor:(UIColor*)textColor Alignment:(NSTextAlignment)alignment textFont:(UIFont*)font {

    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = alignment;
    label.textColor = textColor;
    label.text = text;
    label.font = font;
    
    return label;
    
}

+(UITextField*)viewOfTextFieldWithBorderStyle:(UITextBorderStyle)borderStyle
                                     isClears:(BOOL)isClears clearButtonMode:(UITextFieldViewMode)clearButtonMode isSecure:(BOOL)isSecure{

    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = borderStyle;
    textField.clearsOnBeginEditing = isClears;
    textField.clearButtonMode = clearButtonMode;
    textField.secureTextEntry = isSecure;
    textField.keyboardType = UIKeyboardTypeDefault;
    
    

    
    return textField;
}



@end
