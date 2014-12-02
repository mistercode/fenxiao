//
//  ShowTableViewCell.m
//  FenXiaoCell
//
//  Created by 刘蒙 on 14/12/1.
//  Copyright (c) 2014年 刘蒙. All rights reserved.
//

#import "ShowTableViewCell.h"

@implementation ShowTableViewCell
{
    float width;
    float height;
}
@synthesize firstBtn;
@synthesize sencondBtn;
@synthesize thiredBtn;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self putthecontrol];
        firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        firstBtn.frame = CGRectMake(10, 5, 98, 100);
        [firstBtn setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
        [self addSubview:firstBtn];
        
        sencondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sencondBtn.frame = CGRectMake((width/2) - 49, 5, 98, 100);
        [sencondBtn setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
        [self addSubview:sencondBtn];
        
        thiredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        thiredBtn.frame = CGRectMake(width - 108, 5, 98, 100);
        [thiredBtn setImage:[UIImage imageNamed:@"test.png"] forState:UIControlStateNormal];
        [self addSubview:thiredBtn];
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
