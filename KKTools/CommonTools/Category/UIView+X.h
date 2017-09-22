//
//  UIView+X.h
//  KKTools
//
//  Created by zving on 2017/7/4.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BorderDirectionType) {
    BorderDirectionTop = 0,
    BorderDirectionLeft,
    BorderDirectionBottom,
    BorderDirectionRight
};
typedef NS_ENUM(NSInteger, ShakeDirection) {
    DirectionHorizontal,
    DirectionVertical
};

@interface UIView (X)
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign,readonly) CGFloat right;
@property (nonatomic, assign,readonly) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

/**
 添加虚线边框
 */
- (void)drawSurroundingsDottedLine;

/**
 抖动动画开始
 */
- (void)startAnimate;

/**
 抖动动画结束
 */
- (void)stopAnimate;

/**
 添加某个方向的边框

 @param direction <#direction description#>
 @param color <#color description#>
 @param width <#width description#>
 */
- (void)addBorder:(BorderDirectionType)direction color:(UIColor *)color width:(CGFloat)width;

- (void)shakeWithShakeDirection:(ShakeDirection)shakeDirection;
- (void)shakeWithTimes:(NSInteger)times shakeDirection:(ShakeDirection)shakeDirection;
- (void)shakeWithTimes:(NSInteger)times speed:(CGFloat)speed shakeDirection:(ShakeDirection)shakeDirection;
- (void)shakeWithTimes:(NSInteger)times speed:(CGFloat)speed range:(CGFloat)range shakeDirection:(ShakeDirection)shakeDirection;

@end
