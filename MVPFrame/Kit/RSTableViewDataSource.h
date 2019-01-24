//
//  RSTableViewDataSource.h
//  RSLibDemo
//
//  Created by chenzetong on 2018/11/29.
//  Copyright © 2018年 cocoa_chen. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UITableView的dataSourced数据源类
 */
@interface RSTableViewDataSource : NSObject<UITableViewDataSource>


@property(nonatomic,copy,readonly) NSString*         cellIdentifer;
/**
 初始化数据源类

 @param tableView 目标tableView
 @param identifer cell标识
 @param block 设置cell回调
 @return 数据源对象
 */
- (instancetype)initWithTableView:(UITableView*)tableView identifier:(NSString *)identifer cellForRow:(void (^)(id cell, id model))block;

/**
 添加数据

 @param modles 数据模型数组
 */
- (void)RS_addModles:(NSArray*)modles;

/**
 删除所有
 */
- (void)RS_removeAllModels;
@end
