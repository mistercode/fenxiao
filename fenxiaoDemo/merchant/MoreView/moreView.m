//
//  moreView.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "moreView.h"
@implementation moreView
- (void)drawRect:(CGRect)rect {
    paixuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 140, 39)];
    [paixuBtn setTitle:@"排序" forState:UIControlStateNormal];
    [paixuBtn setTitleColor:[UIColor colorWithRed:202.0/255 green:202.0/255 blue:202.0/255 alpha:1.0] forState:UIControlStateNormal];
    [paixuBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    paixuBtn.tag = 101;
     [self.viewForBaselineLayout addSubview:paixuBtn];
    saixuanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 39, 140, 39)];
    [saixuanBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [saixuanBtn setTitleColor:[UIColor colorWithRed:202.0/255 green:202.0/255 blue:202.0/255 alpha:1.0] forState:UIControlStateNormal];
    [saixuanBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    saixuanBtn.tag = 102;
    [self.viewForBaselineLayout addSubview:saixuanBtn];
    
    
    seekBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 39*2, 140, 39)];
    [seekBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [seekBtn setTitleColor:[UIColor colorWithRed:202.0/255 green:202.0/255 blue:202.0/255 alpha:1.0] forState:UIControlStateNormal];
    [seekBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    seekBtn.tag = 103;
    [self.viewForBaselineLayout addSubview:seekBtn];
    goBackHome = [[UIButton alloc]initWithFrame:CGRectMake(0, 39*3, 140, 39)];
    [goBackHome setTitle:@"返回首页" forState:UIControlStateNormal];
    [goBackHome setTitleColor:[UIColor colorWithRed:202.0/255 green:202.0/255 blue:202.0/255 alpha:1.0] forState:UIControlStateNormal];
    [goBackHome addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    goBackHome.tag = 104;
     [self.viewForBaselineLayout addSubview:goBackHome];
    int j = 0;
    for (int i = 0; i<4; i++) {
    
        UIView *myview = [[UILabel alloc]initWithFrame:CGRectMake(0, j, 140, 1)];
        [myview setBackgroundColor:[UIColor colorWithRed:202.0/255 green:202.0/255 blue:202.0/255 alpha:1]];
        [self.viewForBaselineLayout addSubview:myview];
        j = j+40;
    }
    
}
-(void)touchBtn:(UIButton *)button{
    CLog(@"触发");
    //    判断delegate是否实现和这个touchale：代理方法是否实现
    if (_delegate && [_delegate respondsToSelector:@selector(touchale:)]) {
    switch (button.tag) {
        case 101:
            [_delegate touchale:101];
            
            break;
        case 102:
            [_delegate touchale:102];
           
            break;
        case 103:
            [_delegate touchale:103];
            
            break;
        case 104:
            [_delegate touchale:104];
            
            break;
        default:
            break;
    }
        }
}

@end
