//
//  AFAppItem.m
//  AFAccumulating
//
//  Created by 郑飞飞 on 2017/8/24.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "AFAppItem.h"

@implementation AFAppItem


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.title = dict[@"title"];
    }
    return self;
}

+ (instancetype)appItemWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
