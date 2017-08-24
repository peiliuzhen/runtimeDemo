//
//  Model.h
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+category.h"
@interface Model : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, strong)NSNumber *age;

@end
