//
//  BWViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "BWViewController.h"
#import "BWRuntimeViewController.h"
@interface BWViewController ()

@end

@implementation BWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"Runtime";

    self.view.backgroundColor=[UIColor greenColor];

    UIButton *pushButton=[UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame=CGRectMake(100, 200, 200, 40);
    [pushButton setTitle:@"runtime" forState:UIControlStateNormal];
    [pushButton setBackgroundColor:[UIColor blueColor]];
    [pushButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(clickToRuntime:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton];
    
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
}

-(void)clickToRuntime:(UIButton *)sender{
    
    BWRuntimeViewController *runVC=[[BWRuntimeViewController alloc]init];
    
    [self.navigationController pushViewController:runVC animated:YES];
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
