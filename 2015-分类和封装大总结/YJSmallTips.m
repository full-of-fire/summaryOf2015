//
//  YJSmallTips.m
//  小技巧
//
//  Created by  jason on 15/12/28.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJSmallTips.h"

@implementation YJSmallTips

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(void)goToAppStore
{
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",547203890];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (NSString*)currentLanguage {

    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defs objectForKey:@"AppleLanguages"];
    NSString *preferredLang = [languages objectAtIndex:0];
    
    return preferredLang;
}

+ (void)test {

    
    /*通过这个函数，我们可以计算一个图片放在另一个 view 按照一定的比例居中显示，可能说的我比较抽象，还是用图来显示，可以说它可以直接一个 image 以任何的比例显示显示在 imageview 中居中所处的位置，拿 UIViewContontAspectFit来演示*/
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
//    imageView.center = self.view.center;
    imageView.backgroundColor = [UIColor redColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = [UIImage imageNamed:@"mm.jpg"];
    imageView.image = image;
    
    CGRect iamgeAspectRect = AVMakeRectWithAspectRatioInsideRect(image.size, imageView.bounds);
    NSLog(@"iamgeAspectRect = %@, imageView =%@",NSStringFromCGRect(iamgeAspectRect),NSStringFromCGRect(imageView.frame));
//    [self.view addSubview:imageView];
}

@end
