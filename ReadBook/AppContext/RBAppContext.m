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

@property (nonatomic, readwrite) RBBaseNavigationController *navVC;
@property (nonatomic, readwrite) UIWindow *window;

@end


@implementation RBAppContext

RBSingletonImplementation


#pragma mark - Setter

- (void)setTintColor:(UIColor *)tintColor {

    _tintColor = tintColor;
    [_navVC.navigationBar setTintColor:_tintColor];
}

- (void)setBarTintColor:(UIColor *)barTintColor {

    _barTintColor = barTintColor;
    [_navVC.navigationBar setBarTintColor:_barTintColor];
    [_navVC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:_barTintColor}];
}

- (void)setStatusStyleWhite:(BOOL)statusStyleWhite {

    _statusStyleWhite = statusStyleWhite;
    
    if (_statusStyleWhite) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    } else {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
}

#pragma mark -Getter

- (RBBaseNavigationController *)navVC {
    if (!_navVC) {
        UIViewController *rootView = [RBBookCaseVC new];
        _navVC = [[RBBaseNavigationController alloc]initWithRootViewController:rootView];
        
        [_navVC.navigationBar setBarTintColor:RBNavBarTintColor];
        [_navVC.navigationBar setTintColor:RBNavTintColor];
        [_navVC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RBNavTintColor}];
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
