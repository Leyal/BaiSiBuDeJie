//
//  LYLoginViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/5.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYLoginViewController.h"
#import "LYNewViewController.h"
@interface LYLoginViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation LYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片
    [self setBackground];
    //设置qq登录按钮
    [self setQQLogin];
    //腾讯登录
    [self setTengxunLogin];
    
    //设置新浪微博登录按钮
    [self setSinaLogin];
    //其他方式登录按钮  1.上升式侧滑菜单(手机号登录)
    [self setupNavigationBar];
    
    // Do any additional setup after loading the view.
}


-(void)setSinaLogin
{
    UIButton * sina = [UIButton buttonWithType:UIButtonTypeCustom];
    [sina setImage:[UIImage imageNamed:@"login_sina_icon"] forState:UIControlStateNormal];
    [self.view addSubview:sina];
    [sina mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
        make.bottom.equalTo(self.view).offset(-100);
    }];
}
-(void)setTengxunLogin
{
    UIButton * Tengxun = [UIButton buttonWithType:UIButtonTypeCustom];
    [Tengxun setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:UIControlStateNormal];
    [self.view addSubview:Tengxun];
    [Tengxun mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
        make.bottom.equalTo(self.view).offset(-200);
    }];
}

-(void)setQQLogin
{
    UIButton * qq = [UIButton buttonWithType:UIButtonTypeCustom];
    [qq setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
    [self.view addSubview:qq];
    [qq mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
        make.bottom.equalTo(self.view).offset(-300);
    }];
}
-(void)setupNavigationBar
{
    //设置左边按钮
//    self.navigationController.navigationBar.hidden = YES;
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    
//    [self.view addSubview:btn];
    [_imageView addSubview:btn];

//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
//    [btn sizeToFit];
//    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(leftButtonGo)];
    [btn mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.and.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(30);
    }];
    
    [btn addTarget:self action:@selector(leftButtonGo) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)leftButtonGo
{
//    LYNewViewController * new = [[LYNewViewController alloc]init];
//    [self.navigationController pushViewController:new animated:NO];
//    [self.navigationController popViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
//    NSLog(@"xxx");
}

-(void)setBackground
{
    UIImageView * background = [[UIImageView alloc]init];
    background.userInteractionEnabled = YES;
    background.image = [UIImage imageNamed:@"login_register_background"];
    _imageView = background;
    
    [self.view addSubview:background];
    [background mas_makeConstraints:^(MASConstraintMaker * make){
        make.width.and.height.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
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

@end
