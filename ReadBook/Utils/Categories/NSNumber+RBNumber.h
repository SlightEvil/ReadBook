//
//  NSNumber+RBNumber.h
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (RBNumber)

/**
 从字符串中获取价格

 @return 只有两位小数的价格
 */
+ (NSNumber *)priceWithString:(NSString *)string;

@end
