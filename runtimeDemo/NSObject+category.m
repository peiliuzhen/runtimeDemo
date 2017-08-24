//
//  NSObject+category.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "NSObject+category.h"

@implementation NSObject (category)

//声明全局变量，作为关联对象的key
static char associatedObjectKey;

+(NSArray *)bw_objcProperties{
    
    //获取关联对象
    NSArray *ptyList =objc_getAssociatedObject(self, &associatedObjectKey);
    if (ptyList) {
        return ptyList;
    }
    /* 调用运行时方法, 取得类的属性列表 */
    unsigned int count=0;
    /**
     * 参数1: 要获取得类
     * 参数2: 类属性的个数指针
     * 返回值: 所有属性的数组, C 语言中,数组的名字,就是指向第一个元素的地址
     */
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arr=[NSMutableArray array];
    
    for (unsigned int i=0; i<count; i++) {
        
        objc_property_t property=propertyList[i];
        
        const char *propertyName_C=property_getName(property);
        
        NSString *propertyName_OC=[NSString stringWithUTF8String:propertyName_C];
        
        [arr addObject:propertyName_OC];
    }
    /* 设置关联对象 */
    /**
     *  参数1 : 对象self
     *  参数2 : 动态添加属性的 key
     *  参数3 : 动态添加属性
     *  参数4 : 对象的引用关系
     */
    objc_setAssociatedObject(self, &associatedObjectKey, arr.copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    free(propertyList);
    return arr.copy;

}
+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    //实例化对象
    id objc=[[self alloc]init];
    
    //使用字典设置对象信息
    /* 1. 获得 self 的属性列表 */
    NSArray *array=[self bw_objcProperties];
    /* 2. 遍历字典 */
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        /* 3. 判断 key 是否在 propertyList 中 */
        if ([array containsObject:key]) {
            /* 说明属性存在,可以使用 KVC 设置数值 */
            [objc setValue:obj forKey:key];
        }
    }];
    return objc;
}
@end
