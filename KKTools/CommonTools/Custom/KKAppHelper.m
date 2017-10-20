//
//  KKAppHelper.m
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#import "KKAppHelper.h"
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <StoreKit/StoreKit.h>

#define HudHiddenTime   2

static MBProgressHUD *hud;
static NSString *prev_msg;
static MBProgressHUD *nonBlockingHUD;

@implementation KKAppHelper
#pragma mark----- 系统设置
+ (void)prohibitAppSleep{
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

+ (void)setBrightness:(CGFloat)brightness{
    [[UIScreen mainScreen] setBrightness:brightness];
}
+ (void)goToAppSetting{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
        
    }];
}
+ (void)goToAppSettingWithTypes:(NSString *)types{
    NSString *newType = [NSString stringWithFormat:@"prefs:root=%@",types];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:newType]];
}
+ (void)goToAppstore{
    static NSString *appId = @"7823982390";
        
    NSString *itunesurl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8&action=write-review",appId];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itunesurl]];
}
+ (UIWindow*)getWindow {
    UIWindow* win = nil; //[UIApplication sharedApplication].keyWindow;
    for (id item in [UIApplication sharedApplication].windows) {
        if ([item class] == [UIWindow class]) {
            if (!((UIWindow*)item).hidden) {
                win = item;
                break;
            }
        }
    }
    return win;
}

+ (void)removeAllUserdefault{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (UIViewController *)viewControllerWithView:(UIView *)view{
    UIViewController *viewController = nil;
    UIResponder *next = view.nextResponder;
    while (next)
    {
        if ([next isKindOfClass:[UIViewController class]])
        {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    } 
    return viewController;
}

//文件大小
+ (long long)fileSizeAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path])
    {
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size;
    }
    
    return 0;
}

//文件夹大小
+ (long long)folderSizeAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    long long folderSize = 0;
    
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *fileAbsolutePath = [path stringByAppendingPathComponent:fileName];
            if ([fileManager fileExistsAtPath:fileAbsolutePath]) {
                long long size = [fileManager attributesOfItemAtPath:fileAbsolutePath error:nil].fileSize;
                folderSize += size;
            }
        }
    }
    
    return folderSize;
}

+ (void)deviceHasFixApplications{
    Class c =NSClassFromString(@"LSApplicationWorkspace");
    id s;
    SuppressPerformSelectorLeakWarning(
        s = [(id)c performSelector:NSSelectorFromString(@"defaultWorkspace")];
    );
    NSArray *array;
    SuppressPerformSelectorLeakWarning(
        array = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
    );
    
    for (id item in array){
        SuppressPerformSelectorLeakWarning(
            DLog(@"%@",[item performSelector:NSSelectorFromString(@"applicationIdentifier")]);
            DLog(@"%@",[item performSelector:NSSelectorFromString(@"bundleVersion")]);
            DLog(@"%@",[item performSelector:NSSelectorFromString(@"shortVersionString")]);
        );
    }
}
#pragma mark----- 权限判断
+ (void)obtainJurisdictionStatus{
    if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        DLog(@"没有定位权限");
    }
    AVAuthorizationStatus statusVideo = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (statusVideo == AVAuthorizationStatusDenied) {
        DLog(@"没有摄像头权限");
    }
    //是否有麦克风权限
    AVAuthorizationStatus statusAudio = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (statusAudio == AVAuthorizationStatusDenied) {
        DLog(@"没有录音权限");
    }
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusDenied) {
            DLog(@"没有相册权限");
        }
    }];
}


#pragma mark----- 上整和下整
+ (int)maxIntWithFloat:(CGFloat)floatValue{
    return ceil(floatValue);//(int)round(floatValue));
}
+ (int)minIntWithFloat:(CGFloat)floatValue{
    return (int)floatValue;//floor(floatValue)
}

