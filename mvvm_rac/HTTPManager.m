//
//  HTTPManager.m
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/21.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager
static HTTPManager *_instance = nil;
+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HTTPManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://www.wanandroid.com/"]];
    });
    return _instance;
}
- (NSURLSessionDataTask *)cc_POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, BaseModel * _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    return [self POST:URLString parameters:parameters progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, [BaseModel mj_objectWithKeyValues:responseObject]);
    } failure:failure];
}
@end
