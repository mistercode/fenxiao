//
//  FirstSortViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstSortViewController.h"
#import "FirstHandViewController.h"

@interface FirstSortViewController ()
{
    float width;
    float height;
    NSArray *sortArray;
}

@end

@implementation FirstSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    sortArray = [NSArray arrayWithObjects:@"最近更新",@"人气产品",@"价格由高到低",@"价格由低到高",@"最新发布",nil];
    UITableView *sortTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, width, 200)];
    sortTabelView.delegate = self;
    sortTabelView.dataSource = self;
    sortTabelView.rowHeight = 40;
    sortTabelView.backgroundColor = [UIColor whiteColor];
    sortTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:sortTabelView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 270, width, height-270)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];

}
- (IBAction)firstSortBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 39, width, 0.5)];
    [lineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
    [cell addSubview:lineImageView];
    
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[sortArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLog(@"------->%ld",(long)indexPath.row);
    [self.navigationController popViewControllerAnimated:YES];
    FirstHandViewController *firstHandVC = [[FirstHandViewController alloc]init];
    [firstHandVC setSortStr:[sortArray objectAtIndex:indexPath.row]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)putthecontrol{
    
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽、高度
    width = bounds.size.width ;
    height = bounds.size.height;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
