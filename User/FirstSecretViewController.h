//
//  FirstSecretViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstSecretViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIButton *backButton;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

@property (nonatomic,weak) IBOutlet UIImageView *keyView;
@property (nonatomic,weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic,weak) IBOutlet UILabel *testLabel;
@property (nonatomic,weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic,weak) IBOutlet UITextField *testTextField;
@property (nonatomic,weak) IBOutlet UIButton *nextBtn;
-(IBAction)nextBtn:(id)sender;
-(IBAction)backBtn:(id)sender;
@end
