//
//  LYTableViewCell.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/6.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYAllDelegate<NSObject>
@optional
-(void)didDingClickButton:(UIButton *)button;
-(void)didCaiClickButton:(UIButton *)button;
-(void)didCommentClickButton:(UIButton *)button;
-(void)didRepostClickButton:(UIButton *)button;


@end
@class LYModel;
@interface LYTableViewCell : UITableViewCell
@property(nonatomic,strong) LYModel * model;
@property(nonatomic,weak) UILabel * nameLabel;
@property(nonatomic,weak) UILabel * timeLabel;
@property(nonatomic,weak) UILabel * contentLabel;
@property(nonatomic,weak) UIImageView * icon;
@property(nonatomic,weak) UIButton * dingButton;
@property(nonatomic,weak) UIButton * caiButton;
@property(nonatomic,weak) UIButton * commentButton;
@property(nonatomic,weak) UIButton * repostButton;
@property(nonatomic,weak) UILabel * dingLabel;
@property(nonatomic,weak) UILabel * caiLabel;
@property(nonatomic,weak) UILabel * commentLabel;
@property(nonatomic,weak) UILabel * repostLabel;
@property(nonatomic,weak) id<LYAllDelegate> delegate;
-(CGFloat) getCellHeight;


@end
