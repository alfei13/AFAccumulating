//
//  UIColor+AFColorSet.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/8/20.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AFColorSet)

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHue:(CGFloat)h saturation:(CGFloat)s value:(CGFloat)v alpha:(CGFloat)a;

- (UIColor *)multiplyHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;

- (UIColor *)addHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;

- (UIColor *)copyWithAlpha:(CGFloat)newAlpha;

/// Uses multiplyHue to create a lighter version of the color.
- (UIColor *)highlight;

/// Uses multiplyHue to create a darker version of the color.
- (UIColor *)shadow;

- (CGFloat)hue;

- (CGFloat)saturation;

- (CGFloat)value;

/// 获取UIImage对象的主色调
+ (UIColor*)mostColor:(UIImage*)image;


@end
