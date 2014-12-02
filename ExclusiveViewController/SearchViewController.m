//
//  SearchViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/26.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "SearchViewController.h"
#import "ExclusiveViewController.h"

@interface SearchViewController ()

{
    float width;
    float height;
    UITextField *searchField;
}

@end

@implementation SearchViewController

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

-(void)searchBtnClick
{
    ExclusiveViewController *exclusiveVC = [[ExclusiveViewController alloc]init];
    [exclusiveVC setSearchStr:searchField.text];
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)searchBack:(id)sender {
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
