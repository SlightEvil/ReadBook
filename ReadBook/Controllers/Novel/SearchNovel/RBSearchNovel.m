//
//  RBSearchNovel.m
//  ReadBook
//
//  Created by hy on 2017/1/5.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBBook.h"
#import "RBNovel.h"
#import "RBSearchNovel.h"
#import "RBSearchBookCell.h"
#import "RBNovelParticularsVC.h"

#import <AFNetworking.h>


@interface RBSearchNovel () <UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UITableView *searchResultTableView;

@property (nonatomic, copy) NSArray  *novelBookArray;

@end


@implementation RBSearchNovel

- (instancetype)init {

    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.navigationItem.title = RBLocalizedString(@"novel.searchNovel.title");
        self.hidesBottomBarWhenPushed = YES;
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.searchResultTableView];
}

#pragma mark - Method

- (void)searchNovelWithNovelName:(NSString *)novelName {
    
    NSString *searchUrl = [NSString stringWithFormat:@"%@%@",BqgHostUrl,BqgSearchUrl(novelName)];

    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sessionManager GET:searchUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
            NSLog(@"解析失败 = %@",error.localizedDescription);
            return ;
        }
        NSLog(@"解析成功");
        if ([[dic objectForKey:@"info"] isEqualToString:@"success"]) {
            NSLog(@"返回信息info is success");
            
            NSMutableArray *novelArray = [NSMutableArray array];
            NSArray *searchResultNovelAry = [dic objectForKey:@"data"];
            
            [searchResultNovelAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                RBBook *book = [RBBook rb_objcWithDic:obj];
                [novelArray addObject:book];
            }];
            self.novelBookArray = novelArray.copy;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail = %@",error.localizedDescription);
    }];
    
}

#pragma mark - Getter

- (UISearchBar *)searchBar {
    
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, RBScreenWidth, RBSearchBarHeight)];
        _searchBar.delegate = self;
        _searchBar.placeholder = RBLocalizedString(@"novel.searchBar.placeholder");
        _searchBar.clearsContextBeforeDrawing = YES;
    }
    return _searchBar;
}

- (UITableView *)searchResultTableView {
    
    if (!_searchResultTableView) {
        _searchResultTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, RBSearchBarHeight, RBScreenWidth, self.view.frame.size.height - RBSearchBarHeight) style:UITableViewStylePlain];
        _searchResultTableView.delegate = self;
        _searchResultTableView.dataSource =self;
        [_searchResultTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RBSearchBookCell class]) bundle:nil] forCellReuseIdentifier:RBCellIdentifierWithSearchBook];
    }
    return _searchResultTableView;
}
#pragma mark - Setter

- (void)setNovelBookArray:(NSArray *)novelBookArray {
    
    _novelBookArray = novelBookArray;
    [_searchResultTableView reloadData];
}

#pragma mark - Delegate
#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {

    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {

    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    [self searchNovelWithNovelName:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.novelBookArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RBSearchBookCell *cell = [tableView dequeueReusableCellWithIdentifier:RBCellIdentifierWithSearchBook forIndexPath:indexPath];
    
    RBBook *book = [self.novelBookArray objectAtIndex:indexPath.row];
    RBNovel *novel = [RBNovel rb_objcWithDic:book.novel];
    cell.novel = novel;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return RBNovelSheifCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RBNovelParticularsVC *particulars = [[RBNovelParticularsVC alloc]init];
    [self.navigationController pushViewController:particulars animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
