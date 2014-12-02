//
//  webTableViewCell.h
//  View
//
//  Created by 123 on 14/12/1.
//  Copyright (c) 2014年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UIButton *genaBtn;
@property (nonatomic,weak) IBOutlet UIButton *ligeBtn;
@property (nonatomic,weak) IBOutlet UIButton *aimeiBtn;
@property (nonatomic,weak) IBOutlet UIButton *lalaBtn;

@property (nonatomic,weak) IBOutlet UILabel *sellerLabel;
@property (nonatomic,weak) IBOutlet UIView *sellerView;

@end
