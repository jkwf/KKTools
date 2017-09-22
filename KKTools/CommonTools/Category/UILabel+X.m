//
//  UILabel+X.m
//  KKTools
//
//  Created by zving on 2017/7/11.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UILabel+X.h"
#import "UIView+X.h"

@implementation UILabel (X)
- (void)setParagraphSpacing:(CGFloat)space{
    NSMutableAttributedString* attrString = [[NSMutableAttributedString  alloc] initWithString:self.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:space];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.text.length)];
    self.attributedText = attrString;
}
- (CGFloat)caclueHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(self.width, MAXFLOAT)];
    return size.height;
}
@end
