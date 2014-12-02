//
//  aViewController.m
//  2.自定义UItabbar
//
//  Created by 杨炯 on 14/11/12.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "aViewController.h"
#import "ApushViewController.h"
@interface aViewController ()

@end

@implementation aViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"1";
        self.view.backgroundColor = [UIColor redColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(90, 100, 140, 45)];
    [btn setTitle:@"PUSH" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(pushc) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
-(void)pushc{
    ApushViewController *cv = [[ApushViewController alloc]init];
    [self.navigationController pushViewController:cv animated:YES];
}
//系统方法，视图即将可见时调用。默认情况下不执行任何操作
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //显示标签栏
    self.tabBarController.tabBar.hidden = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
