//
//  UIImage+Image.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/1.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)


/**
 * @param imageName original name
 * @return nature image
 */
+ (instancetype)imageOriginalWithName:(NSString *)imageName;


/**
 * @return initinal circle image
 */
- (instancetype)af_circleImage;

/**
 * @return initinal circle image
 */
+ (instancetype)af_circleImageNamed:(NSString *)name;

@end
