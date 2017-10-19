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

- (CGFloat)calculateLabWidth{
    if (![self.text isEqualToString:@""]) {
        return [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size.width + 5;
    }else{
        return 0;
    }
}
- (CGFloat)calculateLabHeight{
    if (![self.text isEqualToString:@""]) {
        return [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size.height;
    }else{
        return 0;
    }
}

- (CGFloat)attributeHeightWithSpace:(CGFloat)space{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paraStyle
                          };
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
@end
