//
//  RBBook.h
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//


#import "NSObject+RBRuntime.h"


@interface RBBook : NSObject

@property (nonatomic) NSDictionary *author;
@property (nonatomic) NSDictionary *category;
@property (nonatomic) NSDictionary *source;
@property (nonatomic) NSDictionary *novel;    //小说
@property (nonatomic) NSDictionary *data;
@property (nonatomic) NSDictionary *last;
@property (nonatomic) NSDictionary *url;

@end



