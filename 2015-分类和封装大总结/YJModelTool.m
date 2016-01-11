//
//  YJModelTool.m
//  常用正则表达式NSString
//
//  Created by  jason on 15/11/23.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJModelTool.h"

@implementation YJModelTool


+(void)modelToolWithDictionary:(NSDictionary*)dictionary {

    [self modelToolWithDictionary:dictionary modelName:nil];
}

+(void)modelToolWithDictionary:(NSDictionary *)dictionary modelName:(NSString *)modelName
{
    if (modelName) {
       
        printf("\n@interface %s :NSObject\n",modelName.UTF8String);
    }
    
    for (NSString *key in dictionary) {
        printf("@property (nonatomic,copy) NSString *%s;\n",key.UTF8String);
    }

    if (modelName) {
        
            printf("@end\n");
    }
}

@end
