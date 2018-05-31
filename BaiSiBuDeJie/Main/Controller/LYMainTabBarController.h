//
//  LYMainTabBarController.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYPublishButtonDelegate<NSObject>;
@optional
-(void)didAddVideoButtonCLick:(UIButton *)button;
@end
@interface LYMainTabBarController : UITabBarController
@property(nonatomic,assign) id<LYPublishButtonDelegate> delegate;
@property(nonatomic,assign) CGFloat alpha;
@end
