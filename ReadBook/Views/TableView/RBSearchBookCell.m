//
//  RBSearchBookCell.m
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBSearchBookCell.h"
#import "RBNovel.h"

#import <UIImageView+WebCache.h>


@implementation RBSearchBookCell

- (void)setNovel:(RBNovel *)novel {

    _novel = novel;
    
    self.name.text = novel.name;
    self.intro.text = novel.intro;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BqgHostUrl,novel.cover]] placeholderImage:[UIImage imageNamed:@"novel_book_placeholder"]];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
