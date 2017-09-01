//
//  UIImage+AFAntialias.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/3.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//  周边生成一个1边框为1的透明像素

#import "UIImage+AFAntialias.h"

@implementation UIImage (AFAntialias)

/** 图片效果处理 */
- (UIImage *)imageAntialias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width - 2*border, self.size.height - 2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width, rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage *antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

@end
