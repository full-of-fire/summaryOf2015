//
//  YJGuideViewController.m
//  Account
//
//  Created by  jason on 15/11/9.
//  Copyright © 2015年 yangjie. All rights reserved.
//

#import "YJGuideViewController.h"

@interface YJGuideViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, strong) UIScrollView *guideScrollView;

@end

@implementation YJGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIApplication *app = [UIApplication sharedApplication];
    // 显示状态栏
    app.statusBarHidden = YES;
    

    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


- (void)initUI {

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    scrollView.bounces = NO;     //设置到达边界反弹
    scrollView.showsVerticalScrollIndicator = NO;  //不显示垂直滚动条
    scrollView.showsHorizontalScrollIndicator = NO; //不显示水平滚动条
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(ScreenWidth*self.imagesArray.count, ScreenHeight);
  
    
    for (int i = 0; i<self.imagesArray.count; i++) {
        
        UIImageView *guideView = [[UIImageView alloc] initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        guideView.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:i]];
        
        guideView.tag = i;
        
        [scrollView addSubview:guideView];
    }
    
    
    UIImageView *lastView = (UIImageView*)[scrollView viewWithTag:self.imagesArray.count-1];
    
    lastView.userInteractionEnabled = YES;
    
    UIButton *syte = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [syte setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState:UIControlStateNormal];
    
    syte.frame = CGRectMake((ScreenWidth-100)/2, ScreenHeight-50,100, 30);
    [syte setTitle:@"立即使用" forState:UIControlStateNormal];
    [syte setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [syte addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    syte.layer.cornerRadius = 5;
    syte.clipsToBounds = YES;
//    syte.backgroundColor = [UIColor lightGrayColor];
    
    
    [lastView addSubview:syte];
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake((ScreenWidth-150)/2, ScreenHeight-70,150 , 20)];
    page.numberOfPages = self.imagesArray.count;
    
    page.pageIndicatorTintColor = [UIColor colorWithRed:242/250.0 green:242/250.0 blue:242/250.0 alpha:1.0];
    page.currentPageIndicatorTintColor = [UIColor grayColor];
//    page.userInteractionEnabled = NO;
    [page addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
   
    
    self.pageControl = page;
    self.guideScrollView = scrollView;
    
    self.guideScrollView.delegate = self;
    [self.view addSubview:self.guideScrollView];
    [self.view addSubview:self.pageControl];
    self.view.userInteractionEnabled = YES;
}


- (void)pageChange:(UIPageControl*)page{

    int currentPage = page.currentPage;
    CGFloat offX = currentPage*ScreenWidth;
    
    self.guideScrollView.contentOffset = CGPointMake(offX, 0);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offX = scrollView.contentOffset.x;
    int currentPage = offX/ScreenWidth;
    
    self.pageControl.currentPage = currentPage;
}


#pragma mark - 改变其状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {

    return YES;
}

- (void)sureAction{

    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:appVersion forKey:@"AppVersion"];
    [userDefaults synchronize];
    UIApplication *app = [UIApplication sharedApplication];
 
    app.statusBarHidden = NO;
    
    app.keyWindow.rootViewController = self.rootViewController;

}

#pragma mark - 是否需要引导页
+(BOOL)isNeedGuide {

    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //判断是否第一次登陆,ture:跳到引导页 flase:跳到首页
    if ([userDefaults objectForKey:@"AppVersion"] == nil || ![[userDefaults objectForKey:@"AppVersion"] isEqualToString:appVersion]) {
        
        return YES;
    }else {
        
        return NO;
        
    }
}
@end
