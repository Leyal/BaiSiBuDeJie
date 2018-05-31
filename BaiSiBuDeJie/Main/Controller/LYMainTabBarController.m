//
//  LYMainTabBarController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYMainTabBarController.h"
#import "LYEssenceViewController.h"
#import "LYNewViewController.h"
#import "LYMeTableViewController.h"
#import "LYPublishViewController.h"
#import "LYFriendTrendViewController.h"
#import "LYTabBar.h"
#import "LYNavigationViewController.h"
#import "LYPublishViewController.h"
#import "LYAddVideoVC.h"
#define interval 25
#define bigInterval (ScreenW-210-50)/2
@interface LYMainTabBarController ()<LYEssenceViewControllerDelegate,LYTabDelegate,LYPublishButtonDelegate>
@property(nonatomic,weak) UIButton * videoButton;
@property(nonatomic,weak) UIButton * pictureButton;
@property(nonatomic,weak) UIButton * episodeButton;
@property(nonatomic,weak) UIButton * voiceButton;
@property(nonatomic,weak) UIButton * linkButton;
@property(nonatomic,weak) UIButton * downLoadButton;
@property(nonatomic,weak) UILabel * videoLabel;
@property(nonatomic,weak) UILabel * pictureLabel;
@property(nonatomic,weak) UILabel * episodeLabel;
@property(nonatomic,weak) UILabel * voiceLabel;
@property(nonatomic,weak) UILabel * linkLabel;
@property(nonatomic,weak) UILabel * downLoadLabel;
@property(nonatomic,weak) UIImageView * publishView;
@end

