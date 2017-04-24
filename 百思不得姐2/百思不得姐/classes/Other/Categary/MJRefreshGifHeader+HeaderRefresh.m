//
//  MJRefreshGifHeader+HeaderRefresh.m
//  Local
//
//  Created by tarena on 2016/11/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MJRefreshGifHeader+HeaderRefresh.h"

@implementation MJRefreshGifHeader (HeaderRefresh)

- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 88; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%02ld", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages duration:idleImages.count * (1 / 25.0) forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"down_loading_%02ld", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages duration:refreshingImages.count * (1 / 10.0) forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:idleImages duration:idleImages.count * (1 / 25.0) forState:MJRefreshStateRefreshing];
}



@end
