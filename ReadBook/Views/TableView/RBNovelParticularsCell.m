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


- (IBAction)readNovel:(id)sender {
    
    NSLog(@"begin read");
    
}

- (IBAction)addRmoveNovel:(id)sender {
    
    NSLog(@"add novel to booksheif");
}

- (IBAction)cacheNovel:(id)sender {
    
    NSLog(@"book novel cache");
    
}


- (void)setBook:(RBBook *)book {

    _book = book;
    
    RBNovel *novel = [RBNovel rb_objcWithDic:book.novel];
    
    [_cover sd_setImageWithURL:[NSURL URLWithString:novel.cover] placeholderImage:[UIImage imageNamed:@"novel_book_placeholder"]];
    _novelName.text = novel.name;
    _author.text = [NSString stringWithFormat:@"作者:%@ |更新:%@",[book.author objectForKey:@"name"],[self timestampWithNumber:[book.last objectForKey:@"time"]]];
    _category.text = [NSString stringWithFormat:@"%@ | 来自: %@",[book.category objectForKey:@"name"],[book.source objectForKey:@"sitename"]];
}


- (NSString *)timestampWithNumber:(NSString *)number {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:date].copy;
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
