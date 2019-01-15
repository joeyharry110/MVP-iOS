//
//  NewsListViewController.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "NewsListViewController.h"
#import "RSTableViewDataSource.h"
#import <Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "NewsListPresenter.h"
#import "NewsCell.h"

@interface NewsListViewController ()<UITableViewDelegate>

@property(nonatomic,strong) UITableView*                    tableView;
@property(nonatomic,strong) RSTableViewDataSource*          dataSource;
@property(nonatomic,strong) NewsListPresenter*              newsPersenter;
@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - private
- (void)freshTableVeiw{
    [self.newsPersenter loadNewsList:0 complate:^(ZTNetError *error, id result) {
        if (!error) {
            [self.dataSource RS_removeAllModels];
            [self.dataSource RS_addModles:result];
        }
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark  - getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100;
        _tableView.delegate = self;
        _tableView.dataSource = self.dataSource;
        [_tableView registerClass:[NewsCell class] forCellReuseIdentifier:self.dataSource.cellIdentifer];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(freshTableVeiw)];
    }
    return _tableView;
}

- (RSTableViewDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[RSTableViewDataSource alloc] initWithTableView:self.tableView identifier:@"main_list_cell" cellForRow:^(UITableViewCell *cell, id model) {
            NewsCell* nCell = (NewsCell*)cell;
            nCell.model = model;
        }];
    }
    return _dataSource;
}

- (NewsListPresenter *)newsPersenter{
    if (!_newsPersenter) {
        _newsPersenter = [NewsListPresenter new];
    }
    return _newsPersenter;
}
@end
