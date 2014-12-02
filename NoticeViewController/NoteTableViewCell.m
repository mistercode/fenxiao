//
//  NoteTableViewCell.m
//  fenxiaoDemo
//
//  Created by 刘蒙 on 14/11/27.
//  Copyright (c) 2014年 YangJiong. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell
{
    float width;
    float height;
    UIImageView *lineImageView;
}
@synthesize contentLabel;
@synthesize dateLabel;


- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self putthecontrol];
        contentLabel = [[UILabel alloc]init];
        contentLabel.textAlignment = NSTextAlignmentLeft;
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:contentLabel];
        
        dateLabel = [[UILabel alloc]init];
        dateLabel.numberOfLines = 0;
        dateLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:dateLabel];
        
        lineImageView = [[UIImageView alloc]init];
        [lineImageView setBackgroundColor:[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0]];
        [self addSubview:lineImageView];
        
    }
    return self;
}


-(void)setContentStr:(NSString *)str wihtDate:(NSString *)dateStr
{
    float sizeHeight = [self sizeHeightWithStr:str];
    contentLabel.frame = CGRectMake(10, 10, width -20, sizeHeight);
    contentLabel.text = str;
    
    dateLabel.frame = CGRectMake(10, sizeHeight + 20, width -20, 30);
    dateLabel.text = @"发布时间:2014-09-05 15:02:39";
    
    lineImageView.frame = CGRectMake(0, dateLabel.frame.size.height + dateLabel.frame.origin.y + 10, width, 0.5);
    
}


- (float)sizeHeightWithStr:(NSString *)theStr
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGRect rect = [theStr boundingRectWithSize:CGSizeMake(width - 20, MAXFLOAT)options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size.height;
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
