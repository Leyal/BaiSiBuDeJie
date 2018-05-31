//
//  LYTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/6.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYTableViewCell.h"
#import "LYModel.h"
@interface LYTableViewCell()
@property(nonatomic,assign) BOOL couldClick;//声明一个BOOL属性 默认值是NO
@property(nonatomic,assign) BOOL couldCai;
@property(nonatomic,assign) BOOL could;
@property(nonatomic,assign) BOOL could2;
@property(nonatomic,assign) BOOL couldReportClick;


@end
@implementation LYTableViewCell
//创建属性引用控件
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
        content.font = [UIFont systemFontOfSize:16];
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
    }
    
    
    return self;
}
#pragma mark -model的set方法
-(void)setModel:(LYModel *)model
{
    _model = model;
    [self loadData];
    [self loadFrame];
}
#pragma mark -加载数据
-(void)loadData
{
    LYModel * model = self.model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.created_at;
    self.contentLabel.text = model.text;
    self.dingLabel.text = model.ding;
    self.caiLabel.text = model.cai;
    self.commentLabel.text = model.comment;
    self.repostLabel.text = model.repost;
    
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
        make.top.equalTo(self.timeLabel).offset(17);
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
    
}
-(CGFloat)getCellHeight
{
    NSString * cnt = self.contentLabel.text;
    NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 5;
    CGSize contentSize = [cnt boundingRectWithSize:CGSizeMake(x, MAXFLOAT) options:
                          NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    CGFloat contentH = contentSize.height;
    return 35+65+contentH;
}
@end
