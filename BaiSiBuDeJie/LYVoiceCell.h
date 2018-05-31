//
//  LYVoiceCell.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYVocieDelegate<NSObject>
@optional
-(void)didClickButton:(NSURL *)url andButton:(UIButton *)btn;
-(void)didRepostClickButton:(UIButton *)button;

@end

@class LYVoiceModel;

typedef void(^TransformUrl) (NSString *voiceUrl);


@interface LYVoiceCell : UITableViewCell
@property(nonatomic,strong) LYVoiceModel * Topic;
@property(nonatomic,weak) UILabel * nameLabel;
@property(nonatomic,weak) UIImageView * icon;
@property(nonatomic,weak) UILabel * contentLabel;
@property(nonatomic,weak) UILabel * timeLabel;
@property(nonatomic,weak) UIImageView * img;
@property(nonatomic,weak) UIWebView * webview;
@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,assign) CGFloat imgWidth;
@property(nonatomic,assign) CGFloat imgHeight;
@property(nonatomic,weak) UIButton * playButton;
@property(nonatomic,copy) NSString * url;
@property(nonatomic,weak) UIButton * dingButton;
@property(nonatomic,weak) UIButton * caiButton;
@property(nonatomic,weak) UIButton * commentButton;
@property(nonatomic,weak) UIButton * repostButton;
@property(nonatomic,weak) UILabel * dingLabel;
@property(nonatomic,weak) UILabel * caiLabel;
@property(nonatomic,weak) UILabel * commentLabel;
@property(nonatomic,weak) UILabel * repostLabel;
@property(nonatomic,weak) UIImageView * playButtonBackGround;
@property(nonatomic,weak) id<LYVocieDelegate> delegate;

@property (nonatomic,copy) TransformUrl transformUrl;

@end

