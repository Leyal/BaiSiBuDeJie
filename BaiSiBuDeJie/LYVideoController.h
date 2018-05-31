//
//  LYVideoController.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/4.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYVideoControllerDelegate<NSObject>
@optional
-(void)delegatePlayVideo;
@end
@interface LYVideoController : UITableViewController
@property(nonatomic,weak) id<LYVideoControllerDelegate> delegate;
@property(nonatomic,strong) NSURL * url;
@end
