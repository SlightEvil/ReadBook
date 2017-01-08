//
//  RBNovelVC.m
//  ReadBook
//
//  Created by yangyang on 2016/12/31.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBNovelVC.h"
#import "RBBook.h"
#import "RBSearchNovel.h"

#import <AFHTTPSessionManager.h>


@interface RBNovelVC () <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, copy) NSArray *bookArray;
@property (nonatomic) UITableView *bookTableView;
@property (nonatomic) UISearchBar *searchBar;

@end

@implementation RBNovelVC


- (instancetype)init {
    
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
        self.title = RBLocalizedString(@"navigation.title.novel");
        self.hidesBottomBarWhenPushed = NO;
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBarSearchItem];

    [self.view addSubview:self.bookTableView];
}

#pragma mark - Set UI

- (void)setUpNavBarSearchItem {
    
    UIBarButtonItem *navBarRightSearchItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"novel_search_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(enterSearchVC)];
    self.navigationItem.rightBarButtonItem = navBarRightSearchItem;
}

#pragma mark - Methods

- (void)enterSearchVC {

    RBSearchNovel *searchNovel = [[RBSearchNovel alloc]init];
    [self.navigationController pushViewController:searchNovel animated:YES];
}

#pragma mark - Delegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.bookArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RBCellIdentifierWithNovelBookSheif forIndexPath:indexPath];
    cell.textLabel.text = @"test";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return RBNovelSheifCellHeight;
}

#pragma mark - Getter

- (UITableView *)bookTableView {

    if (!_bookTableView) {
        _bookTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _bookTableView.delegate = self;
        _bookTableView.dataSource = self;
        [_bookTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RBCellIdentifierWithNovelBookSheif];
    }
    return _bookTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
