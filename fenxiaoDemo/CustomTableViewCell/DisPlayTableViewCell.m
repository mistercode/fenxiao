//
//  DisPlayTableViewCell.m
//  FenXiaoCell
//
//  Created by 刘蒙 on 14/12/1.
//  Copyright (c) 2014年 刘蒙. All rights reserved.
//

#import "DisPlayTableViewCell.h"

@implementation DisPlayTableViewCell
{
    float width;
    float height;
    UILabel *firstNameLabel;
    UILabel *firstPriceLabel;
    UILabel *sencondNameLabel;
    UILabel *sencondPriceLabel;
    UILabel *thiredNameLabel;
    UILabel *thiredPriceLabel;
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
        [firstBtn setImage:[UIImage imageNamed:@"test1.png"] forState:UIControlStateNormal];
        [self addSubview:firstBtn];
        
        sencondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sencondBtn.frame = CGRectMake((width/2) - 49, 5, 98, 100);
        [sencondBtn setImage:[UIImage imageNamed:@"test1.png"] forState:UIControlStateNormal];
        [self addSubview:sencondBtn];
        
        thiredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        thiredBtn.frame = CGRectMake(width - 108, 5, 98, 100);
        [thiredBtn setImage:[UIImage imageNamed:@"test1.png"] forState:UIControlStateNormal];
        [self addSubview:thiredBtn];
        
        for (int i = 0; i < 3; i ++) {
            UILabel *nameLabel = [[UILabel alloc]init];
            nameLabel.textAlignment = NSTextAlignmentLeft;
            nameLabel.backgroundColor = [UIColor clearColor];
            nameLabel.text = @"凯运达&22737";
            [nameLabel setFont:[UIFont boldSystemFontOfSize:13]];
            [self addSubview:nameLabel];
            
            UILabel *priceLabel = [[UILabel alloc]init];
            priceLabel.textAlignment = NSTextAlignmentLeft;
            priceLabel.backgroundColor = [UIColor clearColor];
            [priceLabel setTextColor:[UIColor redColor]];
            priceLabel.text = @"¥100";
            [priceLabel setFont:[UIFont boldSystemFontOfSize:13]];
            [self addSubview:priceLabel];
            switch (i) {
                case 0:
                    nameLabel.frame = CGRectMake(10, 105, 98, 20);
                    priceLabel.frame = CGRectMake(10, 125, 98, 20);
                    break;
                case 1:
                    nameLabel.frame = CGRectMake((width/2) - 49, 105, 98, 20);
                    priceLabel.frame = CGRectMake((width/2) - 49, 125, 98, 20);
                    break;
                case 2:
                    nameLabel.frame = CGRectMake(width - 108, 105, 98, 20);
                    priceLabel.frame = CGRectMake(width - 108, 125, 98, 20);
                    break;
                default:
                    break;
            }
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



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
