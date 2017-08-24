//
//  Dog.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)eat{
    
    DLog(@"小狗吃食");
}

void drink(){
    
    DLog(@"小狗喝水");
}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
// 刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel ==NSSelectorFromString(@"drink")) {
        
        class_addMethod([self class], sel, (IMP)drink, "v%@");
        return YES;
    }
    // 先恢复, 不然会覆盖系统的方法
    return [super resolveInstanceMethod:sel];}
@end
