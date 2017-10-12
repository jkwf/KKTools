//
//  ViewController.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "ViewController.h"
#import "KKAppHelper.h"
#import <Photos/Photos.h>
#import "KKTextField.h"
#import "UIView+X.h"
#import "NSArray+Value.h"
#import "NSString+X.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<UITextFieldDelegate,WKNavigationDelegate>{
    __weak IBOutlet KKTextField *_textField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _textField.delegate = self;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"------------%@",string);
    if ([string isEnglishOrNumber]) {
        return YES;
    }else{
        return NO;
    }
}
- (IBAction)begin:(UIButton *)sender {

    [_textField shakeWithTimes:2 shakeDirection:DirectionHorizontal];
//    [_textField startAnimate];
}
- (IBAction)end:(UIButton *)sender {
    [_textField stopAnimate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
