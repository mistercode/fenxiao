//
//  FeedBackViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController
@synthesize FeedBacktext,phonetextfield,submitBtn,promptLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    FeedBacktext.delegate = self;
    phonetextfield.delegate = self;
    phonetextfield.keyboardType = UIKeyboardTypeNumberPad;
    FeedBacktext.autocapitalizationType = UITextAutocorrectionTypeNo;
    [[submitBtn layer]setCornerRadius: 7.0];
    [submitBtn addTarget:self action:@selector(subtouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [[FeedBacktext layer] setBorderWidth:0.5];//画线的宽度
    [[FeedBacktext layer] setBorderColor:[UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1 ].CGColor];//颜色
    [[FeedBacktext layer]setCornerRadius:8.0];//圆角
    // Do any additional setup after loading the view from its nib.
    [self preferredStatusBarStyle];
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    promptLabel.hidden = YES;
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [self upView];
    }
    return YES;
}
//输入完成以后
- (void)textViewDidEndEditing:(UITextView *)textView{
    if(textView.text.length<=200){
        
    }else{
        [self myAlectView:@"您输入的内容超出规定范围" andbuttonGut:@"确定"];
    }
   
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    [self upView];
          return YES;
      }
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self viewRestore];
    return YES;
}

//点击空白处隐藏键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
// 隐藏键盘
    [self tapHideKeyboard];
       [self viewRestore];
    if (FeedBacktext.text.length == 0) {
        
        promptLabel.hidden = NO;
    }
}


- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//上移屏幕
-(void)upView{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //上移n个单位，按实际情况设置
    CGRect rect=CGRectMake(0.0f,-120,width,height);
    self.view.frame=rect;
    [UIView commitAnimations];
}
//把屏幕还原
-(void)viewRestore{
    //   设置一个定时器
    NSTimeInterval animationDuration=0.30f;
    //
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //    设置宽为view自身的宽
    float width = self.view.frame.size.width;
    //    设置高为view自身的高
    float height = self.view.frame.size.height;
    //上移n个单位，按实际情况设置
    CGRect rect=CGRectMake(0,0,width,height);
    self.view.frame=rect;
    //    提交动画设定
    [UIView commitAnimations];
}
-(void)subtouchBtn:(UIButton *)btn{
    [self viewRestore];
    [self tapHideKeyboard];
    if (FeedBacktext.text.length > 0 && FeedBacktext.text.length <= 200) {
        CLog(@"提交");
    }else{
        promptLabel.hidden = NO;
        [self myAlectView:@"您输入的内容不在规定范围" andbuttonGut:@"确定"];
    }
   
}
-(void)myAlectView:(NSString *)gut andbuttonGut:(NSString *)buttonGut{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:gut delegate:self cancelButtonTitle:nil otherButtonTitles:buttonGut, nil];
    [alert show];
}
-(void)tapHideKeyboard{
    [FeedBacktext resignFirstResponder];
    [phonetextfield resignFirstResponder];

}
@end
