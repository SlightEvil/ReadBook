//
//  RBAppContext.h
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#define AppCTX [RBAppContext sharedInstance]

@interface RBAppContext : NSObject

RBSingletonDeclaration

- (void)setUpWindowRootViewController;



@end
