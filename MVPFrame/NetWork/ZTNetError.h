//
//  ZTNetError.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger ZTNetErrorResponseAnalysisErrCode;
extern NSString* const ZTNetErrorResponseAnalysisErrMsg;

/**
 网络请求错误
 */
@interface ZTNetError : NSObject

/**
 错误编码
 */
@property(nonatomic,assign,readonly) NSInteger                  errCode;

/**
 错误描述
 */
@property(nonatomic,copy,readonly) NSString*                    desc;

/**
 用户自定义信息
 */
@property(nonatomic,copy,readonly) NSDictionary*                userInfo;

+ (instancetype)initWithErrCode:(NSInteger)errCode desc:(NSString*)desc userInfo:(NSDictionary*)userInfo;
+ (instancetype)initWithErr:(NSError*)error;
@end
