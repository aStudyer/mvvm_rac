//
//  UserInfo.m
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/21.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import "UserInfo.h"
#import <MJExtension/MJExtension.h>

@implementation UserInfo
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id"
             };
}
@end
