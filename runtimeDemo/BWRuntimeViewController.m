//
//  BWRuntimeViewController.m
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import "BWRuntimeViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "fiveViewController.h"
#import "SixViewController.h"
#import "SenvenViewController.h"
@interface BWRuntimeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *array;
@end

@implementation BWRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    self.title = @"Runtime使用场景";
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];

    if (_array) {
        
        _array=[NSArray array];
        
    }
    _array=@[@"1.动态给分类添加属性",
             @"2.方法的交换swizzling",
             @"3.字典转模型",
             @"4.获取所有的私有属性和方法",
             @"5.对私有属性修改",
             @"6.归档解档",
             @"7.动态添加方法"
             ];

    [self.view addSubview:self.tableView];
    
    
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _array.count;;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"cellIdentifier";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=_array[indexPath.row];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            
            OneViewController *oneVC=[[OneViewController alloc]init];
            [self.navigationController pushViewController:oneVC animated:YES];

        }
            break;
            
        case 1:{
            
            TwoViewController *twoVC=[[TwoViewController alloc]init];
            [self.navigationController pushViewController:twoVC animated:YES];
        }
            break;
        case 2:{
            ThreeViewController *threeVC=[[ThreeViewController alloc]init];
            [self.navigationController pushViewController:threeVC animated:YES];
        }
            break;
        case 3:{
            FourViewController *fourVC=[[FourViewController alloc]init];
            [self.navigationController pushViewController:fourVC animated:YES];
        }
            break;
        case 4:{
            fiveViewController *fiveVC=[[fiveViewController alloc]init];
            [self.navigationController pushViewController:fiveVC animated:YES];
        }
            break;
        case 5:{
            SixViewController *sixVC=[[SixViewController alloc]init];
            [self.navigationController pushViewController:sixVC animated:YES];
        }
            break;
        case 6:{
            SenvenViewController *senVC=[[SenvenViewController alloc]init];
            [self.navigationController pushViewController:senVC animated:YES];
        }
            break;
        default:
            break;
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
