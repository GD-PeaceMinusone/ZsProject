//
//  UIImageView+WSIExtension.h
//  心愿很忙
//
//  Created by Jackeylove on 2017/4/22.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WSIExtension)

-(void)circleHeader: (UIView*)headerView withBorderWidth: (CGFloat)width andBorderColor: (UIColor*)color;
+ (instancetype)imageWithIconName:(NSString *)icon borderImage:(NSString *)borderImage border:(int)border;
@end
