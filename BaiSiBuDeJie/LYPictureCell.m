//
//  LYPictureCell.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYPictureCell.h"
#import <UIImageView+WebCache.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "LYPictureModel.h"
#import <WebKit/WebKit.h>
@interface LYPictureCell()
@property(nonatomic,assign) BOOL couldClick;//声明一个BOOL属性 默认值是NO
@property(nonatomic,assign) BOOL couldCai;
@property(nonatomic,assign) BOOL could;
@property(nonatomic,assign) BOOL could2;
@property(nonatomic,assign) BOOL couldReportClick;

@property(nonatomic,assign) CGFloat contentH;


@end
@implementation LYPictureCell
#pragma mark -判断是否被顶过

#pragma mark -判断是否被踩过



#pragma mark -设置cell的间距
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 8;
    [super setFrame:frame];
    
}

#pragma mark -重写单元格的initWithStyle方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //头像
        UIImageView * img = [[UIImageView alloc]init];
        img.layer.cornerRadius = 17.5;
        img.layer.masksToBounds = YES;
        [self.contentView addSubview:img];
        self.icon = img;
        //昵称
        UILabel * name = [[UILabel alloc]init];
        name.font = [UIFont systemFontOfSize:17];
        name.textColor = [UIColor redColor];
        [self.contentView addSubview:name];
        self.nameLabel = name;
        //发布时间
        UILabel * time = [[UILabel alloc]init];
        time.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:time];
        self.timeLabel = time;
        //正文
        UILabel * content = [[UILabel alloc]init];
        content.font = [UIFont systemFontOfSize:14];
        content.numberOfLines =0;
        [self.contentView addSubview:content];
        self.contentLabel = content;
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
        
        //图片
        UIImageView * videoImage = [[UIImageView alloc]init];
        
//        NSString * cnt = self.contentLabel.text;
//        NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
//        CGFloat x = [UIScreen mainScreen].bounds.size.width - 5;
//        CGSize contentSize = [cnt boundingRectWithSize:CGSizeMake(x, MAXFLOAT) options:
//                              NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
//        CGFloat contentH = contentSize.height;
//        CGFloat pictureX = 5;
//        CGFloat pictureY = 49 + contentH + 5;
//        CGFloat pictureW = ScreenW - 10;
//        CGFloat pictureH = [self.pictureWidth intValue] *pictureW / [self.pictureHeight intValue];
//        if (pictureH > ScreenH) {
//            pictureH = 200;
//            self.longPic = YES;
//        }
//        self.videoImage.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        //        videoImage.contentMode = UIViewContentModeTop;
        //        videoImage.clipsToBounds = YES;
        [self.contentView addSubview:videoImage];
        self.videoImage = videoImage;
        self.videoImage.userInteractionEnabled = YES;
        //如果是gif图
        UIImageView * firstImage = [[UIImageView alloc]init];
        firstImage.userInteractionEnabled = YES;
        [self.contentView addSubview:firstImage];
        self.gifFrameImage = firstImage;
        
        //使用WKwebView加载Gif
        WKWebView * gifImage = [[WKWebView alloc]init];
        NSURLRequest * request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.videoUrl]];
        [gifImage loadRequest:request];
        self.web = gifImage;
        
        //gif标签
        UIImageView * gifTag = [[UIImageView alloc]init];
        [gifTag setImage:[UIImage imageNamed:@"common-gif"]];
        [self.gifFrameImage addSubview:gifTag];
        self.gifTag = gifTag;
        
        //显示长图按钮
        UIButton * showLongImage = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [showLongImage setTitle:@"点击查看长图" forState:UIControlStateNormal];
        //        [showLongImage setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [showLongImage sizeToFit];
        [showLongImage setImage:[UIImage imageNamed:@"lookLongImage"] forState:UIControlStateNormal];
        [showLongImage addTarget:self action:@selector(showDetailImage:andUrl:) forControlEvents:UIControlEventTouchUpInside];
        [self.videoImage addSubview:showLongImage];
        self.showLongImage = showLongImage;
        
        //查看动图按钮
        UIButton * showGifImage = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [showGifImage setTitle:@"点击查看动图" forState:UIControlStateNormal];
        //        [showGifImage setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [showGifImage sizeToFit];
        [showGifImage setImage:[UIImage imageNamed:@"look_gif_Image"] forState:UIControlStateNormal];
        [showGifImage addTarget:self action:@selector(showGifImage:andUrl:) forControlEvents:UIControlEventTouchUpInside];
        [self.gifFrameImage addSubview:showGifImage];
        self.showGifImage = showGifImage;
    }
    
    
    return self;
}
#pragma mark -点击查看大图
-(void)showDetailImage:(UIButton *)btn andUrl:(NSURL *)url
{
    btn = self.showLongImage;
    url = [NSURL URLWithString:self.videoUrl];
    [self.delegate didShowDetailImage:btn andUrl:url];
}
#pragma mark - 点击查看动图
-(void)showGifImage:(UIButton *)btn andUrl:(NSURL *)url
{
    btn = self.showGifImage;
    url = [NSURL URLWithString:self.videoUrl];
    [self.delegate didShowGifImage:btn andURl:url];
}


