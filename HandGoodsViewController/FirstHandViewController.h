//
//  FirstHandViewController.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstHandViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *popularityBtn;
@property (weak, nonatomic) IBOutlet UIButton *directBtn;
@property (weak, nonatomic) IBOutlet UIButton *interBtn;
@property (weak, nonatomic) IBOutlet UIButton *residueBtn;
@property (weak, nonatomic) IBOutlet UIButton *lowBtn;
@property (weak, nonatomic) IBOutlet UIButton *heightBtn;
@property (weak, nonatomic) IBOutlet UIButton *bootsBtn;
@property (weak, nonatomic) IBOutlet UIButton *sandalBtn;
@property (weak, nonatomic) IBOutlet UIButton *slipperBtn;
@property (weak, nonatomic) IBOutlet UITableView *firstHandTableView;


-(void)setSortStr:(NSString *)theSort;

-(void)setSelectArray:(NSMutableArray *)theArray;

-(void)setSearchStr:(NSString *)theSearchStr;

@end
