//
//  RBHelperFunctions.m
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBHelperFunctions.h"

@implementation RBHelperFunctions

#define MRSingletonNameFromBlock(name, block) \
+ (instancetype)shared ## name { \
static dispatch_once_t onceToken; \
static id _instance = nil; \
dispatch_once(&onceToken, ^{ \
@try { \
_instance = block(); \
} \
@catch (NSException *e) { \
} \
}); \
return _instance; \
}

@end
