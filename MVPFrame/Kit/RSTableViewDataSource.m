//
//  RSTableViewDataSource.m
//  RSLibDemo
//
//  Created by chenzetong on 2018/11/29.
//  Copyright © 2018年 cocoa_chen. All rights reserved.
//

#import "RSTableViewDataSource.h"

@interface RSTableViewDataSource()


@property(nonatomic,weak) UITableView*              tableView;
@property(nonatomic,copy) NSString*                 cellIdentifer;
@property(nonatomic,copy) void (^cellBlock)(UITableViewCell* cell,id model);
@property(nonatomic,strong) NSMutableArray*           dataArray;
@end

@implementation RSTableViewDataSource

- (instancetype)initWithTableView:(UITableView*)tableView identifier:(NSString *)identifer cellForRow:(void (^)(UITableViewCell *cell, id model))block{
    self = [self init];
    if (self) {
        _cellIdentifer = identifer;
        _cellBlock = block;
        _tableView = tableView;
    }
    return self;
}

#pragma mark - public
- (void)RS_addModles:(NSArray *)modles{
    [self.dataArray addObjectsFromArray:modles];
    [_tableView reloadData];
}

- (void)RS_removeAllModels{
    [self.dataArray removeAllObjects];
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifer];
    if (self.cellBlock) {
        self.cellBlock(cell, self.dataArray[indexPath.row]);
    }
    return cell;
}

#pragma mark - getter
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}
@end
