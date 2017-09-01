//
//  NSNull+AFNullCast.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/2/28.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  防止服务器因没有做非空判断而导致程序崩溃
 */
@interface NSNull (AFNullCast)

@end
