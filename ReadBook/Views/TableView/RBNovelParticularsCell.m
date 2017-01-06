//
//  RBNovelParticularsCell.m
//  ReadBook
//
//  Created by hy on 2017/1/6.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBNovelParticularsCell.h"
#import "RBBook.h"
#import "RBNovel.h"

#import <UIImageView+WebCache.h>


@implementation RBNovelParticularsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - Methods

- (NSString *)timestampWithNumber:(NSString *)number {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:date].copy;
}

- (IBAction)readNovel:(id)sender {
    
    NSLog(@"begin read");
    
}

- (IBAction)addRmoveNovel:(id)sender {
    
    NSLog(@"add novel to booksheif");
}

- (IBAction)cacheNovel:(id)sender {
    
    NSLog(@"book novel cache");
    
}

#pragma mark - Setter

- (void)setBook:(RBBook *)book {

    _book = book;
    
    RBNovel *novel = [RBNovel rb_objcWithDic:book.novel];
    
    [self.cover sd_setImageWithURL:[NSURL URLWithString:novel.cover] placeholderImage:[UIImage imageNamed:@"novel_book_placeholder"]];
    self.novelName.text = novel.name;
    self.author.text = [NSString stringWithFormat:@"作者:%@ |更新:%@",[book.author objectForKey:@"name"],[self timestampWithNumber:[book.last objectForKey:@"time"]]];
    self.category.text = [NSString stringWithFormat:@"%@ | 来自: %@",[book.category objectForKey:@"name"],[book.source objectForKey:@"sitename"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


@end
