//
//  NSObject+RBRuntime.m
//  ReadBook
//
//  Created by hy on 2016/12/29.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSObject+RBRuntime.h"
#import <objc/runtime.h>

/*
     //KVC 设置属性值
     [object setValue:@"value" forKey:@"key"];
     //获取属性值
     id value = [object valueForKey:@"key"];
     
     //通过键路径 设置值
     [object setValue:@"value1" forKeyPath:@"self.key"];
     //通过键路径 获取值
     [object valueForKeyPath:@"self.key"];
 
 */

@implementation NSObject (RBRuntime)


+ (instancetype)rb_objcWithDic:(NSDictionary *)dic {

    id object = [[self alloc]init];
    
    NSArray *array = [self rb_objProperties];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([array containsObject:key]) {
            
            [object setValue:obj forKey:key];
        }
    }];
    
    return object;
}

void *properties = "propertiesKey";

+ (NSArray *)rb_objProperties {
    
    NSArray *ptyArray = objc_getAssociatedObject([self class], properties);
    
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
    
    objc_setAssociatedObject([self class], properties, array, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return array.copy;
}

@end
