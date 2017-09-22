//
//  NSArray+Value.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSArray (Value)

/**
 最大值

 @return <#return value description#>
 */
- (CGFloat)maxValue;

/**
 最小值

 @return <#return value description#>
 */
- (CGFloat)minValue;

/**
 求和

 @return <#return value description#>
 */
- (CGFloat)sumValue;

/**
 平均数

 @return <#return value description#>
 */
- (CGFloat)averageValue;

/**
 删除重复数据

 @return <#return value description#>
 */
- (NSArray *)deleteRecurElement;
@end
