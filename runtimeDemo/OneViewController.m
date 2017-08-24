//
//  OneViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "OneViewController.h"
#import "UIGestureRecognizer+Block.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"动态给分类添加属性";
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 200, kScreenWidth-200, 40)];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
    [view addGestureRecognizer:[UITapGestureRecognizer bw_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        
        DLog(@"动态给分类添加属性成功");
    }]];
    
    //UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ww)];
   // [view addGestureRecognizer:tap];
}

-(void)ww{
    
    NSLog(@"ww");
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
