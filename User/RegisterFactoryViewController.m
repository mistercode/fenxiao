//
//  RegisterFactoryViewController.m
//  fenxiaoDemo
//
//  Created by 123 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "RegisterFactoryViewController.h"
#import "LoginViewController.h"
#import "RegisterUserViewController.h"

@interface RegisterFactoryViewController ()

@end

@implementation RegisterFactoryViewController
@synthesize scrollView;
@synthesize preserveBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
   // [self createNav];
     [[preserveBtn layer]setCornerRadius:8.0];//圆角
    
     [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 600)];
    // Do any additional setup after loading the view from its nib.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//返回按钮事件
-(IBAction)backBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//
-(IBAction)userBtn:(id)sender
{
    RegisterUserViewController *user = [[RegisterUserViewController alloc]init];
    [self.navigationController pushViewController:user animated:NO];
}

-(IBAction)preserveBtn:(id)sender
{
    
}

-(IBAction)usernameTextField:(id)sender
{
    
}
-(IBAction)passwordTextField:(id)sender
{
    
}
-(IBAction)confirmTextField:(id)sender
{
    
}
-(IBAction)fullNameTextField:(id)sender
{
    
}
-(IBAction)telephoneTextField:(id)sender
{
    
}
-(IBAction)keepBackTextField:(id)sender
{
    
}
-(IBAction)emailTextField:(id)sender
{
    
}
-(IBAction)qqTextField:(id)sender
{
    
}
-(IBAction)webTextField:(id)sender
{
    
}
-(IBAction)testTextField:(id)sender
{
    
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
