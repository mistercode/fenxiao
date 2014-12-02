//
//  moreView.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol btndelegate<NSObject>

-(void)touchale:(int)tagValue;
@end

@interface moreView : UIView
{
    UIButton *paixuBtn;
    UIButton *saixuanBtn;
    UIButton *seekBtn;
    UIButton *goBackHome;
}
//设置属性
@property (nonatomic,assign) id<btndelegate>delegate;
@end
