//
//  NSArray+OnlyMember.m
//  SJLM
//
//  Created by  jason on 15/10/20.
//  Copyright © 2015年 XiaoChen. All rights reserved.
//

#import "NSArray+OnlyMember.h"

@implementation NSArray (OnlyMember)

+ (NSArray *)arrayWithMemberIsOnly:(NSArray *)array {

    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [array count]; i++) {
            if ([categoryArray containsObject:[array objectAtIndex:i]] == NO)
            {
                [categoryArray addObject:[array objectAtIndex:i]];
                
                
            }
        
        
    }
    return categoryArray;
                                        
}
@end
