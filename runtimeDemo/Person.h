//
//  Person.h
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;
//公共的
- (void)publicMethod;

@end
