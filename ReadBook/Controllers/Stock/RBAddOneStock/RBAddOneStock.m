//
//  RBAddOneStock.m
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBAddOneStock.h"
#import "RBStockDetail.h"
#import "RBAddStockCell.h"
#import "NSString+RBSandBoxPath.h"
#import "NSDate+RBDate.h"

#define PATH [[NSString documentPath] stringByAppendingString:@"/stockDetail.data"]
static NSString *const kRBAddStockCellIdentifier = @"RBAddStockCell";

@interface RBAddOneStock () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) RBStockDetail *stockDetail;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation RBAddOneStock

- (instancetype)init {
    
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
        self.title = RBLocalizedString(@"navigation.title.add.stock");
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupData];
    [self setUpNavBarItem];
    [self setupView];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.editing = NO;
}

#pragma mark - Setup

- (void)setupData {
    
    self.stockDetail = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
    if (!self.stockDetail) {
     
        self.stockDetail = [[RBStockDetail alloc] init];
        self.stockDetail.valueArray = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    }
    
    self.stockDetail.placeholderArray = [NSArray arrayWithObjects:@"请输入股票名称", @"请输入买入理由", @"请输入卖出理由", @"请输入买入时间", @"请输入卖出时间", @"请输入买入价格", @"请输入卖出价格", @"请输入止损价", @"请输入目标价", nil];
}

- (void)setUpNavBarItem {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
}

- (void)setupView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RBAddStockCell" bundle:nil] forCellReuseIdentifier:kRBAddStockCellIdentifier];
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - Action

- (void)done {
        
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (self.stockDetail.stockName.length == 0 || self.stockDetail.buyPrice == 0) return;
    
    if (self.stockDetail.sellPrice != 0 && self.stockDetail.endTime.length == 0) {
        
        self.stockDetail.endTime = [NSDate stringFromDate:[NSDate date] formatter:@"yyyy-MM-dd"];
        [self.stockDetail.valueArray replaceObjectAtIndex:4 withObject:self.stockDetail.endTime];
    }
    
    if (!self.stockDetail.stopLossPrice) {
        
        self.stockDetail.stopLossPrice = self.stockDetail.buyPrice * 0.97;
        [self.stockDetail.valueArray replaceObjectAtIndex:7 withObject:@(self.stockDetail.stopLossPrice)];
    }
    
    if (!self.stockDetail.targetPrice) {
        
        self.stockDetail.targetPrice = self.stockDetail.buyPrice * 1.03;
        [self.stockDetail.valueArray replaceObjectAtIndex:8 withObject:@(self.stockDetail.targetPrice)];
    }
    
    if (!self.stockDetail.startTime || self.stockDetail.startTime.length == 0) {
        
        self.stockDetail.startTime = [NSDate stringFromDate:[NSDate date] formatter:@"yyyy-MM-dd"];
        [self.stockDetail.valueArray replaceObjectAtIndex:3 withObject:self.stockDetail.startTime];
    }
    
    [NSKeyedArchiver archiveRootObject:self.stockDetail toFile:PATH];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.stockDetail.placeholderArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RBAddStockCell *cell = [tableView dequeueReusableCellWithIdentifier:kRBAddStockCellIdentifier forIndexPath:indexPath];
    
    [cell setupModel:self.stockDetail row:indexPath.row];
    
    return cell;
}

@end
