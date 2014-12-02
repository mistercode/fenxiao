//
//  FirstPiceViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstPiceViewController.h"
#import "FirstSiftViewController.h"

@interface FirstPiceViewController ()

{
    float width;
    float height;
    NSArray *priceArray;
}

@end

@implementation FirstPiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    priceArray = [NSArray arrayWithObjects:@"30元以下",@"30-60元",@"60-100元",@"100-150元",@"200-300元",@"300元以上", nil];
    
    UITableView *priceTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, width, 200)];
    priceTabelView.delegate = self;
    priceTabelView.dataSource = self;
    priceTabelView.rowHeight = 40;
    priceTabelView.backgroundColor = [UIColor whiteColor];
    priceTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:priceTabelView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 270, width, height-270)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[priceArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popViewControllerAnimated:YES];
    FirstSiftViewController *excSiftVC = [[FirstSiftViewController alloc]init];
    [excSiftVC setSelectPrice:[priceArray objectAtIndex:indexPath.row]];
}

- (IBAction)backClick:(id)sender {
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


@end
