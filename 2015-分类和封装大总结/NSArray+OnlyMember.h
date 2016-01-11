//
//  NSArray+OnlyMember.h
//  SJLM
//
//  Created by  jason on 15/10/20.
//  Copyright © 2015年 XiaoChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (OnlyMember)

+ (NSArray *)arrayWithMemberIsOnly:(NSArray *)array;
@end
