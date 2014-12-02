//
//  LoginViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UIButton *loginButton;
@property (nonatomic,weak) IBOutlet UIButton *regButton;
@property (nonatomic,weak) IBOutlet UIButton *secretButton;
@property (nonatomic,weak) IBOutlet UIImageView *userImage;
@property (nonatomic,weak) IBOutlet UIImageView *secretImage;
@property (nonatomic,weak) IBOutlet UITextField *username;
@property (nonatomic,weak) IBOutlet UITextField *password;


@property (nonatomic,weak) IBOutlet UIView *navView;
@property (nonatomic,weak) IBOutlet UIButton *backButton;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

-(IBAction)loginBtn:(id)sender;
-(IBAction)regBtn:(id)sender;
-(IBAction)secretBtn:(id)sender;
-(IBAction)username:(id)sender;
-(IBAction)password:(id)sender;

-(IBAction)backBtn:(id)sender;
@end
