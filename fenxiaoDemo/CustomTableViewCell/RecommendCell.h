//
//  RecommendCell.h
//  fenxiao
//
//  Created by yons on 14/12/1.
//  Copyright (c) 2014年 tangqian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendCell : UITableViewCell<UIScrollViewDelegate>


@property (nonatomic,strong) UIPageControl * pageControl;
@property (nonatomic,strong) UIScrollView * bannerScrollView;

@property (nonatomic,strong) NSMutableArray * imageviewArray;




@end
