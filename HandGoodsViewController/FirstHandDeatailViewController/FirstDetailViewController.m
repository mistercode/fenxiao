//
//  FirstDetailViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "FirstReportViewController.h"

@interface FirstDetailViewController ()
{
    float width;
    float height;
    UIView *siftView;
    UIScrollView *imageScrollView;
    UITableView *goodsTableView;
    NSArray *infoArray;
    BOOL loadImage;
    UIView *lucencyView;

}

@end

@implementation FirstDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self putthecontrol];
    loadImage = NO;
    [self loadDetailContentView];
}

-(void)loadDetailContentView
{
    infoArray = [NSArray arrayWithObjects:@"基本信息:",@"上市年份季节:",@"风格:",@"帮面材质:",@"内里材质:",@"皮质特性:",@"鞋底材质:",@"开口深度:",@"鞋头款式:",@"内里材质:",@"跟高:", @"鞋跟款式:",@"流行元素:",@"闭合方式:",@"制作工艺:",@"图案:",@"尺码:",@"颜色:",nil];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 68, width, 35)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setText:@"商家编码：鞋柜&A30"];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:titleLabel];
    float scale = (width- 265)/2;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 300)];
    headerView.backgroundColor = [UIColor blackColor];
    
    imageScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(scale, 20, 265, 265)];
    imageScrollView.showsHorizontalScrollIndicator=YES;  //可以水平滑动
    [imageScrollView setBackgroundColor: [UIColor whiteColor]];
    [imageScrollView setContentSize:CGSizeMake(265*5, 265)];
    imageScrollView.pagingEnabled = YES;
    for (int i = 0; i < 5; i ++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * 265, 0, 265, 265)];
        NSString *imageName = [NSString stringWithFormat:@"image%d",i+1];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [imageScrollView  addSubview:imageView];
    }
    [headerView addSubview:imageScrollView];
    
    
    goodsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 102, width, height - 102)];
    goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    goodsTableView.dataSource = self;
    goodsTableView.delegate = self;
    goodsTableView.rowHeight = 30;
    goodsTableView.tableHeaderView = headerView;
    [self.view addSubview:goodsTableView];
    
    lucencyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    lucencyView.backgroundColor = [UIColor blackColor];
    lucencyView.alpha = .4;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lucencyevent)];
    [lucencyView addGestureRecognizer:tapGesture];
    [tapGesture setNumberOfTapsRequired:1];
    [self.view addSubview:lucencyView];
    lucencyView.hidden = YES;
    
    siftView = [[UIView alloc]initWithFrame:CGRectMake(width - 100, 68, 100, 120)];
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
    [orderBtn setTitle:@"投诉" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:orderBtn];
    
    
    UIButton *siftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    siftBtn.frame = CGRectMake(0, 40, 100, 40);
    siftBtn.tag = 12;
    [siftBtn addTarget:self action:@selector(siftClick:) forControlEvents:UIControlEventTouchUpInside];
    siftBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [siftBtn setTitle:@"拿货" forState:UIControlStateNormal];
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
    [seachBtn setTitle:@"首页" forState:UIControlStateNormal];
    [seachBtn setTitleColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    [siftView addSubview:seachBtn];
    UIImageView *secondLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 1)];
    [secondLineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
    [seachBtn addSubview:secondLineImageView];
}

#pragma  mark - SiftViewHidden

-(void)lucencyevent
{
    if (siftView.hidden == NO) {
        lucencyView.hidden = YES;
        siftView.hidden = YES;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (loadImage == YES) {
        return infoArray.count + 10;
    }else{
        return infoArray.count + 1;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    if (indexPath.row == 0) {
        UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width/2 - 0.5, 30)];
        priceLabel.backgroundColor = [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        [priceLabel setText:@"批发价：109"];
        priceLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.view addSubview:priceLabel];
        
        UILabel *popularityLabel = [[UILabel alloc]initWithFrame:CGRectMake(width/2, 0, width/2, 30)];
        popularityLabel.backgroundColor = [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0];
        [popularityLabel setText:@"总人气：109"];
        popularityLabel.textAlignment = NSTextAlignmentCenter;
        popularityLabel.textColor = [UIColor whiteColor];
        popularityLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.view addSubview:popularityLabel];
        
        [cell addSubview:priceLabel];
        [cell addSubview:popularityLabel];
    }else if(indexPath.row == infoArray.count){
        if (loadImage == YES) {
            
        }else{
            UIButton *loadImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            loadImageBtn.frame = CGRectMake((width-150)/2, 1, 150, 29);
            [loadImageBtn setBackgroundColor: [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
            [loadImageBtn setTitle:@"加载图片和详情" forState:UIControlStateNormal];
            [loadImageBtn addTarget:self action:@selector(loadImageClick) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:loadImageBtn];
        }
    }else if (indexPath.row > infoArray.count){
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, 400)];
        [imageView setImage:[UIImage imageNamed:@"image_test.png"]];
        [cell addSubview:imageView];
    }else{
        cell.textLabel.text = [infoArray objectAtIndex:indexPath.row - 1];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        
        UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 29, width, 0.5)];
        [lineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
        [cell addSubview:lineImageView];
    }
    
    return cell;
}
#pragma  mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (loadImage == YES) {
        if (indexPath.row > infoArray.count) {
            return 400;
        }else{
            return 30;
        }
    }else{
        return 30;
    }
}


-(void)loadImageClick
{
    loadImage = YES;
    [goodsTableView reloadData];
}


-(void)siftClick:(UIButton *)btn
{
    if (siftView.hidden == NO) {
        siftView.hidden = YES;
        lucencyView.hidden = YES;
    }
    if (btn.tag == 11) {
        FirstReportViewController *firstReportVC = [[FirstReportViewController alloc]init];
        [self.navigationController pushViewController:firstReportVC animated:YES];
    }else if (btn.tag == 12){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"拿货信息" message:@"拿货地址:国际商贸城A区3楼3325号\n联系电话:13012345678\n厂家联系QQ:123456789" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }else if (btn.tag == 13){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
