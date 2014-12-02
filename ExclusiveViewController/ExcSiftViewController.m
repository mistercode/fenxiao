//
//  ExcSiftViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "ExcSiftViewController.h"
#import "PriceViewController.h"
#import "SizeViewController.h"
#import "StyleViewController.h"
#import "MaterialViewController.h"
#import "ExclusiveViewController.h"

@interface ExcSiftViewController ()
{
    float width;
    float height;
    UITableView *siftTabelView;
}


@end

@implementation ExcSiftViewController

static NSMutableArray *siftArray;

static NSString *price;
static NSString *size;
static NSString *style;
static NSString *material;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self putthecontrol];
    
    siftTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, width, 200)];
    siftTabelView.delegate = self;
    siftTabelView.dataSource = self;
    siftTabelView.rowHeight = 40;
    siftTabelView.backgroundColor = [UIColor whiteColor];
    siftTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:siftTabelView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 270, width, height-270)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    siftArray = [[NSMutableArray alloc]initWithObjects:@"不限 >",@"不限 >",@"不限 >",@"不限 >", nil];
    
    
    UIButton *loadImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadImageBtn.frame = CGRectMake((width-150)/2, 280, 150, 35);
    [loadImageBtn setBackgroundColor: [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    [loadImageBtn setTitle:@"完成筛选" forState:UIControlStateNormal];
    [loadImageBtn addTarget:self action:@selector(finishSift) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadImageBtn];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 40)];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [cell addSubview:titleLabel];
    
    [cell.textLabel setTextAlignment:NSTextAlignmentRight];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
    cell.textLabel.text = [siftArray objectAtIndex:indexPath.row];
    
    
    switch (indexPath.row) {
        case 0:
            titleLabel.text = @"  价格范围";
            break;
        case 1:
            titleLabel.text = @"  尺码";
            break;
        case 2:
            titleLabel.text = @"  风格";
            break;
        case 3:
            titleLabel.text = @"  帮面材质";
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - SetSelectSift

-(void)setSelectPrice:(NSString *)thePrice
{
    price = thePrice;
    [siftArray replaceObjectAtIndex:0 withObject:price];
}

-(void)setSelectSize:(NSString *)theSize
{
    size = theSize;
    [siftArray replaceObjectAtIndex:1 withObject:size];
}
-(void)setSelectStyle:(NSString *)theStyle
{
    style = theStyle;
    [siftArray replaceObjectAtIndex:2 withObject:style];
}
-(void)setSelectMaterial:(NSString *)theMaterial
{
    material = theMaterial;
    [siftArray replaceObjectAtIndex:3 withObject:material];
}



-(void)viewWillAppear:(BOOL)animated
{
    [siftTabelView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        PriceViewController *priceVC = [[PriceViewController alloc]init];
        [self.navigationController pushViewController:priceVC animated:YES];
    }else if (indexPath.row == 1){
        SizeViewController *sizeVC = [[SizeViewController alloc]init];
        [self.navigationController pushViewController:sizeVC animated:YES];
    }else if (indexPath.row == 2){
        StyleViewController *styleVC = [[StyleViewController alloc]init];
        [self.navigationController pushViewController:styleVC animated:YES];
    }else if (indexPath.row == 3){
        MaterialViewController *materialVC = [[MaterialViewController alloc]init];
        [self.navigationController pushViewController:materialVC animated:YES];
    }
    
}

-(void)finishSift
{
    CLog(@"完成筛选");
    [self.navigationController popViewControllerAnimated:YES];
    ExclusiveViewController *exclsiveVC = [[ExclusiveViewController alloc]init];
    [exclsiveVC setSelectArray:siftArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)siftBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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

@end
