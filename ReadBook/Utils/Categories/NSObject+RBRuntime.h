//
//  NSObject+RBRuntime.h
//  ReadBook
//
//  Created by hy on 2016/12/29.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBRuntime)


+ (instancetype)rb_objcWithDic:(NSDictionary *)dic;

+ (NSArray *)rb_objProperties;


@end
