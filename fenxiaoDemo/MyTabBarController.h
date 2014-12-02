//
//  MyTabBarController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/20.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UITabBarController
{
    UIImageView *tabBarBG;
    UITabBarItem *anitemHome;
    UITabBarItem *anitemScale;
    UITabBarItem *anitemMerchant;
    UITabBarItem *anitemForum;
    UITabBarItem *anitemPerson;
    UIButton *homeBtn;
    UIButton *scaleBtn;
    UIButton *merchantBtn;
    UIButton *forumBtn;
    UIButton *personBtn;
    
}
-(void)showtabbar;
-(void)hidetabbat;
@end
