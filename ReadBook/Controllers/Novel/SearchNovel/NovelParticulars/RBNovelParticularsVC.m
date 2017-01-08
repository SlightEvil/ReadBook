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
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
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
