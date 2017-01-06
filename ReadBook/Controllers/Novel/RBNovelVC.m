//
//  RBNovelVC.m
//  ReadBook
//
//  Created by yangyang on 2016/12/31.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBNovelVC.h"
#import <AFHTTPSessionManager.h>
#import "RBBook.h"
#import "RBSearchNovel.h"


@interface RBNovelVC ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, copy) NSArray *bookArray;
@property (nonatomic, strong) UITableView *bookTableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation RBNovelVC


- (instancetype)init {
    
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
        self.title = RBLocalizedString(@"navigation.title.novel");
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBarSearchItem];

    [self.view addSubview:self.bookTableView];
}

- (void)setUpNavBarSearchItem {

    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 30, 30);
    [searchBtn setImage:[UIImage imageNamed:@"novel_search_btn"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(enterSearchVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = searchItem;
}

#pragma mark -

- (void)enterSearchVC {

    RBSearchNovel *searchNovel = [[RBSearchNovel alloc]init];
    [self.navigationController pushViewController:searchNovel animated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.bookArray.count ? self.bookArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    RBSearchBookCell *cell = [tableView dequeueReusableCellWithIdentifier:RBCellIdentifierWithSearchBook];
//    if (!cell) {
//        cell = [[RBSearchBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RBCellIdentifierWithSearchBook];
//    }
//    
//    RBBook *book = [self.bookArray objectAtIndex:indexPath.row];
//    RBNovel *novel = [RBNovel rb_objcWithDic:book.novel];
//    cell.novel = novel;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"test";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 90;
}

#pragma mark - Getter
- (UITableView *)bookTableView {

    if (!_bookTableView) {
        _bookTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _bookTableView.delegate = self;
        _bookTableView.dataSource = self;
    }
    return _bookTableView;
}


#pragma mark - Setter




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
