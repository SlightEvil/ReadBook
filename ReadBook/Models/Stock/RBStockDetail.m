//
//  RBStockDetail.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStockDetail.h"

static NSString *const kStockName = @"stockName";
static NSString *const kBuyReason = @"buyReason";
static NSString *const kSellReason = @"sellReason";
static NSString *const kStartTime = @"startTime";
static NSString *const kEndTime = @"endTime";
static NSString *const kBuyPrice = @"buyPrice";
static NSString *const kSellPrice = @"sellPrice";
static NSString *const kStopLossPrice = @"stopLossPrice";
static NSString *const kTargetPrice = @"targetPrice";
static NSString *const kValueArray = @"valueArray";

@interface RBStockDetail () <NSCoding>

@end

@implementation RBStockDetail

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self.stockName = [aDecoder decodeObjectForKey:kStockName];
    self.buyReason = [aDecoder decodeObjectForKey:kBuyReason];
    self.sellReason = [aDecoder decodeObjectForKey:kSellReason];
    self.startTime = [aDecoder decodeObjectForKey:kStartTime];
    self.endTime = [aDecoder decodeObjectForKey:kEndTime];
    self.buyPrice = [aDecoder decodeFloatForKey:kBuyPrice];
    self.sellPrice = [aDecoder decodeFloatForKey:kSellPrice];
    self.stopLossPrice = [aDecoder decodeFloatForKey:kStopLossPrice];
    self.targetPrice = [aDecoder decodeFloatForKey:kTargetPrice];
    self.valueArray = [aDecoder decodeObjectForKey:kValueArray];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.stockName forKey:kStockName];
    [aCoder encodeObject:self.buyReason forKey:kBuyReason];
    [aCoder encodeObject:self.sellReason forKey:kSellReason];
    [aCoder encodeObject:self.startTime forKey:kStartTime];
    [aCoder encodeObject:self.endTime forKey:kEndTime];
    [aCoder encodeFloat:self.buyPrice forKey:kBuyPrice];
    [aCoder encodeFloat:self.sellPrice forKey:kSellPrice];
    [aCoder encodeFloat:self.stopLossPrice forKey:kStopLossPrice];
    [aCoder encodeFloat:self.targetPrice forKey:kTargetPrice];
    [aCoder encodeObject:self.valueArray forKey:kValueArray];
}

@end
