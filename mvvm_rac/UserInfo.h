//
//  UserInfo.h
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/21.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

@property (nonatomic, assign) BOOL admin;

@property (nonatomic, strong) NSNumber *ID;

@property (nonatomic, copy) NSString *nickname;

@end

NS_ASSUME_NONNULL_END
