//
//  LYEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYEssenceViewController.h"
#import "LYNewViewController.h"
#import "UINavigationItem+LYItem.h"
#import "LYAllTableViewController.h"
#import "LYVideoController.h"
#import "LYPictureController.h"
#import "LYPictureController.h"
#import "LYInteractiveController.h"
#import "LYRednetController.h"
#import "LYSocityController.h"
#import "LYVoteController.h"
#import "LYGoodEyeController.h"
#import "LYColdKnowController.h"
#import "LYGameController.h"
#import "LYVoiceController.h"
#import "LYTabBar.h"
#import "LYPublishViewController.h"

@interface LYEssenceViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UIScrollView * top;
@property(nonatomic,weak) UIScrollView * bottom;
@property(nonatomic,weak) UIButton * selectbutton;
@property(nonatomic,strong) NSMutableArray * titleButtonArray;
@property(nonatomic,weak) UIView * leftMenu;
@property(nonatomic,weak) UITableView * leftTabView;
@property(nonatomic,assign) BOOL isLeftMenuClick;
@end

@implementation LYEssenceViewController
//懒加载 只有用到的时候才加载
-(NSMutableArray *)titleButtonArray
{
    if(_titleButtonArray == nil)
    {
        _titleButtonArray = [NSMutableArray array];
    }
    return _titleButtonArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航条背景颜色
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view.
    
    [self setupNavigationBar];
    //添加标题scroll
    [self setTitleScroll];
    //添加内容scorll
    [self setContentScroll];
    //添加子控制器
    [self setChildController];
    //设置所有标题
    [self setAllTitle];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    //添加左侧侧滑菜单
    [self createLeftMenu];
    [[[UIApplication sharedApplication].delegate window] addSubview:self.view];
    //左侧菜单添加按钮
    [self addButtonToLeftMenu];
    
    
}
#pragma mark -左侧菜单添加按钮
-(void)addButtonToLeftMenu
{
//    UIButton * firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [firstButton setImage:[UIImage imageNamed:@"common_icon_membership_level1"] forState:UIControlStateNormal];
//    [firstButton setTitle:@"了解会员特权" forState:UIControlStateNormal];
//    [firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIButton * secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [secondButton setImage:[UIImage imageNamed:@"common_icon_membership_level2"] forState:UIControlStateNormal];
//    [secondButton setTitle:@"钱包" forState:UIControlStateNormal];
//    [secondButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIButton * thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [thirdButton setImage:[UIImage imageNamed:@"common_icon_membership_level3"] forState:UIControlStateNormal];
//    [thirdButton setTitle:@"个性装扮" forState:UIControlStateNormal];
//    [thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIButton * fourthButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fourthButton setImage:[UIImage imageNamed:@"common_icon_membership_level4"] forState:UIControlStateNormal];
//    [fourthButton setTitle:@"我的收藏" forState:UIControlStateNormal];
//    [fourthButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIButton * fifthButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fifthButton setImage:[UIImage imageNamed:@"common_icon_membership_level5"] forState:UIControlStateNormal];
//    [fifthButton setTitle:@"设置" forState:UIControlStateNormal];
//    [fifthButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    
//    [self.leftMenu addSubview:firstButton];
//    [self.leftMenu addSubview:secondButton];
//    [self.leftMenu addSubview:thirdButton];
//    [self.leftMenu addSubview:fourthButton];
//    [self.leftMenu addSubview:fifthButton];
//    
//    [firstButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.mas_equalTo(25);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(self.leftMenu).offset(200);
//    }];
//    
//    [secondButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.mas_equalTo(25);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(firstButton).offset(70);
//    }];
//    
//    [thirdButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.mas_equalTo(25);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(secondButton).offset(70);
//    }];
//    
//    [fourthButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.mas_equalTo(25);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(thirdButton).offset(70);
//    }];
//    
//    [fifthButton mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.mas_equalTo(25);
//        make.height.mas_equalTo(44);
//        make.top.equalTo(fourthButton).offset(70);
//    }];
//    
//    
//    UIImageView * menuIcon = [[UIImageView alloc]init];
//    menuIcon.image = [UIImage imageNamed:@"menuIcon.jpg"];
//    [self.leftMenu addSubview:menuIcon];
//    
//    [menuIcon mas_makeConstraints:^(MASConstraintMaker * make){
//        make.left.equalTo(self.leftMenu).offset(85);
//        make.top.equalTo(self.leftMenu).offset(50);
//        make.width.mas_equalTo(ScreenW/2-100);
//        make.height.mas_equalTo(ScreenW/2-100);
//        
//    }];
    
}

