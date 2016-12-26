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



- (void)setBarTintColor:(UIColor *)barTintColor {

    _barTintColor = barTintColor;
    
    [self.navigationBar setBarTintColor:_barTintColor];
}

- (void)setTintColor:(UIColor *)tintColor {

    _tintColor = tintColor;
    
    [self.navigationBar setTintColor:_tintColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:_tintColor}];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
