//
//  UIView+LY_frame.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/1.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "UIView+LY_frame.h"

@implementation UIView (LY_frame)
-(void)setLY_width:(CGFloat)LY_width
{
    CGRect rect = self.frame;
    rect.size.width = LY_width;
    self.frame = rect;
}
-(CGFloat)LY_width
{
    return self.frame.size.width;
}

-(void)setLY_height:(CGFloat)LY_height
{
    CGRect rect = self.frame;
    rect.size.height = LY_height;
    self.frame = rect;
}
-(CGFloat)LY_height
{
    return self.frame.size.height;
}

-(void)setLY_x:(CGFloat)LY_x
{
    CGRect rect = self.frame;
    rect.origin.x = LY_x;
    self.frame = rect;

}
-(CGFloat)LY_x
{
    return self.frame.origin.x;
}
-(void)setLY_y:(CGFloat)LY_y
{
    CGRect rect = self.frame;
    rect.origin.y = LY_y;
    self.frame = rect;
    
}
-(CGFloat)LY_y
{
    return self.frame.origin.y;
}
@end
