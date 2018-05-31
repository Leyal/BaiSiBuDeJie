//
//  LYVoiceCell.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYVoiceCell.h"
#import <UIImageView+WebCache.h>
#import "LYVoiceModel.h"
@interface LYVoiceCell()
@property(nonatomic,assign) BOOL couldClick;//声明一个BOOL属性 默认值是NO
@property(nonatomic,assign) BOOL couldCai;
@property(nonatomic,assign) BOOL could;
@property(nonatomic,assign) BOOL could2;
@property(nonatomic,assign) BOOL couldReportClick;
@end
@implementation LYVoiceCell
#pragma mark -设置cell间距
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 5;
    [super setFrame:frame];
    
}
#pragma mark -重写cell的intWithStyle方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //        self.userInteractionEnabled = YES;
        
        //头像
        UIImageView * icon = [[UIImageView alloc]init];
        icon.layer.cornerRadius = 17.5;
        icon.layer.masksToBounds = YES;
        
        [self.contentView addSubview:icon];
        self.icon = icon;
        //昵称
        
        UILabel * name = [[UILabel alloc]init];
        name.textColor = [UIColor redColor];
        name.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:name];
        self.nameLabel = name;
        //发布时间
        UILabel * time = [[UILabel alloc]init];
        time.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:time];
        self.timeLabel = time;
        //正文
        UILabel * content = [[UILabel alloc]init];
        content.font = [UIFont systemFontOfSize:14];
        
        content.numberOfLines = 0;//换行
        //        content.lineBreakMode = 0;
        [self.contentView addSubview:content];
        self.contentLabel = content;
        //        self.contentLabel.numberOfLines = 0;
        //图片
        UIImageView * image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        self.img = image;
        self.img.userInteractionEnabled = YES;
        //播放按钮背景图片
        //        UIImageView * playButtonBackGround = [[UIImageView alloc]init];
        //        playButtonBackGround.image = [UIImage imageNamed:@"playButton"];
        //        [self.img addSubview:playButtonBackGround];
        //        self.playButtonBackGround = playButtonBackGround;
        //        self.playButtonBackGround.userInteractionEnabled = YES;
        
        
        //播放按钮
        UIButton * playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [playButton addTarget:self action:@selector(btnClick:andButton:) forControlEvents:UIControlEventTouchUpInside];
        [playButton setImage:[UIImage imageNamed:@"playButtonPlay"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"playButtonPause"] forState:UIControlStateSelected];
        [self.img addSubview:playButton];
        self.playButton = playButton;
        
        //ding按钮
        UIButton * ding = [UIButton buttonWithType:UIButtonTypeCustom];
        [ding setImage:[UIImage imageNamed:@"mainCellDing"] forState:UIControlStateNormal];
        [ding setImage:[UIImage imageNamed:@"mainCellDingClick"] forState:UIControlStateSelected];
        [ding addTarget:self action:@selector(btnDingClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:ding];
        self.dingButton = ding;
        //dingLabel
        UILabel * dingLabel = [[UILabel alloc]init];
        dingLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:dingLabel];
        self.dingLabel = dingLabel;
        //cai按钮
        UIButton * cai = [UIButton buttonWithType:UIButtonTypeCustom];
        [cai setImage:[UIImage imageNamed:@"mainCellCai"] forState:UIControlStateNormal];
        [cai setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateSelected];
        [cai addTarget:self action:@selector(btnCaiClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:cai];
        self.caiButton = cai;
        //caiLabel
        UILabel * caiLabel = [[UILabel alloc]init];
        caiLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:caiLabel];
        self.caiLabel = caiLabel;
        //comment按钮
        UIButton * comment = [UIButton buttonWithType:UIButtonTypeCustom];
        [comment setImage:[UIImage imageNamed:@"mainCellComment"] forState:UIControlStateNormal];
        [comment setImage:[UIImage imageNamed:@"mainCellCommentClick"] forState:UIControlStateSelected];
        [comment addTarget:self action:@selector(btnCommentClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:comment];
        self.commentButton = comment;
        //commentLabel
        UILabel * commentLabel = [[UILabel alloc]init];
        commentLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:commentLabel];
        self.commentLabel = commentLabel;
        //repost按钮
        UIButton * repost = [UIButton buttonWithType:UIButtonTypeCustom];
        [repost setImage:[UIImage imageNamed:@"mainCellShare"] forState:UIControlStateNormal];
        [repost setImage:[UIImage imageNamed:@"mainCellShareClick"] forState:UIControlStateSelected];
        [repost addTarget:self action:@selector(btnRepostClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:repost];
        self.repostButton = repost;
        //repostLaebl
        UILabel * repostLabel = [[UILabel alloc]init];
        repostLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:repostLabel];
        self.repostLabel = repostLabel;
        
        
        
    }
    return self;
}
#pragma mark -button点击事件，通过代理模式响应
-(void)btnDingClick:(UIButton *)btn
{
    //    [self.delegate didDingClickButton:btn];
    //判断按钮被重复点击
    
    
    if(!_couldClick&&!_could&&!_could2)
    {
        btn.selected = !btn.selected;
        self.dingLabel.text = [NSString stringWithFormat:@"%g",([self.dingLabel.text floatValue] + 1 )];
        _couldClick = !_couldClick;
        _could = !_could;
        NSLog(@"%@",self.dingLabel.text);
    }
    else if(_couldClick&&!_could2)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"您已经顶过了~~亲" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"朕知道了", nil];
        [alertView show];
    }
    else if(!_could&&_could2)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"您已经踩过了~~亲" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"朕知道了", nil];
        [alertView show];
    }
    
    //    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"您已经顶过了~~" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"朕知道了", nil];
    //    [alertView show];
    
}
#pragma mark -cai按钮的点击事件

