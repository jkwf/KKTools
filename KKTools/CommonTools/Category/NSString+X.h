//
//  NSString+X.h
//  KKTools
//
//  Created by zving on 2017/9/6.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (X)

/**
 全角转半角

 @return <#return value description#>
 */
- (NSString *)replaceSpecialWhitespace;

/**
 半角转全角

 @return <#return value description#>
 */
- (NSString *)replaceNormalWhiteSpace;

/**
 判断邮箱

 @return <#return value description#>
 */
- (BOOL)isEmail;

/**
 判断手机号

 @return <#return value description#>
 */
- (BOOL)isPhone;

/**
 判断邮编

 @return <#return value description#>
 */
- (BOOL)isPostcode;

/**
 判断中文

 @return <#return value description#>
 */
- (BOOL)isChinese;

/**
 判断日期格式

 @return <#return value description#>
 */
- (BOOL)isDate;

/**
 是否包含中文

 @return <#return value description#>
 */
- (BOOL)isHasChinese;

/**
 是否是英文和数字

 @return <#return value description#>
 */
- (BOOL)isEnglishOrNumber;

/**
 获取汉字的拼音
 
 @return <#return value description#>
 */
- (NSString *)transformToPhonetic;

/**
 字符串反转
 
 @return <#return value description#>
 */
- (NSString*)reverseWords;

/**
 首字母大写
 
 @return <#return value description#>
 */
- (NSString *)capitalFirstLetter;

/**
 删除所有空格

 @return <#return value description#>
 */
- (NSString *)deleteAllWhiteSpace;

/**
 删除首尾空格

 @return <#return value description#>
 */
- (NSString *)deleteFirstAndLastWhiteSpace;
@end
