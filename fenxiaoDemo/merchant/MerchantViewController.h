//
//  MerchantViewController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "moreView.h"
@interface MerchantViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,btndelegate>{
    moreView *MV;
    UIView *backgroundView;
}
- (IBAction)goBack:(id)sender;
- (IBAction)more:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *MerchantTV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

//市场商家
@property (weak, nonatomic) IBOutlet UIButton *MarketBtn;
//高级认证
@property (weak, nonatomic) IBOutlet UIButton *advancedBtn;
//生产厂家
@property (weak, nonatomic) IBOutlet UIButton *productionBtn;
//外部商家
@property (weak, nonatomic) IBOutlet UIButton *sansBtn;

@end
