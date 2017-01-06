//
//  NSObject+RBRuntime.h
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBRuntime)


+ (instancetype)rb_objcWithDic:(NSDictionary *)dic;

+ (NSArray *)rb_objcProperties;


@end
