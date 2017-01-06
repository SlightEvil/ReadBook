//
//  RBSearchBookCell.h
//  ReadBook
//
//  Created by hy on 2017/1/3.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <UIKit/UIKit.h>


@class RBNovel;


@interface RBSearchBookCell : UITableViewCell

@property (nonatomic, copy) RBNovel *novel;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;


@end
