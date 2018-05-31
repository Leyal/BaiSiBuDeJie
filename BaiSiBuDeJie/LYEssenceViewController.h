//
//  LYEssenceViewController.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYEssenceViewControllerDelegate<NSObject>

-(void)leftMenuGO:(UIButton *)btn;

@end

//@protocol LYAllDelegate<NSObject>
//@optional
//-(void)didDingClickButton:(UIButton *)button;
//-(void)didCaiClickButton:(UIButton *)button;
//-(void)didCommentClickButton:(UIButton *)button;
//-(void)didRepostClickButton:(UIButton *)button;
//
//
//@end

@interface LYEssenceViewController : UIViewController
@property(nonatomic,weak) id<LYEssenceViewControllerDelegate> delegate;
@end
