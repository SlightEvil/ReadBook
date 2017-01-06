//
//  RBDesignDefines.h
//  ReadBook
//
//  Created by hy on 2016/12/27.
//  Copyright © 2016年 机智的静默( https://github.com/jizhidejingmo ). All rights reserved.
//

#ifndef RBDesignDefines_h
#define RBDesignDefines_h

#pragma mark - URL

#define BqgHostUrl                  @"https://goapi.yphsy.com/"
#define BqgSearchUrl(bookName)      [[NSString stringWithFormat:@"api/novel/list.html?page=1&pagesize=20&searchkey=%@&searchtype=name", bookName]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

#pragma mark - Constant

#define RBTabBarHeight          49.0f
#define RBAnimationuration      0.25f

#pragma mark - Font 

#define RBNovelParticularsButtonFont  12


#pragma mark - Frame

#define RBSearchBarHeight           40.0f
#define RBNovelSheifCellHeight      80.0f
#define RBNavBarBackItemSize        35.0f



#pragma mark - Colors 

#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0f)
#define HEXRGBA(c, a)       RGBA(((c & 0xff0000) >> 16), ((c & 0x00ff00) >> 8), (c & 0x0000ff), a)
#define HEXRGB(c)           HEXRGBA(c, 1.0f)

#define RBBGNightColor      HEXRGB(0x000000)
#define RBBGEyeColor        HEXRGB(0xC0FF3E)
#define RBOldBookColor      HEXRGB(0xbeb89f)
#define RBNavTintColor      HEXRGB(0xffffff)
#define RBNavBarTintColor   HEXRGB(0xc62525)


#pragma mark - CellIdentifier

#define RBCellIdentifierWithSearchBook      @"RBCellIdentifierWithSearchBook"
#define RBCellIdentifierWithNovelBookSheif      @"RBCellIdentifierWithNovelBookSheif"



//#pragma mark - NSDictionary Key
//
//#define RBNovelNameKey          @"name"
//#define RBNovelLastTimeKey      @"time"
//#define RBNovelSourceKey        @"sitename"





#endif /* RBDesignDefines_h */
