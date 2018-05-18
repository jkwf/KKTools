//
//  HttpHelper.m
//  KKTools
//
//  Created by zving on 2017/10/19.
//  Copyright © 2017年 KK. All rights reserved.
//

#import "HttpHelper.h"

@implementation HttpHelper

+ (void)GET:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [HttpHelper GET:urlStr alert:YES parameters:parameters progress:nil success:success failure:failure];
}
+ (void)GET:(NSString *)urlStr parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [HttpHelper GET:urlStr alert:NO parameters:parameters progress:downloadProgress success:success failure:success];
}
+ (void)GET:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [HttpHelper GET:urlStr alert:alert parameters:parameters progress:nil success:success failure:success];
}

+ (void)GET:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (alert) {
        [KKAppHelper showHudWithMsg:@"正在加载……"];
    }
    [manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
        if (alert) {
            [KKAppHelper removeHUD:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
        if (alert) {
            [KKAppHelper removeHUD:@"加载失败"];
        }
    }];
}
+ (void)POST:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure{
    [HttpHelper POST:urlStr alert:YES parameters:parameters success:success failure:failure];
}
+ (void)POST:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure{
    [HttpHelper POST:urlStr alert:alert parameters:parameters progress:nil success:success failure:failure];
}
+ (void)POST:(NSString *)urlStr alert:(BOOL)alert parameters:(id)parameters progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (alert) {
        [KKAppHelper showHudWithMsg:@"正在加载……"];
    }
    
    
    [manager POST:urlStr parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
        if (alert) {
            [KKAppHelper removeHUD:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
        if (alert) {
            [KKAppHelper removeHUD:@"加载失败"];
        }
    }];
}



@end
