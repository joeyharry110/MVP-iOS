//
//  NewsModel.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "NewsModel.h"
#import <MJExtension/MJExtension.h>

static NSString* const kNewsListUri = @"https://c.m.163.com/recommend/getSubDocPic?from=toutiao&prog=&open=&openpath=&passport=u7l7gRMelQSAPoZkFEtc7A%3D%3D&devId=XTsePQ7xhF6dRw2/VoZcD8Q79LgdSr6DVVCFD1J2JNH11VWm7B%2BWWR5kf%2BUdRmMK&version=45.1&spever=false&net=wifi&lat=&lon=&ts=1547515691&sign=WWlULp4oz8x1UAwEwq1bXU02UzNn9BCF4ecgRwWXQ3R48ErR02zJ6/KXOnxX046I&encryption=1&canal=appstore&offset=0&size=10&fn=4&spestr=reader_expert_2";

@implementation NewsModel

+ (void)load{
    [NewsModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
          @"nTemplate":@"template"
          };
    }];
}


+ (NSURLSessionDataTask *)loadNewsList:(NSDictionary *)params complate:(ZTNetComplateBlock)complate{
    return [ZTHTTPSessionManager ZT_GET:kNewsListUri parameters:params complate:^(ZTNetError *error, id resultData) {
        if (!error) {
            resultData = [NewsModel mj_objectArrayWithKeyValuesArray:resultData[@"tid"]];
        }
        complate(error,resultData);
    }];
}
@end
