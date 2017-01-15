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
    
    self.incomeMoney = [coder decodeFloatForKey:kIncomeMoney] ;
    self.totalMoney = [coder decodeFloatForKey:kTotalMoney];
    self.costMoney = [coder decodeFloatForKey:kCostMoney];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeFloat:self.incomeMoney forKey:kIncomeMoney];
    [aCoder encodeFloat:self.totalMoney forKey:kTotalMoney];
    [aCoder encodeFloat:self.costMoney forKey:kCostMoney];
}

@end
