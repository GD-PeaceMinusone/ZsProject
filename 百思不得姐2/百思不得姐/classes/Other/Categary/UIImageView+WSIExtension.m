//
//  UIImageView+WSIExtension.m
//  心愿很忙
//
//  Created by Jackeylove on 2017/4/22.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "UIImageView+WSIExtension.h"

@implementation UIImageView (WSIExtension)

/**
 *  圆形头像
 */
-(void)circleHeader:(UIView *)headerView withBorderWidth:(CGFloat)width andBorderColor:(UIColor *)color{
    
    headerView.layer.cornerRadius = headerView.bounds.size.width * 0.5;
    headerView.layer.masksToBounds = YES;
    
    headerView.layer.borderWidth = width;
    
    headerView.layer.borderColor = color.CGColor;
}




@end
