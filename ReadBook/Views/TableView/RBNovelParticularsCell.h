//
//  RBNovelParticularsCell.h
//  ReadBook
//
//  Created by hy on 2017/1/6.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBBook;

@interface RBNovelParticularsCell : UITableViewCell


@property (nonatomic, copy) RBBook *book;

@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *novelName;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *category;

- (IBAction)readNovel:(id)sender;

- (IBAction)addRmoveNovel:(id)sender;

- (IBAction)cacheNovel:(id)sender;

@end