-(void)btnCaiClick:(UIButton *)btn
{
    //    [self.delegate didCaiClickButton:btn];  执行代理中的方法 让其他类来实现
    if(!_couldCai&&!_could2&&!_could)
    {
        btn.selected = !btn.selected;
        
        self.caiLabel.text = [NSString stringWithFormat:@"%g",([self.caiLabel.text floatValue] + 1 )];
        _couldCai = !_couldCai;
        _could2 = !_could2;
    }
    else if(_could && !_could2)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"您已经顶过了~~亲" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"朕知道了", nil];
        [alertView show];
    }
    else if (_couldCai&&!_could)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"您已经踩过了~~亲" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"朕知道了", nil];
        [alertView show];
    }
    
    
}
#pragma mark -评论按钮的点击事件
-(void)btnCommentClick:(UIButton *)btn
{
    //    [self.delegate didCommentClickButton:btn];
    btn.selected = !btn.selected;
    
    self.commentLabel.text = [NSString stringWithFormat:@"%g",([self.commentLabel.text floatValue] + 1 )];
    
    
}
#pragma mark -repost安妞妞的点击事件
-(void)btnRepostClick:(UIButton *)btn
{
    [self.delegate didRepostClickButton:btn];
    //    btn.selected = !btn.selected;
    
    self.repostLabel.text = [NSString stringWithFormat:@"%g",([self.repostLabel.text floatValue] + 1 )];
}
#pragma mark -button点击事件，通过代理模式响应
-(void)btnClick:(NSURL *)url andButton:(UIButton *)btn
{   url = [NSURL URLWithString:self.url];
    btn = self.playButton;
    [self.delegate didClickButton:url andButton:btn];
    
}
#pragma mark -model的set方法
-(void)setTopic:(LYVoiceModel *)Topic
{
    _Topic = Topic;
    LYVoiceModel * topic = self.Topic;
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]];
    self.nameLabel.text = topic.name;
    self.timeLabel.text =topic.created_at;
    self.contentLabel.text = topic.text;
    self.imgHeight = [topic.height floatValue];
    self.imgWidth = [topic.width floatValue];
    self.dingLabel.text = topic.ding;
    self.caiLabel.text = topic.cai;
    self.commentLabel.text = topic.comment;
    self.repostLabel.text = topic.repost;
    [self.img sd_setImageWithURL:[NSURL URLWithString:topic.image1]];
    
    self.url = topic.voiceuri;
    
    [self setFrame];
    
}


-(void)setFrame
{
    //    LYTopic * topic = [[LYTopic alloc]init];
    //头像
    [self.icon mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(5);
        make.width.and.height.mas_equalTo(35);
    }];
    //昵称
    NSString * nick = self.nameLabel.text;
    //    CGFloat nameX = CGRectGetMaxX(self.icon.frame) + 10;
    
    NSDictionary * attr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize nameSize = [nick boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr1 context:nil].size;
    //    CGFloat nameW = nameSize.width;
    CGFloat nameH  = nameSize.height;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self).offset(5);
        make.height.mas_equalTo(nameH);
        make.width.mas_equalTo(100);
        make.left.equalTo(self.icon).offset(50);
    }];
    //发布时间
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.icon).offset(22);
        make.width.mas_equalTo(200);
    }];
    
    
    
    
    /*
     使用autoLayout时不用设置label的高度
     */
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.timeLabel).offset(13);
        //        make.width.mas_equalTo(contentW);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        //        make.height.mas_equalTo(contentSize.height+50);
        make.left.equalTo(self).offset(5);
    }];
    //图片
    NSString * cnt = self.contentLabel.text;
    NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 5;
    CGSize contentSize = [cnt boundingRectWithSize:CGSizeMake(x, MAXFLOAT) options:
                          NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    CGFloat contentH = contentSize.height;
    [self.img mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.timeLabel).offset(25+contentH);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-20);
        //        make.width.mas_offset([topic.width floatValue]);
        make.height.mas_equalTo(300);
        
        
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    
    //播放按钮背景
    [self.playButtonBackGround mas_makeConstraints:^(MASConstraintMaker * make){
        make.center.equalTo(self.img);
        make.width.and.height.mas_equalTo(70);
        
    }];
    
    //播放按钮
    [self.playButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.center.equalTo(self.img);
        make.width.and.height.mas_equalTo(45);
    }];
    
    //ding按钮
    [self.dingButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self).offset(17.5);
        make.width.mas_equalTo(23.5);
        make.bottom.equalTo(self).offset(-8);
    }];
    
    //dingLabel
    [self.dingLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.dingButton).offset(23.5);
        make.centerY.equalTo(self.dingButton);
        
    }];
    //cai按钮
    [self.caiButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.dingLabel).offset(74);
        make.centerY.equalTo(self.dingButton);
        make.width.mas_equalTo(23.5);
    }];
    //caiLabel
    [self.caiLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.caiButton).offset(23.5);
        make.centerY.equalTo(self.dingButton);
        
    }];
    //comment按钮
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.caiLabel).offset(74);
        make.centerY.equalTo(self.dingButton);
        make.width.mas_equalTo(23.5);
    }];
    //commentLabel
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.commentButton).offset(23.5);
        make.centerY.equalTo(self.dingButton);
        
    }];
    //repost按钮
    [self.repostButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.commentLabel).offset(74);
        make.centerY.equalTo(self.dingButton);
        make.width.mas_equalTo(23.5);
    }];
    //repostLaebl
    [self.repostLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.repostButton).offset(23.5);
        make.centerY.equalTo(self.dingButton);
        
    }];
    
}



@end
