//
//  LYPictureController.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LYPictureControllerDelegate<NSObject>
@optional
-(void)delegatePlayVideo;
-(void)addGif:(NSURL *)url;
@end
@interface LYPictureController : UITableViewController
@property(nonatomic,weak) id<LYPictureControllerDelegate> delegate;
@property(nonatomic,strong) NSURL * url;
@property(nonatomic,copy) NSString * isGif;
@end
