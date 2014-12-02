//
//  ExcSiftViewController.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcSift.h"

@interface ExcSiftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

-(void)setSelectPrice:(NSString *)thePrice;
-(void)setSelectSize:(NSString *)theSize;
-(void)setSelectStyle:(NSString *)theStyle;
-(void)setSelectMaterial:(NSString *)theMaterial;

@end
