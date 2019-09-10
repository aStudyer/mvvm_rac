//
//  HTTPManager.h
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/21.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTPManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (nullable NSURLSessionDataTask *)cc_POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, BaseModel *_Nullable response))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
