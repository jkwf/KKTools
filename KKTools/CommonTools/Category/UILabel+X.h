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
@end
