//
//  UIView+X.m
//  KKTools
//
//  Created by zving on 2017/7/4.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UIView+X.h"
#define RADIANS(degrees) (((degrees) * M_PI) / 180.0)
@implementation UIView (X)

- (CGFloat)left{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (CGFloat)top{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)right{
    return [self left] + [self width];
}
- (CGFloat)bottom{
    return self.top + self.height;
}
- (void)drawSurroundingsDottedLine{
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor colorWithRed:67/255.0f green:37/255.0f blue:83/255.0f alpha:1].CGColor;
    border.fillColor = nil;
    border.lineDashPattern = @[@4, @2];
    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.frame = self.bounds;
    [self.layer addSublayer:border];
}

- (void)startAnimate {
    self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5));
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse) animations:^ {
        self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5));
    } completion:nil];
}

- (void)stopAnimate {
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear) animations:^ {
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

#pragma mark---- 增加某个方向上的边框
- (void)addBorder:(BorderDirectionType)direction color:(UIColor *)color width:(CGFloat)width {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    switch (direction) {
        case BorderDirectionTop:
        {
            border.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, width);
        }
            break;
        case BorderDirectionLeft:
        {
            border.frame = CGRectMake(0.0f, 0.0f, width, self.bounds.size.height);
        }
            break;
        case BorderDirectionBottom:
        {
            border.frame = CGRectMake(0.0f, self.bounds.size.height - width, self.bounds.size.width, width);
        }
            break;
        case BorderDirectionRight:
        {
            border.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
        }
            break;
        default:
            break;
    }
    [self.layer addSublayer:border];
}
#pragma mark---- view晃动
- (void)shakeWithShakeDirection:(ShakeDirection)shakeDirection {
    [self shakeWithTimes:10 speed:0.05 range:5 shakeDirection:shakeDirection];
}

- (void)shakeWithTimes:(NSInteger)times shakeDirection:(ShakeDirection)shakeDirection {
    [self shakeWithTimes:times speed:0.05 range:5 shakeDirection:shakeDirection];
}

- (void)shakeWithTimes:(NSInteger)times speed:(CGFloat)speed shakeDirection:(ShakeDirection)shakeDirection {
    [self shakeWithTimes:times speed:speed range:5 shakeDirection:shakeDirection];
}

- (void)shakeWithTimes:(NSInteger)times speed:(CGFloat)speed range:(CGFloat)range shakeDirection:(ShakeDirection)shakeDirection {
    [self viewShakesWithTiems:times speed:speed range:range shakeDirection:shakeDirection currentTimes:0 direction:1];
}
- (void)viewShakesWithTiems:(NSInteger)times speed:(CGFloat)speed range:(CGFloat)range shakeDirection:(ShakeDirection)shakeDirection currentTimes:(NSInteger)currentTimes direction:(int)direction{
    
    [UIView animateWithDuration:speed animations:^{
        self.transform = (shakeDirection == DirectionHorizontal)? CGAffineTransformMakeTranslation(range * direction, 0):CGAffineTransformMakeTranslation(0, range * direction);
     } completion:^(BOOL finished) {
         if (currentTimes >= times) {
             [UIView animateWithDuration:speed animations:^{
                 self.transform = CGAffineTransformIdentity;
             }];
             return;
        }
#pragma mark - 循环到times == currentTimes时候 会跳出该方法
         [self viewShakesWithTiems:times - 1
                             speed:speed
                             range:range
                    shakeDirection:shakeDirection
                       currentTimes:currentTimes + 1
                          direction:direction * -1];
        }];
}

- (void)setPositionCornerWithRadius:(CGFloat)radius rectCorner:(ZVRectCorner)rectCorner{
    UIRectCorner rect;
    switch (rectCorner) {
        case ZVRectCornerTop:
            rect = UIRectCornerTopLeft|UIRectCornerTopRight;
            break;
        case ZVRectCornerBottom:
            rect = UIRectCornerBottomLeft|UIRectCornerBottomRight;
            break;
        case ZVRectCornerLeft:
            rect = UIRectCornerTopLeft|UIRectCornerBottomLeft;
            break;
        case ZVRectCornerRight:
            rect = UIRectCornerTopRight|UIRectCornerBottomRight;
            break;
        case ZVRectCornerTopLeft:
            rect = UIRectCornerTopLeft;
            break;
        case ZVRectCornerTopRight:
            rect = UIRectCornerTopRight;
            break;
        case ZVRectCornerBottomLeft:
            rect = UIRectCornerBottomLeft;
            break;
        case ZVRectCornerBottomRight:
            rect = UIRectCornerBottomRight;
            break;
        default:
            rect = UIRectCornerAllCorners;
            break;
    }
    
    UIBezierPath *fieldPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rect cornerRadii:CGSizeMake(radius , radius)];
    CAShapeLayer *fieldLayer = [[CAShapeLayer alloc] init];
    fieldLayer.frame = self.bounds;
    fieldLayer.path = fieldPath.CGPath;
    self.layer.mask = fieldLayer;
}

@end
