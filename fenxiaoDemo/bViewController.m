//
//  bViewController.m
//  2.自定义UItabbar
//
//  Created by 杨炯 on 14/11/12.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "bViewController.h"
#import "myoneViewController.h"
#import "MyTabBarController.h"
#import "VenderViewController.h"
#import "MerchantViewController.h"
#import "ExclusiveViewController.h"
#import "FirstHandViewController.h"
#import "NoteViewController.h"
@interface bViewController ()

@end

@implementation bViewController
float height;
float width;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self Putthecontrol];
    [self addbutton];
    [self preferredContentSize];
    // Do any additional setup after loading the view.
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)addbutton{
    float scale = width/320;
    
    
    UIScrollView *scro = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, width, height-49)];
    [self.view addSubview:scro];
    float widthsc = scro.frame.size.width-30;
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *onlyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    onlyBtn.frame = CGRectMake(10, 0, widthsc/2, 489/2 * scale);
    [onlyBtn setImage:[UIImage imageNamed:@"home_03.png"] forState:UIControlStateNormal];
    onlyBtn.tag = 11;
    [onlyBtn addTarget:self action:@selector(exclusiveClick:) forControlEvents:UIControlEventTouchUpInside];
    [scro addSubview:onlyBtn];
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame = CGRectMake(widthsc/2+20 , 0, widthsc/2, 489/2*scale);
    [oneBtn setImage:[UIImage imageNamed:@"home_05.png"] forState:UIControlStateNormal];
    oneBtn.tag = 12;
    [oneBtn addTarget:self action:@selector(exclusiveClick:) forControlEvents:UIControlEventTouchUpInside];
    [scro addSubview:oneBtn];
    
    //  ++++++++++++++++++++++++++++++++++++++++++++++
    UIButton *marketBtn = [[UIButton alloc]initWithFrame:CGRectMake(10,onlyBtn.frame.size.height+10, widthsc/2, 489/2 * scale)];
    [marketBtn setImage:[UIImage imageNamed:@"home_09"] forState:UIControlStateNormal];
    [marketBtn addTarget:self action:@selector(pushMerchant) forControlEvents:UIControlEventTouchUpInside];
    [scro addSubview:marketBtn];
    
    UIButton *giveBtn = [[UIButton alloc]initWithFrame:CGRectMake(20+widthsc/2, onlyBtn.frame.size.height + 10, widthsc/2, 489/2 * scale)];
    [giveBtn setImage:[UIImage imageNamed:@"home_10"] forState:UIControlStateNormal];
    [giveBtn addTarget:self action:@selector(pushVender) forControlEvents:UIControlEventTouchUpInside];
    [scro addSubview:giveBtn];
    
   
    
    [scro setContentSize:CGSizeMake(width, giveBtn.frame.size.height + giveBtn.frame.origin.y + 10)];
    scro.scrollEnabled = NO;
    if (height == 480) {
        scro.scrollEnabled = YES;
    }
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    homeBtn.bounds = CGRectMake(0, 0, 220*scale, 220*scale);
        homeBtn.center = CGPointMake(width/2, (scro.contentSize.height)/2-5);
    homeBtn.tag = 13;
    [[homeBtn layer]setCornerRadius:100];//圆角
    [homeBtn setImage:[UIImage imageNamed:@"yuan_08"] forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(exclusiveClick:) forControlEvents:UIControlEventTouchUpInside];
    [scro addSubview:homeBtn];
    
}

-(void)exclusiveClick:(UIButton *)btn
{
    if (btn.tag == 11) {
        ExclusiveViewController *exViewController = [[ExclusiveViewController alloc]init];
        [self.navigationController pushViewController:exViewController animated:YES];
    }else if (btn.tag == 12){
        FirstHandViewController *firstHandVC = [[FirstHandViewController alloc]init];
        [self.navigationController pushViewController:firstHandVC animated:YES];
    }else if (btn.tag == 13){
        NoteViewController *noteVC = [[NoteViewController alloc]init];
        [self.navigationController pushViewController:noteVC animated:YES];
    }
    
}
-(void)pushMerchant{
    MerchantViewController *merchanVC = [[MerchantViewController alloc]init];
    [self.navigationController pushViewController:merchanVC animated:YES];
}
//生产厂家
-(void)pushVender{
    VenderViewController *VenderVC = [[VenderViewController alloc]init];
    [self.navigationController pushViewController:VenderVC animated:YES];
}
-(void)onlyClick{
    myoneViewController *myVC = [[myoneViewController alloc]init];
    [self.navigationController pushViewController:myVC animated:YES];
}
//系统方法，视图即将可见时调用。默认情况下不执行任何操作
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    隐藏导航条
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    隐藏自定义的tabbar的时候要转下
    MyTabBarController *mVC = (MyTabBarController*)self.tabBarController;
    [mVC showtabbar];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Putthecontrol{
    
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽、高度
    width = bounds.size.width ;
    height = bounds.size.height;
    
}

@end
