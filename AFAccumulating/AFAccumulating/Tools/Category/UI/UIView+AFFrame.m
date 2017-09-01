//
//  UIView+AFFrame.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/3.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "UIView+AFFrame.h"

@implementation UIView (AFFrame)

- (CGFloat)af_width
{
    return self.frame.size.width;
}

- (void)setAf_width:(CGFloat)af_width
{
    CGRect rect = self.frame;
    rect.size.width = af_width;
    self.frame = rect;
}

- (CGFloat)af_height
{
    return self.frame.size.height;
}

- (void)setAf_height:(CGFloat)af_height
{
    CGRect rect = self.frame;
    rect.size.height = af_height;
    self.frame = rect;
}

- (CGPoint)af_origin {
    return self.frame.origin;
}

- (void)setAf_origin:(CGPoint)af_origin {
    CGRect rect = self.frame;
    rect.origin = af_origin;
    self.frame = rect;
}

- (CGFloat)af_x
{
    return self.frame.origin.x;
}

- (void)setAf_x:(CGFloat)af_x
{
    CGRect rect = self.frame;
    rect.origin.x = af_x;
    self.frame = rect;
}

- (CGFloat)af_y
{
    return self.frame.origin.y;
}

- (void)setAf_y:(CGFloat)af_y
{
    CGRect rect = self.frame;
    rect.origin.y = af_y;
    self.frame = rect;
}

- (CGFloat)af_centerX
{
    return self.center.x;
}

- (void)setAf_centerX:(CGFloat)af_centerX
{
    CGPoint center = self.center;
    center.x = af_centerX;
    self.center = center;
}

- (CGFloat)af_centerY
{
    return self.center.y;
}

- (void)setAf_centerY:(CGFloat)af_centerY
{
    CGPoint center = self.center;
    center.y = af_centerY;
    self.center = center;
}

- (CGPoint)af_bottom
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (void)setAf_bottom:(CGPoint)af_bottom
{
    CGRect frame = self.frame;
    frame = CGRectMake(af_bottom.x - frame.size.width, af_bottom.y - frame.size.height, frame.size.width, frame.size.height);
    self.frame = frame;
}

- (CGFloat)af_bottom_x
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAf_bottom_x:(CGFloat)af_bottom_x
{
    CGRect frame = self.frame;
    frame.origin.x = af_bottom_x - frame.size.width;
    self.frame = frame;
}

- (CGFloat)af_bottom_y
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAf_bottom_y:(CGFloat)af_bottom_y
{
    CGRect frame = self.frame;
    frame.origin.y = af_bottom_y - frame.size.height;
    self.frame = frame;
}

+ (instancetype)af_viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}



@end
