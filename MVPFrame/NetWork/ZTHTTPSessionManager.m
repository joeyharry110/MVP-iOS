//
//  ZTHTTPSessionManager.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "ZTHTTPSessionManager.h"


@interface ZTHTTPSessionManager()

@property(nonatomic) BOOL                   useEncryptTransmit;
@end

static ZTHTTPSessionManager* sessionManager;
@implementation ZTHTTPSessionManager

+ (void)ZT_configBaseUrl:(NSString *)baseUrl useEncryptTransmit:(BOOL)use{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        sessionManager.useEncryptTransmit = use;
    });
}

+ (ZTHTTPSessionManager*)shareInstance{
    if (sessionManager) {
        return sessionManager;
    }
    [self ZT_configBaseUrl:nil useEncryptTransmit:NO];
    return sessionManager;
}

+ (NSURLSessionDataTask*)ZT_POST:(NSString*)url parameters:(id)params complate:(void(^)(ZTNetError* error,id resultData))complateBlock{
    //是否加密处理
    id postParams = [self shareInstance].useEncryptTransmit ? params : params;
   return [[self shareInstance] POST:url parameters:postParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
       [self _ZT_ResponseAnalysis:responseObject complate:^(ZTNetError *err, id result) {
           complateBlock(err,result);
       }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZTNetError* err = [ZTNetError initWithErr:error];
        complateBlock(err,nil);
    }];
}

+ (NSURLSessionDataTask*)ZT_GET:(NSString*)url parameters:(id)params complate:(void(^)(ZTNetError* error,id resultData))complateBlock{
    //是否加密处理
    id postParams = [self shareInstance].useEncryptTransmit ? params : params;
    return [[self shareInstance] GET:url parameters:postParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        [self _ZT_ResponseAnalysis:responseObject complate:^(ZTNetError *err, id result) {
            complateBlock(err,result);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZTNetError* err = [ZTNetError initWithErr:error];
        complateBlock(err,nil);
    }];
}


#pragma mark - private

/**
 响应处理、结果状态判断

 @param response 响应数据
 @param complateBlock 处理结果回调
 */
+ (void)_ZT_ResponseAnalysis:(id)response complate:(void(^)(ZTNetError* err,id result))complateBlock{
    if ([self shareInstance].useEncryptTransmit) {
        //解密处理
        complateBlock(nil,response);
    }
    complateBlock(nil,response);
}
@end
