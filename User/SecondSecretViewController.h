//
//  SecondSecretViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondSecretViewController : UIViewController
@property (nonatomic,weak) IBOutlet UIView *navView;
@property (nonatomic,weak) IBOutlet UIButton *backButton;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

@property (nonatomic,weak) IBOutlet UIImageView *keyView;
@property (nonatomic,weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic,weak) IBOutlet UILabel *emailLabel;
@property (nonatomic,weak) IBOutlet UIButton *testBtn;
@property (nonatomic,weak) IBOutlet UIButton *nextBtn;
-(IBAction)nextBtn:(id)sender;
-(IBAction)testBtn:(id)sender;
-(IBAction)backBtn:(id)sender;
@end
