
//
//  BWModel.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "BWModel.h"

@implementation BWModel

-(void)encodeWithCoder:(NSCoder *)encoder {
    
    unsigned int count;
    //runtime获取实例变量的列表
    Ivar *ivars=class_copyIvarList([self class], &count);
    // 遍历实例变量列表
    for (unsigned int i=0; i<count; i++) {
        //  取出i位置对应的实例变量
        Ivar ivar=ivars[i];
        //  查看实例变量的名字
        const char *ivarName=ivar_getName(ivar);
        //  C语言字符串转化为NSString
        NSString *nameStr=[NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        //  利用KVC取出属性对应的值
        id value=[self valueForKey:nameStr];
        //归档
        [encoder encodeObject:value forKey:nameStr];
    }
    //c语言copy需要释放
    free(ivars);
}

-(id)initWithCoder:(NSCoder *)decoder{
    
    if (self=[super init]) {
        
        unsigned int count;
        //runtime获取实例变量的列表
        Ivar *ivars=class_copyIvarList([self class], &count);
        // 遍历实例变量列表
        for (unsigned int i=0; i<count; i++) {
            //  取出i位置对应的实例变量
            Ivar ivar=ivars[i];
            //  查看实例变量的名字
            const char *ivarName=ivar_getName(ivar);
            //  C语言字符串转化为NSString
            NSString *nameStr=[NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
            //从decoder取值
            id value=[decoder decodeObjectForKey:nameStr];
            //设置到成员变量
            [self setValue:value forKey:nameStr];
        }
        free(ivars);
    }
    return self;
}
@end
