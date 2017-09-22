//
//  UIImage+X.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (X)

/**
 截图某个view

 @param view <#view description#>
 @return <#return value description#>
 */
+ (UIImage *)takeScreenShotWithView:(UIView *)view;

/**
 颜色转图片

 @param color <#color description#>
 @return <#return value description#>
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 转化为灰度图

 @param sourceImage <#sourceImage description#>
 @return <#return value description#>
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

/**
 在图上绘制文字

 @param title 文字
 @param fontSize 文字字体大小
 @param sourceImg 原图
 @return <#return value description#>
 */
+ (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize image:(UIImage *)sourceImg;

/**
 圆形图

 @param sourceImg 原图
 @return <#return value description#>
 */
+ (UIImage *)circleImageFromImage:(UIImage *)sourceImg;
@end
