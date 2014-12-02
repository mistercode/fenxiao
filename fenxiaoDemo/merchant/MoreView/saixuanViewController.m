//
//  saixuanViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "saixuanViewController.h"
#import "saixuanCollectionViewCell.h"
@interface saixuanViewController ()

@end

@implementation saixuanViewController
@synthesize saixuanCollertion;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    letterArr = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    saixuanCollertion.backgroundColor = [UIColor whiteColor];
    saixuanCollertion.dataSource = self;
    saixuanCollertion.delegate = self;
    
    [saixuanCollertion registerClass:[saixuanCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCellid"];
       // Do any additional setup after loading the view from its nib.
    [self preferredStatusBarStyle];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#define 注释
//设置每段显示图标的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [letterArr count];
}
//装载视图
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
            //通过上面设置的标示来获取视图
        saixuanCollectionViewCell *cell = (saixuanCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellid" forIndexPath:indexPath];
    
    cell.saixuanlabel.text = [letterArr objectAtIndex:[indexPath row]];
        return cell;

}
//点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"您点击了第%d个",(int)[indexPath row]);
}
//、、、、、、、、、、、、、、、、、、、、、、



#pragma mark-UICollectionViewDelegate
//设置每个cell的大小(宽、高)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    return  CGSizeMake( saixuanCollertion.frame.size.width/7, 30);
}
//两个cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return -1.0;
}
//两个行之间的最小距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return -1.0;
}
//取消选中的时候执行
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect");
}


@end
