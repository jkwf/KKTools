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

@end
