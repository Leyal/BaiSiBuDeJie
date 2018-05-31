//
//  LYVideoCell.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYVideoCellDelegate<NSObject>
@optional
-(void)didRepostClickButton:(UIButton *)button;
-(void)didPlayClickButton:(NSURL *)url;
@end
@class LYVideoModel;
@interface LYVideoCell : UITableViewCell
@property(nonatomic,strong) LYVideoModel * model;
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
@property(nonatomic,weak) UILabel * playCountLabel;
@property(nonatomic,weak) UILabel * videoTimeLabel;
@property(nonatomic,weak) UIImageView * playButtonBackGround;
@property(nonatomic,weak) UIButton * playButton;
@property(nonatomic,copy) NSString * videoUrl;
@property(nonatomic,weak) UIImageView * videoImage;
@property(nonatomic,weak) id<LYVideoCellDelegate> delegate;
-(CGFloat) getCellHeight;

@end
