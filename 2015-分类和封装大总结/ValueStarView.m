//
//  ValueStarView.m
//  ValueStarView
//
//  Created by  jason on 15/11/16.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "ValueStarView.h"

#define ValueStarMargrin 10
#define ValueStarTop 5
#define ValueStarWH 20
#define ValueStarConstantNum 1000
#define FullStar @"full.png"
#define EmptyStar @"empty.png"

@implementation ValueStarView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        for (int i = 0; i<5; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.selected = NO;
            button.tag = ValueStarConstantNum + i;
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [button setImage:[UIImage imageNamed:EmptyStar] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:FullStar] forState:UIControlStateSelected];
            
            [self addSubview:button];
        }
    }
    return self;
}


- (void)layoutSubviews {

    for ( int i = 0; i<self.subviews.count; i++) {
        
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake((ValueStarMargrin+ValueStarWH)*i, ValueStarTop, ValueStarWH, ValueStarWH);
    }
}




- (void)buttonAction:(UIButton*)button {

    
    button.selected = !button.selected;
    
    switch (button.tag - ValueStarConstantNum) {
        case 0:
            for (int i = 0; i<self.subviews.count; i++) {
                
                UIButton *btn = self.subviews[i];
                if (i!=button.tag - ValueStarConstantNum) {
                    
                    btn.selected = NO;
                }
            }
    
            break;
        case 1:
            
            [self changeButtonsStateWithButton:button];
            
            break;
        case 2:
        
           [self changeButtonsStateWithButton:button];
        
            break;
        case 3:
        
             [self changeButtonsStateWithButton:button];       

            break;
        case 4:
            
            if (button.selected) {
                
                for (int i = 0; i<self.subviews.count; i++) {
                    
                    UIButton *btn = self.subviews[i];
                    
                    if (i!=button.tag - ValueStarConstantNum) {
                        
                        btn.selected = YES;
                    }
                }
            }
            

            break;
        
        default:
            break;
    }
    
    
    int  count = 0;
    
    for (UIButton *butt in self.subviews) {
        
        if (butt.selected) {
            count++;
        }
    }

    if (self.delegate&& [self.delegate respondsToSelector:@selector(valueStarSelectedStarCount:)]) {
        
        [self.delegate valueStarSelectedStarCount:count];
    }
    
}


// 改变其他按得状态
- (void)changeButtonsStateWithButton:(UIButton*)button {

    
    if (button.selected) {
        
        for (int i = 0; i<self.subviews.count; i++) {
            
            UIButton *btn = self.subviews[i];
            if (i<button.tag - ValueStarConstantNum) {
                
                btn.selected = YES;
            }
        }
    }
    else {
        
        for (int i = 0; i<self.subviews.count; i++) {
            
            UIButton *btn = self.subviews[i];
            if (i>button.tag - ValueStarConstantNum) {
                
                btn.selected = NO;
            }
        }
    }
}

+(CGSize)valueStarSize {
    
    return CGSizeMake(ValueStarWH*5+ValueStarMargrin*4, ValueStarWH+2*ValueStarTop);
}
@end
