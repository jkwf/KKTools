//
//  UIColor+X.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (X)

/**
 随机颜色

 @return <#return value description#>
 */
+ (UIColor *)randomColor;

/**
 色值

 @param hex <#hex description#>
 @return <#return value description#>
 */
+ (UIColor *)colorWithHex:(NSInteger)hex;


/**
 色值

 @param hex <#hex description#>
 @param alpha <#alpha description#>
 @return <#return value description#>
 */
+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(double)alpha;
@end
