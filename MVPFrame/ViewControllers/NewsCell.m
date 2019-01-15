//
//  NewsCell.m
//  MVPFrame
//
//  Created by chenzetong on 2019/1/15.
//  Copyright © 2019年 cocoa_chen. All rights reserved.
//

#import "NewsCell.h"
#import "NewsProtocol.h"
#import <Masonry.h>

@interface NewsCell()

@property(nonatomic,strong) UILabel*         newsTitleLabel;
@property(nonatomic,strong) UILabel*         newsInfo;
@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.newsTitleLabel];
        [self addSubview:self.newsInfo];
        [self addConstraintsForViews];
    }
    return self;
}

- (void)addConstraintsForViews{
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(24);
    }];
    [self.newsInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.newsTitleLabel);
        make.top.mas_equalTo(self.newsTitleLabel.mas_bottom).mas_offset(5);
        make.bottom.mas_equalTo(-12);
    }];
}

#pragma mark  - setter
- (void)setModel:(id<NewsProtocol>)model{
    self.newsTitleLabel.text = model.title;
    self.newsInfo.text = model.digest;
}

#pragma mark  - getter
- (UILabel *)newsTitleLabel{
    if (!_newsTitleLabel) {
        _newsTitleLabel = [UILabel new];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsInfo{
    if (!_newsInfo) {
        _newsInfo = [UILabel new];
        _newsInfo.numberOfLines = 0;
    }
    return _newsInfo;
}
@end
