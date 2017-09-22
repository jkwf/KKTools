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

@interface ViewController (){

    __weak IBOutlet KKTextField *_textField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:[UIImage imageNamed:@"person"]];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"------%d------%@",success,error);
    }];
    [KKAppHelper deviceHasFixApplications];
    
    NSArray *array = @[@"1",@"2",@"3",@"0",@"8",@"1",@"6",@"7",@"2"];
    NSLog(@"============%@",[array deleteRecurElement]);
    
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
