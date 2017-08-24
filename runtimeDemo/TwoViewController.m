//
//  TwoViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"方法的交换";
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 100, kScreenWidth-100, kScreenHeight-200)];
    //实际图片的名字是new_Cart    
    [imageView setImage:[UIImage imageNamed:@"kebi"]];
    
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
