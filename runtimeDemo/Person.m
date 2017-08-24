//
//  Person.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic,copy) NSString *address;

@end

@implementation Person

-(instancetype)init{
    
    self=[super init];
    
    if (self) {
        
        self.name=@"詹姆斯";
        self.address=@"迈阿密";
    }
    return self;
}

//共有方法
-(void)publicMethod{
    
    DLog(@"对外暴露的方法 %@",self.address);
}
-(void)pritaveMethod{
    
    DLog(@"私有方法%@",self.name);

}

-(NSString *)description{
    
    return [NSString stringWithFormat:@" %@,  %@",self.address,self.name];

}
@end
