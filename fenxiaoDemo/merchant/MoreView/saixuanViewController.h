//
//  saixuanViewController.h
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface saixuanViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *letterArr;
}
- (IBAction)goback:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *saixuanCollertion;

@end
