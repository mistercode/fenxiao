//
//  HomeViewController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/12/1.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTF;
- (IBAction)searchBtn:(id)sender;
- (IBAction)noticeBtn:(id)sender;

@end
