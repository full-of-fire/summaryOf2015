//
//  YJTabBarTool.m
//  YJTabBarTool
//
//  Created by  jason on 15/12/11.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJTabBarTool.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface YJTabBarTool ()

@property(nonatomic, strong) UIImageView *backgroudImageView;



@end
@implementation YJTabBarTool

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        
        
        self.userInteractionEnabled = YES;
        self.backgroudImageView = [[UIImageView alloc] init];
        
        self.backgroudImageView.frame = CGRectMake(0, 0, ScreenW, 44);
        self.backgroudImageView.backgroundColor = [[UIColor alloc] initWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
        self.backgroudImageView.userInteractionEnabled = YES;
        
        [self addSubview:self.backgroudImageView];
    }
    
    return self;
}

- (void)setItems:(NSArray *)items {

    _items = items;
    
    if (items.count<=0) {
        
        return;
    }
    
    
    CGFloat itemW = self.backgroudImageView.frame.size.width / items.count;
    
    CGFloat itemH = self.backgroudImageView.frame.size.height;
    
    
    for (NSInteger i = 0; i<items.count; i++) {
        
        if ([items[i] isKindOfClass:[YJTabBarToolItem class]]) {
            
            YJTabBarToolItem *item = items[i];
            
            item.frame = CGRectMake(itemW*i, 0, itemW, itemH);
            
            [item addTarget:self action:@selector(tabBarToolItemAction:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = i;
            
             [self.backgroudImageView addSubview:item];
        }
    }
    self.selectedIndex = 0;
    [self setNeedsLayout];
}


- (void)setSelectedIndex:(NSInteger)selectedIndex {

    _selectedIndex = selectedIndex;
    
    for (YJTabBarToolItem *item in self.backgroudImageView.subviews) {
        
        if (item.tag == selectedIndex) {
            
            item.selected = YES;
        }
        else {
        
            item.selected = NO;
        }
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    
}



- (void)tabBarToolItemAction:(YJTabBarToolItem*)item {

    for (YJTabBarToolItem *subItem in self.backgroudImageView.subviews) {
        
        if (subItem.tag ==item.tag) {
            
            subItem.selected = YES;
        }
        else {
        
            subItem.selected = NO;
        }
    }
    
    
    if (self.delegate &&[self.delegate respondsToSelector:@selector(tabBarTool:didSelectedItem:andIndex:)]) {
        
        [self.delegate tabBarTool:self didSelectedItem:item andIndex:item.tag];
    }
    
}


@end
