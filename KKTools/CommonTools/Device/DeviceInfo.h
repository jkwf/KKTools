//
//  DeviceInfo.h
//  test2
//
//  Created by zving on 2017/5/26.
//  Copyright © 2017年 zving. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject

/**
 获取设备信息

 @return 设备信息json串
 */
+ (NSString *)getDeviceInfoJson;

/**
 获取设备运营商

 @return <#return value description#>
 */
+ (NSString *)getProvider;

/**
 获取设备剩余内存

 @return <#return value description#>
 */
+ (uint64_t)getFreeDiskspace ;
+ (NSString *)freeDiskSpaceInBytes;

/**
 获取设备型号

 @return <#return value description#>
 */
+ (NSString *)getDeviceModel;
@end
