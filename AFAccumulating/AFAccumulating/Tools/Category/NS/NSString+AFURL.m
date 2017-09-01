//
//  NSString+AFURL.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/3/15.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "NSString+AFURL.h"

@implementation NSString (AFURL)

- (NSURL *)af_url
{
    return [NSURL URLWithString:self];
}

@end

