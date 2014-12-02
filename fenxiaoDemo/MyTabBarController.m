//
//  MyTabBarController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/20.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"//主页
#import "bViewController.h"//今日新品
#import "MerchantStallsViewController.h"//档口商家
#import "ForumViewController.h"//论坛
#import "PersonalCenterViewController.h"//个人中心

@interface MyTabBarController ()

@end

@implementation MyTabBarController
float width;
float height;
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.tabBar.hidden = YES;
//    隐藏所有的包含UITabBar的都隐藏掉
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITabBar class]]) {
            view.hidden = YES;
            
            break;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self xitongtabbar];
    [self loadCustomTabBarView];
   
}

-(void)xitongtabbar{
    HomeViewController *HomeVC = [[HomeViewController alloc]init];
    UINavigationController *navHome = [[UINavigationController alloc]initWithRootViewController:HomeVC];
    anitemHome = [[UITabBarItem alloc]init];
    navHome.tabBarItem = anitemHome;
    
    bViewController *bv = [[bViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:bv];
    anitemScale = [[UITabBarItem alloc]init];
    nav2.tabBarItem = anitemScale;
    
    MerchantStallsViewController *MerchantStallsVC = [[MerchantStallsViewController alloc]init];
    UINavigationController *navMerchant = [[UINavigationController alloc]initWithRootViewController:MerchantStallsVC];
    anitemMerchant = [[UITabBarItem alloc]init];
    navMerchant.tabBarItem = anitemMerchant;
    
    ForumViewController *forumVC = [[ForumViewController alloc]init];
    UINavigationController *navForum = [[UINavigationController alloc]initWithRootViewController:forumVC];
    anitemForum = [[UITabBarItem alloc]init];
    navForum.tabBarItem = anitemForum;
    
    PersonalCenterViewController *personalCenterVC = [[PersonalCenterViewController alloc]init];
    UINavigationController *navPerson = [[UINavigationController alloc]initWithRootViewController:personalCenterVC];
    anitemPerson = [[UITabBarItem alloc]init];
    navPerson.tabBarItem = anitemPerson;
       self.viewControllers = @[navHome,nav2,navMerchant,navForum,navPerson];
    //       隐藏tabBar
    self.tabBar.hidden = YES;
}
//装在自定义tabbar(层次：背景（最下） 选中图片（中间） 按钮（最上）)
-(void)loadCustomTabBarView{
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽、高度
    width = bounds.size.width;
    height = bounds.size.height;
    //1、    设置背景
    //    初始化自定义的Tabbar并添加背景图片
    tabBarBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, height-49, width, 49)];
    //    打开imageview的点击事件
    tabBarBG.userInteractionEnabled = YES;
    tabBarBG.image= [UIImage imageNamed:@"dicao_17"];
    [self.view addSubview:tabBarBG];
//    主页
    homeBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 37, 30)];
    homeBtn.tag = 100;
//    选中之前的状态
    [homeBtn setImage:[UIImage imageNamed:@"home1"] forState:UIControlStateNormal];
//    选中以后的状态
    [homeBtn setImage:[UIImage imageNamed:@"home2"] forState:UIControlStateSelected];
    //    启动就要直接进入第二个 所以直接设置button的选中状态（selected） 等于YES
    homeBtn.selected = YES;
    [homeBtn addTarget:self action:@selector(viewSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBG addSubview:homeBtn];
//    今日新品
    scaleBtn = [[UIButton alloc]initWithFrame:CGRectMake(width/4-5,10,40, 30)];
    scaleBtn.tag = 101;
    [scaleBtn setImage:[UIImage imageNamed:@"today1"] forState:UIControlStateNormal];
    [scaleBtn setImage:[UIImage imageNamed:@"today2"] forState:UIControlStateSelected];
    [scaleBtn addTarget:self action:@selector(viewSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBG addSubview:scaleBtn];
//    档口商家
    merchantBtn = [[UIButton alloc]initWithFrame:CGRectMake(width/2-20, 10, 40, 30)];
    merchantBtn.tag = 102;
    [merchantBtn setImage:[UIImage imageNamed:@"shop1"] forState:UIControlStateNormal];
    [merchantBtn setImage:[UIImage imageNamed:@"shop2"] forState:UIControlStateSelected];
    [merchantBtn addTarget:self action:@selector(viewSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBG addSubview:merchantBtn];
//    论坛
    forumBtn = [[UIButton alloc]initWithFrame:CGRectMake(width-width/4-35, 10, 33, 30)];
    forumBtn.tag = 103;
    [forumBtn setImage:[UIImage imageNamed:@"lt1"] forState:UIControlStateNormal];
    [forumBtn setImage:[UIImage imageNamed:@"lt2"] forState:UIControlStateSelected];
    [forumBtn addTarget:self action:@selector(viewSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBG addSubview:forumBtn];
//    个人中心
    personBtn = [[UIButton alloc]initWithFrame:CGRectMake(width-60, 10, 40, 30)];
    personBtn.tag = 104;
    [personBtn setImage:[UIImage imageNamed:@"my1"] forState:UIControlStateNormal];
    [personBtn setImage:[UIImage imageNamed:@"my2"] forState:UIControlStateSelected];
    [personBtn addTarget:self action:@selector(viewSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBG addSubview:personBtn];
    
  
    }
-(void)viewSwitch:(UIButton *)mybutton{
//    选中以后把他们的选中属性都设置成NO只有选中的这个才是YES
    homeBtn.selected = NO;
    scaleBtn.selected  = NO;
    merchantBtn.selected = NO;
    forumBtn.selected = NO;
    personBtn.selected = NO;
    mybutton.selected = YES;
    //selectedIndex控制UITabBarController上的页面是第几个
    self.selectedIndex = mybutton.tag-100;
    CLog(@"%ld",mybutton.tag-100);
}
//显示tabbar
-(void)showtabbar{
//   tabBarBG.hidden = NO;
    [UIView beginAnimations:nil context:nil];
     tabBarBG.Frame = CGRectMake(0, height-49, width, 49);
    [UIView commitAnimations];
}
//隐藏tabbar
-(void)hidetabbat{
//    tabBarBG.hidden = YES;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.23];
    
    tabBarBG.frame = CGRectMake(-0, height+49, width, 49);
    //    结束动画
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

@end
