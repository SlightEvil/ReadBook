//
//  NSDate+RBDate.h
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

@interface NSDate (RBDate)

/**
 从时间中获取指定格式的字符串

 @param date 时间
 @param formatter 格式
 @return 返回值
 */
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 从时间戳中获取指定格式的字符串

 @param timeInterval 时间戳
 @param formatter 格式
 @return 返回值
 */
+ (NSString *)stringFromeTimeInterval:(id)timeInterval formatter:(NSString *)formatter;

@end
