//
//  NSDate+AFDealTime.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/2.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//  时间显示问题处理

#import "NSDate+AFDealTime.h"

@implementation NSDate (AFDealTime)

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *nowComp = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *creatComp = [calendar components:NSCalendarUnitYear fromDate:self];
    
    return nowComp.year == creatComp.year;
}

- (BOOL)isToday
{
    // 实例化一个日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInToday:self];
}

- (BOOL)isYesterToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInYesterday:self];
}

- (NSDateComponents *)dealTime
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
}

@end
