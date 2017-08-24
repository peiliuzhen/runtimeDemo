//
//  SixViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "SixViewController.h"
#import "BWModel.h"
@interface SixViewController ()

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"归档.解档";
    
    BWModel *model=[[BWModel alloc]init];
    
    model.age=26;
    model.name1=@"詹姆斯";
    model.name2=@"欧文";
    model.name3=@"勒夫";
    model.name4=@"史密斯";
    model.name5=@"汤普森";
    
    //创建归档路径
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    DLog(@"path=%@",path);
    
    NSString *filePath=[path stringByAppendingPathComponent:@"BWModel.data"];
    
    //存储用户信息 归档
    BOOL result=[NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
    if (result) {
        
        DLog(@"归档成功:%@",filePath);
    }else{
        
        DLog(@"归档失败");
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //解档
    
    //归档路径
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *filePath=[path stringByAppendingPathComponent:@"BWModel.data"];
    
    BWModel *model=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    DLog(@"%ld",(long)model.age);
    DLog(@"%@",model.name1);
    DLog(@"%@",model.name2);
    DLog(@"%@",model.name3);
    DLog(@"%@",model.name4);
    DLog(@"%@",model.name5);

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
