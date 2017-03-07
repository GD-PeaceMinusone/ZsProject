//
//  XMGItemManager.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/7.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGItemManager.h"

@implementation XMGItemManager
+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage action:(SEL)action target: (id)target{

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}
@end
