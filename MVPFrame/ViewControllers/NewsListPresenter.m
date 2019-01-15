//
//  NewsListPresenter.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "NewsListPresenter.h"
#import "NewsModel.h"

@interface NewsListPresenter()

@end

@implementation NewsListPresenter

- (void)loadNewsList:(NSInteger)page complate:(ZTNetComplateBlock)complateBlock{
    //参数示意，没作用
    NSDictionary* params = @{
                             @"page":[NSString stringWithFormat:@"%ld",page]
                             };
    [NewsModel loadNewsList:params complate:^(ZTNetError *error, id result) {
        complateBlock(error,result);
    }];
}
@end
