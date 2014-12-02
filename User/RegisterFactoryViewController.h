//
//  RegisterFactoryViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterFactoryViewController : UIViewController
@property (nonatomic,weak) IBOutlet UIView *navView;
@property (nonatomic,weak) IBOutlet UIButton *backButton;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

@property (nonatomic,weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic,weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic,weak) IBOutlet UILabel *confirmLabel;
@property (nonatomic,weak) IBOutlet UILabel *fullNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *telephoneLabel;
@property (nonatomic,weak) IBOutlet UILabel *keepBackLabel;
@property (nonatomic,weak) IBOutlet UILabel *emailLabel;
@property (nonatomic,weak) IBOutlet UILabel *qqLabel;
@property (nonatomic,weak) IBOutlet UILabel *webLabel;
@property (nonatomic,weak) IBOutlet UILabel *testLabel;

@property (nonatomic,weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic,weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic,weak) IBOutlet UITextField *confirmTextField;
@property (nonatomic,weak) IBOutlet UITextField *fullNameTextField;
@property (nonatomic,weak) IBOutlet UITextField *telephoneTextField;
@property (nonatomic,weak) IBOutlet UITextField *keepBackTextField;
@property (nonatomic,weak) IBOutlet UITextField *emailTextField;
@property (nonatomic,weak) IBOutlet UITextField *qqTextField;
@property (nonatomic,weak) IBOutlet UITextField *webTextField;
@property (nonatomic,weak) IBOutlet UITextField *testTextField;

@property (nonatomic,weak) IBOutlet UIButton *factoryBtn;
@property (nonatomic,weak) IBOutlet UIButton *userBtn;
@property (nonatomic,weak) IBOutlet UIButton *preserveBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,weak) IBOutlet UIImageView *testView;

-(IBAction)userBtn:(id)sender;
-(IBAction)preserveBtn:(id)sender;
-(IBAction)backBtn:(id)sender;
-(IBAction)usernameTextField:(id)sender;
-(IBAction)passwordTextField:(id)sender;
-(IBAction)confirmTextField:(id)sender;
-(IBAction)fullNameTextField:(id)sender;
-(IBAction)telephoneTextField:(id)sender;
-(IBAction)keepBackTextField:(id)sender;
-(IBAction)emailTextField:(id)sender;
-(IBAction)qqTextField:(id)sender;
-(IBAction)webTextField:(id)sender;
-(IBAction)testTextField:(id)sender;


@end
