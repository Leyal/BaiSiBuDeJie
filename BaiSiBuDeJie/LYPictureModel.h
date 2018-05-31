//
//  LYPictureModel.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPictureModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString * profile_image;
@property(nonatomic,copy) NSString * text;
@property(nonatomic,copy) NSString * created_at;
@property(nonatomic,copy) NSString * ding;
@property(nonatomic,copy) NSString * cai;
@property(nonatomic,copy) NSString * comment;
@property(nonatomic,copy) NSString * repost;
@property(nonatomic,assign) CGFloat cellheight;
@property(nonatomic,copy) NSString * image1;
@property(nonatomic,copy) NSString * videouri;
@property(nonatomic,copy) NSString * videotime;
@property(nonatomic,copy) NSString * playcount;
@property(nonatomic,copy) NSString * is_gif;
@property(nonatomic,copy) NSString * gifFistFrame;
@property(nonatomic,copy) NSString * height;
@property(nonatomic,copy) NSString * width;

@property (nonatomic,assign,getter=isLongPic) BOOL longPic;



@end
