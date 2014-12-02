//
//  JudgeViewController.h
//  fenxiaoDemo
//
//  Created by 123 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JudgeViewController : UIViewController

@property (nonatomic,weak) IBOutlet UILabel *judgeLabel;
@property (nonatomic,weak) IBOutlet UILabel *serverLabel;
@property (nonatomic,weak) IBOutlet UILabel *UILabel;
@property (nonatomic,weak) IBOutlet UILabel *functionLabel;
@property (nonatomic,weak) IBOutlet UILabel *otherLabel;

@property (nonatomic,weak) IBOutlet UILabel *oneLabel;
@property (nonatomic,weak) IBOutlet UILabel *twoLabel;
@property (nonatomic,weak) IBOutlet UILabel *threeLabel;

@property (nonatomic,weak) IBOutlet UIButton *submitBtn;
@property (nonatomic,weak) IBOutlet UIButton *backBtn;
@property (nonatomic,weak) IBOutlet UITextView *judgeTextView;


@end
