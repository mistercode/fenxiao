//
//  RegisterFactoryViewController.m
//  fenxiaoDemo
//
//  Created by 123 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "RegisterFactoryViewController.h"
#import "LoginViewController.h"

@interface RegisterFactoryViewController ()
{
    float width;
    float height;
    UIView *switchView;
    BOOL left;
    UIImageView *lineImage;
}

@end

@implementation RegisterFactoryViewController
@synthesize scrollView;
@synthesize preserveBtn;
@synthesize factoryScrollerView;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
   // [self createNav];
    [self putthecontrol];
     [[preserveBtn layer]setCornerRadius:8.0];//圆角
    
     [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 600)];
    // Do any additional setup after loading the view from its nib.
    UIButton *factoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    factoryBtn.frame = CGRectMake(0, 80, width/2, 30);
    [factoryBtn setTitle:@"注册成为厂家" forState:UIControlStateNormal];
    [factoryBtn setTitleColor:[UIColor colorWithRed:236/255.0 green:27/255.0 blue:89/255.0 alpha:1.0] forState:UIControlStateNormal];
    [factoryBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    factoryBtn.tag = 11;
    [factoryBtn addTarget:self action:@selector(userSwitchClick:) forControlEvents:UIControlEventTouchUpInside];
    factoryBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.view addSubview:factoryBtn];
    
    UIButton *userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.frame = CGRectMake(width/2, 80, width/2, 30);
    [userBtn setTitle:@"注册成用户" forState:UIControlStateNormal];
    [userBtn setTitleColor:[UIColor colorWithRed:236/255.0 green:27/255.0 blue:89/255.0 alpha:1.0] forState:UIControlStateNormal];
    [userBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    userBtn.tag = 12;
    [userBtn addTarget:self action:@selector(userSwitchClick:) forControlEvents:UIControlEventTouchUpInside];
    userBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.view addSubview:userBtn];
    

    
    switchView = [[UIView alloc]init];
    switchView.frame = CGRectMake(-width, 120, width*2, height-120);
    switchView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:switchView];
    
    scrollView.frame = CGRectMake(width, 0, width, height-120);
    [switchView addSubview:scrollView];
    
    factoryScrollerView.frame = CGRectMake(0, 0, width, height-120);
    [switchView addSubview:factoryScrollerView];
    
    lineImage = [[UIImageView alloc]init];
    [lineImage setImage:[UIImage imageNamed:@"register_line.png"]];
    lineImage.frame = CGRectMake(-(width - width/4), 110, width*2, 10);
    [self.view addSubview:lineImage];
    
    left = YES;
    
}

-(void)userSwitchClick:(UIButton *)btn
{
    if (btn.tag == 11) {
        if (!left) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:.25];
            switchView.frame = CGRectMake(-width, 120, width*2, height-120);
            lineImage.frame = CGRectMake(-(width - width/4), 110, width*2, 10);
            [UIView commitAnimations];

            left = YES;
        }
    }else{
        if (left) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:.25];
            switchView.frame = CGRectMake(0, 120, width*2, height-120);
            lineImage.frame = CGRectMake(- width/4, 110, width*2, 10);
            [UIView commitAnimations];

            left = NO;
        }
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//返回按钮事件
-(IBAction)backBtn:(id)sender
{
    lineImage.hidden = YES;
    switchView.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
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
-(void)putthecontrol{
    
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽、高度
    width = bounds.size.width ;
    height = bounds.size.height;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
