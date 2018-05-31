//
//  LYVoiceModel.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/16.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYVoiceModel : NSObject
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * profile_image;
@property(nonatomic,copy) NSString * text;
@property(nonatomic,copy) NSString * created_at;
@property(nonatomic,assign) NSString *ding;
@property(nonatomic,assign) NSString *cai;
@property(nonatomic,assign) NSString *repost;
@property(nonatomic,assign) NSString *comment;
@property(nonatomic,copy) NSString * image1;
@property(nonatomic,assign) NSString * width;
@property(nonatomic,assign) NSString * height;
@property(nonatomic,copy) NSString * voiceuri;
@end
