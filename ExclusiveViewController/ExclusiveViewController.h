//
//  ExclusiveViewController.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExclusiveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *lowBtn;
@property (weak, nonatomic) IBOutlet UIButton *heightBtn;
@property (weak, nonatomic) IBOutlet UIButton *bootBtn;
@property (weak, nonatomic) IBOutlet UIButton *slipperBtn;
@property (weak, nonatomic) IBOutlet UIButton *sandalBtn;

-(void)setSelectArray:(NSMutableArray *)theArray;

-(void)setSortStr:(NSString *)theSort;

-(void)setSearchStr:(NSString *)theSearchStr;

@end