#pragma mark -model的set方法
-(void)setModel:(LYPictureModel *)model
{
    _model = model;
    [self loadData];
    [self loadFrame];
}
#pragma mark -加载数据
-(void)loadData
{
    LYPictureModel * model = self.model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.created_at;
    self.contentLabel.text = model.text;
    self.dingLabel.text = model.ding;
    self.caiLabel.text = model.cai;
    self.commentLabel.text = model.comment;
    self.repostLabel.text = model.repost;
    self.videoUrl = model.image1;
    self.isGif = model.is_gif;
    self.pictureHeight = model.height;
    self.pictureWidth = model.width;
    self.longPic= model.longPic;
    
    
    
    //    NSLog(@"%@",model.videouri);
    if([self.isGif intValue] == 0)
    {
//        if (self.isLongPic) {
////            self.videoImage.layer.contentsRect = CGRectMake(0, 0, 0.5, (double)200/[self.pictureHeight intValue]);
//            self.videoImage.contentMode = UIViewContentModeTop;
//            self.videoImage.clipsToBounds = YES;
//        }else{
//            self.videoImage.contentMode = UIViewContentModeScaleToFill;
//            self.videoImage.clipsToBounds = NO;
//        }
//                NSLog(@"++++++%@",self.pictureHeight);
//                NSLog(@"_______%@",self.pictureWidth);
                if([self.pictureHeight intValue] >400&&[self.pictureHeight intValue]<8000)
                {
                    self.videoImage.layer.contentsRect =CGRectMake(0, 0, 1, 0.3);
                }
                else if([self.pictureHeight intValue]>8000&&[self.pictureWidth intValue]>600)
                {
                    NSLog(@"高度大于8000 宽度大于600");
                    self.videoImage.layer.contentsRect = CGRectMake(0, 0, 0.5, (double)500/[self.pictureHeight intValue]);
                    self.gifFrameImage.clipsToBounds = YES;
                    self.gifFrameImage.contentMode = UIViewContentModeScaleAspectFit;
                    [self.gifFrameImage setContentScaleFactor:[[UIScreen mainScreen] scale]];
                    self.gifFrameImage.autoresizingMask= UIViewAutoresizingFlexibleHeight;
                }
                else if ([self.pictureWidth intValue]>600)
                {
                    self.videoImage.layer.contentsRect = CGRectMake(0, 0, (double)500/[self.pictureWidth intValue], (double)500/[self.pictureHeight intValue]);
        
                }
                else
                {
                    self.showLongImage.hidden = NO;
                }
        self.gifTag.hidden = YES;
        self.gifFrameImage.hidden = YES;
        [self.videoImage sd_setImageWithURL:[NSURL URLWithString:model.image1]];
        self.web.hidden = YES;//隐藏gif
        
    }
    else if([self.isGif intValue] == 1)
    {
        if([self.pictureHeight intValue] >400)
        {
            NSLog(@"=====%@=",self.pictureHeight);
            self.gifFrameImage.layer.contentsRect = CGRectMake(0, 0, 1, (double)200/[self.pictureHeight intValue]);
            
        }
        [self.gifFrameImage sd_setImageWithURL:[NSURL URLWithString:model.gifFistFrame]];
        self.gifTag.hidden =NO;
        self.videoImage.hidden = YES;
        self.showGifImage.hidden = NO;
        self.gifFrameImage.hidden = NO;
        
        
        //        //手势
        UITapGestureRecognizer  * tagGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureGo:andPictureUrl:)];
        tagGesture.numberOfTapsRequired = 1;//点击次数
        tagGesture.numberOfTouchesRequired = 1;//点击手指数
        [self.gifFrameImage addGestureRecognizer:tagGesture];
        
        
        //使用WKWebView
        //        self.videoImage.hidden = YES;
        //        self.gifFrameImage.hidden = YES;
        //        self.gifTag.hidden = NO;
        
    }
    //后来添加的
    
    
    
    
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
#pragma mark -cai按钮

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
-(void)btnCommentClick:(UIButton *)btn
{
    //    [self.delegate didCommentClickButton:btn];
    btn.selected = !btn.selected;
    
    self.commentLabel.text = [NSString stringWithFormat:@"%g",([self.commentLabel.text floatValue] + 1 )];
    
    
}
#pragma mark -repost
-(void)btnRepostClick:(UIButton *)btn
{
    [self.delegate didRepostClickButton:btn];
    //    btn.selected = !btn.selected;
    
    self.repostLabel.text = [NSString stringWithFormat:@"%g",([self.repostLabel.text floatValue] + 1 )];
}
#pragma mark -加载frame
-(void)loadFrame
{
    //头像
    [self.icon mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.and.top.equalTo(self).offset(7);
        make.width.and.height.mas_equalTo(35);
        
    }];
    //昵称
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.icon).offset(45);
        make.top.equalTo(self).offset(10);
    }];
    //发布时间
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel).offset(20);
        make.width.mas_equalTo(self.frame.size.width/2);
    }];
    //正文
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.timeLabel).offset(23);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.left.equalTo(self).offset(5);
        
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
    NSString * cnt = self.contentLabel.text;
    NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 5;
    CGSize contentSize = [cnt boundingRectWithSize:CGSizeMake(x, MAXFLOAT) options:
                          NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    CGFloat contentH = contentSize.height;
   // 视频图片
    [self.videoImage mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.timeLabel).offset(45+contentH);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
        make.height.mas_equalTo(315*[self.pictureHeight intValue]/[self.pictureWidth intValue]);
    }];
    
    
    //gif第一张图
    [self.gifFrameImage mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.timeLabel).offset(45+contentH);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
        make.height.mas_equalTo(280);
    }];
    [self.gifTag mas_makeConstraints:^(MASConstraintMaker * make){
        make.left.and.top.equalTo(self.gifFrameImage);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        
    }];
    //WKwebView
    //    [self.web mas_makeConstraints:^(MASConstraintMaker * make){
    //        make.top.equalTo(self.timeLabel).offset(45+contentH);
    //        make.left.equalTo(self).offset(5);
    //        make.right.equalTo(self).offset(-5);
    //        make.height.mas_equalTo(300);
    //    }];
    //显示大图按钮
    [self.showLongImage mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.videoImage);
        make.bottom.equalTo(self.videoImage);
        make.height.mas_equalTo(44);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
    }];
    //显示动图按钮
    [self.showGifImage mas_makeConstraints:^(MASConstraintMaker * make){
        make.bottom.equalTo(self.gifFrameImage);
        make.centerX.equalTo(self.gifFrameImage);
        make.height.mas_equalTo(44);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
    }];
    
    
}
-(CGFloat)getCellHeight
{
    NSString * cnt = self.contentLabel.text;
    NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 5;
    CGSize contentSize = [cnt boundingRectWithSize:CGSizeMake(x, MAXFLOAT) options:
                          NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    CGFloat contentH = contentSize.height;
    self.contentH = contentH;
//    return 35+65+contentH + [self.pictureWidth intValue] * (ScreenW - 10) / [self.pictureHeight intValue];
    return 35+65+contentH + 200;
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
