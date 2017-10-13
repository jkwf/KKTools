//
//  UIViewController+X.m
//  KKTools
//
//  Created by zving on 2017/9/4.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "UIViewController+X.h"

@implementation UIViewController (X)
- (void)setBackBarItemWithImageName:(NSString *)imgName Action:(SEL)action{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(12, 32, 11, 20);
    [backBtn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [backBtn setTitle:@"" forState:UIControlStateNormal];
    [backBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setEmptyBackBtn{
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButtonItem];
}
- (void)setNavBackBtnImage:(NSString *)imageName{
    UIImage *backButtonImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = backButtonImage;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
}
@end
