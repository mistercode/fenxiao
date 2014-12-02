//
//  NoteViewController.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "NoteViewController.h"
#import "MyTabBarController.h"
#import "NoteTableViewCell.h"

@interface NoteViewController ()
{
    float width;
    float height;
    NSArray *noteArray;
}

@end

@implementation NoteViewController
@synthesize noteTableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self putthecontrol];
    noteTableView.frame = CGRectMake(0, 111, width, height - 111);
    noteTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    noteTableView.delegate = self;
    noteTableView.dataSource = self;
    NSString *str1 = @" 在此中秋佳节来临之际,购途市场衷心祝愿您和家人团圆美满,幸福安康!笑脸如鲜花常开!愿望个个如愿!中秋快乐!我公司将于9月6日-9月8日放假,放假期间如有任何疑问请拨打4006611603或联系客服QQ4006611603，我们将竭诚为您服务!";
    NSString *str2 = @"3.15打假日临近,淘宝打假规则升级,产品图片含大牌标志（logo及背景有大牌因素的）均可能导致淘宝店铺被惩罚，请上图前仔细确认!";
    NSString *str3 = @"即日起全站严查盗图产品,同一套图在平台上两个以上产品使用均属于盗图行为(不区分是否同厂家或授权使用),所有经查处的盗图产品屏蔽显示并扣分,无论被盗图款是否加入独家货源,盗图款更换图片后依然受盗款方式限制,仅恢复商家网站内显示.(不能被搜索和主列表显示以及推广宣传,且价格不能低于原款!).";
    NSString *str4 = @"接用户反馈,近日有QQ冒充本司客服进行诈骗,提示各位用户,本司唯一客服QQ号码为:4006611603,切勿相信诈骗信息.有任何问题请及时向本司客服反馈和核实,客服电话:4006611603";
    NSString *str5 = @"即日起,由本站客服主动巡查出来的同图产品,发布时间差距超过15天的,将直接以盗图方式屏蔽后发布的同图产品,同时为了避免纠纷,本站也不再对盗图产品屏蔽操作进行单独通知,如果被屏蔽产品为原图商家请主动联系客服申诉恢复并处理其它盗图产品.";
    NSString *str6 = @"近日有厂家反映自称淘宝一件代发邀请厂家入驻,经核实属于诈骗行为,以骗取入驻费为目的,提醒各商家谨防上当受骗!主要是许诺他们有诸多的分销卖家可以协助推广产品,这种毫无意义的虚假宣传,诈骗入驻费.另还有一种所谓淘宝创业的行骗方式,提醒各位卖家谨防上当受骗!";
    NSString *str7 = @"盗图处理规则调整,被成功举报盗图超过3次的厂家,全站屏蔽一个月.被成功举报盗图的产品下载记录,发布到淘宝记录,会员记录都会被转入原图产品.";
    noteArray = [NSArray arrayWithObjects:str1, str2,str3,str4,str5,str6,str7,nil];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return noteArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    NoteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[NoteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        
    }
    [cell setContentStr:[noteArray objectAtIndex:indexPath.row] wihtDate:nil];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = [self sizeHeightWithStr:[noteArray objectAtIndex:indexPath.row]];
    return cellHeight + 50;
}


- (float)sizeHeightWithStr:(NSString *)theStr
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGRect rect = [theStr boundingRectWithSize:CGSizeMake(width - 20, MAXFLOAT)options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes
                                              context:nil];
    return rect.size.height;
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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    显示navigationbar
    
    self.navigationController.navigationBarHidden = YES;
    //    初始化的时候注意转下
    MyTabBarController *MtB = (MyTabBarController *)self.tabBarController;
    [MtB hidetabbat];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
