//
//  RBAppContext.m
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBAppContext.h"
#import "RBBaseNavigationController.h"
#import "RBTabBarController.h"
#import "RBNovelVC.h"
#import "RBStockVC.h"

@interface RBAppContext ()

@property (nonatomic) RBTabBarController *tabbarVC;
@property (nonatomic) UIWindow *window;

@end


@implementation RBAppContext

RBSingletonImplementation

#pragma mark - Getter

- (RBTabBarController *)tabbarVC {
    
    if (!_tabbarVC) {
        
        _tabbarVC = [[RBTabBarController alloc] init];
    }
    
    return _tabbarVC;
}

- (UIWindow *)window {
    
    return [UIApplication sharedApplication].delegate.window;
}

#pragma mark - SetupRootVC

- (void)setUpWindowRootViewController {

    RBStockVC *stock = [[RBStockVC alloc] init];
    RBBaseNavigationController *stockNavVC = [[RBBaseNavigationController alloc] initWithRootViewController:stock];
    stockNavVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_stock_unselected"];
    
    RBNovelVC *novel = [[RBNovelVC alloc] init];
    RBBaseNavigationController *novelNavVC = [[RBBaseNavigationController alloc] initWithRootViewController:novel];
    novelNavVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_novel_unselected"];
    
    self.tabbarVC.viewControllers = @[stockNavVC, novelNavVC];
    
    self.window.rootViewController = self.tabbarVC;
    [self.window makeKeyAndVisible];
}


@end
