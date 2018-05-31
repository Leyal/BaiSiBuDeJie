//
//  LYPictureCell.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@protocol LYPictureDelegate<NSObject>
@optional
-(void)didRepostClickButton:(UIButton *)button;
-(void)didPlayClickButton:(NSURL *)url;
-(void)didShowDetailImage:(UIButton *)btn andUrl:(NSURL *)url;
-(void)didShowGifImage:(UIButton *)btn andURl:(NSURL *)url;
@optional
-(void)didGestureGo:(UIImageView *)img andUrl:(NSURL *)url;
@end
@class LYPictureModel;
@interface LYPictureCell : UITableViewCell
@property(nonatomic,strong) LYPictureModel * model;
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
@property(nonatomic,copy) NSString * isGif;
@property(nonatomic,weak) UIImageView * gifFrameImage;
@property(nonatomic,weak) UIImageView * gifTag;
@property(nonatomic,weak) UIButton * showLongImage;
@property(nonatomic,weak) UIButton * showGifImage;
@property(nonatomic,weak) UIButton * showBigPictureButton;
@property(nonatomic,copy) NSString * pictureHeight;
@property(nonatomic,weak)  WKWebView * web;
@property(nonatomic,copy) NSString * pictureWidth;
@property(nonatomic,weak) id<LYPictureDelegate> delegate;
@property (nonatomic,assign,getter=isLongPic) BOOL longPic;
-(CGFloat) getCellHeight;
@end
