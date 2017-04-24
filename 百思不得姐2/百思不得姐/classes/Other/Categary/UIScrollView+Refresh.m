//
//  UIScrollView+Refresh.m
//  QingTour
//
//  Created by tarena on 16/10/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <MJRefreshGifHeader.h>
#import <MJRefreshBackNormalFooter.h>

@implementation UIScrollView (Refresh)

- (void)addHeaderRefresh:(void (^)())handler{
//    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:handler];
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:handler];
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    gifHeader.stateLabel.hidden = YES;
    self.mj_header = gifHeader;
}

- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}

- (void)addFooterRefresh:(void (^)())handler{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:handler];
}

- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

- (void)endRefreshingWithNoMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)resetNoMoreData{
    [self.mj_footer resetNoMoreData];
}

@end
