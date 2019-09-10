//
//  ViewController.m
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/20.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewModel.h"
#import "ModelViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, strong) LoginViewModel *loginVM;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录页";
    [self bindViewModel];
    [self loginEvent];
}
/// 绑定viewModel
- (void)bindViewModel{
    // 给视图模型的账号和密码绑定信号
    RAC(self.loginVM, account) = self.accountField.rac_textSignal;
    RAC(self.loginVM, password) = self.pwdField.rac_textSignal;
}
/// 登录事件
- (void)loginEvent{
    // 设置按钮能否被点击
    RAC(self.loginBtn, enabled) = self.loginVM.loginBtnEnableSignal;
    // 监听按钮点击事件
    [[self.loginBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了登录按钮");
        [[self.loginVM.loginCommand execute:nil] subscribeNext:^(UserInfo * _Nullable x) {
            NSLog(@"x = %@",x);
            [self.navigationController pushViewController:[ModelViewController new] animated:YES];
        } error:^(NSError * _Nullable error) {
            NSLog(@"error = %@",error.localizedDescription);
        }];
    }];
//    // 监听命令执行过程
//    [[self.loginVM.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
//        if ([x boolValue]) {
//            [SVProgressHUD showWithStatus:@"登录中..."];
//        }else{
//            [SVProgressHUD dismiss];
//        }
//    }];
}
#pragma mark - Getter
- (LoginViewModel *)loginVM{
    if (!_loginVM) {
        _loginVM = [LoginViewModel new];
    }
    return _loginVM; 
}
@end
