//
//  UIImage+category.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "UIImage+category.h"
@implementation UIImage (category)

+(void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass=object_getClass([self class]);
        
        SEL sel1=@selector(imageNamed:);
        Method m1=class_getInstanceMethod(selfClass, sel1);
        
        SEL sel2=@selector(myImageNamed:);
        Method m2=class_getInstanceMethod(selfClass, sel2);
        
        BOOL addSec=class_addMethod(selfClass, sel1, method_getImplementation(m2), method_getTypeEncoding(m2));
        
        
        if (addSec){
            class_replaceMethod(selfClass, sel2, method_getImplementation(m1), method_getTypeEncoding(m1));
            
        }else{
            
            method_exchangeImplementations(m1, m2);
        }

    });
}

+(UIImage *)myImageNamed:(NSString *)name{
    
    NSString *myname=[NSString stringWithFormat:@"%@%@",@"new_",name];
    
    return [self myImageNamed:myname];
}
@end
