//
//  NewsCell.h
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NewsProtocol;

@interface NewsCell : UITableViewCell

@property(nonatomic) id<NewsProtocol>         model;
@end

