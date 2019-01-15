//
//  NewsProtocol.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NewsProtocol <NSObject>

- (NSString*)nTemplate;
- (NSString*)recSource;
- (NSString*)lmodify;
- (NSString*)source;
- (NSString*)title;
- (NSString*)digest;
@end

