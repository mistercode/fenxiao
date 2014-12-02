//
//  FirstSiftViewController.h
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstSiftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

-(void)setSelectPrice:(NSString *)thePrice;
-(void)setSelectSize:(NSString *)theSize;
-(void)setSelectStyle:(NSString *)theStyle;
-(void)setSelectMaterial:(NSString *)theMaterial;

@end
