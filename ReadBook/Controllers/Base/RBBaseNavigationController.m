//
//  RBBaseNavigationVC.m
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBBaseNavigationController.h"

@interface RBBaseNavigationController ()

@end

@implementation RBBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setBarTintColor:RBNavBarTintColor];
    [self.navigationBar setTintColor:RBNavTintColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RBNavTintColor}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
