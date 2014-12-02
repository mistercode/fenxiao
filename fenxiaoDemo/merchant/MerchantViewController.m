//
//  MerchantViewController.m
//  fenxiaoDemo
//
//  Created by 杨炯 on 14/11/25.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "MerchantViewController.h"
#import "MerchantTableViewCell.h"
#import "moreView.h"
#import "SelectViewController.h"
#import "MJRefresh.h"
#import "paixuViewController.h"
#import "saixuanViewController.h"
@interface MerchantViewController ()

@end

@implementation MerchantViewController
@synthesize MerchantTV,MarketBtn,advancedBtn,productionBtn,sansBtn,titleLabel;

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor blackColor];
    [super viewWillAppear:animated];
    //    初始化的时候注意转下
    MyTabBarController *MtB = (MyTabBarController *)self.tabBarController;
    [MtB hidetabbat];
    
    [self preferredContentSize];
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    MerchantTV.delegate = self;
    MerchantTV.dataSource = self;
//    调用第三放类库
    [MerchantTV addHeaderWithTarget:self action:@selector(headerRereshing)];
    [MerchantTV addFooterWithTarget:self action:@selector(footerRereshing)];
    
    [MarketBtn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
    MarketBtn.tag = 101;
    [MarketBtn setBackgroundColor:[UIColor colorWithRed:232.0/255 green:33.0/255 blue:91.0/255 alpha:1]];
    [advancedBtn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
    advancedBtn.tag = 102;
    [productionBtn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
    productionBtn.tag = 103;
    
    [sansBtn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
    sansBtn.tag = 104;
    
    //获取屏幕大小
    UIScreen *s = [UIScreen mainScreen];
    //获取屏幕边界
    CGRect bounds = s.bounds;
    //获取屏幕的宽、高度
    float width = bounds.size.width;
   
    MV = [[moreView alloc]initWithFrame:CGRectMake(width-140, 70, 140, 160)];
     MV.delegate = self;
    [MV setBackgroundColor:[UIColor whiteColor]];
    
    // Do any additional setup after loading the view from its nib.
}
//下拉
-(void)headerRereshing{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [MerchantTV reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
      [MerchantTV headerEndRefreshing];
    });
    
    }
//上滑
-(void)footerRereshing{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [MerchantTV reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [MerchantTV footerEndRefreshing];
    });

    
}
-(void)touchbtn:(UIButton *)Btn{
//    利用循环来查找tag为i的UIButton对象，并把这个对象设置成你想要的颜色
    for (int i = 101; i < 105; i ++) {
//        在当前视图上根据tag值来查找UIButton对象
        UIButton *currentBtn = (UIButton *)[self.view viewWithTag:i];
//          设置背景颜色
        [currentBtn setBackgroundColor:[UIColor colorWithRed:189.0/255 green:189.0/255 blue:189.0/255 alpha:1]];
        
    }
    [Btn setBackgroundColor:[UIColor colorWithRed:232.0/255 green:33.0/255 blue:91.0/255 alpha:1]];
    switch (Btn.tag) {
        case 101:
            self.titleLabel.text  = @"市场商家";
             [MerchantTV reloadData];
            break;
        case 102:
            self.titleLabel.text = @"高级认证";
             [MerchantTV reloadData];
            break;
        case 103:
             self.titleLabel.text  = @"生产厂家";
             [MerchantTV reloadData];
            break;
        case 104:
             self.titleLabel.text  = @"外部商家";
            [MerchantTV reloadData];
            break;
            
        default:
            break;
    }
}

//返回段
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//返回行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellstr = @"cell";
    MerchantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (cell == nil) {
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *files = [bundle loadNibNamed:@"MerchantTableViewCell" owner:self options:nil];
        cell =  [files objectAtIndex:0];
        //    移除单元格选中高亮状态 写在组装tableview的代码中
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.approveImage.hidden = YES;
    if ([titleLabel.text isEqualToString:@"市场商家"]) {
        //    把这个approveImage隐藏掉
        cell.approveImage.hidden = NO;
    }else if([titleLabel.text isEqualToString:@"高级认证"]){
        cell.venderImage.image = [UIImage imageNamed:@"gjrz-small"];
    }else if ([titleLabel.text isEqualToString:@"生产厂家"]){
        cell.venderImage.image = [UIImage imageNamed:@"sccj-small"];
    }else if ([titleLabel.text isEqualToString:@"外部商家"]){
        cell.venderImage.image = [UIImage imageNamed:@"wbsj"];
    }

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CLog(@"您点击了cell");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 223;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//返回
- (IBAction)goBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//更多
- (IBAction)more:(id)sender {
  

   backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0.6;
    [self.view addSubview:backgroundView];
//    给view添加一个手势
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [self.view addGestureRecognizer:singleTap];
    //    设置阴影
    MV.layer.shadowOffset = CGSizeMake(0, 2);
    MV.layer.shadowOpacity = 0.80;
    [self.view addSubview:MV];
    
}
-(void)handleSingleTap{
    [MV removeFromSuperview];
    [backgroundView removeFromSuperview];
}
//实现代理方法(进行跳转)
-(void)touchale:(int)tagValue{
 SelectViewController *selectVC = [[SelectViewController alloc]init];
    paixuViewController *paixuVC = [[paixuViewController alloc]init];
    saixuanViewController *saixuanVC = [[saixuanViewController alloc]init];
    [MV removeFromSuperview];
    [backgroundView removeFromSuperview];
    switch (tagValue) {
        case 101:
            [self.navigationController pushViewController:paixuVC animated:YES];
            break;
        case 102:
            [self.navigationController pushViewController:saixuanVC animated:YES];
            break;
        case 103:
             [self.navigationController pushViewController:selectVC animated:YES];
            break;
        case 104:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        default:
            break;
    }
    
   
   
}

@end
