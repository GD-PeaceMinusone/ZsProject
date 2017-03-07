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
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
#pragma mark - 重新布局

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat buttonW = self.xmg_width/5;
    CGFloat buttonH = self.xmg_height;
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
    
    self.publishButton.xmg_width = buttonW;
    self.publishButton.xmg_height = buttonH;
    self.publishButton.xmg_centerX = self.xmg_width*0.5;
    self.publishButton.xmg_centerY = buttonH*0.5;
}
//通过代码创建的控件最终会调用该方法 所以在该方法里修改tabBar的背景图
-(instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

#pragma mark - 监听

-(void)publishClick {
    
    XMGLogFunc;
    
}


@end
