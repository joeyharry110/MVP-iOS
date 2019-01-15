//
//  NewsListPresenter.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"

@interface NewsListPresenter : NSObject

- (void)loadNewsList:(NSInteger)page complate:(ZTNetComplateBlock)complateBlock;
@end