#pragma mark -添加左侧侧滑菜单
-(void)createLeftMenu
{
    UIView * leftMenu = [[UIView alloc]init];
//    leftMenu.image = [UIImage imageNamed:@"leftMenuBackGround.jpg"];
    leftMenu.userInteractionEnabled = YES;
    leftMenu.backgroundColor = [UIColor colorWithRed:103/255.0 green:98/255.0 blue:98/255.0 alpha:0.8];
    [[[UIApplication sharedApplication].delegate window] addSubview:leftMenu];
    
    leftMenu.frame = CGRectMake(-([UIScreen mainScreen].bounds.size.width/2+80), 0, ([UIScreen mainScreen].bounds.size.width/2+80), [UIScreen mainScreen].bounds.size.height);
    self.leftMenu = leftMenu;
    
    //创建tableView
    UITableView * leftTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenH/3, ScreenW/2+80, ScreenH/3)];
    _leftTabView = leftTabView;
    [_leftMenu addSubview:_leftTabView];
    _leftTabView.dataSource = self;
    _leftTabView.delegate = self;
    
}
#pragma mark 左侧侧滑菜单的数据源方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        UITableViewCell * cell = [[UITableViewCell alloc]init];
        cell.imageView.image = [UIImage imageNamed:@"common_icon_membership_level1"];
        cell.textLabel.text = @"了解会员情况";
        return cell;
    }
    else if (indexPath.row == 1)
    {
        UITableViewCell * cell = [[UITableViewCell alloc]init];
        cell.imageView.image = [UIImage imageNamed:@"common_icon_membership_level1"];
        cell.textLabel.text = @"钱包";
        return cell;
    }
    else if (indexPath.row == 2)
    {
        UITableViewCell * cell = [[UITableViewCell alloc]init];
        cell.imageView.image = [UIImage imageNamed:@"common_icon_membership_level1"];
        cell.textLabel.text = @"设置";
        return cell;
    }
    else if (indexPath.row == 3)
    {
        UITableViewCell * cell = [[UITableViewCell alloc]init];
        cell.imageView.image = [UIImage imageNamed:@"common_icon_membership_level1"];
        cell.textLabel.text = @"我的收藏";
        return cell;
    }
    else
    {
        UITableViewCell * cell = [[UITableViewCell alloc]init];
        cell.imageView.image = [UIImage imageNamed:@"common_icon_membership_level1"];
        cell.textLabel.text = @"设置";
        return cell;
    }
    
    
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


-(void)titleClick:(UIButton *)btn
{
    [self selButton:btn];
    NSInteger i = btn.tag;
    [self setupOneViewController:i];
    CGFloat x = i* [UIScreen mainScreen].bounds.size.width;//计算每个视图的X
    self.bottom.contentOffset = CGPointMake(x, 0);//设置内容视图的偏移量
}
-(void)setAllTitle
{
    NSInteger count = self.childViewControllers.count;
    CGFloat btnW = 100;
    for(int i=0;i<count;i++)
    {
        UIButton * titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIViewController *vc = self.childViewControllers[i];
        [titleButton setTitle:vc.title forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        titleButton.tag = i;
        
        [self.titleButtonArray addObject:titleButton];
        
        if(i==0)
        {
            [self titleClick:titleButton];
        }
        [self.top addSubview:titleButton];
        [titleButton mas_makeConstraints:^(MASConstraintMaker * make){
            make.centerY.equalTo(_top);
            make.left.mas_equalTo(btnW*i+10);
            make.height.equalTo(_top);
        }];
    }
    self.top.contentSize = CGSizeMake(btnW *count, 0);
    self.top.showsHorizontalScrollIndicator = NO;
    
    self.bottom.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*count, 0);
}


