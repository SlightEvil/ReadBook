//
//  NSString+RBSandBoxPath.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "NSString+RBSandBoxPath.h"

@implementation NSString (RBSandBoxPath)

+ (NSString *)documentPath {
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)libraryPrefPath {
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)libraryCachePath {
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)tmpPath {
    
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}

@end