+ (BOOL)checkNetworkStatus{
//    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
//    [reachabilityManager startMonitoring];
//    return [reachabilityManager isReachable];
    return YES;
}
#pragma mark-------------- 绘制虚线
+ (void)drawVerticalDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame), CGRectGetHeight(lineView.frame) / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:0.5];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame)/2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:1];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
#pragma mark---------------------- 倒计时按钮
+ (void)startCountDownWithButton:(UIButton *)button withColor:(UIColor *)color resendColor:(UIColor *)resendColor withCountDownTime:(int)countDownTime {
    button.enabled = NO;
    __block int timeout= countDownTime; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                button.enabled = YES;
                [button setTitle:@"重新发送" forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
                button.backgroundColor = resendColor;
            });
        }else{
            int seconds = timeout % countDownTime;
            if( seconds == 0)
                seconds = countDownTime;
            NSString *strTime = [NSString stringWithFormat:@"%d秒", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [button setTitle:strTime forState:UIControlStateDisabled];
                
                [button setTitleColor:color forState:UIControlStateDisabled];
                button.backgroundColor = [UIColor lightGrayColor];
                
            });
            timeout--;
        }
    });
    dispatch_resume(timer);
}
#pragma mark----- 富文本处理
+ (NSMutableAttributedString *)drawDeleteLabWithString:(NSString *)str location:(NSInteger)location length:(NSInteger)length color:(UIColor *)color{
    NSMutableAttributedString *attritu = [[NSMutableAttributedString alloc] initWithString:str];
    
    [attritu addAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),
                             NSStrikethroughColorAttributeName:color,
                             NSBaselineOffsetAttributeName:@(0),
                             } range:NSMakeRange(location, length)];
    
    return attritu;
}
+ (NSAttributedString *)setLabelWithSpace:(CGFloat)space withString:(NSString*)str withFont:(UIFont*)font {
    if (str == nil || [str isEqualToString:@""]) {
        return [[NSAttributedString alloc]initWithString:@""];
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = space; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    return attributeStr;
}
+ (NSAttributedString *)changeToAttributeStringWithHtmlStr:(NSString *)htmlStr{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
    return attributedString;
}
#pragma mark----- 设置导航和状态栏
+ (void)setNavigationStyle{
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
}
+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

+ (void)forbidReRespond:(id)respond{
    
    // UIView有个属性叫做exclusiveTouch，设置为YES后，其响应事件会和其他view互斥(有其他view事件响应的时候点击它不起作用)
    UIView *view = (UIView *)respond;
    view.exclusiveTouch = YES;
    
    // 一个一个设置太麻烦了，可以全局设置
    [[UIView appearance] setExclusiveTouch:YES];
    
    // 或者只设置button
    [[UIButton appearance] setExclusiveTouch:YES];
}
#pragma mark---- 多个网络请求
+ (void)manyRequest{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t serialQueue = dispatch_queue_create("com.wzb.test.www", DISPATCH_QUEUE_SERIAL);
    dispatch_group_enter(group);
    dispatch_group_async(group, serialQueue, ^{
        // 网络请求一
//        [WebClick getDataSuccess:^(ResponseModel *model) {
//            dispatch_group_leave(group);
//        } failure:^(NSString *err) {
//            dispatch_group_leave(group);
//        }];
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, serialQueue, ^{
        // 网络请求二
//        [WebClick getDataSuccess:getBigTypeRM onSuccess:^(ResponseModel *model) {
//            dispatch_group_leave(group);
//        } failure:^(NSString *errorString) {
//            dispatch_group_leave(group);
//        }];
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, serialQueue, ^{
        // 网络请求三
//        [WebClick getDataSuccess:^{
//            dispatch_group_leave(group);
//        } failure:^(NSString *errorString) {
//            dispatch_group_leave(group);
//        }];
    });
    
    // 所有网络请求结束后会来到这个方法
    dispatch_group_notify(group, serialQueue, ^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                // 刷新UI
            });
        });
    });
}
+ (void)solveOpenUrlDelayWithUrlStr:(NSString *)urlStr{
    // 方法一
    NSURL *url = [NSURL URLWithString:urlStr];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIApplication *application = [UIApplication sharedApplication];
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{}
               completionHandler:nil];
        } else {
            [application openURL:url];
        }
    });
}
+ (void)biologicalRecognitionResult:(void (^)(BOOL success, NSError *error))result{
    
    if (@available(iOS 8.0, *)) {
        LAContext *context = [[LAContext alloc] init];
        NSString *localizedReason = @"指纹登录";
        if (@available(iOS 11.0, *)) {
            if (context.biometryType == LABiometryTypeTouchID) {
            }else if (context.biometryType == LABiometryTypeFaceID){
                localizedReason = @"Face ID登录";
            }
        } else {
            // Fallback on earlier versions
        }
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:localizedReason reply:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    NSLog(@"--------识别成功");
                }else{
                    if (error.code != 2) {
                        
                    }
                }
            }];
        }
    }else {
        NSLog(@"你的设备不支持指纹识别");
    }
}
#pragma mark----- 结束应用
+ (void)exitApplication {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
    } completion:^(BOOL finished) {
        exit(0);
    }];
}
+ (void)saveImageToAlbumWithImageName:(NSString *)imageName completionHandler:(void(^)(BOOL success, NSError * error))completionHandler{
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:[UIImage imageNamed:@"person"]];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (completionHandler) {
            completionHandler(success,error);
        }
    }];
}
+ (void)judgeSystemVersion{
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0){
        
    }
    
    if (__IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0) {
        NSLog(@"=====================");
    }
    
    if (@available(iOS 8.0, *)) {
        
    }else{
        // Fallback on earlier versions
    }
}
#pragma mark---- toast信息

