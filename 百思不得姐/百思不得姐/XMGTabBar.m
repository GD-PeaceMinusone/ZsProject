//
//  XMGTabBar.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTabBar.h"
@interface XMGTabBar()
@property(nonatomic,weak)UIButton *publishButton;
@end

@implementation XMGTabBar
#pragma mark 懒加载

- (UIButton *)publishButton {
    
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"]forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        // [publishButton sizeToFit];
        publishButton.backgroundColor = XMGRandomColor;
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
#pragma mark - 重新布局

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width/5;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    int buttonIndex = 0;
    
    for (UIView *subView in self.subviews) {
        if (![@"UITabBarButton" isEqualToString:NSStringFromClass(subView.class)]) {
            continue;
        }
        
        CGFloat buttonX = buttonIndex * buttonW;
        if (buttonIndex >= 2) {
            buttonX += buttonW;
        }
        subView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        buttonIndex++;
    }
    
    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.publishButton.center = CGPointMake(self.frame.size.width*0.5, buttonH*0.5);
}

#pragma mark - 监听

-(void)publishClick {
    
    XMGLogFunc;
    
}


@end
