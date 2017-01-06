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

#pragma mark - Set UI

- (void)setUpNavBarBackItem {
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBeforeVC)];
    self.navigationItem.leftBarButtonItem = backItem;
}

#pragma mark - Methods

- (void)backBeforeVC {

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
