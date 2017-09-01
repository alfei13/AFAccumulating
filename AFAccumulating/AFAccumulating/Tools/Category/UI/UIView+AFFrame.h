//
//  UIView+AFFrame.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/3.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//  view's frame

/** 
 *  在分类中声明@property, 只会生成方法的声明,
 *  不会生成方法的实现和带有_下划线的成员变量
 */

#import <UIKit/UIKit.h>

@interface UIView (AFFrame)

/** 宽度 */
@property (nonatomic, assign) CGFloat af_width;

/** 高度 */
@property (nonatomic, assign) CGFloat af_height;


/** 中心 */
@property (nonatomic, assign) CGPoint af_origin;

/** x坐标 */
@property (nonatomic, assign) CGFloat af_x;

/** y坐标 */
@property (nonatomic, assign) CGFloat af_y;

/** 中心点横坐标 */
@property (nonatomic, assign) CGFloat af_centerX;

/** 中心点纵坐标 */
@property (nonatomic, assign) CGFloat af_centerY;

#pragma mark - bottom
/** bottom */
@property (nonatomic, assign) CGPoint af_bottom;
/** bottom_x */
@property (nonatomic, assign) CGFloat af_bottom_x;
/** bottom_y */
@property (nonatomic, assign) CGFloat af_bottom_y;



/** 从xib加载view */
+ (instancetype)af_viewFromXib;

@end
