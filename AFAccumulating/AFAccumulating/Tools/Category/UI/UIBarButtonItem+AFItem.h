//
//  UIBarButtonItem+AFItem.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/1.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (AFItem)

// 快速创建UIBarButtonItem

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

/** not rootnavgation's back button */
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

/** selected image */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

@end
