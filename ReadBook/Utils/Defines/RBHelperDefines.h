//
//  RBHelperDefines.h
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#ifndef RBHelperDefines_h
#define RBHelperDefines_h

#pragma mark - common
#define RBLocalizedString(str) NSLocalizedString(str, nil)

#pragma mark - ScreenSize

#define RBScreenWidth   CGRectGetWidth([UIScreen mainScreen].bounds)
#define RBScreenHeight  CGRectGetHeight([UIScreen mainScreen].bounds)

#pragma mark - Notification

#define RBAddNotification(SEL,notificationName)   \
[[NSNotificationCenter defaultCenter] addObserver:self selector:SEL name:notificationName object:nil]

#define RBPostNotification(notificationName,info)  \
[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:info];

#define RBRemoveNotification(notificationName)    \
[[NSNotificationCenter defaultCenter] removeObserver:self name:notificationName object:nil]

#define RBRemoveAllNotification()                     \
[[NSNotificationCenter defaultCenter] removeObserver:self]

#pragma mark - Singleton

#define RBSingletonDeclaration \
+ (instancetype)sharedInstance;

#define RBSingletonImplementation \
+ (instancetype)sharedInstance { \
    static dispatch_once_t onceToken;   \
    static id _instance = nil;  \
    dispatch_once(&onceToken, ^{    \
        _instance = [[self class] new]; \
    }); \
    return _instance;   \
}

#endif /* RBHelperDefines_h */
