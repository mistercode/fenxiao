//
//  RecommendCell.m
//  fenxiao
//
//  Created by yons on 14/12/1.
//  Copyright (c) 2014年 tangqian. All rights reserved.
//

#import "RecommendCell.h"

@interface RecommendCell ()
{
    float width;
    float height;
}

@property (nonatomic,strong) NSTimer * timer;
//计时器
- (void)p_startTimer;
//设置scrollView上图片自动滚动的时间间隔
- (void)p_setupTimeForScrollView;

@end

@implementation RecommendCell
@synthesize bannerScrollView;
@synthesize pageControl;

static NSMutableArray * imageviewArray;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self putthecontrol];
        //布局子视图
        [self setupSubviews];
    }
    return self;
}
- (void)awakeFromNib {
    
}

//布局子视图
- (void)setupSubviews
{
    self.bannerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, 125)];
    [self.contentView addSubview:self.bannerScrollView];
    //设置UIScrollView 的显示内容的尺寸，有n张图要显示，就设置 屏幕宽度*n ，这里假设要显示5张图，这里的设置是为了能实现滑动切换图片
    self.bannerScrollView.contentSize = CGSizeMake(width*5,125);
    
    //设置翻页效果
    self.bannerScrollView.pagingEnabled = YES;
    //不允许反弹
    self.bannerScrollView.bounces = NO;
    //不显示水平滑条
    self.bannerScrollView.showsHorizontalScrollIndicator = NO;
    //设置代理为自身
    self.bannerScrollView.delegate = self;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(width-120, 110, 100, 20)];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //设置pageControl的点的个数
    self.pageControl.numberOfPages = 5;
    
    
    self.imageviewArray = [NSMutableArray arrayWithCapacity:40];
    
    for (int i = 0; i< 5; i++) {
        
        //设置这个imageview.frame的CGRectMake的时候要注意X轴的坐标位置（第一次进入循环的时候i的值为0，所以第一张的坐标位置是320*0，0；以此类推来确定X轴的位置）
        UIButton *bannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bannerBtn.frame = CGRectMake(width*i, 0, width, 125);
        switch (i) {
            case 0:
                [bannerBtn setBackgroundColor:[UIColor redColor]];
                break;
            case 1:
                [bannerBtn setBackgroundColor:[UIColor lightGrayColor]];
                break;
            case 2:
                [bannerBtn setBackgroundColor:[UIColor blackColor]];
                break;
            case 3:
                [bannerBtn setBackgroundColor:[UIColor grayColor]];
                break;
            case 4:
                [bannerBtn setBackgroundColor:[UIColor greenColor]];
                break;
                
            default:
                break;
        }

        [self.imageviewArray addObject:bannerBtn];
        [self.bannerScrollView addSubview:bannerBtn];
    }
    
    [self.contentView addSubview:self.pageControl];
    //计时器
    [self p_startTimer];

    
}

#pragma mark -----------控制方法------------
//计时器
- (void)p_startTimer
{
    //第一个参数，设置滚动视图自动切换的时间（3秒）
    //最后一个参数，设置自动切换视图重复
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(p_setupTimeForScrollView) userInfo:nil repeats:YES];
}

//代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 记录scrollView 的当前位置，因为已经设置了分页效果，所以：位置/宽度 = 第几页
    int current = scrollView.contentOffset.x/320;
    //    设置PageControl的点是第几个
    self.pageControl.currentPage = current;
}

//当停止拖动滚动视图时，图片开始自动滚动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self p_startTimer];//开始
}

//当开始拖动滚动视图时，图片停止自动滚动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];//结束
}

//移除自动滚动效果
- (void)removeTimer
{
    [self.timer invalidate];
    
}

//设置scrollView上图片自动滚动
- (void)p_setupTimeForScrollView
{
    int page=(int)self.pageControl.currentPage;
    
    if (page==4) {
        page=0;
    }else{
        page++;
    }
    
    //偏移量
    CGFloat offsetx = page * self.bannerScrollView.frame.size.width;
    //滚动视图的偏移量
    self.bannerScrollView.contentOffset = CGPointMake(offsetx, 0);
    
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



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
