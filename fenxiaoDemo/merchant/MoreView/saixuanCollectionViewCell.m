//
//  saixuanCollectionViewCell.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "saixuanCollectionViewCell.h"

@implementation saixuanCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"saixuanCollectionViewCell" owner:self options:nil];
        
        self = [arrayOfViews lastObject];
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}


@end
