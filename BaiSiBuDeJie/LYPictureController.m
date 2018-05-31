//
//  LYPictureController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYPictureController.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "LYPictureModel.h"
#import "LYPictureCell.h"
#import <WebKit/WebKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <WebKit/WebKit.h>
#import <MJRefresh/MJRefresh.h>

@interface LYPictureController ()<LYPictureDelegate,LYPictureControllerDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong) NSMutableArray * array;
@property(nonatomic,weak) UIButton * dingBtn;
@property(nonatomic,weak) UIButton * caiBtn;
@property(nonatomic,weak) UIButton * commentBtn;
@property(nonatomic,weak) UIButton * repostBtn;
@property(nonatomic,weak) UILabel * dingLabel;
@property(nonatomic,weak) UILabel * caiLabel;
@property(nonatomic,weak) UILabel * commentLabel;
@property(nonatomic,weak) UILabel * repostlabel;
@property(nonatomic,weak) UIView * menuVIew;
@property(nonatomic,strong) NSURL * gifUrl;
@property(nonatomic,strong) NSURL * longImageUrl;
@property (nonatomic,strong)NSString *maxtime;

@property(nonatomic,weak) UIWebView * web;
@property(nonatomic,weak) UIButton * backButton;
@property(nonatomic,weak) UIImageView * backgourndView;


@property(nonatomic,weak) UIWebView * longWeb;
@property(nonatomic,weak) UIButton * backLongButton;
@property(nonatomic,weak) UIImageView * backGorundView;

@property(nonatomic,assign) BOOL reportClick;
@property(nonatomic,strong) UITapGestureRecognizer * recognizer;
@end

@implementation LYPictureController
static NSString *ID = @"cell";
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    self.view.backgroundColor = [UIColor grayColor];
    [self createMenu];
    [self.delegate addGif:self.gifUrl];
    [self refresh];
    
}

- (void) refresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
-(void)loadMoreData
{
    //1.创建请求会话管理者
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //2.拼接参数
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(10);
    parameters[@"maxtime"] = _maxtime;
    //3、请求数据
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nullable task,id  _Nullable responseObject)
     {
         
         _maxtime = responseObject[@"info"][@"maxtime"];
         NSArray * temp =  [LYPictureModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         [self.array addObjectsFromArray:temp];
         
         
         
         
         //刷新数据
         [self.tableView reloadData];
         [self.tableView.mj_footer endRefreshing];
     }failure:^(NSURLSessionDataTask * _Nullable task, id _Nullable error)
     {
         NSLog(@"%@",error);
         [self.tableView.mj_footer endRefreshing];
     }];
    
    
}

#pragma mark -显示长图的代理方法
-(void)didShowDetailImage:(UIButton *)btn andUrl:(NSURL *)url
{
    self.longImageUrl = url;
    UIWebView * longWeb = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, ScreenW, ScreenH-64)];
    NSURLRequest * request =[[NSURLRequest alloc]initWithURL:self.longImageUrl];
    [longWeb loadRequest:request];
    longWeb.userInteractionEnabled = YES;
    longWeb.scalesPageToFit = YES;
    longWeb.scrollView.bounces = NO;
    
    self.longWeb = longWeb;
    [[[UIApplication sharedApplication].delegate window]addSubview:self.longWeb];
    
//    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH/4)];
//    view.backgroundColor = [UIColor whiteColor];
//    self.backgourndView = view;
//    [[[UIApplication sharedApplication].delegate window]addSubview:view];
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, ScreenH-44, ScreenW, 44)];
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    self.backButton =backButton;
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backToLongImage) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication].delegate window] addSubview:backButton];
    
}
#pragma mark -返回到长图原始界面
-(void)backToLongImage
{
    [self.longWeb removeFromSuperview];
//    [self.backgourndView removeFromSuperview];
    [self.backButton removeFromSuperview];
}


#pragma mark -代理方法
-(void)didShowGifImage:(UIButton *)btn andURl:(NSURL *)url
{
    self.gifUrl = url;
    UIWebView * web = [[UIWebView alloc]initWithFrame:CGRectMake(0, ScreenH/4, ScreenW, ScreenH-ScreenH/4-44)];
    NSURLRequest * request =[[NSURLRequest alloc]initWithURL:self.gifUrl];
    [web loadRequest:request];
    web.userInteractionEnabled = YES;
    web.scalesPageToFit = YES;
    web.scrollView.bounces = NO;
    self.web = web;
    
    [[[UIApplication sharedApplication].delegate window]addSubview:self.web];
    UIButton * bc = [UIButton buttonWithType:UIButtonTypeCustom];
    bc.backgroundColor = [UIColor whiteColor];
    [bc setTitle:@"返回" forState:UIControlStateNormal];
    [bc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bc.frame = CGRectMake(0, ScreenH-44, ScreenW, 44);
    self.backButton = bc;
    //    [self.web addSubview:bc];
    [[[UIApplication sharedApplication].delegate window]addSubview:bc];
    
    [bc addTarget:self action:@selector(backToGif) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH/4)];
    view.backgroundColor = [UIColor whiteColor];
    self.backgourndView = view;
    [[[UIApplication sharedApplication].delegate window]addSubview:view];
}

