//
//  NewsModel.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTHTTPSessionManager.h"
#import "NewsProtocol.h"

@interface NewsModel : NSObject<NewsProtocol>

@property(nonatomic,copy) NSString*         nTemplate;
@property(nonatomic,copy) NSString*         recSource;
@property(nonatomic,copy) NSString*         lmodify;
@property(nonatomic,copy) NSString*         source;
@property(nonatomic,copy) NSString*         title;
@property(nonatomic,copy) NSString*         digest;

+ (NSURLSessionDataTask*)loadNewsList:(NSDictionary*)params complate:(ZTNetComplateBlock)complate;
@end

