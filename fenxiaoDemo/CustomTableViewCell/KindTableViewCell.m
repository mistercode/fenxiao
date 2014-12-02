//
//  KindTableViewCell.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/12/1.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "KindTableViewCell.h"

@implementation KindTableViewCell
{
    float width;
    float height;
}
- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self putthecontrol];
        UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake((width-320)/2, 0, 320, 25)];
        contentView.backgroundColor = [UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0];
        [self addSubview:contentView];
        NSArray *titleArray = [NSArray arrayWithObjects:@"独家货源",@"一手货源",@"市场商家",@"生产厂家",@"一件代发",@"摄影服务", nil];
        for (int i = 0; i < 6; i ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i + 100;
            btn.frame = CGRectMake(i*50 +10, 0, 45, 25);
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor colorWithRed:231/255.0 green:32/255.0 blue:92/255.0 alpha:1.0]];
            [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize: 10.0];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            [contentView addSubview:btn];
        }
        
    }
    return self;
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
