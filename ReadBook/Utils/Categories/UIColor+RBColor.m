//
//  UIColor+RBColor.m
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "UIColor+RBColor.h"

@implementation UIColor (RBColor)

+ (UIColor *)hexColorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha {

    hexStr = [hexStr stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexStr substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0) green:(float)(green/255.0) blue:(float)(blue/255.0) alpha:1];
}

@end
