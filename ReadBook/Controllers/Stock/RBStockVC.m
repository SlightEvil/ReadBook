//
//  RBStockVC.m
//  ReadBook
//
//  Created by yangyang on 2016/12/31.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStockVC.h"
#import "RBStockEditView.h"
#import "RBStock.h"
#import "NSString+RBSandBoxPath.h"
#import "RBAddOneStock.h"
#import "RBStockDetail.h"

#define PATH [[NSString documentPath] stringByAppendingString:@"/stock.data"]
#define DetailPATH [[NSString documentPath] stringByAppendingString:@"/stockDetail.data"]

static NSString *const kRBDetailStockCellIdentifier = @"RBDetailStockCell";

@interface RBStockVC ()

@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UILabel *incomeLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *costPriceLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic) RBStock *stock;
@property (nonatomic) RBStockDetail *stockDetail;

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

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupData];
    [self setUpNavBarItem];
    [self setUpHeaderViewWithIncome:self.stock.incomeMoney];
    [self setupTableView];
}

#pragma mark - Setup

- (void)setupData {
    
    self.stock = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
    if (!self.stock) self.stock = [[RBStock alloc] init];
    
    self.stockDetail = [NSKeyedUnarchiver unarchiveObjectWithFile:DetailPATH];
    if (!self.stockDetail) self.stockDetail = [[RBStockDetail alloc] init];
}

- (void)setUpNavBarItem {

    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addOneStock)];
}

- (void)setUpHeaderViewWithIncome:(CGFloat)income {
    
    self.incomeLabel.text = [NSString stringWithFormat:@"%0.2f", self.stock.incomeMoney];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%0.2f", self.stock.totalMoney];
    self.costPriceLabel.text = [NSString stringWithFormat:@"%0.2f", self.stock.costMoney];
    
    if (income >= 0) {
        
        self.headerView.backgroundColor = [UIColor redColor];
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    } else {
        
        self.headerView.backgroundColor = [UIColor blueColor];
        self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    }
}

- (void)setupTableView {
 
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kRBDetailStockCellIdentifier];
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - Action

- (void)addOneStock {
    
    RBAddOneStock *vc = [RBAddOneStock new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)editTotalPrice:(UIButton *)sender {
    
    RBStockEditView *editView = [[RBStockEditView alloc] initWithTitle:RBLocalizedString(@"stock.edit.total.placeholder")];
    [editView completionBlock:^(CGFloat price) {
        
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f", price];
        self.stock.totalMoney = price;
        [self calculateMoney];
    }];
}

- (IBAction)editCostPrice:(id)sender {
    
    RBStockEditView *editView = [[RBStockEditView alloc] initWithTitle:RBLocalizedString(@"stock.edit.cost.placeholder")];
    [editView completionBlock:^(CGFloat price) {
        
        self.costPriceLabel.text = [NSString stringWithFormat:@"%.2f", price];
        self.stock.costMoney = price;
        [self calculateMoney];
    }];
}

- (void)calculateMoney {
    
    self.stock.incomeMoney = self.stock.totalMoney - self.stock.costMoney;
    [NSKeyedArchiver archiveRootObject:self.stock toFile:PATH];
    
    [self setUpHeaderViewWithIncome:self.stock.incomeMoney];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.stockDetail.valueArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRBDetailStockCellIdentifier forIndexPath:indexPath];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.stockDetail.valueArray objectOrNilAtIndex:indexPath.row]];
    
    return cell;
}

@end
