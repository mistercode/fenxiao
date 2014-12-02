//
//  LoginViewController.m
//  fenxiaoDemo
//
//  Created by 123 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterFactoryViewController.h"
#import "MyTabBarController.h"
#import "FirstSecretViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
  [[loginButton layer]setCornerRadius:8.0];//圆角
    //[self createNav];
   // [self createUI];
    
    // Do any additional setup after loading the view from its nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    隐藏导航条
    //    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.tabBarItem.image = [UIImage imageNamed:@"user1"];
    [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"user2"]];
    
    MyTabBarController *tabBar = (MyTabBarController*)self.tabBarController;
    [tabBar hidetabbat];

}

-(void)createNav
{
    
//    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _backButton.frame = CGRectMake(10, 10, 20, 30);
//    [_backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
//    [_backButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 414, 50)];
//    
//    _navView.backgroundColor =[UIColor colorWithRed:232/255.0 green:32/255.0 blue:92/255.0 alpha:1.0];
//    
//    [self.view addSubview:_navView];
//    [_navView addSubview:_backButton];
    
//    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 0, 80, 50)];
//    _titleLabel.text = @"登录";
//    _titleLabel.textColor = [UIColor whiteColor];
//    _titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:25];
//    [_navView addSubview:_titleLabel];
}

-(IBAction)username:(id)sender
{
   
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextField *userField = (UITextField *)[self.view viewWithTag:1];
    UITextField *secretField = (UITextField *)[self.view viewWithTag:2];
    if([userField.text isEqualToString:@"admin"]&&[secretField.text isEqualToString:@"123"])
    {
        CLog(@"我登录成功了");
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:userField.text forKey:@"用户名"];
        [user setObject:secretField.text forKey:@"密码"];
        [user synchronize];
    }
    else
    {
        CLog(@"你的账号密码有误");
    }
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *nameStr=[user objectForKey:@"用户名"];
    NSString *passWordStr=[user objectForKey:@"密码"];
    if(nameStr)
    {
        ((UITextField *)[self.view viewWithTag:5000]).text=nameStr;
        ((UITextField *)[self.view viewWithTag:5001]).text=passWordStr;
    }

    [_password resignFirstResponder];
    
    return YES;
}

//返回按钮事件
-(IBAction)backBtn:(id)sender
{
//    MyTabBarController *myTabBar = [[MyTabBarController alloc]init];
//    
//    [self.navigationController popToViewController:myTabBar animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(IBAction)password:(id)sender
{
//    [_password resignFirstResponder];
    
}

-(IBAction)loginBtn:(id)sender
{
    
}

//注册按钮事件
-(IBAction)regBtn:(id)sender

{
   RegisterFactoryViewController *reg = [[RegisterFactoryViewController alloc] init];
    [self.navigationController pushViewController:reg animated:YES];
        
}
//忘记密码按钮事件
-(IBAction)secretBtn:(id)sender
{
    FirstSecretViewController *firstSecret = [[FirstSecretViewController alloc] init];
    [self.navigationController pushViewController:firstSecret animated:YES];
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
