//
//  NSString+RBSandBoxPath.h
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

@interface NSString (RBSandBoxPath)

/**
 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据

 @return path
 */
+ (NSString *)documentPath;

/**
 配置目录，配置文件存这里

 @return path
 */
+ (NSString *)libraryPrefPath;

/**
 缓存目录，系统永远不会删除这里的文件，ITUNES会删除

 @return path
 */
+ (NSString *)libraryCachePath;

/**
 临时缓存目录，APP退出后，系统可能会删除这里的内容

 @return path
 */
+ (NSString *)tmpPath;

@end
