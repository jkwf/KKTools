//
//  UIColor+X.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UIColor+X.h"

@implementation UIColor (X)

+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
+ (UIColor *)colorWithHex:(NSInteger)hex {
    return [UIColor colorWithHex:hex alpha:1];
}

+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(double)alpha{
    NSInteger r = hex / 0x10000;
    NSInteger g = (hex - r * 0x10000) / 0x100;
    NSInteger b = (hex - r * 0x10000 - g * 0x100);
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}
@end
