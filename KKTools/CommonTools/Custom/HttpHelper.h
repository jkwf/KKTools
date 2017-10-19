//
//  HttpHelper.h
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject
+ (void)GET:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
+ (void)GET:(NSString *)urlStr parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
+ (void)GET:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
+ (void)GET:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)POST:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;
+ (void)POST:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;
+ (void)POST:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;
@end
