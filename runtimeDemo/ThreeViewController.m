//
//  ThreeViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "ThreeViewController.h"
#import "Model.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary *dic = @{@"name":@"我爱NBA",
                          @"sex":@"男",
                          @"age":@23
                          };

    Model *model=[Model modelWithDict:dic];
    NSLog(@"name:%@  sex:%@ age:%@ ",model.name,model.sex,model.age);
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
