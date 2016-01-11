//
//  YJModelTool.h
//  常用正则表达式NSString
//
//  Created by  jason on 15/11/23.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJModelTool : NSObject

/**
 *  打印字典转模型的属性
 *
 *  @param dictionary 字典
 */
+(void)modelToolWithDictionary:(NSDictionary*)dictionary;
/**
 *  打印字典转模型的属性和模型名字
 *
 *  @param dictionary 字典
 *  @param modelName  模型名
 */
+(void)modelToolWithDictionary:(NSDictionary *)dictionary modelName:(NSString *)modelName;

@end
