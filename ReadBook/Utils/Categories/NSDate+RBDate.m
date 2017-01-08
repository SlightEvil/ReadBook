//
//  NSDate+RBDate.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSDate+RBDate.h"

@implementation NSDate (RBDate)

+ (NSString *)stringFromDate:(id)date formatter:(NSString *)formatter {
    
    return [[self formatterWithString:formatter] stringFromDate:date].copy;
}

+ (NSString *)stringFromeTimeInterval:(id)timeInterval formatter:(NSString *)formatter {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    
    return [[self formatterWithString:formatter] stringFromDate:date].copy;
}

#pragma mark - Helper

+ (NSDateFormatter *)formatterWithString:(NSString *)str {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:str];
    
    return formatter;
}


@end
