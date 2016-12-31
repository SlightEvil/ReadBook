//
//  RBStockVC.m
//  ReadBook
//
//  Created by yangyang on 2016/12/31.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStockVC.h"

@interface RBStockVC ()

@end

@implementation RBStockVC

- (instancetype)init {
    
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
        self.title = RBLocalizedString(@"navigation.title.stock");
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
