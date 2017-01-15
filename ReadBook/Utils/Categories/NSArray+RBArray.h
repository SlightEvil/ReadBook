//
//  NSArray+RBArray.h
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RBArray)

/**
 获取下标对应的值，若下标超出数组个数，返回0

 @param index 下标
 @return 返回值
 */
- (id)objectOrNilAtIndex:(NSUInteger)index;

@end
