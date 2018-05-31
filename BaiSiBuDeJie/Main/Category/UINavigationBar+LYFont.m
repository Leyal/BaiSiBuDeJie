//
//  UINavigationBar+LYFont.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/2.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "UINavigationBar+LYFont.h"

@implementation UINavigationBar (LYFont)
+(UINavigationBar *) setNavigationBarFont
{
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    //boldSystemFontOfSize设置粗体字体尺寸
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    UINavigationBar * navigationBar = [[UINavigationBar alloc]init];
    [navigationBar setTitleTextAttributes:attr];
    return navigationBar;
}
@end
