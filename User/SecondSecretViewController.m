//
//  SecondSecretViewController.m
//  fenxiaoDemo
//
//  Created by 123 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "SecondSecretViewController.h"
#import "ThirdSecretViewController.h"
@interface SecondSecretViewController ()

@end

@implementation SecondSecretViewController
@synthesize nextBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
     [[nextBtn layer]setCornerRadius:8.0];//圆角
    // Do any additional setup after loading the view from its nib.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
//    
//    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 100, 50)];
//    _titleLabel.text = @"密码找回";
//    _titleLabel.textColor = [UIColor whiteColor];
//    _titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:25];
//    [_navView addSubview:_titleLabel];
}

-(void)btnClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)backBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)nextBtn:(id)sender
{
    ThirdSecretViewController *thirdSecret = [[ThirdSecretViewController alloc] init];
    [self.navigationController pushViewController:thirdSecret animated:YES];
     CLog(@"========下一步========");
}
-(IBAction)testBtn:(id)sender
{
    CLog(@"========发送验证至邮箱®========");
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
