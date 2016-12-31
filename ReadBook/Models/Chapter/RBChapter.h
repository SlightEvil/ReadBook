//
//  RBChapter.h
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBChapter : NSObject

@property (nonatomic, copy) NSString *chapterName;
@property (nonatomic, copy) NSString *chapterPageRead;
@property (nonatomic, copy) NSString *chapterPageCurrent;
@property (nonatomic, copy) NSString *chapterPageTotal;

/**
    当前时间，跟电池 在设置章节页 的时候 直接获取会好一点
 */
@property (nonatomic, copy) NSString *timeCurrent;
@property (nonatomic, copy) NSString *battery;



@end