#pragma mark-------------  指示器
+ (void)showHudWithMsg:(NSString *)msg{
    if(hud){
        [KKAppHelper removeHUD:nil];
    }
    hud = [MBProgressHUD showHUDAddedTo:App_Window animated:YES];
    hud.label.text = msg;
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    [hud showAnimated:YES];
    prev_msg = msg;
}
+ (void)removeHUD:(NSString *)msg{
    if( hud ){
        if (msg) {
            hud.label.text = msg;
            [hud hideAnimated:YES afterDelay:1.0f];
        }else{
            [hud hideAnimated:YES];
        }
        hud = nil;
    }
}

#pragma mark-------------  toast消息
+ (void)toastMessage:(NSString*)msg{
    [self toastMessage:msg window:App_Window];
}
+ (void)toastMessage:(NSString*)msg completion:(void (^)(void))completion{
    [self toastMessage:msg window:App_Window];
    if (completion) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HudHiddenTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completion();
        });
    }
}
+ (void)toastMessage:(NSString*)msg window:(UIWindow*)window{
    [KKAppHelper showNonBlockingHUD:[NSString stringWithFormat:@"%@",msg]
                            addto:window
                hideWithinSeconds:HudHiddenTime];
}

+ (void)showNonBlockingHUD:(NSString *)msg addto:(UIView*)superview hideWithinSeconds:(NSTimeInterval)delay{
    [KKAppHelper removeNonBlockingHUD];
    nonBlockingHUD = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    nonBlockingHUD.mode = MBProgressHUDModeText;
//    nonBlockingHUD.detailsLabel.textColor = [UIColor blueColor];//文本颜色
    nonBlockingHUD.contentColor = [UIColor whiteColor];//文字和菊花的颜色
    nonBlockingHUD.bezelView.backgroundColor = [UIColor blackColor];//菊花背景颜色
    nonBlockingHUD.detailsLabel.text = msg;
    [nonBlockingHUD hideAnimated:YES afterDelay:delay];
}
+ (void)removeNonBlockingHUD{
    if( nonBlockingHUD ) {
        [nonBlockingHUD hideAnimated:YES];
        nonBlockingHUD = nil;
    }
}

@end
