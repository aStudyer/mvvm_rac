//
//  LoginViewModel.m
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/20.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import "LoginViewModel.h"
#import "HTTPManager.h"

@implementation LoginViewModel
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    // 登录按钮是否可以点击的信号
    _loginBtnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, password)] reduce:^id _Nonnull(NSString *account, NSString *pwd){
        return @(account.length && pwd.length);
    }];
    // 登录命令
    @weakify(self);
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"username"] = self.account;
            params[@"password"] = self.password;
            [SVProgressHUD showWithStatus:@"登录中..."];
            [[HTTPManager sharedManager] cc_POST:@"user/login" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, BaseModel * _Nullable response) {
                if (response.errorCode.integerValue != 0) {
                    [SVProgressHUD showErrorWithStatus:response.errorMsg];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    [subscriber sendNext:[UserInfo mj_objectWithKeyValues:response.data]];
//                    [subscriber sendError:[NSError errorWithDomain:@"com.aStudyer.su" code:1000 userInfo:@{NSLocalizedDescriptionKey: @"逗你玩"}]];
                }
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [SVProgressHUD showErrorWithStatus:@"网络错误"];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}
@end
