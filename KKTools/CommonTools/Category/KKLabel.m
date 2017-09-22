//
//  KKLabel.m
//  KKTools
//
//  Created by zving on 2017/7/13.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "KKLabel.h"

@implementation KKLabel //设置label字体位置

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.textAlignmentType) {
        case TextAlignmentTypeLeftTop: {
            rect.origin = bounds.origin;
        }
            break;
        case TextAlignmentTypeRightTop: {
            rect.origin = CGPointMake(CGRectGetMaxX(bounds) - rect.size.width, bounds.origin.y);
        }
            break;
        case TextAlignmentTypeLeftBottom: {
            rect.origin = CGPointMake(bounds.origin.x, CGRectGetMaxY(bounds) - rect.size.height);
        }
            break;
        case TextAlignmentTypeRightBottom: {
            rect.origin = CGPointMake(CGRectGetMaxX(bounds) - rect.size.width, CGRectGetMaxY(bounds) - rect.size.height);
        }
            break;
        case TextAlignmentTypeTopCenter: {
            rect.origin = CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(rect)) / 2, CGRectGetMaxY(bounds) - rect.origin.y);
        }
            break;
        case TextAlignmentTypeBottomCenter: {
            rect.origin = CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(rect)) / 2, CGRectGetMaxY(bounds) - CGRectGetMaxY(bounds) - rect.size.height);
        }
            break;
        case TextAlignmentTypeLeft: {
            rect.origin = CGPointMake(0, rect.origin.y);
        }
            break;
        case TextAlignmentTypeRight: {
            rect.origin = CGPointMake(rect.origin.x, 0);
        }
            break;
        case TextAlignmentTypeCenter: {
            rect.origin = CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(rect)) / 2, (CGRectGetHeight(bounds) - CGRectGetHeight(rect)) / 2);
        }
            break;
        default:
            break;
    }
    return rect;
}
- (void)drawTextInRect:(CGRect)rect {
    CGRect textRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:textRect];
}

@end
