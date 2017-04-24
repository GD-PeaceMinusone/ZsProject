//
//  UIScrollView+Refresh.h
//  QingTour
//
//  Created by tarena on 16/10/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())handler;

- (void)endHeaderRefresh;

- (void)beginHeaderRefresh;

- (void)addFooterRefresh:(void(^)())handler;

- (void)endFooterRefresh;

- (void)endRefreshingWithNoMoreData;

- (void)resetNoMoreData;



@end
