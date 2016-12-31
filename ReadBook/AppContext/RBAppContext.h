//
//  RBAppContext.h
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RBBaseNavigationController;

#define AppCTX [RBAppContext sharedInstance]

@interface RBAppContext : NSObject

RBSingletonDeclaration

@property (nonatomic, readonly) RBBaseNavigationController *navVC;
@property (nonatomic, readonly) UIWindow *window;

@property (nonatomic) UIColor *barTintColor;
@property (nonatomic) UIColor *tintColor;
@property (nonatomic) BOOL statusStyleWhite;


- (void)setUpWindowRootViewWithNavVC;


@end
