//
//  RoundButton.h
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundButton : UIButton
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat boderWidth;
@property (nonatomic, strong)IBInspectable UIColor *boderColor;
@end
