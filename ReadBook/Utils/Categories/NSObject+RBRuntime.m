//
//  NSObject+RBRuntime.m
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSObject+RBRuntime.h"
#import <objc/runtime.h>


@implementation NSObject (RBRuntime)

void *propertiesKey = "RBPropertiesKey";

+ (instancetype)rb_objcWithDic:(NSDictionary *)dic {
    
    id object = [[self alloc]init];
    
    NSArray *array = [self rb_objcProperties];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        if ([array containsObject:key]) {
    
            [object setValue:obj forKey:key];
        }
    }];
    
    return object;
}

+ (NSArray *)rb_objcProperties {
    
    NSArray *ptyArray = objc_getAssociatedObject(self, propertiesKey);
    if (ptyArray) {
        return ptyArray.copy;
    }

    unsigned int count = 0;
    objc_property_t *proList = class_copyPropertyList([self class], &count);
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t pty = proList[i];
        const char *cName = property_getName(pty);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [array addObject:name];
    }
    
    free(proList);
    
    objc_setAssociatedObject(self, propertiesKey, array.copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return array.copy;
}

@end
