//
//  LYADViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/4.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYADViewController.h"
#import "LYMainTabBarController.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "LYADItem.h"

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface LYADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *adIamge;
- (IBAction)goOnButton:(id)sender;
//@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property(nonatomic,strong) NSTimer * timer;
//@property(nonatomic,weak) UIButton * skipButton;
@property(nonatomic,assign) int count;

@property (nonatomic,strong)LYADItem *item;

@end

@implementation LYADViewController
{
    UIButton * skipButton;
}
-(int)count
{
    if(_count == 0)
    {
        int count = 3;
        _count = count;
    }
    return _count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //请求广告图片
    [self loadAdImage];
//    UIButton * skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [skipButton setTitle:[NSString stringWithFormat:@"%@%d%@",@"跳过",10,@"s"] forState:UIControlStateNormal];
    skipButton = [UIButton new];
    [skipButton setBackgroundColor:[UIColor lightGrayColor]];
    [skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [skipButton setTitle:@"跳过3s" forState:UIControlStateNormal];
     skipButton.titleLabel.font = [UIFont systemFontOfSize:18];
//    [skipButton setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    [skipButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 5, 0)];
    [self.view addSubview:skipButton];
    [skipButton mas_makeConstraints:^(MASConstraintMaker * make){
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(35);
        make.right.equalTo(_adIamge).offset(-20);
        make.top.equalTo(_adIamge).offset(20);
        
    }];
    
     self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setSkip) userInfo:nil repeats:YES];
    
    [skipButton addTarget:self action:@selector(goOn) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self adGesture];
}
#pragma mark -广告界面手势
-(void)adGesture
{
    self.adIamge.userInteractionEnabled = YES;
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureToSafari)];
    gesture.numberOfTapsRequired = 1;
    gesture.numberOfTouchesRequired = 1;
    [self.adIamge addGestureRecognizer:gesture];
}

#pragma mark -界面添加手势跳转到广告url
-(void)gestureToSafari
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:_item.ori_curl]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_item.ori_curl]];
    }
}
- (IBAction)setSkip{
    
//    UIButton * skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [skipButton setTitle:[NSString stringWithFormat:@"%@%d%@",@"跳过",3,@"s"] forState:UIControlStateNormal];
//    skipButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [skipButton setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [skipButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
//    [self.view addSubview:skipButton];
//    [skipButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.width.mas_equalTo(56);
//        make.height.mas_equalTo(15);
//        make.right.equalTo(_adIamge).offset(-20);
//        make.top.equalTo(_adIamge).offset(20);
//        
//    }];
    
    if(_count>=1)
    {
        [skipButton setTitle:[NSString stringWithFormat:@"%@%d%@",@"跳过",_count,@"s"] forState:UIControlStateNormal];
    }
    
    if(_count<0)
    {
        [self.timer invalidate];
    }
    
    if(self.count == 1)
    {
        [skipButton setTitle:[NSString stringWithFormat:@"%@%d%@",@"跳过",_count,@"s"] forState:UIControlStateNormal];
//        [self goOn];
        [self performSelector:@selector(goOn) withObject:nil afterDelay:1];
        [self.timer invalidate];
    }
    NSLog(@"%d",_count);
    _count --;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goOnButton:(id)sender {
//    [self performSelector:@selector(goOn) withObject:nil afterDelay:3];
    [self performSelector:@selector(goOn)];
}
-(void)goOn
{
//    LYMainTabBarController * mainVc = [[LYMainTabBarController alloc]init];
//    [self.navigationController pushViewController:mainVc animated:YES];
    
    //获取当前应用程序
    LYMainTabBarController * mainVc = [[LYMainTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVc;
    [self.timer invalidate];
//    AppDelegate * app2 = app.delegate;
//    app2.window.rootViewController = mainVc;
    
    
}
#pragma mark -- 请求广告图片
- (void)loadAdImage{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"code2"] = code2;
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //                NSLog(@"%@",responseObject);
        NSDictionary *adDict =[responseObject[@"ad"] lastObject];
        //        [adDict createPropertyCode];
        _item = [LYADItem mj_objectWithKeyValues:adDict];
        //按比例拉伸高度
        if (_item.w * _item.h == 0) return;
        CGFloat H = ScreenW / _item.w * _item.h;
        self.adIamge.frame = CGRectMake(0, 0, ScreenW, H);
        //        NSLog(@"%@",_item.w_picurl);
        [self.adIamge sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
