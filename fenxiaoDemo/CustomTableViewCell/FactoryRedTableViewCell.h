//
//  FactoryRedTableViewCell.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/12/2.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoryRedTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl * pageControl;
@property (nonatomic,strong) UIScrollView * bannerScrollView;

@property (nonatomic,strong) NSMutableArray * imageviewArray;
@end
