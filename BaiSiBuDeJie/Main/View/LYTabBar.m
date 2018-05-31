//
//  LYTabBar.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/1.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYTabBar.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <Masonry.h>
#import "UIView+LY_frame.h"
#import "LYPublishViewController.h"
@interface LYTabBar()

@end
@implementation LYTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIButton *)publish
{
    if(!_publish)
    {
        
        UIButton * publish = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [publish setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon.png"] forState:UIControlStateNormal];
        [publish setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon.png"] forState:UIControlStateHighlighted];
        //按钮的大小设置
        [publish sizeToFit];//根据图片的内容 自适应
        
//        [publish mas_makeConstraints:^(MASConstraintMaker * make){
//            make.centerX.equalTo(self);
//            make.centerY.equalTo(self);
//            make.height.equalTo(40);
//            make.width.equalTo(40);
//            
//        }];
        //因为是弱引用 所以button会被销毁 为了不被销毁 所以 要将button加载到视图上去
//        [publish addTarget:self action:@selector(publishGo) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publish];
        _publish = publish;//赋值
    }
    
    return _publish;
}


-(void)layoutSubviews
{
    //为了保证中间的按钮只加载一次 要采用懒加载的方式  懒加载需要有属性 属性就得有扩展方法
    [super layoutSubviews];
    
    [self.publish addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
    NSInteger count = self.items.count;
    CGFloat btnW = self.LY_width /(count +1);
    CGFloat btnX = 0;
    CGFloat btnH = self.LY_height;
    int i =0;
//    self.backgroundColor = [UIColor redColor];
    for (UIView * tabBarButton in self.subviews) {
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if(i == 2)
            {
                i +=1;
            }
            btnX = btnW *i;
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            i++;
        }
        
    }
    self.publish.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
//    [self.publish addTarget:self action:@selector(trans) forControlEvents:UIControlEventTouchUpInside];
}
-(void)publishButtonClick
{
    [self.delegate didPublishGo:self.publish];
}
@end
