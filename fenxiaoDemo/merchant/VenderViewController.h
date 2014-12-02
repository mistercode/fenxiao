//
//  VenderViewController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "moreView.h"
@interface VenderViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,btndelegate>{
    UIView *backgroundView;
}
@property (weak, nonatomic) IBOutlet UITableView *Vendertableview;
@property (weak,nonatomic) IBOutlet UILabel *titleLabel;
//市场商家
@property (weak, nonatomic) IBOutlet UIButton *MarketBtn;
//高级认证
@property (weak, nonatomic) IBOutlet UIButton *advancedBtn;
//生产厂家
@property (weak, nonatomic) IBOutlet UIButton *productionBtn;
//外部商家
@property (weak, nonatomic) IBOutlet UIButton *sansBtn;


//返回
- (IBAction)backHome:(id)sender;
//更多
- (IBAction)more:(id)sender;

@end
