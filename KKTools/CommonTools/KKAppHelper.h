//
//  KKAppHelper.h
//  KKTools
//
//  Created by zving on 2017/6/29.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface KKAppHelper : NSObject

/**
 禁止设备休眠
 */
+ (void)prohibitAppSleep;

/**
 前往应用设置页面
 */
+ (void)goToAppSetting;

/**
 打开设置

 @param types 设置类型{// 以下是设置其他界面
                        General
                        General&path=Reset
                        General&path=About
                        General&path=Network
                        General&path=AUTOLOCK
                        General&path=Keyboard
                        General&path=Assistant
                        General&path=Network/VPN
                        General&path=ACCESSIBILITY
                        General&path=INTERNATIONAL
                        General&path=DATE_AND_TIME
                        General&path=SOFTWARE_UPDATE_LINK
                        General&path=USAGE/CELLULAR_USAGE
                        General&path=USAGE prefs:root=VIDEO
                        General&path=ManagedConfigurationList
                        Phone
                        Phone&path=Blocked
                        AIRPLANE_MODE
                        Brightness
                        Bluetooth
                        FACETIME
                        CASTLE
                        CASTLE&path=STORAGE_AND_BACKUP
                        LOCATION_SERVICES
                        ACCOUNT_SETTINGS
                        MUSIC
                        MUSIC&path=EQ
                        MUSIC&path=VolumeLimit
                        NIKE_PLUS_IPOD
                        NOTES
                        NOTIFICATIONS_ID
                        Photos
                        Sounds
                        Sounds&path=Ringtone
                        Safari
                        STORE
                        TWITTER
                        FACEBOOK
                        Wallpaper
                        WIFI
                        INTERNET_TETHERING
                        DO_NOT_DISTURB
                    }
 
 */
+ (void)goToAppSettingWithTypes:(NSString *)types;

/**
 前往App Store
 */
+ (void)goToAppstore;

/**
 删除所有NSUserdefault信息
 */
+ (void)removeAllUserdefault;

/**
 获取设备安装的应用
 */
+ (void)deviceHasFixApplications;

/**
 获取汉字的拼音

 @param chinese <#chinese description#>
 @return <#return value description#>
 */
+ (NSString *)transform:(NSString *)chinese;

/**
 字符串反转

 @param str <#str description#>
 @return <#return value description#>
 */
+ (NSString*)reverseWordsInString:(NSString*)str;

/**
 首字母大写

 @param string <#string description#>
 @return <#return value description#>
 */
+ (NSString *)capitalFirstLetterWithString:(NSString *)string;
/**
 判断设备权限
 */
+ (void)obtainJurisdictionStatus;

/**
 文件大小

 @param path 文件位置
 @return <#return value description#>
 */
+ (long long)fileSizeAtPath:(NSString *)path;

/**
 文件夹大小

 @param path 文件夹位置
 @return <#return value description#>
 */
+ (long long)folderSizeAtPath:(NSString *)path;

/**
 设置屏幕亮度

 @param brightness <#brightness description#>
 */
+ (void)setBrightness:(CGFloat)brightness;

/**
 取上整

 @param floatValue <#floatValue description#>
 @return <#return value description#>
 */
+ (int)maxIntWithFloat:(CGFloat)floatValue;

/**
 取下整

 @param floatValue <#floatValue description#>
 @return <#return value description#>
 */
+ (int)minIntWithFloat:(CGFloat)floatValue;

/**
 绘制水平虚线
 
 @param lineView 展示
 @param lineLength 线长
 @param lineSpacing 线之间的间隔
 @param lineColor 线的颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
/**
 绘制垂直虚线
 
 @param lineView 展示
 @param lineLength 线长
 @param lineSpacing 线之间的间隔
 @param lineColor 线的颜色
 */
+ (void)drawVerticalDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 倒计时
 
 @param button <#button description#>
 @param color <#color description#>
 @param resendColor 重新发送的颜色
 @param countDownTime <#countDownTime description#>
 */
+ (void)startCountDownWithButton:(UIButton *)button withColor:(UIColor *)color resendColor:(UIColor *)resendColor withCountDownTime:(int)countDownTime;

/**
 设置导航栏样式（返回按钮的样式，颜色，字体大小）
 */
+ (void)setNavigationStyle;

/**
 设置statusbar的颜色

 @param color <#color description#>
 */
+ (void)setStatusBarBackgroundColor:(UIColor *)color;

/**
 htmlString转NSAttributedString

 @param htmlStr <#htmlStr description#>
 @return <#return value description#>
 */
+ (NSAttributedString *)changeToAttributeStringWithHtmlStr:(NSString *)htmlStr;

/**
 禁止多个事件同时响应

 @param respond <#respond description#>
 */
+ (void)forbidReRespond:(id)respond;

/**
 同一页面多次网络请求
 */
+ (void)manyRequest;

/**
 解决openURL时有延迟的情况

 @param urlStr <#urlStr description#>
 */
+ (void)solveOpenUrlDelayWithUrlStr:(NSString *)urlStr;

/**
 验证指纹结果

 @param reason <#reason description#>
 @param result <#result description#>
 */
+ (void)fingerPrintWithReason:(NSString *)reason result:(void (^)(BOOL success, NSError *error))result;
    
/**
 把文字转化成有行间距的富文本
 
 @param space 行间距
 @param str 原文本
 @param font 字体
 @return <#return value description#>
 */
+ (NSAttributedString *)setLabelWithSpace:(CGFloat)space withString:(NSString*)str withFont:(UIFont*)font;

/**
 判断系统版本
 */
+ (void)judgeSystemVersion;
@end
