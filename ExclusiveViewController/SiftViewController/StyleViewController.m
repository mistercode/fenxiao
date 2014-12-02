//
//  StyleViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "StyleViewController.h"
#import "ExcSiftViewController.h"

@interface StyleViewController ()

{
    float width;
    float height;
    NSArray *styleArray;
}

@end

@implementation StyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UITableView *sizeTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, width, height - 70)];
    sizeTabelView.delegate = self;
    sizeTabelView.dataSource = self;
    sizeTabelView.rowHeight = 40;
    sizeTabelView.backgroundColor = [UIColor whiteColor];
    sizeTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:sizeTabelView];
    
    styleArray = [NSArray arrayWithObjects:@"甜美",@"日系",@"学院",@"公主",@"田园",@"森女",@"洛丽塔",@"街头",@"欧美",@"休闲",@"朋克",@"军装",@"嘻哈",@"中性",@"波普",@"通勤",@"韩版",@"简约",@"英伦",@"优雅",@"民族风",@"性感",@"舒适", nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return styleArray.count;
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
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[styleArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExcSiftViewController *excSiftVC = [[ExcSiftViewController alloc]init];
    [excSiftVC setSelectStyle:[styleArray objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)styleBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
