//
//  KKTextField.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKTextField : UITextField
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat boderWidth;
@property (nonatomic, strong)IBInspectable UIColor *boderColor;
@property (nonatomic, strong)IBInspectable UIColor *placeholderColor;
@property (nonatomic, assign)IBInspectable UIEdgeInsets insets;

@end
