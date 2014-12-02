//
//  HomeViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/12/1.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "HomeViewController.h"
#import "ShowTableViewCell.h"
#import "DisPlayTableViewCell.h"
#import "RecommendCell.h"
#import "KindTableViewCell.h"
#import "TableViewCell.h"
#import "FactoryRedTableViewCell.h"
#import "webTableViewCell.h"

@interface HomeViewController ()
{
    float width;
    float height;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self putthecontrol];
    [self loadHomeView];
}

- (void)loadHomeView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, width , height - 64 - 49)];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString * cellIdentifier = @"RecommendCell";
        RecommendCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[RecommendCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }
    if (indexPath.row == 1) {
        static NSString * cellIdentifier = @"KindTableViewCell";
        KindTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[KindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        for (int i = 0; i < 6; i ++) {
            UIButton *btn = (UIButton *)[cell viewWithTag:100 + i];
            [btn addTarget:self action:@selector(kindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        return cell;
    }
    
    if (indexPath.row == 2) {
        static NSString * cellIdentifier = @"TableViewCell";
        TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellIdentifier];
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *files = [bundle loadNibNamed:@"TableViewCell" owner:self options:nil];
            cell = [files objectAtIndex:0];
            cell.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:223.0/255.0  blue:223.0/255.0  alpha:1.0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        return cell;
    }
    
    if (indexPath.row == 3 ||indexPath.row == 4 ) {
        static NSString * cellIdentifier = @"ShowTableViewCell";
        ShowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[ShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            [cell.firstBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.sencondBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.thiredBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        return cell;
    }else if(indexPath.row == 5)
    {
        static NSString * cellIdentifier = @"FactoryRedTableViewCell";
        FactoryRedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[FactoryRedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }else if (indexPath.row == 6){
        static NSString * cellIdentifier = @"webTableViewCell";
        webTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[webTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor redColor];
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *files = [bundle loadNibNamed:@"webTableViewCell" owner:self options:nil];
            cell = [files objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }

        return cell;
    }else{
        static NSString * cellIdentifier = @"DisPlayTableViewCell";
        DisPlayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[DisPlayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:cellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        }

        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 125;
    }else if(indexPath.row ==1){
        return 25;
    }else if(indexPath.row == 2){
        return 100;
    }else if(indexPath.row == 3 || indexPath.row == 4){
        return 105;
    }else if(indexPath.row == 5){
        return 125;
    }else{
        return 145;
    }
}


-(void)kindBtnClick:(UIButton *)btn
{
    CLog(@"------>%ld",(long)btn.tag);
}

-(void)goodsClick:(UIButton *)btn
{
    CLog(@"------>%ld",(long)btn.tag);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)searchBtn:(id)sender {
}

- (IBAction)noticeBtn:(id)sender {
}
@end
