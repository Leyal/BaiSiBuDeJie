//
//  LYMeTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/9.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYMeTableViewCell.h"
@interface LYMeTableViewCell()

@end
@implementation LYMeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView * icon = [[UIImageView alloc]init];
//        icon.image = [UIImage imageNamed:@"setup-head-default"];
        [self.contentView addSubview:icon];
        self.icon = icon;
        [self.icon mas_makeConstraints:^(MASConstraintMaker * make){
            make.left.equalTo(self).offset(15);
            make.centerY.equalTo(self);
            make.width.and.height.mas_equalTo(35);
        }];
        
        UILabel * label = [[UILabel alloc]init];
//        label.text = @"登录/注册";
        [self.contentView addSubview:label];
        self.label = label;
        [self.label mas_makeConstraints:^(MASConstraintMaker * make){
            make.centerY.equalTo(self);
            make.left.equalTo(self.icon).offset(60);
            make.width.mas_equalTo(100);
            
        }];
    }
    
    return self;
}

-(UIImageView *)icon
{
    if(_icon == nil)
    {
        UIImageView * icon = [[UIImageView alloc]init];
//        icon.image = [UIImage imageNamed:@"icon1.jpg"];
        _icon = icon;
    }
    return _icon;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