@implementation LYMainTabBarController
-(void)didPublishGo:(UIButton *)button
{
    UIImageView * publishView = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenH, ScreenW, ScreenH)];
    publishView.image = [UIImage imageNamed:@"shareBottomBackground"];
    publishView.userInteractionEnabled = YES;
    self.publishView = publishView;
    [[[UIApplication sharedApplication].delegate window]addSubview:publishView];
    
    UIImageView * sloginView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 120, ScreenW-20, 35)];
    sloginView.image = [UIImage imageNamed:@"app_slogan"];
    [publishView addSubview:sloginView];
    //1发视频
    UIButton * videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [videoButton setImage:[UIImage imageNamed:@"publish-video"] forState:UIControlStateNormal];
    videoButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    videoButton.layer.cornerRadius = 35;
    videoButton.layer.masksToBounds = YES;
    self.videoButton = videoButton;
    [videoButton addTarget:self action:@selector(videoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UILabel* videoLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    videoLabel.textAlignment = NSTextAlignmentCenter;
    videoLabel.text = @"发视频";
    self.videoLabel = videoLabel;
    [[[UIApplication sharedApplication].delegate window]addSubview:videoLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:videoButton];
    [UIView animateWithDuration:0.5 animations:^{
        videoButton.frame = CGRectMake(interval, 200, 70, 70);
        videoLabel.frame = CGRectMake(interval, 290, 70, 30);
    }];
    //2发图片
    UIButton * pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pictureButton setImage:[UIImage imageNamed:@"publish-picture"] forState:UIControlStateNormal];
    pictureButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    pictureButton.layer.cornerRadius = 35;
    pictureButton.layer.masksToBounds = YES;
    self.pictureButton = pictureButton;
    UILabel * pictureLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    pictureLabel.textAlignment = NSTextAlignmentCenter;
    pictureLabel.text = @"发图片";
    self.pictureLabel = pictureLabel;
    [[[UIApplication sharedApplication].delegate window]addSubview:pictureLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:pictureButton];
    [UIView animateWithDuration:0.8 animations:^{
        pictureButton.frame = CGRectMake(interval+70+bigInterval, 200, 70, 70);
        pictureLabel.frame = CGRectMake(interval+70+bigInterval, 290, 70, 30);
    }];
    //3发段子
    UIButton * episodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [episodeButton setImage:[UIImage imageNamed:@"publish-text"] forState:UIControlStateNormal];
    episodeButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    episodeButton.layer.cornerRadius = 35;
    episodeButton.layer.masksToBounds = YES;
    self.episodeButton = episodeButton;
    UILabel * episodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    episodeLabel.textAlignment = NSTextAlignmentCenter;
    episodeLabel.text = @"发段子";
    self.episodeLabel = episodeLabel;
    [[[UIApplication sharedApplication].delegate window]addSubview:episodeLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:episodeButton];
    [UIView animateWithDuration:0.9 animations:^{
        episodeButton.frame = CGRectMake(interval+70+bigInterval+70+bigInterval, 200, 70, 70);
        episodeLabel.frame = CGRectMake(interval+70+bigInterval+70+bigInterval, 290, 70, 30);
    }];
    //4发声音
    UIButton * voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [voiceButton setImage:[UIImage imageNamed:@"publish-audio"] forState:UIControlStateNormal];
    voiceButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    voiceButton.layer.cornerRadius = 35;
    voiceButton.layer.masksToBounds = YES;
    self.voiceButton = voiceButton;
    UILabel * voiceLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    voiceLabel.text = @"发音乐";
    self.voiceLabel = voiceLabel;
    voiceLabel.textAlignment = NSTextAlignmentCenter;
    [[[UIApplication sharedApplication].delegate window]addSubview:voiceLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:voiceButton];
    [UIView animateWithDuration:0.7 animations:^{
        voiceButton.frame = CGRectMake(interval, 340, 70, 70);
        voiceLabel.frame = CGRectMake(interval, 430, 70, 30);
    }];
    //5发链接
    UIButton * linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [linkButton setImage:[UIImage imageNamed:@"publish-review"] forState:UIControlStateNormal];
    linkButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    linkButton.layer.cornerRadius = 35;
    linkButton.layer.masksToBounds = YES;
    self.linkButton = linkButton;
    UILabel * linkLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    linkLabel.text = @"发链接";
    linkLabel.textAlignment = NSTextAlignmentCenter;
    self.linkLabel = linkLabel;
    [[[UIApplication sharedApplication].delegate window]addSubview:linkLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:linkButton];
    [UIView animateWithDuration:0.7 animations:^{
        linkButton.frame = CGRectMake(interval+70+bigInterval, 340, 70, 70);
        linkLabel.frame = CGRectMake(interval+70+bigInterval, 430, 70, 30);
    }];
    //6离线
    UIButton * downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [downLoadButton setImage:[UIImage imageNamed:@"publish-offline"] forState:UIControlStateNormal];
    downLoadButton.frame = CGRectMake(ScreenW/3*2, -100, 30, 30);
    downLoadButton.layer.cornerRadius = 35;
    downLoadButton.layer.masksToBounds = YES;
    self.downLoadButton = downLoadButton;
    UILabel * downLoadLabel= [[UILabel alloc]initWithFrame:CGRectMake(ScreenW/3*2, -50, 0, 0)];
    downLoadLabel.textAlignment = NSTextAlignmentCenter;
    downLoadLabel.text = @"离线观看";
    self.downLoadLabel = downLoadLabel;
    [[[UIApplication sharedApplication].delegate window]addSubview:downLoadLabel];
    [[[UIApplication sharedApplication].delegate window]addSubview:downLoadButton];
    [UIView animateWithDuration:0.7 animations:^{
        downLoadButton.frame = CGRectMake(interval+70+bigInterval+70+bigInterval, 340, 70, 70);
        downLoadLabel.frame = CGRectMake(interval+70+bigInterval+70+bigInterval, 430, 70, 30);
    }];
    
    //publish界面
    [UIView animateWithDuration:0.1 animations:^{
        publishView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
        
    }];
    //取消按钮
    UIButton * canclebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [canclebutton setTitle:@"取消" forState:UIControlStateNormal];
    [canclebutton setTitle:@"取消" forState:UIControlStateHighlighted];
    [canclebutton setBackgroundColor:[UIColor whiteColor]];
    [canclebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [canclebutton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    canclebutton.frame = CGRectMake(0, ScreenH-44, ScreenW, 44);
    [publishView addSubview:canclebutton];
    [canclebutton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark -发视频按钮点击事件
-(void)videoButtonClick
{
    
    
    
    LYAddVideoVC * addVideoVC = [[LYAddVideoVC alloc]init];
//    LYMainTabBarController * main = [[LYMainTabBarController alloc]init];
    
    [self presentViewController:addVideoVC animated:YES completion:nil];
    [self publishViewRemoveFromWindow];
    
    
    
}

#pragma mark -取消按钮的点击事件
-(void)cancleButtonClick
{
    
    [UIView animateWithDuration:0.7 animations:^{
        self.videoLabel.frame = CGRectMake(interval, ScreenH+100, 70, 30);
        self.videoButton.frame = CGRectMake(interval, ScreenH+100, 70, 70);
        
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.pictureLabel.frame = CGRectMake(interval+70+bigInterval, ScreenH+100, 70, 30);
        self.pictureButton.frame = CGRectMake(interval+70+bigInterval, ScreenH+100, 70, 70);
    }];
    [UIView animateWithDuration:0.4 animations:^{
        self.episodeLabel.frame = CGRectMake(interval+140+bigInterval*2, ScreenH+100, 70, 30);
        self.episodeButton.frame = CGRectMake(interval+140+bigInterval*2, ScreenH+100, 70, 70);
    }];
    [UIView animateWithDuration:0.9 animations:^{
        self.voiceLabel.frame = CGRectMake(interval,ScreenH+100, 70, 30);
        self.voiceButton.frame = CGRectMake(interval, ScreenH+100, 70, 70);
    }];
    [UIView animateWithDuration:0.6 animations:^{
        self.linkLabel.frame = CGRectMake(interval+70+bigInterval, ScreenH+100, 70, 30);
        self.linkButton.frame = CGRectMake(interval+70+bigInterval, ScreenH+100, 70, 70);
    }];
    [UIView animateWithDuration:1 animations:^{
        self.downLoadLabel.frame = CGRectMake(interval+140+bigInterval*2, ScreenH+100, 70, 30);
        self.downLoadButton.frame= CGRectMake(interval+140+bigInterval*2, ScreenH+100, 70, 70);
    }];
    
    
    [self performSelector:@selector(publishViewRemoveFromWindow) withObject:nil afterDelay:0.5];
}
#pragma mark -移除发布界面
-(void)publishViewRemoveFromWindow
{
    [self.voiceLabel removeFromSuperview];
    [self.voiceButton removeFromSuperview];
    [self.videoButton removeFromSuperview];
    [self.videoLabel removeFromSuperview];
    [self.pictureButton removeFromSuperview];
    [self.pictureLabel removeFromSuperview];
    [self.episodeButton removeFromSuperview];
    [self.episodeLabel removeFromSuperview];
    [self.linkButton removeFromSuperview];
    [self.linkLabel removeFromSuperview];
    [self.downLoadButton removeFromSuperview];
    [self.downLoadLabel removeFromSuperview];
    [self.publishView removeFromSuperview];
}
//这个方法只会执行一次
+(void)load
{
    //appearence 只有遵守了UIAppearance协议  实现方法
    //哪些属性可以通过appearance 只有被UI_APPEARANCE_SELECTOR 修饰的属性才能设置
    UITabBarItem * item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    //这里不用appearance的原因是不影响全局的tabbarItem  值改变当前类的tabbarItem
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    //设置字体尺寸只有正常尺寸才有效果
    
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    
    //设置字体尺寸只有正常尺寸才有效果
    NSMutableDictionary * attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}
-(void)setuoTabBar
{
    LYTabBar * tabBar = [[LYTabBar alloc]init];
    
    //    [tabBar.publish addTarget:self action:@selector(publishGo) forControlEvents:UIControlEventTouchUpInside];
    //此刻的tabBar为readonly属性 想要修改tabBar可以用KVC 通过属性赋值的 不是通过set方法赋值的
    [self setValue:tabBar forKey:@"tabBar"];
    
    //    NSLog(@"%@",tabBar);
}



#pragma mark -代理方法
-(void)leftMenuGO:(UIButton *)btn
{
    //    [UIView animateWithDuration:0.7 animations:^{
    //        self.view.frame= CGRectMake(ScreenW/2, 0, ScreenW, ScreenH);
    //    }];
}


#pragma mark -生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UITabBar appearance] setBackgroundColor:[UIColor blackColor]];
    
//    _alpha = self.view.alpha;
    
    
    //将tabBar设置为黑色
    //1.
//        UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 49)];
//        backgroundView.backgroundColor = [UIColor blackColor];
//        [self.tabBarController.tabBar insertSubview:backgroundView atIndex:0];
//        self.tabBarController.tabBar.opaque = YES;
    //2.
    //给tabBar添加子控制器-> 自定义控制器  划分项目文件结构
    //Essence
    LYEssenceViewController * essenceVc = [[LYEssenceViewController alloc]init];
    LYNavigationViewController * nav1 = [[LYNavigationViewController alloc]
                                         initWithRootViewController:essenceVc];
    //包装成navigationController
    [self addChildViewController:nav1];
    //New
    LYNewViewController * newVc = [[LYNewViewController alloc]init];
    LYNavigationViewController * nav2 = [[LYNavigationViewController alloc]
                                         initWithRootViewController:newVc];
    [self addChildViewController:nav2];
    //Publish
    //    LYPublishViewController * publishVc = [[LYPublishViewController alloc]init];
    //
    //    [self addChildViewController:publishVc];
    
    //FriendTren
    LYFriendTrendViewController * ftVc = [[LYFriendTrendViewController alloc]init];
    LYNavigationViewController * nav4 = [[LYNavigationViewController alloc]
                                         initWithRootViewController:ftVc];
    [self addChildViewController:nav4];
    
    ////    Me
    //    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([LYMeTableViewController class]) bundle:nil];
    ////
    //    LYMeTableViewController * meVc = [storyboard instantiateInitialViewController];
    LYMeTableViewController * meVc = [[LYMeTableViewController alloc]init];
    LYNavigationViewController * nav5 = [[LYNavigationViewController alloc]
                                         initWithRootViewController:meVc];
    [self addChildViewController:nav5];
    [self setuoTabBar];
    
    //设置tabbar按钮的内容
    //1.
    nav1.tabBarItem.title = @"精华";
    nav1.tabBarItem.image =[UIImage imageNamed:@"tabBar_essence_icon.png"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon.png"];
    
    //    [nav1.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    //2.
    nav2.tabBarItem.title = @"新帖";
    nav2.tabBarItem.image =[UIImage imageNamed:@"tabBar_new_icon.png"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon.png"];
    //    [nav2.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    //3.
    
    //    publishVc.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon.png"];
    //
    //    publishVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_publish_click_icon.png"];
    //    //设置图片的偏移量
    //    publishVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //4.
    nav4.tabBarItem.title = @"关注";
    nav4.tabBarItem.image =[UIImage imageNamed:@"tabBar_friendTrends_icon.png"];
    nav4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon.png"];
    //    [nav4.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    //5.
    nav5.tabBarItem.title = @"我的";
    nav5.tabBarItem.image =[UIImage imageNamed:@"tabBar_me_icon.png"];
    nav5.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon.png"];
    //    [nav5.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    /*
     1.图片被渲染
     2.字体大小比较大
     3.发布按钮图片显示不出来
     */
//    self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    self.tabBar.tintColor = [UIColor blackColor];
    
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
