//
//  FirstSearchViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "FirstSearchViewController.h"
#import "FirstHandViewController.h"

@interface FirstSearchViewController ()
{
    float width;
    float height;
    UITextField *searchField;
}

@end

@implementation FirstSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putthecontrol];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.frame = CGRectMake(0, 70, width, height);
    [self.view addSubview:contentView];
    [self loadSearchView];
}

-(void)loadSearchView
{
    UIView *searchView = [[UIView alloc]init];
    searchView.frame = CGRectMake(0, 110, width, 30);
    [self.view addSubview:searchView];
    float xPiont = (width-240)/2;
    
    searchField = [[UITextField alloc]initWithFrame:CGRectMake(xPiont, 0, 210, 30)];
    [searchField setBackground:[UIImage imageNamed:@"search_label.png"]];
    [searchView addSubview:searchField];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setImage:[UIImage imageNamed:@"search_btn.png"] forState:UIControlStateNormal];
    searchBtn.frame = CGRectMake(xPiont + searchField.frame.size.width, 0, 40, 30);
    [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:searchBtn];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [searchField resignFirstResponder];
}
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBtnClick
{
    FirstHandViewController *firstHandVC = [[FirstHandViewController alloc]init];
    [firstHandVC setSearchStr:searchField.text];
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
