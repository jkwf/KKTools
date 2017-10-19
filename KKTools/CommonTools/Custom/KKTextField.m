//
//  KKTextField.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "KKTextField.h"
#define RADIANS(degrees) (((degrees) * M_PI) / 180.0)
@implementation KKTextField

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
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

/* 修改边距
- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect paddedRect = UIEdgeInsetsInsetRect(bounds, self.insets);
    if (self.rightViewMode == UITextFieldViewModeAlways || self.rightViewMode == UITextFieldViewModeUnlessEditing) {
        return [self adjustRectWithWidthRightView:paddedRect];
    }
    return paddedRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect paddedRect = UIEdgeInsetsInsetRect(bounds, self.insets);
    
    if (self.rightViewMode == UITextFieldViewModeAlways || self.rightViewMode == UITextFieldViewModeUnlessEditing) {
        return [self adjustRectWithWidthRightView:paddedRect];
    }
    return paddedRect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect paddedRect = UIEdgeInsetsInsetRect(bounds, self.insets);
    if (self.rightViewMode == UITextFieldViewModeAlways || self.rightViewMode == UITextFieldViewModeWhileEditing) {
        return [self adjustRectWithWidthRightView:paddedRect];
    }
    return paddedRect;
}

- (CGRect)adjustRectWithWidthRightView:(CGRect)bounds {
    CGRect paddedRect = bounds;
    paddedRect.size.width -= CGRectGetWidth(self.rightView.frame);
    
    return paddedRect;
}
 */
@end
