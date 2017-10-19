//
//  UILabel+X.h
//  KKTools
//
//  Created by zving on 2017/7/11.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (X)

/**
 设置字体行间距

 @param space 行间距
 */
- (void)setParagraphSpacing:(CGFloat)space;

/**
 计算label的高

 @return <#return value description#>
 */
- (CGFloat)caclueHeight;

/**
 计算label的宽

 @return <#return value description#>
 */
- (CGFloat)calculateLabWidth;

/**
 计算label的高度

 @return <#return value description#>
 */
- (CGFloat)calculateLabHeight;

/**
 计算富文本的高度

 @param space 行间距
 @return <#return value description#>
 */
- (CGFloat)attributeHeightWithSpace:(CGFloat)space;
@end
