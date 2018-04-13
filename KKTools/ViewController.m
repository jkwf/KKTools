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
#import "HttpHelper.h"
#import "ProgressButton.h"

@interface ViewController ()<UITextFieldDelegate,WKNavigationDelegate>{
    NSTimer *_timer;
    IBOutlet UIProgressView *_prog;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [KKAppHelper deviceHasFixApplications];
    
    NSArray *array = @[@"1",@"4",@"9",@"10",@"29",@"18",@"16",@"15",@"10",@"11",@"12",@"19"];
    NSSet *set = [NSSet setWithArray:array];
    NSLog(@"set=====%@",set.allObjects);
    //升序
    NSOrderedSet *set1 = [NSOrderedSet orderedSetWithArray:array];
    NSLog(@"set1====%@",set1.array);
    
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *image = [UIImage imageNamed:@"test"];
    UIImage *proImg = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
    _prog.progressImage = proImg;
    
//    NSLog(@"uppercaseString==%@", [array valueForKeyPath:@"uppercaseString"]);
//    NSLog(@"length==%@", [array valueForKeyPath:@"length"]);
    
    NSLog(@"-----%f",[array maxValue]);
    NSLog(@"------%f",[array minValue]);
    NSLog(@"-------%f",[array sumValue]);
    NSLog(@"--------%f",[array averageValue]);
    NSLog(@"---------%@",[array deleteRecurElement]);
    [array sequence];
    NSLog(@"----------%@",array);
    
    NSString *string = @"ABKJFDRFIUEROFDVFDLPEOFPEM";
    NSArray *arr = [string componentsSeparatedByString:@"D"];
    NSLog(@"==========%lu",arr.count-1);
}

- (IBAction)btnClick:(ProgressButton *)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(loadData:) userInfo:sender repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode: NSRunLoopCommonModes];
}
- (void)loadData:(id)sender {
    
    _prog.progress = _prog.progress + 0.05;
    NSLog(@"=============%f",_prog.progress);
//    ProgressButton *progressView = (ProgressButton *)[sender userInfo];
//    NSInteger idx = progressView.tag;
//
//    progressView.fillColor = [UIColor yellowColor];
//    
//    if (progressView.progress < 1) {
//        progressView.progress = progressView.progress + 0.015;
//    } else {
//        [_timer invalidate];
//        _timer = nil;
////        progressView.textLabel.text = [NSString stringWithFormat:@"style%ld", idx + 1];
//       
//    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"------------%@",string);
    if ([string isEnglishOrNumber]) {
        return YES;
    }else{
        return NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
