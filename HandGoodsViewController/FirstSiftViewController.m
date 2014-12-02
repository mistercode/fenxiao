//
//  FirstSiftViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstSiftViewController.h"
#import "FirstHandViewController.h"
#import "FirstPiceViewController.h"
#import "FirstSizeViewController.h"
#import "FirstStyleViewController.h"
#import "FirstMaterialViewController.h"

@interface FirstSiftViewController ()

{
    float width;
    float height;
    UITableView *siftTabelView;
}

@end

@implementation FirstSiftViewController

static NSMutableArray *siftArray;

static NSString *siftPrice;
static NSString *siftSize;
static NSString *siftStyle;
static NSString *siftMaterial;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self loadFirstView];
    
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadFirstView
{
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
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [cell addSubview:titleLabel];
    
    [cell.textLabel setTextAlignment:NSTextAlignmentRight];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        FirstPiceViewController *firstPice = [[FirstPiceViewController alloc]init];
        [self.navigationController pushViewController:firstPice animated:YES];
    }else if (indexPath.row == 1){
        FirstSizeViewController *firstSize = [[FirstSizeViewController alloc]init];
        [self.navigationController pushViewController:firstSize animated:YES];
        
    }else if (indexPath.row == 2){
        
        FirstStyleViewController *firstStyle = [[FirstStyleViewController alloc]init];
        [self.navigationController pushViewController:firstStyle animated:YES];
        
    }else if (indexPath.row == 3){
        FirstMaterialViewController *firstMaterial = [[FirstMaterialViewController alloc]init];
        [self.navigationController pushViewController:firstMaterial animated:YES];
    }
    
}

-(void)finishSift
{
    CLog(@"完成筛选");
    [self.navigationController popViewControllerAnimated:YES];
    FirstHandViewController *firstHandVC = [[FirstHandViewController alloc]init];
    [firstHandVC setSelectArray:siftArray];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SiftSelect

-(void)setSelectPrice:(NSString *)thePrice
{
    siftPrice = thePrice;
    CLog(@"====>%@",siftPrice);
    [siftArray replaceObjectAtIndex:0 withObject:siftPrice];
}
-(void)setSelectSize:(NSString *)theSize
{
    siftSize = theSize;
    [siftArray replaceObjectAtIndex:1 withObject:siftSize];
    CLog(@"====>%@",siftSize);
}
-(void)setSelectStyle:(NSString *)theStyle
{
    siftStyle = theStyle;
    [siftArray replaceObjectAtIndex:2 withObject:siftStyle];
    CLog(@"====>%@",siftStyle);
}
-(void)setSelectMaterial:(NSString *)theMaterial
{
    siftMaterial = theMaterial;
    [siftArray replaceObjectAtIndex:3 withObject:siftMaterial];
    CLog(@"====>%@",siftMaterial);
}
-(void)viewWillAppear:(BOOL)animated
{
    [siftTabelView reloadData];
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
