//
//  FirstMaterialViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstMaterialViewController.h"
#import "FirstSiftViewController.h"

@interface FirstMaterialViewController ()
{
    float width;
    float height;
    NSArray *materialArray;
}

@end

@implementation FirstMaterialViewController

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
    
    materialArray = [NSArray arrayWithObjects:@"塑胶",@"头层牛皮",@"树脂",@"毛线",@"牛二层皮",@"牛仔布",@"网布",@"藤草",@"裘皮",@"西施绒",@"超细纤维",@"猪皮",@"羊皮",@"PU",@"鸵鸟皮",@"鳄鱼皮",@"布",@"马毛",@"绸缎",@"绒面",@"呢子",@"棉布",@"亮片布",@"灯芯绒",@"其他",@"混合材质",nil];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return materialArray.count;
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[materialArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstSiftViewController *firstSiftVC = [[FirstSiftViewController alloc]init];
    [firstSiftVC setSelectMaterial:[materialArray objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
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
