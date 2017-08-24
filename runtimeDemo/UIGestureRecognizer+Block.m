//
//  UIGestureRecognizer+Block.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"

@implementation UIGestureRecognizer (Block)

static const int target_key;//声明全局变量，关联对象使用

+(instancetype)bw_gestureRecognizerWithActionBlock:(BWGestureBlcok)block{
    
    __typeof(self) weakSelf=self;
    return [[weakSelf alloc]initWithActionBlock:block];
}

-(instancetype)initWithActionBlock:(BWGestureBlcok)block{
    
    self=[self init];
    
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    
    return self;
}

-(void)addActionBlock:(BWGestureBlcok)block{
    
    if (block) {
        
        //添加属性
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

-(void)invoke:(id)sender{
    
    BWGestureBlcok block=objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}
@end
