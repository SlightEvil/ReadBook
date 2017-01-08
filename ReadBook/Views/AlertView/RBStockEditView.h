//
//  RBStockEditView.h
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBStockEditView : UIView

- (instancetype)initWithTitle:(NSString *)title;

- (void)removeStockEditView;

- (void)completionBlock:(void (^)(NSNumber *price))block;

@end
