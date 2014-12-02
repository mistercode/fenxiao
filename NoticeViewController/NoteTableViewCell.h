//
//  NoteTableViewCell.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell

@property (retain, nonatomic)UILabel *contentLabel;
@property (retain, nonatomic)UILabel *dateLabel;


-(void)setContentStr:(NSString *)str wihtDate:(NSString *)dateStr;

@end
