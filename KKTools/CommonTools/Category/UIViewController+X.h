//
//  UIViewController+X.h
//  KKTools
//
//  Created by zving on 2017/9/4.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (X)

/**
 设置系统返回按钮大小

 @param imgName <#imgName description#>
 @param action <#action description#>
 */
- (void)setBackBarItemWithImageName:(NSString *)imgName Action:(SEL)action;

/**
 设置返回按钮只有箭头
 */
- (void)setEmptyBackBtn;

/**
 设置系统返回按钮图片

 @param imageName 图片名
 */
- (void)setNavBackBtnImage:(NSString *)imageName;
@end
