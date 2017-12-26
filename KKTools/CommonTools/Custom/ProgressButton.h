//
//  ProgressButton.h
//  KKTools
//
//  Created by zving on 2017/12/15.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "RoundButton.h"

@interface ProgressButton : RoundButton
@property (nonatomic, assign)IBInspectable float progress;
@property (nonatomic, assign) CGFloat moveWidth;
@property (nonatomic, strong) UIColor *fillColor;
@end
