//
//  UINavigationItem+LYItem.h
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/2.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (LYItem)
+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector;

+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)imgN selectImage:(UIImage *)imgSelect target:(id) target action:(SEL) selector;
+(UIBarButtonItem *)returnWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector;
+(UIBarButtonItem *)returnWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector title:(NSString *)title;
+(UIBarButtonItem *)setReturnButtonWithNormalImage:(UIImage *) normalImage highlightImage:(UIImage *) highImage target:(id) target
                                            action:(SEL) selector title:(NSString *)title;
@end
