//
//  UIImage+Image.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/1.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (instancetype)imageOriginalWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

- (instancetype)af_circleImage
{
    //1. 开启图形上下文;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    // 2. 描述裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 3. 设置裁剪区域
    [path addClip];
    // 4. 画图片
    [self drawAtPoint:CGPointZero];
    // 5. 取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 6. 关闭上上文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)af_circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] af_circleImage];
}


@end