#pragma mark -点击屏幕返回图片
-(void)backToGif
{
    [self.web removeFromSuperview];
    [self.backButton removeFromSuperview];
    [self.backgourndView removeFromSuperview];
}
-(void)createMenu
{
    UIView * menuView = [[UIView alloc]initWithFrame:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-200)];
    
    menuView.backgroundColor = [UIColor colorWithRed:64/255.0 green:62/255.0 blue:62/255.0 alpha:0.9];
    //    menuView.alpha = 0.8;
    //    [self.view addSubview:menuView];
    [[[UIApplication sharedApplication].delegate window] addSubview:menuView];
    self.menuVIew = menuView;
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"but_signin_qq"] forState:UIControlStateNormal];
    [button1 sizeToFit];
    [button1 addTarget:self action:@selector(button3Go) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVIew addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"but_signin_sina"] forState:UIControlStateNormal];
    [button2 sizeToFit];
    //    [button1 addTarget:self action:@selector(button1Go) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVIew addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[UIImage imageNamed:@"but_signin_wechet"] forState:UIControlStateNormal];
    [button3 sizeToFit];
    [button3 addTarget:self action:@selector(button3Go) forControlEvents:UIControlEventTouchUpInside];
    [self.menuVIew addSubview:button3];
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setTitle:@"取消" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(button4Go) forControlEvents:UIControlEventTouchUpInside];
    button4.backgroundColor = [UIColor colorWithRed:157/255.0 green:141/255.0 blue:141/255.0 alpha:0.4];
    [self.menuVIew addSubview:button4];
    
    UILabel * reminder = [[UILabel alloc]init];
    reminder.text = @"分享到:";
    reminder.textColor = [UIColor whiteColor];
    reminder.textAlignment = NSTextAlignmentCenter;
    [self.menuVIew addSubview:reminder];
    
    UILabel * weibo = [[UILabel alloc]init];
    weibo.text = @"新浪微博";
    [self.menuVIew addSubview:weibo];
    
    UILabel * qq = [[UILabel alloc]init];
    qq.text = @"QQ好友";
    [self.menuVIew addSubview:qq];
    
    UILabel * wechat =[[UILabel alloc]init];
    wechat.text=@"微信好友";
    [self.menuVIew addSubview:wechat];
    
    
    [reminder mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.menuVIew);
        make.top.equalTo(self.menuVIew).offset(10);
        make.height.mas_equalTo(30);
    }];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(reminder).offset(30);
        make.centerX.equalTo(self.menuVIew);
        make.height.and.width.mas_equalTo(50);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(reminder).offset(30);
        make.left.equalTo(button1).offset(-100);
        make.height.and.width.mas_equalTo(50);
    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(reminder).offset(30);
        make.right.equalTo(button1).offset(100);
        make.height.and.width.mas_equalTo(50);
    }];
    
    [button4 mas_makeConstraints:^(MASConstraintMaker * make){
        make.bottom.equalTo(self.menuVIew);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(44);
    }];
    
    
    
}


#pragma mark -微信分享
-(void)button3Go
{
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://c.f.winapp111.com.cn/share/25743914.html?wx.qq.com&appname="]];
    
}
-(void)button4Go
{
    
    [UIView animateWithDuration:0.7 animations:^{
        self.menuVIew.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-200);
        self.tableView.scrollEnabled = YES;
        //        self.menuVIew.hidden = YES;
    }];
    self.view.userInteractionEnabled = YES;
    
}
#pragma mark - 请求数据
-(void)loadData
{
    
    //1.创建请求会话管理者
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //2.拼接参数
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(10);
    
    //3、请求数据
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nullable task,id  _Nullable responseObject)
     {
         
         [responseObject writeToFile:@"/Users/leiyuan/Desktop/leyal.plist" atomically:YES];
         self.array =  [LYPictureModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         //刷新数据
         [self.tableView reloadData];
         [self.tableView.mj_footer endRefreshing];
     }failure:^(NSURLSessionDataTask * _Nullable task, id _Nullable error)
     {
         NSLog(@"%@",error);
         [self.tableView.mj_footer endRefreshing];
     }];
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYPictureCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[LYPictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.array[indexPath.row];
    LYPictureModel * Model = self.array[indexPath.row];
    
    
    self.url = [NSURL URLWithString:cell.videoUrl];
    self.isGif = cell.isGif;
    NSLog(@"%@",self.isGif);
    
    self.dingBtn = cell.dingButton;
    self.caiBtn = cell.caiButton;
    self.dingLabel = cell.dingLabel;
    self.caiLabel = cell.caiLabel;
    cell.delegate = self;
    Model.cellheight = [cell getCellHeight];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    LYPictureModel * model = self.array[indexPath.row];
//    return model.cellheight;
    return 450;
}
//-(void)didDingClickButton:(UIButton *)button
//{
//
//}

//-(void)didCaiClickButton:(UIButton *)button
//{
//
//}
//
//-(void)didCommentClickButton:(UIButton *)button
//{
//
//}
-(void)didRepostClickButton:(UIButton *)button
{
    
    self.view.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.7 animations:^{
        self.menuVIew.frame= CGRectMake(0, [UIScreen mainScreen].bounds.size.height-[UIScreen mainScreen].bounds.size.width+200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-200);
    }];
    self.menuVIew.hidden = NO;
    self.tableView.scrollEnabled = NO;
    
    
}

@end