-(void)selButton:(UIButton *)btn
{
//    _selectbutton = btn;
    _selectbutton.transform = CGAffineTransformIdentity;
    [_selectbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //让标题居中
    [self setuoTitleCenter:_selectbutton];
    
    //设置字体缩放形变
    btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _selectbutton = btn;
}

-(void)setuoTitleCenter:(UIButton *)button
{
    CGFloat offSetX = button.center.x - [UIScreen mainScreen].bounds.size.width* 0.5;
    if(offSetX<0){
        offSetX = 0;
    }
    CGFloat maxOffSetx = self.top.contentSize.width- [UIScreen mainScreen].bounds.size.width;
    if(offSetX > maxOffSetx)
    {
        offSetX = maxOffSetx;
    }
    
    [self.top setContentOffset:CGPointMake(offSetX, 0) animated:YES];
}

#pragma mark -添加标题scroll
-(void)setTitleScroll
{
    UIScrollView * toP = [[UIScrollView alloc]init];
//    toP.backgroundColor = [UIColor whiteColor];
    toP.backgroundColor = [UIColor colorWithRed:238/255.0 green:164/255.0 blue:183/255.0 alpha:1.0];
    toP.showsHorizontalScrollIndicator = YES;
    
    _top = toP;
    [self.view addSubview:toP];
    
    [toP mas_makeConstraints:^(MASConstraintMaker * make){
        make.top.equalTo(self.view).offset(64);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}
#pragma mark -添加内容scorll
     
-(void)setContentScroll
{
    UIScrollView * bottom = [[UIScrollView alloc]init];
    bottom.backgroundColor = [UIColor yellowColor];
    _bottom = bottom;
    [self.view addSubview:bottom];
    //设置属性
    //分页
    self.bottom.pagingEnabled = YES;
    //弹簧
    self.bottom.bounces = NO;
    //指示器
    self.bottom.showsHorizontalScrollIndicator = NO;
    //设置代理
    self.bottom.delegate = self;
    
    [bottom mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_top).offset(44);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
}

-(void)setText:(UIViewController *) vc
{
    NSMutableDictionary * arr = [NSMutableDictionary dictionary];
    arr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:2];
//    vc.titleTextAttributes =arr;
    
}
#pragma mark -添加子控制器
-(void)setChildController
{
    LYAllTableViewController * all = [[LYAllTableViewController alloc]init];
    all.title = @"段子";
    
    //设置字体大小
    [self setText:all];
    
    [self addChildViewController:all];
    
    LYVideoController * video = [[LYVideoController alloc]init];
    video.title = @"视频";
     [self setText:video];
    [self addChildViewController:video];
    
    LYVoiceController * picture = [[LYVoiceController alloc]init];
    picture.title = @"声音";
     
    [self addChildViewController:picture];
    
    LYPictureController * satin = [[LYPictureController alloc]init];
    satin.title = @"图片";
     
    [self addChildViewController:satin];
    
    LYInteractiveController * rank = [[LYInteractiveController alloc]init];
    rank.title = @"排行";
     [self setText:rank];
    [self addChildViewController:rank];
    
    LYInteractiveController * interactive = [[LYInteractiveController alloc]init];
    interactive.title = @"互动区";
    [self addChildViewController:interactive];
    
    LYRednetController * rednet = [[LYRednetController alloc]init];
    rednet.title = @"网红";
    [self addChildViewController:rednet];
    
    LYSocityController * socity = [[LYSocityController alloc]init];
    socity.title = @"社会";
    [self addChildViewController:socity];
    
    LYVoteController * vote = [[LYVoteController alloc]init];
    vote.title = @"投票";
    [self addChildViewController:vote];
    
    LYGoodEyeController * goodEye = [[LYGoodEyeController alloc]init];
    goodEye.title = @"养眼";
    [self addChildViewController:goodEye];
    
    LYColdKnowController * coldKnow = [[LYColdKnowController alloc]init];
    coldKnow.title = @"冷知识";
    [self addChildViewController:coldKnow];
    
    LYGameController * game = [[LYGameController alloc]init];
    game.title = @"游戏";
    [self addChildViewController:game];
}
-(void)setupNavigationBar
{
    //设置左边按钮

    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon.png"] highlightImage:[UIImage imageNamed:@"nav_item_game_click_icon.png"] target:self action:@selector(leftButtonGo:)];
    
    //设置右边按钮
     self.navigationItem.rightBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"navigationButtonRandomN.png"] highlightImage:[UIImage imageNamed:@"navigationButtonRandomClick.png"] target:self action:@selector(rightButtonGo)];
    // 设置标题图片
    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle.png"]];
    self.navigationItem.titleView = titleImage;
}


