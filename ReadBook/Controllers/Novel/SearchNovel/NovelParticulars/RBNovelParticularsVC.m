//
//  RBNovelParticularsVC.m
//  ReadBook
//
//  Created by hy on 2017/1/5.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBNovelParticularsVC.h"

@interface RBNovelParticularsVC ()

@end

@implementation RBNovelParticularsVC

- (instancetype)init {

    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
        self.navigationItem.title = RBLocalizedString(@"novel.novelParticulars.title");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}




#pragma mark - Methods

- (void)backBeforeVC {

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UI

- (void)setUpNavBarBackItem {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, RBNavBarBackItemSize, RBNavBarBackItemSize);
    [backBtn setImage:[UIImage imageNamed:@"navbar_back"] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 12)];
    [backBtn addTarget:self action:@selector(backBeforeVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
