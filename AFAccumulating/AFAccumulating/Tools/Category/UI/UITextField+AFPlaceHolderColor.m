//
//  UITextField+AFPlaceHolderColor.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/2.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//  占位文字的颜色

#import "UITextField+AFPlaceHolderColor.h"

@implementation UITextField (AFPlaceHolderColor)

/** get方法 */
- (UIColor *)placeholderColor {
    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
    return label.textColor;
}

/** set方法 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.placeholder = @"  ";
    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
    label.textColor = placeholderColor;
}

@end
