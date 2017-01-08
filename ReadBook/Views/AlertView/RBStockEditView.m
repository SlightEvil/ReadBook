//
//  RBStockEditView.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBStockEditView.h"
#import "UIView+RBFrame.h"

@interface RBStockEditView () <UITextFieldDelegate>

@property (nonatomic) UIView *centerView;
@property (nonatomic) UITextField *textField;
@property (nonatomic) UIButton *cancelButton;
@property (nonatomic) UIButton *sureButton;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void (^block)(NSNumber *);

@end

@implementation RBStockEditView

#pragma mark - Public

- (instancetype)initWithTitle:(NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        self.title = title;
        [self setupNotification];
        [self setupView];
    }
    
    return self;
}

- (void)removeStockEditView {
    
    [self.textField resignFirstResponder];
    [self removeFromSuperview];
}

- (void)completionBlock:(void (^)(NSNumber *))block {
    
    self.block = block;
}

#pragma mark - setup

- (void)setupNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)setupView {
    
    self.frame = [[UIApplication sharedApplication] keyWindow].frame;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    [self addSubview:self.centerView];
    [self.centerView addSubview:self.textField];
    [self.centerView addSubview:self.cancelButton];
    [self.centerView addSubview:self.sureButton];
    
    [self.textField becomeFirstResponder];
}

#pragma mark - Getter

- (UIView *)centerView {
    
    if (!_centerView) {
        
        _centerView = [[UIView alloc] init];
        
        _centerView.width = self.width;
        _centerView.height = 100;
        _centerView.x = 0;
        _centerView.y = self.height - 100;
        _centerView.backgroundColor = [UIColor whiteColor];
    }
    
    return _centerView;
}

- (UITextField *)textField {
    
    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
        
        _textField.x = self.width * 0.1;
        _textField.y = 10;
        _textField.width = self.width * 0.8;
        _textField.height = 40;
        
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = self.title;
    }
    
    return _textField;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.x = self.width * 0.2;
        _cancelButton.y = self.centerView.height - 30;
        _cancelButton.width = 40;
        _cancelButton.height = 20;
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(removeStockEditView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}

- (UIButton *)sureButton {
    
    if (!_sureButton) {
        
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.x = self.width * 0.7;
        _sureButton.y = self.centerView.height - 30;
        _sureButton.width = 40;
        _sureButton.height = 20;
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _sureButton;
}

#pragma mark - Notification

- (void)keyboardChange:(NSNotification*)notification {
    
    CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if ([notification.name isEqual:@"UIKeyboardWillShowNotification"]) {
        
        self.centerView.y -= keyBoardFrame.size.height;
        
    } else if ([notification.name isEqual: @"UIKeyboardWillHideNotification"]) {
        
        self.centerView.y += keyBoardFrame.size.height;
    }
}

#pragma mark - Action

- (void)sureAction {
    
    if (self.block) {
        
        CGFloat money = self.textField.text.floatValue;
        NSNumber *number = [NSNumber numberWithFloat:money];
        
        self.block(number);
    }
    
    [self removeStockEditView];
}

@end
