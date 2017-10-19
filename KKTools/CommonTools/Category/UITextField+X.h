//
//  UITextField+X.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    EmptyPredicate,         //空文本
    MobilePredicate,        //手机号
    EmailPredicate,         //邮箱
    ChinesePredicate,       //中文
    PostcodePredicate,      //邮编
    IdCardPredicate,        //身份证
    PassWordPredicate,      //6~21位密码
    VerifyCodePredicate,    //验证码
    DatePredicate,          //日期格式 2017-10-19
} PredicateKey;

@interface UITextField (X)

/**
 隐藏光标
 */
- (void)hiddenCursor;

/**
 光标位置

 @param index <#index description#>
 */
- (void)cursorLocationWithIndex:(NSInteger)index;

/**
 修改占位图位置
 */
- (void)changeContentPosition;
@end
