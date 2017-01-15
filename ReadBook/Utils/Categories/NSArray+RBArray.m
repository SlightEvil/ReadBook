//
//  NSArray+RBArray.m
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSArray+RBArray.h"

@implementation NSArray (RBArray)

- (id)objectOrNilAtIndex:(NSUInteger)index {
    
    return index < self.count ? self[index] : nil;
}

@end
