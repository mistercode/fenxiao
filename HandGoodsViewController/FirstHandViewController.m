//
//  FirstHandViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstHandViewController.h"
#import "MyTabBarController.h"
#import "MJRefresh.h"
#import "ExclusiveTableViewCell.h"
#import "FirstSortViewController.h"
#import "FirstSiftViewController.h"
#import "FirstSearchViewController.h"
#import "FirstDetailViewController.h"

@interface FirstHandViewController ()
{
    float width;
    float height;
    UIView *siftView;
    UIView *lucencyView;
}

@end

@implementation FirstHandViewController
@synthesize allBtn;
@synthesize threeBtn;
@synthesize popularityBtn;
@synthesize directBtn;
@synthesize interBtn;
@synthesize lowBtn;
@synthesize heightBtn;
@synthesize bootsBtn;
@synthesize sandalBtn;
@synthesize slipperBtn;
@synthesize firstHandTableView;

static NSMutableArray *firstSiftArray;
static NSString *firstSortStr;
static NSString *firstSearchStr;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self putthecontrol];
    
    [self loadFirstHandView];
}

-(void)loadFirstHandView
{
    for (int i = 1; i < 12; i ++) {
        UIButton * btn = (UIButton *)[self.view viewWithTag:i + 100];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0] forState:UIControlStateNormal];
        [[btn layer] setBorderWidth:0.5];//画线的宽度
        [[btn layer] setBorderColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0].CGColor];//颜色
        [btn addTarget:self action:@selector(siftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton * currentBtn = (UIButton *)[self.view viewWithTag:101];
    [currentBtn setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    [currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    firstHandTableView.delegate = self;
    firstHandTableView.dataSource = self;
    firstHandTableView.backgroundColor = [UIColor whiteColor];
    [firstHandTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [firstHandTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    firstHandTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    firstHandTableView.rowHeight = 200;
    [self.view addSubview:firstHandTableView];
    
    [self loadSiftView];
}

-(void)loadSiftView
{
    
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
    UIImageView *firstLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 0.5)];
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
    UIImageView *secondLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 0.5)];
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
    UIImageView *thiredLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 0.5)];
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
    
    [cell.leftLabel setBackgroundColor: [UIColor whiteColor]];
    [cell.leftLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    [cell.leftLabel setTextAlignment:NSTextAlignmentCenter];
    [[cell.leftLabel layer] setBorderWidth:.5];//画线的宽度
    
    [cell.rightLabel setBackgroundColor:[UIColor whiteColor]];
    [cell.rightLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    [cell.rightLabel setTextAlignment:NSTextAlignmentCenter];
    [[cell.rightLabel layer] setBorderWidth:.5];//画线的宽度

    
    return cell;
}

#pragma mark - DetailClick
-(void)goodsClick:(UIButton *)btn
{
    CLog(@"======>>%ld",(long)btn.tag);
    FirstDetailViewController *firstDeatail = [[FirstDetailViewController alloc]init];
    [self.navigationController pushViewController:firstDeatail animated:YES];
}

-(void)setSortStr:(NSString *)theSort
{
    firstSortStr = theSort;
    CLog(@"--->>%@",theSort);
}



- (void)headerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [firstHandTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [firstHandTableView headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [firstHandTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [firstHandTableView footerEndRefreshing];
    });
}


-(void)siftClick:(UIButton *)btn
{
    if (btn.tag == 11) {
        FirstSortViewController *firstSortVC = [[FirstSortViewController alloc]init];
        [self.navigationController pushViewController:firstSortVC animated:YES];
    }else if (btn.tag == 12){
        FirstSiftViewController *firstSiftVC = [[FirstSiftViewController alloc]init];
        [self.navigationController pushViewController:firstSiftVC animated:YES];
    }else if (btn.tag == 13){
        FirstSearchViewController *firstSearchVC = [[FirstSearchViewController alloc]init];
        [self.navigationController pushViewController:firstSearchVC animated:YES];
    }else if (btn.tag == 14){
        [self.navigationController popViewControllerAnimated:YES];
    }
    siftView.hidden = YES;
    lucencyView.hidden = YES;
}

-(void)siftBtnClick:(UIButton *)btn
{
    for (int i = 1; i < 12; i ++) {
        UIButton * currentBtn = (UIButton *)[self.view viewWithTag:i + 100];
        [currentBtn setBackgroundColor:[UIColor whiteColor]];
        [currentBtn setTitleColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    [btn setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [firstHandTableView reloadData];
}

- (IBAction)firstBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)moreClick:(id)sender {
    if (siftView.hidden == YES) {
        siftView.hidden = NO;
        lucencyView.hidden = NO;
    }else{
        siftView.hidden = YES;
        lucencyView.hidden = YES;
    }
}

-(void)setSelectArray:(NSMutableArray *)theArray
{
    firstSiftArray = theArray;
    CLog(@"===>%@",theArray);
}

-(void)setSearchStr:(NSString *)theSearchStr
{
    firstSearchStr = theSearchStr;
    CLog(@"===>%@",theSearchStr);
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    显示navigationbar
    
    self.navigationController.navigationBarHidden = YES;
    //    初始化的时候注意转下
    MyTabBarController *MtB = (MyTabBarController *)self.tabBarController;
    [MtB hidetabbat];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
