//
//  ProgressButton.m
//  KKTools
//
//  Created by zving on 2017/12/15.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "ProgressButton.h"

@implementation ProgressButton

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.moveWidth, self.bounds.size.height) cornerRadius:self.cornerRadius];
    [[UIColor blueColor] set];
    [path fill];
}
- (void)setProgress:(float)progress {
    _progress = progress;    
    self.moveWidth = progress * self.frame.size.width;
    float decimals = progress * 100;
    if (decimals > 100.00) decimals = 100.00;
    [self setTitle:[NSString stringWithFormat:@"%0.2f%%", decimals] forState:UIControlStateNormal];
    
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
