//
//  LYNewViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYNewViewController.h"
#import "LYEssenceViewController.h"

#import "LYNewVideoController.h"
#import "LYNewPictureController.h"
#import "LYNewSatinController.h"
#import "LYNewActiveController.h"
#import "LYNewablumController.h"
#import "LYNewRednetController.h"
#import "LYNewGoodEyeController.h"
#import "LYNewColdKnowController.h"
#import "LYNewGameController.h"
#import "LYNewVoiceController.h"
#import "LYNewVoteController.h"
#import "LYLoginViewController.h"
@interface LYNewViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak) UIScrollView * top;
@property(nonatomic,weak) UIScrollView * bottom;
@property(nonatomic,weak) UIButton * selectbutton;
@property(nonatomic,strong) NSMutableArray * titleButtonArray;
@end

@implementation LYNewViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor purpleColor];
//    [self setupNavigationBar];
//        // Do any additional setup after loading the view.
//}
//
//-(void)setupNavigationBar
//{
//    //设置左边按钮
//    
//    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:nil];
//    
//    
//    // 设置标题图片
//    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle.png"]];
//    self.navigationItem.titleView = titleImage;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSMutableArray *)titleButtonArray
{
    if(_titleButtonArray == nil)
    {
        _titleButtonArray = [NSMutableArray array];
    }
    return _titleButtonArray;
}
-(BOOL)prefersStatusBarHidden
{
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    UIImageView * imgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imgv;
    
    //设置导航条背景颜色
//        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background1"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view.
    
//    [self setupNavigationBar];
    //添加标题scroll
    [self setTitleScroll];
    //添加内容scorll
    [self setContentScroll];
    //添加子控制器
    [self setChildController];
    //设置所有标题
    [self setAllTitle];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    
    
    
    
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

//-(void)titleClick:(UIButton *) btn
//{
//    [self selButton:btn];
//}

-(void)selButton:(UIButton *)btn
{
    _selectbutton.transform = CGAffineTransformIdentity;
    [_selectbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    //让标题居中
    [self setuoTitleCenter:btn];
    
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
//    toP.backgroundColor = [UIColor redColor];
    toP.backgroundColor = [UIColor colorWithRed:228/255.0 green:46/255.0 blue:22/255.0 alpha:1];
    
    
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
    arr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:5];
    //    vc.titleTextAttributes =arr;
    
}
#pragma mark -添加子控制器
-(void)setChildController
{
    UIViewController * all = [[UIViewController alloc]init];
    all.view.backgroundColor = [UIColor lightGrayColor];
    all.title = @"全部";
    //设置字体大小
    
    [self addChildViewController:all];
    
    LYNewVideoController * video = [[LYNewVideoController alloc]init];
    video.title = @"声音";
    [self setText:video];
    [self addChildViewController:video];
    
    LYNewPictureController * picture = [[LYNewPictureController alloc]init];
    picture.title = @"图片";
    [self setText:picture];
    [self addChildViewController:picture];
    
    LYNewSatinController * satin = [[LYNewSatinController alloc]init];
    satin.title = @"段子";
    [self setText:satin];
    [self addChildViewController:satin];
    
    LYNewActiveController * rank = [[LYNewActiveController alloc]init];
    rank.title = @"互动区";
    [self setText:rank];
    [self addChildViewController:rank];
    
    LYNewablumController * interactive = [[LYNewablumController alloc]init];
    interactive.title = @"相册";
    [self addChildViewController:interactive];
    
    LYNewRednetController * rednet = [[LYNewRednetController alloc]init];
    rednet.title = @"网红";
    [self addChildViewController:rednet];
    
    LYNewVoteController * socity = [[LYNewVoteController alloc]init];
    socity.title = @"投票";
    [self addChildViewController:socity];
    
    LYNewVoteController * vote = [[LYNewVoteController alloc]init];
    vote.title = @"投票";
    [self addChildViewController:vote];
    
    LYNewGoodEyeController * goodEye = [[LYNewGoodEyeController alloc]init];
    goodEye.title = @"养眼";
    [self addChildViewController:goodEye];
    
    LYNewColdKnowController * coldKnow = [[LYNewColdKnowController alloc]init];
    coldKnow.title = @"冷知识";
    [self addChildViewController:coldKnow];
    
    LYNewGameController * game = [[LYNewGameController alloc]init];
    game.title = @"游戏";
    [self addChildViewController:game];
    
    LYNewVoiceController * voice  = [[LYNewVoiceController alloc]init];
    voice.title = @"声音";
    [self addChildViewController:voice];
}

-(void)setupNavigationBar
{
    //设置左边按钮

    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(leftButtonGo)];
}

- (void)viewWillAppear:(BOOL)animated{
    //设置左边按钮
    
    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(leftButtonGo)];
}

//-(void)setupNavigationBar
//{
//    //设置左边按钮
//    
//    self.navigationItem.leftBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon.png"] highlightImage:[UIImage imageNamed:@"nav_item_game_click_icon.png"] target:self action:@selector(leftButtonGo)];
//    
//    //设置右边按钮
//    self.navigationItem.rightBarButtonItem = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"navigationButtonRandomN.png"] highlightImage:[UIImage imageNamed:@"navigationButtonRandomClick.png"] target:self action:@selector(rightButtonGo)];
//    // 设置标题图片
//    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle.png"]];
//    self.navigationItem.titleView = titleImage;
//}



-(void)leftButtonGo
{
    LYLoginViewController * login = [[LYLoginViewController alloc]init];
//    [self.navigationController pushViewController:login animated:YES];
    [self.navigationController presentViewController:login animated:YES completion:nil];
}
//-(void)setupRightNavigateButton
//{
//
////    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
////    [rightButton setImage:[UIImage imageNamed:] forState:UIControlStateNormal];
////    [rightButton setImage:[UIImage imageNamed:@"navigationButtonRandomClick.png"] forState:UIControlStateHighlighted];
////    [rightButton sizeToFit];
////    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//
//}

//-(void)rightButtonGo
//{
//    UIViewController * vc = [[UIViewController alloc]init];
//    vc.view.frame = self.view.frame;
//    vc.view.backgroundColor = [UIColor yellowColor];
//    [self.navigationController pushViewController:vc animated:YES];
//}

//-(UIBarButtonItem *)itemWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector
//{
//
//    UIButton * Button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Button setImage:imgN forState:UIControlStateNormal];
//    [Button setImage:imgH forState:UIControlStateHighlighted];
//    [Button sizeToFit];
//    UIView * containView = [[UIView alloc]initWithFrame:Button.bounds];
//    [containView addSubview:Button];
//
//    [Button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//
//
//    return  [[UIBarButtonItem alloc]initWithCustomView:containView];
//}
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
    // Dispose of any resources that can be recreated.
}

@end
