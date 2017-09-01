//
//  NSNull+AFNullCast.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/2/28.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "NSNull+AFNullCast.h"

@implementation NSNull (AFNullCast)

- (float)floatValue {
    return 0.0;
}

- (int)intValue {
    return 0;
}

@end
