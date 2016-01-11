//
//  StarView.m
//  评分星级
//
//  Created by yangjie on 15/11/15.
//  Copyright © 2015年 yangjie. All rights reserved.
//

#import "StarView.h"
#define SmallStarMargrin 5
#define SmallStarTop 5
#define SmallStarWH 15

#define FullStar @"星星.png"
#define EmptyStar @"灰色星星.png"
#define HalfStar @"半颗星星.png"

@implementation StarView


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        for (int i = 0; i<5; i++) {
            
            UIImageView *Star = [[UIImageView alloc] init];
            
            [self addSubview:Star];
        }
    }
    
    return  self;
}

- (void)setStarRank:(NSString*)starRank {

    _starRank = starRank;
    
    float stars = [starRank floatValue];
    
    if (stars == [starRank intValue]) {
        
        for (int i = 0; i<self.subviews.count; i++) {
            
            UIImageView *star = self.subviews[i];
            
            if (i<stars) {
                
                star.image = [UIImage imageNamed:FullStar] ;
            }
            else {
            
                star.image = [UIImage imageNamed:EmptyStar];
            }
            
            
        }
}
    else {
    
    
        for (int i = 0; i<self.subviews.count; i++) {
            
           UIImageView *star = self.subviews[i];
            
            if (i<[starRank intValue]) {
                
                star.image = [UIImage imageNamed:FullStar];
            }
            else if (i == [starRank intValue]){
            
                star.image = [UIImage imageNamed:HalfStar];
            }
            else {
            
                star.image = [UIImage imageNamed:EmptyStar];
            }
            
            
        }
    }
    
    

    
    
}


- (void)layoutSubviews {

    
    for (int i = 0; i<self.subviews.count; i++) {
        
        UIImageView *image = self.subviews[i];
        
        image.frame = CGRectMake((SmallStarMargrin+SmallStarWH)*i, SmallStarTop, SmallStarWH, SmallStarWH);
    }
    
    
   

    
}


+(CGSize)starViewSizeWithStarRank:(CGFloat)starRank {

    return  CGSizeMake(SmallStarWH*starRank+SmallStarMargrin*(starRank-1), SmallStarWH+2*SmallStarTop);
}


@end
