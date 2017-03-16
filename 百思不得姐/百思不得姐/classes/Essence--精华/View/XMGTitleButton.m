//
//  XMGTitleButton.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/15.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTitleButton.h"

@implementation XMGTitleButton
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{}

@end
