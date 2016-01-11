//
//  NSString+YJRegex.h
//  常用正则表达式NSString
//
//  Created by  jason on 15/11/23.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJRegex)

/**
 *  自定义正则表达式进行判断
 *
 *  @param regex 正则表达式
 *
 *  @return    BOOL
 */
- (BOOL)regexWith:(NSString*)regex;

/**
 *  是否为邮箱
 *
 *  @return bool
 */
- (BOOL)isEmail;

/**
 *  网址是否合法
 *
 *  @return BOOL
 */
- (BOOL)isURL;

/**
 *  用户名是否合法（3-20位的数字和字母组合）
 *
 *  @return BOOL
 */
- (BOOL)isUserName;
/**
 *  密码是否合法（6-20为数字和字母的组合）
 *
 *  @return BOOL
 */
- (BOOL)isPassword;

/**
 *  是否为中文
 *
 *  @return BOOL
 */
- (BOOL)isChinese;

/**
 *  是否为IP
 *
 *  @return BOOL
 */
- (BOOL)isIP;

/**
 *  是否为 QQ
 *
 *  @return BOOL
 */
- (BOOL)isQQ;

/**
 *  是否为身份证
 *
 *  @return BOOL
 */
- (BOOL)isCardID;

/**
 *  是否为手机号码
 *
 *  @return BOOL
 */
- (BOOL)isMobilePhone;
@end
