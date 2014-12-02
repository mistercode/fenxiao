//
//  MerchantTableViewCell.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantTableViewCell : UITableViewCell
//品牌
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
//品牌星级别
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
//高级认证
@property (weak, nonatomic) IBOutlet UIImageView *approveImage;
//生产厂家
@property (weak, nonatomic) IBOutlet UIImageView *venderImage;
//经营模式
@property (weak, nonatomic) IBOutlet UILabel *manageLabel;
//产品款数
@property (weak, nonatomic) IBOutlet UILabel *breedLabel;
//会员个数
@property (weak, nonatomic) IBOutlet UILabel *vipLabel;
//入驻时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//电话号码
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
//qq号码
@property (weak, nonatomic) IBOutlet UILabel *QQnumberLabel;
//官网路径
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
//拿货地址
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
