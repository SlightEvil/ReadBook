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
// 选填，默认创建记录时间
@property (nonatomic, copy) NSString *startTime;
// 清仓时选填，默认填写卖出价的时间
@property (nonatomic, copy) NSString *endTime;
// 必填
@property (nonatomic) CGFloat buyPrice;
// 清仓时必填
@property (nonatomic) CGFloat sellPrice;
// 选填，默认买入价百分之97
@property (nonatomic) CGFloat stopLossPrice;
// 选填，默认买入价百分之103
@property (nonatomic) CGFloat targetPrice;

@property (nonatomic) NSMutableArray *valueArray;
@property (nonatomic, copy) NSArray *placeholderArray;

@end
