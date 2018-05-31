//
//  LYAddVideoVC.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/29.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYAddVideoVC.h"
#import "LYMainTabBarController.h"
@interface LYAddVideoVC ()
@property(nonatomic,weak) UIImageView * imageView;
@end

@implementation LYAddVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    self.view.backgroundColor = [UIColor purpleColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
#pragma mark -
-(void)setBackgroundImageView
{
//    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView * imageView= [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"shareBottomBackground"];
    imageView.userInteractionEnabled = YES;
    _imageView = imageView;
    [self.view addSubview:imageView];
    
}
#pragma mark -隐藏状态栏方法
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
#pragma mark -设置自定义导航按钮
-(void)setupNavigationBar
{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 45, 30);
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [_imageView addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker * make){
//        make.top.and.left.equalTo(self.view).offset(20);
//        make.width.mas_equalTo(45);
//        make.height.mas_equalTo(30);
//    }];
    [btn addTarget:self action:@selector(leftButtonGo) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)leftButtonGo
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
