//
//  RoundView.m
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "RoundView.h"
IB_DESIGNABLE

@implementation RoundView
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
    //    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    //    self.layer.shadowOffset = CGSizeMake(0, 3);
    //    self.layer.shadowOpacity = 0.5;
    self.layer.cornerRadius  = _cornerRadius;
}
@end

@implementation RoundButton
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
@end

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

