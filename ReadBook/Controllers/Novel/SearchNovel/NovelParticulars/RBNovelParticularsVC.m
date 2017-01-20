//
//  RBNovelParticularsVC.m
//  ReadBook
//
//  Created by hy on 2017/1/5.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBNovelParticularsVC.h"
#import "RBBook.h"
#import "RBNovel.h"
#import "NSDate+RBDate.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RBReadNovelVC.h"



@interface RBNovelParticularsVC () <UITabBarDelegate, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;

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
    
    RBNovel *novel = [RBNovel rb_objcWithDic:self.book.novel];
    
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BqgHostUrl,novel.cover]] placeholderImage:[UIImage imageNamed:@"novel_book_placeholder"]];
    self.novelName.text = novel.name;
    self.intro.text = [NSString stringWithFormat:@"    简介：%@",novel.intro];
    self.author.text = [NSString stringWithFormat:@"作者：%@",[self.book.author objectForKey:@"name"]];
    self.lastChapter.text = [NSString stringWithFormat:@"%@",[self.book.last objectForKey:@"name"]];
    self.lastTime.text = [NSString stringWithFormat:@"最后更新时间：%@",[NSDate stringFromeTimeInterval:[self.book.last objectForKey:@"time"] formatter:@"yyyy-MM-dd"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)readNovel:(UIButton *)sender {
    
    RBReadNovelVC *readNovelVC = [RBReadNovelVC new];
    readNovelVC.book = self.book;
    [self.navigationController pushViewController:readNovelVC animated:YES];
}

- (IBAction)addRemoveNovel:(UIButton *)sender {
}

- (IBAction)cacheNovel:(UIButton *)sender {
}


@end
