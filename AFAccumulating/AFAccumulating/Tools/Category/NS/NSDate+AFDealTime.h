//
//  NSDate+AFDealTime.h
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/2.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AFDealTime)

/** 今年 */
- (BOOL)isThisYear;

/** 今天 */
- (BOOL)isToday;

/** 昨天 */
- (BOOL)isYesterToday;

/** 时间处理 */
- (NSDateComponents *)dealTime;

@end
