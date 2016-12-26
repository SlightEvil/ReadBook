//
//  RBAppContext.h
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface RBAppContext : NSObject

@property (nonatomic, readonly) UINavigationController *navVC;
//@property (nonatomic, readonly) UITabBarController *tabVC;
@property (nonatomic, readonly) UIWindow *window;





- (void)setUpWindowRootViewWithNavVC;



@end
