//
//  YJScrollTitle.m
//  滚动标题
//
//  Created by  jason on 15/11/25.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJScrollTitle.h"
#import "UIView+Extension.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define TITLEBUTTONW (ScreenW/4)
#define TITLEBUTTONH 42
#define INDEXVIEWH 2

@interface YJScrollTitle()<UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *backScrollView;

@property(nonatomic, strong) UIView *indexView;
@end

@implementation YJScrollTitle

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.backScrollView = [[UIScrollView alloc] init];
        self.backScrollView.delegate = self;
        self.backScrollView.showsHorizontalScrollIndicator = NO;
        self.backScrollView.showsVerticalScrollIndicator = NO;
        self.backScrollView.bounces = NO;
        
        
        self.indexView = [[UIView alloc] init];
        self.indexView.backgroundColor = [UIColor redColor];
        [self.backScrollView addSubview:self.indexView];
        
        [self addSubview:self.backScrollView];
    }
    
    return self;
}


- (void)setTitlesArray:(NSArray *)titlesArray {

    _titlesArray = titlesArray;
    self.backScrollView.contentSize = CGSizeMake(TITLEBUTTONW*titlesArray.count, TITLEBUTTONH-INDEXVIEWH);
    if (titlesArray.count) {
        
        for (int i = 0; i<titlesArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.tag = i;
            [button setTitle:titlesArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.backScrollView addSubview:button];
        }
    }
}

#pragma mark - 布局
- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.backScrollView.frame = CGRectMake(0, 0, self.width, self.height);
    self.indexView.frame = CGRectMake(0, TITLEBUTTONH-INDEXVIEWH, TITLEBUTTONW, INDEXVIEWH);
    
    
    for (int i = 1; i<self.backScrollView.subviews.count; i++) {
        
       UIView *view = self.backScrollView.subviews[i];
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *button = (UIButton*)view;
            button.x = TITLEBUTTONW*(i-1);
            button.y = 0;
            button.width = TITLEBUTTONW;
            button.height = TITLEBUTTONH;
        }
        
        
    }
    
    
}

#pragma mark - 事件处理

- (void)buttonClick:(UIButton*)button {

    
       
        [UIView animateWithDuration:0.25 animations:^{
            
            self.indexView.x = button.x;
        }];
   
    if (self.titlesArray.count<=4) {
        
        return;
    }
    if (button.tag>=2) {
        
        if (button.tag==2) {
           
            [self.backScrollView setContentOffset:CGPointMake(button.width*(button.tag-2+1), 0) animated:YES];
        }
        else {
        
            [self.backScrollView setContentOffset:CGPointMake(button.width*(button.tag-2), 0) animated:YES];
        }
        
    }
    
    
    NSLog(@"%lf", self.backScrollView.contentOffset.x);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"%lf",scrollView.contentOffset.x);
}

@end
