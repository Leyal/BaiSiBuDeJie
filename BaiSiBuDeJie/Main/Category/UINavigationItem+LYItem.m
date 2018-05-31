//
//  UINavigationItem+LYItem.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/2.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "UINavigationItem+LYItem.h"

@implementation UINavigationItem (LYItem)
+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector
{
    
    UIButton * Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setImage:imgN forState:UIControlStateNormal];
    [Button setImage:imgH forState:UIControlStateHighlighted];
    [Button sizeToFit];
    UIView * containView = [[UIView alloc]initWithFrame:Button.bounds];
    [containView addSubview:Button];
    
    [Button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    
    return  [[UIBarButtonItem alloc]initWithCustomView:containView];
}

+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)imgN selectImage:(UIImage *)imgSelect target:(id) target action:(SEL) selector
{
    
    UIButton * Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setImage:imgN forState:UIControlStateNormal];
    [Button setImage:imgSelect forState:UIControlStateSelected];
    [Button sizeToFit];
    UIView * containView = [[UIView alloc]initWithFrame:Button.bounds];
    [containView addSubview:Button];
    
    [Button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    
    return  [[UIBarButtonItem alloc]initWithCustomView:containView];
}


+(UIBarButtonItem *)returnWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector
{
    
    UIButton * Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [Button setImage:imgN forState:UIControlStateNormal];
    [Button setImage:imgH forState:UIControlStateHighlighted];
    [Button sizeToFit];
    
    UILabel * label = [[UILabel alloc]init];
    label.text = @"返回";
    label.font =[UIFont systemFontOfSize:18]
    ;
    label.frame = CGRectMake(Button.frame.size.width, 0, 40, 20);
    UIView * containView = [[UIView alloc]initWithFrame:Button.bounds];
    [containView addSubview:Button];
    [containView addSubview:label];
    
    [Button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    
    return  [[UIBarButtonItem alloc]initWithCustomView:containView];
}

+(UIBarButtonItem *)ReturnWithNormalImage:(UIImage *)imgN highlightImage:(UIImage *)imgH target:(id) target action:(SEL) selector title:(NSString *)title
{
    
    UIButton * returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnButton setImage:imgN forState:UIControlStateNormal];
    [returnButton setImage:imgH forState:UIControlStateHighlighted];
    [returnButton setTitle:title forState:UIControlStateNormal];
    [returnButton setTitle:title forState:UIControlStateHighlighted];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置按钮内容边距   往哪边移动  就改哪边的值
    returnButton.contentEdgeInsets = UIEdgeInsetsMake(0, -17, 0, 0);
    [returnButton sizeToFit];
    [returnButton addTarget:self action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
     return [[UIBarButtonItem alloc]initWithCustomView:returnButton];

    
    
}
+(UIBarButtonItem *)setReturnButtonWithNormalImage:(UIImage *) normalImage highlightImage:(UIImage *) highImage target:(id) target
                                            action:(SEL) selector title:(NSString *)title
{
    UIButton * returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnButton setImage:normalImage forState:UIControlStateNormal];
    [returnButton setImage:highImage forState:UIControlStateHighlighted];
    [returnButton setTitle:title forState:UIControlStateNormal];
    [returnButton setTitle:title forState:UIControlStateHighlighted];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置按钮内容边距   往哪边移动  就改哪边的值
    returnButton.contentEdgeInsets = UIEdgeInsetsMake(0, -17, 0, 0);
    [returnButton sizeToFit];
    [returnButton addTarget:self action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:returnButton];
}


@end
