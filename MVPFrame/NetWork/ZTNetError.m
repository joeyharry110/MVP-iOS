//
//  ZTNetError.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "ZTNetError.h"

@interface ZTNetError()

@property(nonatomic,assign) NSInteger                  errCode;
@property(nonatomic,copy) NSString*                    desc;
@property(nonatomic,copy) NSDictionary*                userInfo;
@end

const NSInteger ZTNetErrorResponseAnalysisErrCode = -9000;
NSString* const ZTNetErrorResponseAnalysisErrMsg = @"响应数据解析失败";
@implementation ZTNetError

+ (instancetype)initWithErrCode:(NSInteger)errCode desc:(NSString *)desc userInfo:(NSDictionary *)userInfo{
    ZTNetError* netErr = [ZTNetError new];
    netErr.errCode = errCode;
    netErr.desc = desc;
    netErr.userInfo = userInfo;
    return netErr;
}

+ (instancetype)initWithErr:(NSError*)error{
    ZTNetError* netErr = [ZTNetError new];
    netErr.errCode = error.code;
    netErr.desc = [self _ZT_getErrMessage:error.code];
    netErr.userInfo = error.userInfo;
    return netErr;
}

+ (NSString*)_ZT_getErrMessage:(NSInteger)errCode{
    switch (errCode) {
        case -1001:
            return @"请求超时";
            break;
        case -1004:
            return @"无法连接到服务器";
            break;
        case 500:
            return @"服务器错误";
            break;
        case 404:
            return @"请求地址错误";
    }
    return @"Unknown";
}
@end

