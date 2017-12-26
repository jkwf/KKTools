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
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [KKAppHelper deviceHasFixApplications];
    
}
- (void)loadData{
    [HttpHelper GET:@"http://mayi.hizhu.com/Home/House/houselist.html?city_code=001001&pageno=1&limit=10&sort=-1&region_id=&plate_id=&money_max=999999&money_min=0&logicSort=0&line_id=0&stand_id=0&key=&key_self=0&type_no=0&search_id=&latitude=&longitude=&distance=0&update_time=0" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        DLog(@"----------------%@",dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)loadSourceData{
    NSDictionary *dic = @{@"_t":@"1508897975.694627",
                          @"appName":@"zgzf",
                          @"city":@"bj",
                          @"houseType":@"2",
                          @"pageLimit":@"20",
                          @"pageStart":@"1",
                          @"platformType":@"3",
                          @"pos[latitude]":@"40.07933056162528",
                          @"pos[longitude]":@"116.3674785566659",
                          @"s_app_version":@"3.0.5",
                          @"s_os":@"iOS",
                          @"s_os_version":@"11",
                          @"s_screen_height":@"667",
                          @"s_screen_width":@"375",
                          @"status":@"2",
                      @"token":@"Bjxhgkz0_bm1Y_YTQHWuMiSJ0vhbBUilxQqyLHlYc4OjTMY0k0yh2H9yBimeN5_KPDkQChokSynR7BGUJgD48KzZiBksLOKTHZK4VtTong6b0A6QJPBmNSHxNuBnsMnN",
                          
                          };
    [HttpHelper POST:@"http://api.zhugefang.com/API/House/search/addon/V3_1_2" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        DLog(@"----------------%@",dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
- (IBAction)btnClick:(ProgressButton *)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(loadData:) userInfo:sender repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode: NSRunLoopCommonModes];
}
- (void)loadData:(id)sender {
    ProgressButton *progressView = (ProgressButton *)[sender userInfo];
    NSInteger idx = progressView.tag;

    progressView.fillColor = [UIColor yellowColor];
    
    if (progressView.progress < 1) {
        progressView.progress = progressView.progress + 0.015;
    } else {
        [_timer invalidate];
        _timer = nil;
//        progressView.textLabel.text = [NSString stringWithFormat:@"style%ld", idx + 1];
       
    }
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
