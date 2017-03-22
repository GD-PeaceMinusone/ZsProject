//
//  XMGQuickLoginButton.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/8.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGQuickLoginButton.h"

@implementation XMGQuickLoginButton

-(void)awakeFromNib {

    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}
-(void)layoutSubviews {

    [super layoutSubviews];
    self.imageView.xmg_y = 0;
    self.imageView.xmg_centerX = self.xmg_width*0.5;
    
    self.titleLabel.xmg_x = 0;
    self.titleLabel.xmg_y = self.imageView.xmg_height;
    self.titleLabel.xmg_height = self.xmg_height - self.imageView.xmg_height;
    self.titleLabel.xmg_width = self.xmg_width;
}

@end
