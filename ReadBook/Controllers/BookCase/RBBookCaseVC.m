//
//  RBBookCaseVC.m
//  ReadBook
//
//  Created by hy on 2016/12/23.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBBookCaseVC.h"
#import "RBAppContext.h"
#import "RBSearchBookVC.h"
#import "RBBookCaseCell.h"



@interface RBBookCaseVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RBBookCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"书架";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn addTarget:self action:@selector(searchBookAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItemSearch = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItemSearch;
    
    
//    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    [tableView registerClass:[RBBookCaseCell class] forCellReuseIdentifier:cellIdentifierWithBookCase];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
    
    

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击的是 %ld",[indexPath row]);
}

#pragma mark - SearchBtn

- (void)searchBookAction {
    
    RBSearchBookVC *searchBookVC = [RBSearchBookVC new];
    [self.navigationController pushViewController:searchBookVC animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
