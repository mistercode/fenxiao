//
//  paixuViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "paixuViewController.h"

@interface paixuViewController ()

@end

@implementation paixuViewController
@synthesize freshInToBtn,delegateNumberBtn,productNumberBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    [freshInToBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    freshInToBtn.tag = 101;
    [delegateNumberBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    delegateNumberBtn.tag = 102;
    [productNumberBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    productNumberBtn.tag = 103;
    [self preferredStatusBarStyle];
    // Do any additional setup after loading the view from its nib.
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchBtn:(UIButton *)myBtn{
    switch (myBtn.tag) {
        case 101:
            CLog(@"newInto");
            break;
        case 102:
             CLog(@"delegateNumber");
            break;
        case 103:
             CLog(@"productNumber");
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
