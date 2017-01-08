//
//  UIView+RBFrame.m
//  ReadBook
//
//  Created by yangyang on 2017/1/8.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "UIView+RBFrame.h"

@implementation UIView (RBFrame)

#pragma mark - Setter

- (void)setOrigin:(CGPoint)origin {
    
    CGRect rect = self.frame;
    
    rect.origin = origin;
    
    [self setFrame:rect];
}

- (void)setSize:(CGSize)size {
    
    CGRect rect = self.frame;
    
    rect.size = size;
    
    [self setFrame:rect];
}

- (void)setX:(CGFloat)X {
    
    CGRect rect = self.frame;
    
    rect.origin.x = X;
    
    [self setFrame:rect];
}

- (void)setY:(CGFloat)Y {
    
    CGRect rect = self.frame;
    
    rect.origin.y = Y;
    
    [self setFrame:rect];
}

- (void)setWidth:(CGFloat)width {
    
    CGRect rect = self.frame;
    
    rect.size.width = width;
    
    [self setFrame:rect];
}

- (void)setHeight:(CGFloat)height {
    
    CGRect rect = self.frame;
    
    rect.size.height = height;
    
    [self setFrame:rect];
}

- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    
    center.x = centerX;
    
    [self setCenter:center];
}

- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint center = self.center;
    
    center.y = centerY;
    
    [self setCenter:center];
}

#pragma mark - Getter

- (CGPoint)origin {
    
    return self.frame.origin;
}

- (CGSize)size {
    
    return self.frame.size;
}

- (CGFloat)x {
    
    return self.frame.origin.x;
}

- (CGFloat)y {
    
    return self.frame.origin.y;
}

- (CGFloat)width {
    
    return self.frame.size.width;
}

- (CGFloat)height {
    
    return self.frame.size.height;
}

- (CGFloat)centerX {
    
    return self.center.x;
}

- (CGFloat)centerY {
    
    return self.center.y;
}

@end
