//
//  RBBook.h
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+RBRuntime.h"

#import "RBAuthor.h"



@interface RBBook : NSObject

//@property (nonatomic, copy) NSString *bookIcon;
//@property (nonatomic, copy) NSString *bookName;
//@property (nonatomic, copy) NSString *bookSynopsis;
//@property (nonatomic, copy) NSString *bookChapterRead;
//@property (nonatomic, copy) NSString *bookChapterCurrent;
//@property (nonatomic, copy) NSString *bookChapterTotal;
//@property (nonatomic) BOOL  bookRead;


//@property (nonatomic) NSNumber *status;
//@property (nonatomic, copy) NSString *info; //success
////@property (nonatomic, copy) NSDictionary *data;


@property (nonatomic, copy) NSDictionary *author;
@property (nonatomic, copy) NSDictionary *categoty;
@property (nonatomic, copy) NSDictionary *source;
@property (nonatomic, copy) NSDictionary *novel;    //小说
@property (nonatomic, copy) NSDictionary *data;
@property (nonatomic, copy) NSDictionary *last;
@property (nonatomic, copy) NSDictionary *url;

















@end
