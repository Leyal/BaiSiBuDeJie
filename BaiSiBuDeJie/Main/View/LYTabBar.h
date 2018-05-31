//
//  LYTabBar.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/1.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYTabDelegate<NSObject>
@optional
-(void)didPublishGo:(UIButton *)button;
@end
@interface LYTabBar : UITabBar
@property(nonatomic,weak) UIButton * publish;
@property(nonatomic,assign) id<LYTabDelegate> delegate;
@end
