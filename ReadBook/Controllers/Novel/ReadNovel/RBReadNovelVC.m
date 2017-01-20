//
//  RBReadNovelVC.m
//  ReadBook
//
//  Created by hy on 2017/1/11.
//  Copyright © 2017年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#import "RBReadNovelVC.h"
#import "RBBook.h"
#import "RBChapter.h"

#import <AFNetworking.h>


static NSString *novelKey = @"novelid";

@interface RBReadNovelVC ()

@property (nonatomic) NSArray *chapterArray;

@end

@implementation RBReadNovelVC


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setBook:(RBBook *)book {

    _book = book;
    
    if (!_book) {
        NSLog(@"赋值bookmodel 失败%s",__FUNCTION__);
        return;
    }
    NSString *novelID = [_book.novel objectForKey:@"id"];
    NSString *searchUrl = [NSString stringWithFormat:@"%@%@",BqgHostUrl,BqgReadNovelUrl];
    NSDictionary *dic  = [NSDictionary dictionaryWithObjectsAndKeys:novelKey,novelID, nil];
    

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    session.requestSerializer = [[AFHTTPRequestSerializer alloc]init];
//    [session.requestSerializer setValue:@"text/json" forHTTPHeaderField:@"charset=utf-8"];
//    
    AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc]init];
    [serializer setValue:@"text/json,charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    session.requestSerializer = serializer;

    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    [session POST:searchUrl parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
            NSLog(@"解析失败 %s /n %@",__FUNCTION__,error.localizedDescription);
            return ;
        }
        
        NSArray *chapterArray = [dic objectForKey:@"data"];
        NSMutableArray *array = [NSMutableArray array];
        
        [chapterArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            RBChapter *chapter = [RBChapter rb_objcWithDic:obj];
            
            [array addObject:chapter];
        }];
        self.chapterArray = array.copy;

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"search novel chapter fail /n %s, = %@",__FUNCTION__,error.localizedDescription);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
