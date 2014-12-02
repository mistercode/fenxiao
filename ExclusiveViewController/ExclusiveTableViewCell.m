//
//  ExclusiveTableViewCell.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/24.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "ExclusiveTableViewCell.h"

@implementation ExclusiveTableViewCell
{
    float width;
    float height;
}

@synthesize leftBtn;
@synthesize rightBtn;
@synthesize leftLabel;
@synthesize rightLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self Putthecontrol];
        float leftWith = width/2;
        float leftPoint = (leftWith - 130)/2;
        
        leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(leftPoint + 5, 20, 130, 140);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"testimage.png"] forState:UIControlStateNormal];
        [self addSubview:leftBtn];
        
        leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPoint + 5, 160, 130, 20)];
        leftLabel.backgroundColor = [UIColor redColor];
        [leftLabel setText:@"红利大&131 51"];
        [leftLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:leftLabel];
        
        
        rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(leftPoint + leftWith -5, 20, 130, 140);
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"testimage.png"] forState:UIControlStateNormal];
        [self addSubview:rightBtn];
        
        rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPoint + leftWith - 5, 160, 130, 20)];
        rightLabel.backgroundColor = [UIColor redColor];
        [rightLabel setText:@"红利大&131 51"];
        [rightLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:rightLabel];
        
        

    }
    return self;
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
