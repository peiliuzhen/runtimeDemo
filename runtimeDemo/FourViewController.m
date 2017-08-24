//
//  FourViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"获取所有的私有属性和方法";
    
    //获取UIPageControl的私有属性和方法
    [self getAllIvas];
    [self getAllPre];
    [self getAllProtocol];
    [self getAllMethod];
}

-(void)getAllIvas{
    
    unsigned int count;
    //Ivar：定义对象的实例变量，包括类型和名字
    Ivar *ivars=class_copyIvarList([UIPageControl class], &count);
    
    for (unsigned int i=0; i<count; i++) {
        
        Ivar ivar=ivars[i];
        
        const char *ivar_C=ivar_getName(ivar);
        const char *type_C=ivar_getTypeEncoding(ivar);
        
        NSString *ivar_OC=[NSString stringWithUTF8String:ivar_C];
        NSString *type_OC=[NSString stringWithUTF8String:type_C];
        
        DLog(@"ivar_OC=%@ type_OC=%@",ivar_OC,type_OC);
        
    }
}
-(void)getAllPre{
    
    unsigned int count;
    
    objc_property_t *propertyList=class_copyPropertyList([UIPageControl class], &count);
    for (unsigned int i=0; i<count; i++) {
        
        objc_property_t property=propertyList[i];
        
        const char *property_C=property_getName(property);
        
        NSString *property_OC=[NSString stringWithUTF8String:property_C];
        
        DLog(@"property_OC=%@",property_OC);
        
    }
    
}

-(void)getAllMethod{
    
    unsigned int count;
    
    Method *methods=class_copyMethodList([UIPageControl class], &count);
    for (unsigned int i=0; i<count; i++) {
        
        Method method=methods[i];
        
        SEL methodSel=method_getName(method);
        
        const char *method_C=sel_getName(methodSel);
        
        NSString *method_OC=[NSString stringWithUTF8String:method_C];
        
        DLog(@"method_OC=%@",method_OC);
        
    }
}

-(void)getAllProtocol{
    
    unsigned int count;
    
    __unsafe_unretained Protocol **protocols=class_copyProtocolList([UIPageControl class], &count);
    for (unsigned int i=0; i<count; i++) {
        
        Protocol *myprotocol=protocols[i];
        
        const char *property_C=protocol_getName(myprotocol);
        
        NSString *property_OC=[NSString stringWithUTF8String:property_C];
        
        DLog(@"property_OC=%@",property_OC);
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
