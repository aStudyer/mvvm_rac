//
//  BaseModel.h
//  mvvm_rac
//
//  Created by aStudyer on 2019/8/21.
//  Copyright © 2019 com.aStudyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic, strong) id data;

@property (nonatomic, copy) NSString *errorCode;

@property (nonatomic, copy) NSString *errorMsg;

@end

NS_ASSUME_NONNULL_END
