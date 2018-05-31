//
//  LYModel.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/6.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString * profile_image;
@property(nonatomic,copy) NSString * text;
@property(nonatomic,copy) NSString * created_at;
@property(nonatomic,copy) NSString * ding;
@property(nonatomic,copy) NSString * cai;
@property(nonatomic,copy) NSString * comment;
@property(nonatomic,copy) NSString * repost;
@property(nonatomic,assign) CGFloat cellheight;
@end
