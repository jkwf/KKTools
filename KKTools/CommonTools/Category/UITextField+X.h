//
//  UITextField+X.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (X)

/**
 隐藏光标
 */
- (void)hiddenCursor;

/**
 光标位置

 @param index <#index description#>
 */
- (void)cursorLocationWithIndex:(NSInteger)index;

/**
 修改占位图位置
 */
- (void)changeContentPosition;
@end
