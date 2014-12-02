//
//  ExclusiveViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "ExclusiveViewController.h"
#import "MyTabBarController.h"
#import "ExclusiveTableViewCell.h"
#import "MJRefresh.h"
#import "ExcDeatailViewController.h"
#import "ExcSortViewController.h"
#import "ExcSiftViewController.h"
#import "SearchViewController.h"


@interface ExclusiveViewController ()
{
    float width;
    float height;
    UIView *siftView;
    UIView *lucencyView;
}


@end

@implementation ExclusiveViewController
@synthesize contentTableView;
@synthesize allBtn;
@synthesize lowBtn;
@synthesize heightBtn;
@synthesize bootBtn;
@synthesize sandalBtn;
@synthesize slipperBtn;

static NSMutableArray *userSiftArray;
static NSString *sortStr;
static NSString *searchStr;


- (IBAction)backClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)moreClick:(id)sender {
    
    if (lucencyView.hidden == YES) {
        lucencyView.hidden = NO;
        siftView.hidden = NO;
    }else{
        lucencyView.hidden = YES;
        siftView.hidden = YES;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    userSiftArray = [[NSMutableArray alloc]init];
    [self loadContetnView];
}

- (void)loadContetnView
{
    [allBtn setTag:21];
    [lowBtn setTag:22];
    [heightBtn setTag:23];
    [bootBtn setTag:24];
    [slipperBtn setTag:25];
    [sandalBtn setTag:26];

    [allBtn addTarget:self action:@selector(classClick:) forControlEvents:UIControlEventTouchUpInside];
    [allBtn setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    [allBtn setTintColor:[UIColor whiteColor]];
    
    [lowBtn addTarget:self action:@selector(classClick:) forControlEvents:UIControlEventTouchUpInside];
    [lowBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    
    [heightBtn addTarget:self action:@selector(classClick:) forControlEvents:UIControlEventTouchUpInside];
    [heightBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    
    [bootBtn addTarget:self action:@selector(classClick:)
      forControlEvents:UIControlEventTouchUpInside];
    [bootBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    
    [sandalBtn addTarget:self action:@selector(classClick:) forControlEvents:UIControlEventTouchUpInside];
    [sandalBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    
    [slipperBtn addTarget:self action:@selector(classClick:) forControlEvents:UIControlEventTouchUpInside];
    [slipperBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];

    contentTableView.delegate = self;
    contentTableView.dataSource = self;
    contentTableView.backgroundColor = [UIColor whiteColor];
    [contentTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [contentTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    contentTableView.rowHeight = 200;
    [self.view addSubview:contentTableView];
    
    
    lucencyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    lucencyView.backgroundColor = [UIColor blackColor];
    lucencyView.alpha = .4;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lucencyevent)];
    [lucencyView addGestureRecognizer:tapGesture];
    [tapGesture setNumberOfTapsRequired:1];
    [self.view addSubview:lucencyView];
    lucencyView.hidden = YES;
    
    siftView = [[UIView alloc]initWithFrame:CGRectMake(width - 100, 71, 100, 160)];
    siftView.backgroundColor = [UIColor whiteColor];
    siftView.layer.shadowOffset = CGSizeMake(0, 2);
    siftView.layer.shadowOpacity = 0.80;
    [self.view addSubview:siftView];
    siftView.hidden = YES;
    
    
    
    UIButton *orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    orderBtn.frame = CGRectMake(0, 0, 100, 40);
    orderBtn.tag = 11;
    [orderBtn addTarget:self action:@selector(siftClick:) forControlEvents:UIControlEventTouchUpInside];
    orderBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [orderBtn setTitle:@"排序" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:orderBtn];
    
    
    UIButton *siftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    siftBtn.frame = CGRectMake(0, 40, 100, 40);
    siftBtn.tag = 12;
    [siftBtn addTarget:self action:@selector(siftClick:) forControlEvents:UIControlEventTouchUpInside];
    siftBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [siftBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [siftBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:siftBtn];
    UIImageView *firstLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 1)];
    [firstLineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
    [siftBtn addSubview:firstLineImageView];
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seachBtn.frame = CGRectMake(0, 80, 100, 40);
    seachBtn.tag = 13;
    [seachBtn addTarget:self action:@selector(siftClick:) forControlEvents:UIControlEventTouchUpInside];
    seachBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [seachBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [seachBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:seachBtn];
    UIImageView *secondLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 1)];
    [secondLineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
    [seachBtn addSubview:secondLineImageView];
    
    UIButton *backMianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backMianBtn.frame = CGRectMake(0, 120, 100, 40);
    backMianBtn.tag = 14;
    [backMianBtn addTarget:self action:@selector(siftClick:) forControlEvents:UIControlEventTouchUpInside];
    backMianBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [backMianBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [backMianBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:backMianBtn];
    UIImageView *thiredLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 1)];
    [thiredLineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
    [backMianBtn addSubview:thiredLineImageView];
    
    
}

-(void)lucencyevent
{
    if (siftView.hidden == NO) {
        lucencyView.hidden = YES;
        siftView.hidden = YES;
    }
}

-(void)classClick:(UIButton *)btn
{
    for (int i = 0; i < 6; i++) {
        UIButton *currentBtn = (UIButton *)[self.view viewWithTag:21+i];
        [currentBtn setBackgroundColor:[UIColor whiteColor]];
        [currentBtn setTintColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    }
    [btn setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    [btn setTintColor:[UIColor whiteColor]];
    
    [contentTableView reloadData];
    switch (btn.tag) {
        case 21:
            CLog(@"----所有独款");
            break;
        case 22:
            CLog(@"----低帮鞋");
            break;
            
        case 23:
            CLog(@"----高帮鞋");
            break;
            
        case 24:
            CLog(@"----靴子");
            break;
            
        case 25:
            CLog(@"----拖鞋");
            break;
            
        case 26:
            CLog(@"----凉鞋");
            break;
            
            
        default:
            break;
    }
}
-(void)siftClick:(UIButton *)btn
{

    ExcSortViewController *sortVC = [[ExcSortViewController alloc]init];
    ExcSiftViewController *siftVC = [[ExcSiftViewController alloc]init];
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    
    
    switch (btn.tag) {
        case 11:
            [self.navigationController pushViewController:sortVC animated:YES];
            break;
        case 12:
            [self.navigationController pushViewController:siftVC animated:YES];
            break;
        case 13:
            [self.navigationController pushViewController:searchVC animated:YES];
            break;
        case 14:
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        default:
            break;
    }
    lucencyView.hidden = YES;
    siftView.hidden = YES;
}

- (void)headerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [contentTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [contentTableView headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [contentTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [contentTableView footerEndRefreshing];
    });
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    ExclusiveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[ExclusiveTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                             reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    long leftIndex = (indexPath.row + 1)*2 - 2;
    long rigthIndex = (indexPath.row + 1)*2 - 1;
    cell.leftBtn.tag = leftIndex + 100;
    [cell.leftBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.rightBtn.tag = rigthIndex + 100;
    [cell.rightBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.leftLabel.tag = 10000 + leftIndex;
    cell.rightLabel.tag = 10000 + rigthIndex;

    return cell;
}


-(void)goodsClick:(UIButton *)btn
{
    CLog(@"======>>%ld",(long)btn.tag);
    ExcDeatailViewController *excDeatail = [[ExcDeatailViewController alloc]init];
    [self.navigationController pushViewController:excDeatail animated:YES];
}

-(void)setSelectArray:(NSMutableArray *)theArray
{
    userSiftArray = theArray;
}

-(void)setSortStr:(NSString *)theSort
{
    sortStr = theSort;
}
-(void)setSearchStr:(NSString *)theSearchStr
{
    searchStr = theSearchStr;
    CLog(@"===>%@",theSearchStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    显示navigationbar
    
    self.navigationController.navigationBarHidden = YES;
    //    初始化的时候注意转下
    MyTabBarController *MtB = (MyTabBarController *)self.tabBarController;
    [MtB hidetabbat];
}

-(void)Putthecontrol{
    
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
