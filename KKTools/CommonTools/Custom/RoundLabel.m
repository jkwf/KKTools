//
//  RoundLabel.m
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "RoundLabel.h"
IB_DESIGNABLE

@implementation RoundLabel


- (void)setBoderColor:(UIColor *)boderColor {
    _boderColor = boderColor;
    self.layer.borderColor = _boderColor.CGColor;
}
- (void)setBoderWidth:(CGFloat)boderWidth {
    _boderWidth = boderWidth;
    self.layer.borderWidth = _boderWidth;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius  = _cornerRadius;
}
- (void)setCornerBackgroundColor:(UIColor *)cornerBackgroundColor{
    _cornerBackgroundColor = cornerBackgroundColor;
    self.layer.backgroundColor = _cornerBackgroundColor.CGColor;
}

@end
