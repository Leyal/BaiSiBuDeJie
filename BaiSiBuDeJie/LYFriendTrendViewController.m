//
//  LYFriendTrendViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYFriendTrendViewController.h"
#import "LYLoginViewController.h"
@interface LYFriendTrendViewController ()

@end

@implementation LYFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * img = [[UIImageView alloc]init];
    img.image = [UIImage imageNamed:@"friendTrendBackground"];
    img.frame = self.view.bounds;
    [self.view addSubview:img];
    
    UIButton * loginAndRegist = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginAndRegist setImage:[UIImage imageNamed:@"loginandregist"] forState:UIControlStateNormal];
    [loginAndRegist sizeToFit];
    [self.view addSubview:loginAndRegist];
    [loginAndRegist addTarget:self action:@selector(loginAndRegistGo) forControlEvents:UIControlEventTouchUpInside];
    [loginAndRegist mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(34);
        make.bottom.equalTo(self.view).offset(-130);
    }];
    
    UIImageView * imgIcon = [[UIImageView alloc]init];
    imgIcon.image = [UIImage imageNamed:@"header_cry_icon"];
    [self.view addSubview:imgIcon];
    [imgIcon mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(180);
        make.width.and.height.mas_equalTo(45);
    }];
    
    
    
    [self setupNavigationBar];
    // Do any additional setup after loading the view.
}
-(void)loginAndRegistGo
{
    LYLoginViewController * login = [[LYLoginViewController alloc]init];
    [self.navigationController presentViewController:login animated:YES completion:nil];
}

-(void)setupNavigationBar
{
    //设置左边按钮
    
    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:nil];
    
    //设置标题
    self.navigationItem.title = @"我的关注";
   
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
