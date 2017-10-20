//
//  DeviceInfo.m
//  test2
//
//  Created by zving on 2017/5/26.
//  Copyright © 2017年 zving. All rights reserved.
//

#import "DeviceInfo.h"
#import "DeviceIp.h"

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <sys/utsname.h>
#include <sys/param.h>
#include <sys/mount.h>


@implementation DeviceInfo

+ (NSDictionary *)getDeviceInfoJson{
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    //手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    
    //地方型号  （国际化区域名称）
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    // 当前应用版本号码   int类型
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    DLog(@"手机别名: %@ \n 设备名称: %@ \n 手机系统版本: %@ \n 手机型号: %@ \n 国际化区域名称: %@ \n 当前应用名称：%@ \n 当前应用软件版本:%@ \n 当前应用版本号码：%@",userPhoneName,deviceName,phoneVersion,phoneModel,localPhoneModel,appCurName,appCurVersion,appCurVersionNum);
    
    NSString * res = [NSString stringWithFormat:@"%f*%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height];
    
    NSString *ipAdress = [DeviceIp deviceIPAdress];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@"ios" forKey:@"TerminalType"];
    [params setValue:phoneModel forKey:@"TerminalModel"];
    [params setValue:phoneVersion forKey:@"SysVersion"];
    [params setValue:appCurVersion forKey:@"AppVersion"];
    [params setValue:@"wifi" forKey:@"NetworkType"];
    [params setValue:[self getProvider] forKey:@"Provider"];
    [params setValue:@"13911111111" forKey:@"TelNumber"];
    [params setValue:res forKey:@"Resolution"];
    [params setValue:ipAdress forKey:@"IP"];
    
    
    return params;
}
+ (NSString *)getProvider{
    NSString *provider = [[NSString alloc]init];
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [info  subscriberCellularProvider];
    if(carrier == nil){
        provider =  @"N/A";
    }
    
    NSString *code = [carrier mobileNetworkCode];
    if([code isEqualToString:@""]){
        provider =  @"N/A";
    }
    
    if([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]){
        provider = @"中国移动";
    }
    if([code isEqualToString:@"01"] || [code isEqualToString:@"06"]){
        provider = @"中国联通";
    }
    if([code isEqualToString:@"03"] || [code isEqualToString:@"05"]){
        provider = @"中国电信";
    }
    return provider;
}

+ (NSString *)freeDiskSpaceInBytes{
    struct statfs buf;
    long long freespace = -1;
    if(statfs("/var", &buf) >= 0){
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    return [NSString stringWithFormat:@"%qi MB" ,freespace/1024/1024];
}
+ (uint64_t)getFreeDiskspace {
    uint64_t totalSpace = 0;
    uint64_t totalFreeSpace = 0;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes unsignedLongLongValue];
        totalFreeSpace = [freeFileSystemSizeInBytes unsignedLongLongValue];
        NSLog(@"Memory Capacity of %llu MiB with %llu MiB Free memory available.", ((totalSpace/1024ll)/1024ll), ((totalFreeSpace/1024ll)/1024ll));
    } else {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    
    return totalFreeSpace;
}
+ (NSString *) getDeviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPhone10,1"])    return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,3"])    return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch (6 Gen)";
    
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([platform isEqualToString:@"iPad6,11"])      return @"iPad (5th Gen)";
    if ([platform isEqualToString:@"iPad6,12"])      return @"iPad (5th Gen)";
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9 (2nd Gen)";
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9 (2nd Gen)";
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5";
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5";
    
    
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3 (2013)";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}


@end
