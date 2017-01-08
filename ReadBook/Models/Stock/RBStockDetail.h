//
//  RBStockDetail.h
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBStockDetail : NSObject

// 必填
@property (nonatomic, copy) NSString *stockName;
// 选填，默认空
@property (nonatomic, copy) NSString *buyReason;
// 选填，默认空
@property (nonatomic, copy) NSString *sellReason;
// 必填，负值卖出，正值买入
@property (nonatomic) NSInteger stockNumber;
// 选填，默认记录时间
@property (nonatomic, copy) NSString *startTime;
// 必填
@property (nonatomic) CGFloat buyPrice;
// 选填，默认买入价百分之97
@property (nonatomic) CGFloat stopLossPrice;
// 选填，默认买入价百分之103
@property (nonatomic) CGFloat targetPrice;
// 卖必填
@property (nonatomic) CGFloat sellPrice;

// 根据交易数量判断
@property (nonatomic) BOOL traderType;

@end
