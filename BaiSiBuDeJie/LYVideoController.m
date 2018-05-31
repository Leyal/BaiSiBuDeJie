//
//  LYVideoController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/4.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYVideoController.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "LYVideoModel.h"
#import "LYVideoCell.h"
#import <WebKit/WebKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MJRefresh/MJRefresh.h>

@interface LYVideoController ()<LYVideoCellDelegate,UITableViewDelegate,UITableViewDataSource>
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
@property (nonatomic,strong)NSString *maxtime;
@property(nonatomic,assign) BOOL reportClick;
@end

@implementation LYVideoController
static NSString *ID = @"cell";
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
    self.view.backgroundColor = [UIColor grayColor];
    [self createMenu];
    [self refresh];
    [self searchNet];
    
}
-(void)searchNet
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];//开始网络检测
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];//结束网络检测
    //判断网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         
         if(status == AFNetworkReachabilityStatusUnknown)
         {
             
             UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前手机网络状态未知" preferredStyle:UIAlertControllerStyleAlert];
             [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
             [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
             [self.navigationController presentViewController:alertController animated:YES completion:nil];
         }
         else if (status == AFNetworkReachabilityStatusNotReachable)
         {
             UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前手机网络处于未连接状态" preferredStyle:UIAlertControllerStyleAlert];
             [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
             [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
             [self.navigationController presentViewController:alertController animated:YES completion:nil];
         }
         else if (status == AFNetworkReachabilityStatusReachableViaWWAN)
         {
             UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前正在使用流量播放视频" preferredStyle:UIAlertControllerStyleAlert];
             [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
             [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
             [self.navigationController presentViewController:alertController animated:YES completion:^(void){
                 
             }];
         }
         else if (status == AFNetworkReachabilityStatusReachableViaWiFi)
         {
             UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前正在使用WI-FI播放视频" preferredStyle:UIAlertControllerStyleAlert];
             [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
             [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
             [self.navigationController presentViewController:alertController animated:YES completion:nil];
         }
     }];
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
    parameters[@"type"] = @(41);
    parameters[@"maxtime"] = _maxtime;
    //3、请求数据
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nullable task,id  _Nullable responseObject)
     {
         
         _maxtime = responseObject[@"info"][@"maxtime"];
         NSArray * temp =  [LYVideoModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
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
-(void)createMenu
{
    //    UIView * menuView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    
    
    //    [self.menuVIew mas_makeConstraints:^(MASConstraintMaker * make){
    //        make.bottom.equalTo(self.view).offset(-[UIScreen mainScreen].bounds.size.width);
    //        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    //        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    //        make.left.equalTo(self.view);
    //    }];
    //    self.menuVIew.hidden = YES;
    UIView * menuView = [[UIView alloc]initWithFrame:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-200)];
    
    menuView.backgroundColor = [UIColor colorWithRed:64/255.0 green:62/255.0 blue:62/255.0 alpha:0.9];
    //    menuView.alpha = 0.8;
    //    [self.view addSubview:menuView];
    [[[UIApplication sharedApplication].delegate window] addSubview:menuView];
    self.menuVIew = menuView;
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"but_signin_qq"] forState:UIControlStateNormal];
    [button1 sizeToFit];
    [button1 addTarget:self action:@selector(button1Go) forControlEvents:UIControlEventTouchUpInside];
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
#pragma mark -播放按钮代理方法
-(void)didPlayClickButton:(NSURL *)url
{
    AVPlayerViewController * play = [[AVPlayerViewController alloc]init];
    play.player = [[AVPlayer alloc]initWithURL:url];
    [self presentViewController:play animated:YES completion:nil];
    [play.player play];
    
    
    
    
}

-(void)button1Go
{
    //    LYSettingTableViewController * set = [[LYSettingTableViewController alloc]init];
    //    [self.navigationController pushViewController:set animated:YES];
    //    self.menuVIew.hidden = YES;
    //    self.tableView.scrollEnabled = YES;
    
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
    parameters[@"type"] = @(41);
    
    //3、请求数据
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nullable task,id  _Nullable responseObject)
     {
         
         self.array =  [LYVideoModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         //刷新数据
         [self.tableView reloadData];
         [self.tableView.mj_header endRefreshing];
     }failure:^(NSURLSessionDataTask * _Nullable task, id _Nullable error)
     {
         NSLog(@"%@",error);
         [self.tableView.mj_header endRefreshing];
     }];
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYVideoCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[LYVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.array[indexPath.row];
    LYVideoModel * Model = self.array[indexPath.row];
    
    
    self.url = [NSURL URLWithString:cell.videoUrl];
    NSLog(@"%@%@",self.url,@"url地址");
    self.dingBtn = cell.dingButton;
    self.caiBtn = cell.caiButton;
    self.dingLabel = cell.dingLabel;
    self.caiLabel = cell.caiLabel;
    cell.delegate = self;
    
    
    if(Model.cellheight == 0)
    {
        Model.cellheight = [cell getCellHeight];
    }
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       
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
    //    [UIView animateWithDuration:1 animations:^{
    //        [self.menuVIew mas_makeConstraints:^(MASConstraintMaker * make){
    //            make.left.equalTo(self.view);
    //            make.bottom.mas_equalTo(-[UIScreen mainScreen].bounds.size.width);
    //            make.width.and.height.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    //        }];
    //    }];
    
    
    self.view.userInteractionEnabled = NO;
    
    
    
    [UIView animateWithDuration:0.7 animations:^{
        self.menuVIew.frame= CGRectMake(0, [UIScreen mainScreen].bounds.size.height-[UIScreen mainScreen].bounds.size.width+200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width-200);
    }];
    self.menuVIew.hidden = NO;
    self.tableView.scrollEnabled = NO;
  
    
}
@end
