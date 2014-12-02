//
//  RegisterFactoryViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterFactoryViewController : UIViewController
@property (nonatomic,weak) IBOutlet UIButton *backButton;


@property (nonatomic,weak) IBOutlet UIButton *userBtn;
@property (nonatomic,weak) IBOutlet UIButton *preserveBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *factoryScrollerView;


@end
