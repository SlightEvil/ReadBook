//
//  RBAddStockCell.h
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

@class RBStockDetail;

@interface RBAddStockCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UITextField *textField;

- (void)setupModel:(RBStockDetail *)model row:(NSInteger)row;

@end
