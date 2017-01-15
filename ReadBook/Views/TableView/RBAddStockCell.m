//
//  RBAddStockCell.m
//  ReadBook
//
//  Created by yangyang on 2017/1/15.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBAddStockCell.h"
#import "RBStockDetail.h"


@interface RBAddStockCell () <UITextFieldDelegate>

@property (nonatomic) RBStockDetail *model;
@property (nonatomic) NSInteger row;

@end

@implementation RBAddStockCell

- (void)awakeFromNib {
    
    [super awakeFromNib];

    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.delegate = self;
}

- (void)setupModel:(RBStockDetail *)model row:(NSInteger)row {
    
    self.textField.placeholder = [model.placeholderArray objectOrNilAtIndex:row];
    self.row = row;
    self.model = model;
}

#pragma mark - TextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    switch (self.row) {
        case 0:
            self.model.stockName = textField.text;
            break;
        case 1:
            self.model.buyReason = textField.text;
            break;
        case 2:
            self.model.sellReason = textField.text;
            break;
        case 3:
            self.model.startTime = textField.text;
            break;
        case 4:
            self.model.endTime = textField.text;
            break;
        case 5:
            self.model.buyPrice = [[NSNumber priceWithString:textField.text] doubleValue];
            break;
        case 6:
            self.model.sellPrice = [[NSNumber priceWithString:textField.text] doubleValue];
            break;
        case 7:
            self.model.stopLossPrice = [[NSNumber priceWithString:textField.text] doubleValue];
            break;
        case 8:
            self.model.targetPrice = [[NSNumber priceWithString:textField.text] doubleValue];
            break;
        default:
            break;
    }
    
    [self.model.valueArray replaceObjectAtIndex:self.row withObject:textField.text];
}

@end
