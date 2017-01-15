//
//  NSNumber+RBNumber.m
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSNumber+RBNumber.h"

@implementation NSNumber (RBNumber)

+ (NSNumber *)priceWithString:(NSString *)string {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    formatter.maximumFractionDigits = 2;
    
    formatter.minimumFractionDigits = 2;
    
    return [formatter numberFromString:string];
}

@end
