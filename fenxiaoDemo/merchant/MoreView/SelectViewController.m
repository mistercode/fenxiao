//
//  SelectViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@end

@implementation SelectViewController
@synthesize selectTF;
- (void)viewDidLoad {
    [super viewDidLoad];
    selectTF.delegate = self;
   
    // Do any additional setup after loading the view from its nib.
    [self preferredStatusBarStyle];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gobackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//点击return隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [selectTF resignFirstResponder];
    return YES;
}
//点击空白处隐藏键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [selectTF resignFirstResponder];
}
@end
