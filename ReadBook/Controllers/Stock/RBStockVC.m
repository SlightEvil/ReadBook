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

#define PATH [[NSString documentPath] stringByAppendingString:@"/stock.data"]

@interface RBStockVC ()

@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UILabel *incomeLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *costPriceLabel;

@property (nonatomic) RBStock *stock;

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

    [self setupData];
    [self setUpNavBarItem];
    [self setUpHeaderViewWithIncome:self.stock.incomeMoney];
}

#pragma mark - Setup

- (void)setupData {
    
    self.stock = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
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

#pragma mark - Action

- (void)addOneStock {
    
    NSLog(@"add");
}

- (IBAction)editTotalPrice:(UIButton *)sender {
    
    RBStockEditView *editView = [[RBStockEditView alloc] initWithTitle:@"请填写总资金"];
    [editView completionBlock:^(NSNumber *price) {
        
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f", [price floatValue]];
        self.stock.totalMoney = [price floatValue];
        [self calculateMoney];
    }];
}

- (IBAction)editCostPrice:(id)sender {
    
    RBStockEditView *editView = [[RBStockEditView alloc] initWithTitle:@"请填写成本"];
    [editView completionBlock:^(NSNumber *price) {
        
        self.costPriceLabel.text = [NSString stringWithFormat:@"%.2f", [price floatValue]];
        self.stock.costMoney = [price floatValue];
        [self calculateMoney];
    }];
}

- (void)calculateMoney {
    
    self.stock.incomeMoney = self.stock.totalMoney - self.stock.costMoney;
    [NSKeyedArchiver archiveRootObject:self.stock toFile:PATH];
    
    self.incomeLabel.text = [NSString stringWithFormat:@"%.2f", self.stock.incomeMoney];
    [self setUpHeaderViewWithIncome:self.stock.incomeMoney];
}

#pragma mark - Getter

- (RBStock *)stock {
    
    if (!_stock) {
        
        _stock = [[RBStock alloc] init];
    }
    
    return _stock;
}

@end
