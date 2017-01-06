//
//  RBBook.h
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//


#import "NSObject+RBRuntime.h"


@interface RBBook : NSObject

@property (nonatomic, copy) NSDictionary *author;
@property (nonatomic, copy) NSDictionary *category;
@property (nonatomic, copy) NSDictionary *source;
@property (nonatomic, copy) NSDictionary *novel;    //小说
@property (nonatomic, copy) NSDictionary *data;
@property (nonatomic, copy) NSDictionary *last;
@property (nonatomic, copy) NSDictionary *url;

@end



