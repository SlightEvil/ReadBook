//
//  RBStockDetail.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStockDetail.h"
#import "NSDate+RBDate.h"

typedef NS_ENUM(NSUInteger, RBStockTradeType) {
    
    kRBStockTradeBuyType = 0,
    kRBStockTradeSellType
};

@implementation RBStockDetail

#pragma mark - Setter

- (void)setStockNumber:(NSInteger)stockNumber {
    
    if (stockNumber > 0) {
        
        self.traderType = kRBStockTradeBuyType;
    } else if (stockNumber < 0) {
        
        self.traderType = kRBStockTradeSellType;
    }
}

- (void)setStartTime:(NSString *)startTime {
    
    if (startTime.length == 0 || startTime == nil || startTime == NULL) {
        
        _startTime = [NSDate stringFromDate:[NSDate date] formatter:@"yyyy-MM-dd"];
    }
}

- (void)setBuyPrice:(CGFloat)buyPrice {
    
    self.stopLossPrice = buyPrice * 0.97;
    self.targetPrice = buyPrice * 1.03;
}

@end
