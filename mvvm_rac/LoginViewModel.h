//
//  LoginViewModel.h
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/20.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "UserInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString *account;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong, readonly) RACSignal *loginBtnEnableSignal;

@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
