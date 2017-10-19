//
//  RoundView.h
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundView : UIView
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat boderWidth;
@property (nonatomic, strong)IBInspectable UIColor *boderColor;
@end

@interface RoundButton : UIButton
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat boderWidth;
@property (nonatomic, strong)IBInspectable UIColor *boderColor;
@end

@interface RoundLabel : UILabel
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat boderWidth;
@property (nonatomic, strong)IBInspectable UIColor *boderColor;

/**
 设置圆角需要设置layer的背景色
 */
@property (nonatomic, assign)IBInspectable UIColor *cornerBackgroundColor;
@end
