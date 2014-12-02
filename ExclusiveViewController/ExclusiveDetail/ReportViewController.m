//
//  ReportViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()
{
    float width;
    float height;
    NSArray *reportArray;
    UITextView *reasonText;
    NSString *reasonStr;
    UIView *reportKindBg;
}

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, width, height - 70)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    [self loadReportView];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadReportView
{
    reportKindBg = [[UIView alloc]initWithFrame:CGRectMake(10, 90, width, 480)];
    [self.view addSubview:reportKindBg];
    
    float xPoint = (width-255)/2;
    
    reportArray = [NSArray arrayWithObjects:@"标价与市价格不符",@"产品已停止供货",@"经常缺货,供货极不稳定",@"产品质量很糟糕",@"不提供售后服务",@"文字描述与实物不符",@"非实拍图片与实物不符", nil];
    
    UILabel *reportTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(xPoint, 0, 80, 30)];
    reportTitleLabel.text = @"投诉类型:";
    reportTitleLabel.font = [UIFont boldSystemFontOfSize:16];
    [reportKindBg addSubview:reportTitleLabel];
    
    UIImageView *btnBg = [[UIImageView alloc]initWithFrame:CGRectMake(xPoint + reportTitleLabel.frame.size.width, 0, 175, 210)];
    [btnBg setImage:[UIImage imageNamed:@"report_bg.png"]];
    btnBg.userInteractionEnabled = YES;
    [reportKindBg addSubview:btnBg];
    
    for (int i = 0; i < 7; i ++) {
        UIButton *reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        reportBtn.frame = CGRectMake(0, i * 30, 175, 30);
        reportBtn.tag = 100 + i;
        reportBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 15];
        [reportBtn setTitle:[NSString stringWithFormat:@"%@",[reportArray objectAtIndex:i]] forState:UIControlStateNormal];
        [reportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [reportBtn setTitleColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0] forState:UIControlStateSelected];
        [reportBtn addTarget:self action:@selector(reportBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnBg addSubview:reportBtn];
    }
    
    UILabel *reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake(xPoint, 210, 80, 30)];
    reasonLabel.text = @"投诉理由:";
    reasonLabel.font = [UIFont boldSystemFontOfSize:16];
    [reportKindBg addSubview:reasonLabel];
    
    
    reasonText = [[UITextView alloc]initWithFrame:CGRectMake(xPoint, 240, 255, 100)];
    [[reasonText layer] setBorderWidth:0.5];//画线的宽度
    [[reasonText layer] setBorderColor:[UIColor blackColor].CGColor];//颜色
    [[reasonText layer]setCornerRadius:8.0];//圆角
    reasonText.delegate = self;
    [reportKindBg addSubview:reasonText];
    
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitBtn setImage:[UIImage imageNamed:@"report_btn.png"] forState:UIControlStateNormal];
    commitBtn.frame = CGRectMake(width/2 - 75/2, 350, 75, 25);
    [commitBtn addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    [reportKindBg addSubview:commitBtn];
    
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 20)];
    titleView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titleView];
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, width, 50)];
    
    [navView setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(8, 13, 13, 23);
    [backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:backBtn];
    float yPoint = width/2 - 50;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(yPoint, 10, 100, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:@"投诉"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [navView addSubview:titleLabel];
    
    [self.view addSubview:navView];

}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    reportKindBg.frame = CGRectMake(10, 90 - 216, width, 480);
    [UIView commitAnimations];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    reportKindBg.frame = CGRectMake(10, 90, width, 480);
    [UIView commitAnimations];
    return YES;
}

-(void)commitClick
{
    CLog(@"---->>>>%@----%@",reasonStr,reasonText.text);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [reasonText resignFirstResponder];
}

- (void)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)reportBtnClick:(UIButton *)btn
{
    for (int i = 0; i < 7; i ++) {
        UIButton *currentBtn = (UIButton *)[self.view viewWithTag:100+i];
        currentBtn.selected = NO;
    }
    reasonStr = [reportArray objectAtIndex:btn.tag - 100];
    btn.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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



@end