#pragma mark -左侧侧滑菜单按钮点击
-(void)leftButtonGo:(UIButton *) btn
{
    
    if(!_isLeftMenuClick)
    {
    [UIView animateWithDuration:0.7 animations:^{
        self.leftMenu.frame= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2+80, [UIScreen mainScreen].bounds.size.height);
    }];
        
    [UIView animateWithDuration:0.7 animations:^{
//        self.view.frame = CGRectMake(self.view.frame.origin.x+[UIScreen mainScreen].bounds.size.width/2, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
//        self.navigationController.navigationBar.frame = CGRectMake(ScreenW/2, 20, ScreenW, 44);
//        self.tabBarController.tabBar.frame = CGRectMake(ScreenW/2, ScreenH-44, ScreenW, 44);
        self.tabBarController.view.frame = CGRectMake(ScreenW/2+80, 0, ScreenW, ScreenH);

    }];
        
        [self.delegate leftMenuGO:btn];
        
        //添加手势
        UISwipeGestureRecognizer * gesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backToHome)];
        [gesture setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self.leftMenu addGestureRecognizer:gesture];
        _isLeftMenuClick = !_isLeftMenuClick;
    }
    else
    {
        [UIView animateWithDuration:0.7 animations:^{
           self.leftMenu.frame =CGRectMake(-(ScreenW/2+80), 0, (ScreenW/2+80), ScreenH);
        }];
        
        [UIView animateWithDuration:0.7 animations:^{
//            self.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
//            self.navigationController.navigationBar.frame = CGRectMake(0, 20, ScreenH, 44);
//            self.tabBarController.tabBar.frame = CGRectMake(0, ScreenH-44, ScreenW, 44);
//            self.tabBarController.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
            self.tabBarController.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
        }];
        _isLeftMenuClick = !_isLeftMenuClick;
        
    }
    
}
#pragma mark -左划手势
-(void)backToHome
{
    [UIView animateWithDuration:0.7 animations:^{
        self.leftMenu.frame =CGRectMake(-(ScreenW/2), 0, (ScreenW/2), ScreenH);
    }];
    
    [UIView animateWithDuration:0.7 animations:^{
//        self.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
//        self.navigationController.navigationBar.frame = CGRectMake(0, 20, ScreenW, 44);
//        self.tabBarController.tabBar.frame = CGRectMake(0, ScreenH-44, ScreenW, 44);
          self.tabBarController.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    }];
    _isLeftMenuClick = !_isLeftMenuClick;
}
-(void)rightButtonGo
{
    UIViewController * vc = [[UIViewController alloc]init];
    vc.view.frame = self.view.frame;
    vc.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前脚标
    NSInteger i = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    //1.获取标题按钮
    UIButton * titleButton = self.titleButtonArray[i];
    
    [self selButton:titleButton];
    //2.把对应的子控制器的VIew添加上去
    [self setupOneViewController:i];
    //3.
}
-(void)setupRightButton
{
    
}
-(void)setupOneViewController:(NSInteger) i
{
    UIViewController *vc =self.childViewControllers[i];//获取每一个内容视图
    CGFloat x = i* [UIScreen mainScreen].bounds.size.width;//计算每个视图的X
    vc.view.frame = CGRectMake(x, 0, [UIScreen mainScreen].bounds.size.width, self.bottom.bounds.size.height);
    [self.bottom addSubview:vc.view];
    self.bottom.contentOffset = CGPointMake(x, 0);//设置内容视图的偏移量
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
