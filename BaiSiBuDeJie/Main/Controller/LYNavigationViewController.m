//
//  LYNavigationViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/2.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYNavigationViewController.h"
#import "UINavigationItem+LYItem.h"
@interface LYNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation LYNavigationViewController

+(void)load
{
    UINavigationBar * navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    //boldSystemFontOfSize设置粗体字体尺寸
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attr];

    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault]; //必须用default
   
}

/*
 
 UIButton * Button = [UIButton buttonWithType:UIButtonTypeCustom];
 [Button setImage:imgN forState:UIControlStateNormal];
 [Button setImage:imgH forState:UIControlStateHighlighted];
 [Button sizeToFit];
 UIView * containView = [[UIView alloc]initWithFrame:Button.bounds];
 [containView addSubview:Button];
 
 [Button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
 
 
 return  [[UIBarButtonItem alloc]initWithCustomView:containView];
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.interactivePopGestureRecognizer.delegate = nil;
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
//    {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
    
    
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    // 当前页面是显示结果页，不响应滑动手势
//    UIViewController *vc = [self.childViewControllers lastObject];
//    if ([vc isKindOfClass:[BaseResultViewController class]]) {
//        return NO;
//    }
//    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)backReturn
//{
//    [self popViewControllerAnimated:YES];
//}

//-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    //判断为非根视图控制器
//    
//    if(self.childViewControllers.count>0)
//    {
//        
//        viewController.navigationItem.leftBarButtonItem = [UINavigationItem setReturnButtonWithNormalImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(backReturn) title:@"返回"];
//    }
//    [super pushViewController:viewController animated:YES];
//}


@end

