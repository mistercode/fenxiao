//
//  setViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "setViewController.h"
#import "UMSocial.h"
#import "FeedBackViewController.h"
#import "SVStatusHUD.h"
#import "LoginViewController.h"
#import "FirstSecretViewController.h"
@interface setViewController ()

@end

@implementation setViewController
@synthesize fenxiang,pingjia,deCache,feedBack,loginUser,passwordFind,goBack;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"设置";
        [self preferredStatusBarStyle];
        // Custom initialization
    }
    return self;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [fenxiang addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    fenxiang.tag = 101;
    [pingjia addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    pingjia.tag = 102;
    [deCache addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    deCache.tag = 103;
    [feedBack addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    feedBack.tag = 104;
    [loginUser addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    loginUser.tag = 105;
    [passwordFind addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    passwordFind.tag = 106;
    [goBack addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    goBack.tag = 107;
    // Do any additional setup after loading the view from its nib.

}
-(void)touchBtn:(UIButton *)btn{
    FeedBackViewController *fbVC = [[FeedBackViewController alloc]init];
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    FirstSecretViewController *firstSecretVC = [[FirstSecretViewController alloc]init];
    
    switch (btn.tag) {
        case 101:
            [UMSocialSnsService presentSnsIconSheetView:self
                                                 appKey:@"54758072fd98c5b50e0009d5"
                                              shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                             shareImage:[UIImage imageNamed:@"icon"]
                                        shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,UMShareToFacebook,UMShareToTwitter,nil]
                                               delegate:nil];
            break;
            case 102:
            CLog(@"跳转appstore评价");
            break;
        case 103:
            CLog(@"清理缓存");
            [SVStatusHUD showWithImage:[UIImage imageNamed:@"sc"] status:@"清理完成"];
            break;
        case 104:
            CLog(@"意见反馈");
            [self.navigationController pushViewController:fbVC animated:YES];
            break;
        case 105:
            [self.navigationController pushViewController:loginVC animated:YES];
            CLog(@"用户登录");
            break;
        case 106:
            [self.navigationController pushViewController:firstSecretVC animated:YES];
            CLog(@"密码找回");
            break;
        case 107:
            CLog(@"退出");
            break;
            
        default:
            break;
    }
}

-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        CLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
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
