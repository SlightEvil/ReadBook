//
//  RBStock.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStock.h"

static NSString *const kIncomeMoney = @"incomeMoney";
static NSString *const kTotalMoney = @"totalMoney";
static NSString *const kCostMoney = @"costMoney";

@interface RBStock () <NSCoding>

@end

@implementation RBStock

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self.incomeMoney = [[coder decodeObjectForKey:kIncomeMoney] floatValue];
    self.totalMoney = [[coder decodeObjectForKey:kTotalMoney] floatValue];
    self.costMoney = [[coder decodeObjectForKey:kCostMoney] floatValue];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:[NSNumber numberWithFloat:self.incomeMoney] forKey:kIncomeMoney];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.totalMoney] forKey:kTotalMoney];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.costMoney] forKey:kCostMoney];
}

@end
