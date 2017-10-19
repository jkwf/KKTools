//
//  UITextField+X.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UITextField+X.h"
#import "NSString+X.h"

@implementation UITextField (X)
- (void)hiddenCursor{
    self.tintColor = [UIColor clearColor];
}
- (void)cursorLocationWithIndex:(NSInteger)index{
    NSRange range = NSMakeRange(index, 0);
    UITextPosition *start = [self positionFromPosition:[self beginningOfDocument] offset:range.location];
    UITextPosition *end = [self positionFromPosition:start offset:range.length];
    [self setSelectedTextRange:[self textRangeFromPosition:start toPosition:end]];
}
//修改默认占位符位置
- (void)changeContentPosition{
    //垂直
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    //水平
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

@end
