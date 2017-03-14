//
//  XMGMeSquareButton.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/14.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGMeSquareButton.h"

@implementation XMGMeSquareButton

-(instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
-(void)layoutSubviews {

    [super layoutSubviews];
    self.imageView.xmg_y = self.xmg_height * 0.1;
    self.imageView.xmg_height = self.xmg_height * 0.5;
    self.imageView.xmg_width = self.imageView.xmg_height;
    self.imageView.xmg_centerX = self.xmg_width * 0.5;
    
    self.titleLabel.xmg_x = 0;
    self.titleLabel.xmg_y = self.imageView.xmg_bottom;
    self.titleLabel.xmg_width = self.xmg_width;
    self.titleLabel.xmg_height = self.xmg_height - self.titleLabel.xmg_y;
}

@end
