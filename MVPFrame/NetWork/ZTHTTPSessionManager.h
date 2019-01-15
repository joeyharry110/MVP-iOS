//
//  ZTHTTPSessionManager.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "ZTNetError.h"

typedef void(^ZTNetComplateBlock)(ZTNetError* error,id result);

@interface ZTHTTPSessionManager : AFHTTPSessionManager

@property(nonatomic,readonly) BOOL                   useEncryptTransmit;

+ (void)ZT_configBaseUrl:(NSString*)baseUrl useEncryptTransmit:(BOOL)use;

+ (NSURLSessionDataTask*)ZT_POST:(NSString*)url parameters:(id)params complate:(void(^)(ZTNetError* error,id resultData))complateBlock;
+ (NSURLSessionDataTask*)ZT_GET:(NSString*)url parameters:(id)params complate:(void(^)(ZTNetError* error,id resultData))complateBlock;
@end

