//
//  RBSearchBookVC.m
//  ReadBook
//
//  Created by hy on 2016/12/29.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBSearchBookVC.h"
#import "RBJsonUtil.h"
#import "RBBook.h"


@interface RBSearchBookVC ()

@end

@implementation RBSearchBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *searchStr = [NSString stringWithFormat:@"%@%@",BqgHostUrl,BqgSearchUrl(@"善良的死神")];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:searchStr]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"fail = %@",error.localizedDescription);
        }
        
        NSDictionary *dic = [RBJsonUtil jsonWithData:data];

        
        NSNumber *status = [dic objectForKey:@"status"];
        NSString *info = [dic objectForKey:@"info"];
        NSDictionary *dataDic = [dic objectForKey:@"data"];
        
        if ([info  isEqualToString:@"success"]) {
            
            NSLog(@"请求成功");
            
            
            RBBook *book = [RBBook rb_objcWithDic:dataDic];
            
            NSLog(@"book = %@",book);
            
        }
    }];
    [dataTask resume];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
