//
//  RBJsonUtil.m
//  ReadBook
//
//  Created by hy on 2016/12/29.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBJsonUtil.h"

@implementation RBJsonUtil


+ (NSDictionary *)jsonWithData:(NSData *)data {
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    
    NSData *dataUtf8 = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataUtf8 options:kNilOptions error:&error];
    if (error) {
        return nil;
    }
    return dic;
}


@end
