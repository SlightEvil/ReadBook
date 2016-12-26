//
//  RBAppContext.m
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBAppContext.h"
#import "RBBaseNavigationController.h"
#import "RBBookCaseVC.h"


@interface RBAppContext ()

@property (nonatomic, readwrite) UINavigationController *navVC;
//@property (nonatomic, readwrite) UITabBarController *tabVC;
@property (nonatomic, readwrite) UIWindow *window;

@end


@implementation RBAppContext


- (UINavigationController *)navVC {

    if (_navVC) {
        
        UIViewController *rootView = [RBBookCaseVC new];
        _navVC = [[RBBaseNavigationController alloc]initWithRootViewController:rootView];
    }
    
    return _navVC;
}

- (UIWindow *)window {
    return [UIApplication sharedApplication].delegate.window;
}





- (void)setUpWindowRootViewWithNavVC {

    self.window.rootViewController = self.navVC;
    [self.window makeKeyAndVisible];
}



@end
