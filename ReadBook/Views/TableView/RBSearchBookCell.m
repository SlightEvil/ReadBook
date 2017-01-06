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
    
    _name.text = novel.name;
    _intro.text = novel.intro;
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BqgHostUrl,novel.cover]] placeholderImage:[UIImage imageNamed:@"novel_book_placeholder"]];
    
    NSLog(@"简介 = %@",_intro.text);
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}


/*
 

 */

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
