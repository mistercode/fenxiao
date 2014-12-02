//
//  FeedBackViewController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *FeedBacktext;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UITextField *phonetextfield;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

- (IBAction)goBack:(id)sender;
@end
