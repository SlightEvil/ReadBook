//
//  RBNovelParticularsVC.h
//  ReadBook
//
//  Created by hy on 2017/1/5.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//


@class RBBook;


@interface RBNovelParticularsVC : UIViewController

@property (nonatomic) RBBook *book;

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

@property (weak, nonatomic) IBOutlet UILabel *novelName;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *lastChapter;
@property (weak, nonatomic) IBOutlet UILabel *lastTime;
@property (weak, nonatomic) IBOutlet UITextView *intro;


- (IBAction)readNovel:(UIButton *)sender;

- (IBAction)addRemoveNovel:(UIButton *)sender;

- (IBAction)cacheNovel:(UIButton *)sender;


@end
