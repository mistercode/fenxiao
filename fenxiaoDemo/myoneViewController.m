//
//  myoneViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/20.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "myoneViewController.h"
#import "MyTabBarController.h"
@interface myoneViewController ()

@end

@implementation myoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    显示navigationbar
    self.navigationController.navigationBarHidden = NO;
    //    初始化的时候注意转下
    MyTabBarController *MtB = (MyTabBarController *)self.tabBarController;
    [MtB hidetabbat];
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
