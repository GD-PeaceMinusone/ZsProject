//
//  UIImage+WSIExtension.m
//  心愿很忙
//
//  Created by Jackeylove on 2017/4/22.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "UIImage+WSIExtension.h"

@implementation UIImage (WSIExtension)


+ (instancetype)imageWithIconName:(NSString *)icon borderImage:(NSString *)borderImage border:(int)border{
    
    //头像图片
    
    UIImage * image = [UIImage imageNamed:icon];
    
    //边框图片
    
    UIImage * borderImg = [UIImage imageNamed:borderImage];
    
    //
    
    CGSize size = CGSizeMake(image.size.width + border, image.size.height + border);
    
    
    //创建图片上下文
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    
    
    //绘制边框的圆
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    
    
    
    //剪切可视范围
    
    CGContextClip(context);
    
    
    
    //绘制边框图片
    
    [borderImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    
    
    //设置头像frame
    
    CGFloat iconX = border / 2;
    
    CGFloat iconY = border / 2;
    
    CGFloat iconW = image.size.width;
    
    CGFloat iconH = image.size.height;
    
    CGContextAddEllipseInRect(context, CGRectMake(iconX, iconY, iconW, iconH));
    
    CGContextClip(context);
    
    [image drawInRect:CGRectMake(iconX, iconY, iconW, iconH)];
    
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return iconImage;
    
}

+ (instancetype)imageWithIcon: (UIImage*)image borderImage:(NSString *)borderImage Border:(int)border {

    //边框图片
    
    UIImage * borderImg = [UIImage imageNamed:borderImage];
    
    //
    
    CGSize size = CGSizeMake(image.size.width + border, image.size.height + border);
    
    
    //创建图片上下文
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    
    
    //绘制边框的圆
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    
    
    
    //剪切可视范围
    
    CGContextClip(context);
    
    
    
    //绘制边框图片
    
    [borderImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    
    
    //设置头像frame
    
    CGFloat iconX = border / 2;
    
    CGFloat iconY = border / 2;
    
    CGFloat iconW = image.size.width;
    
    CGFloat iconH = image.size.height;
    
    CGContextAddEllipseInRect(context, CGRectMake(iconX, iconY, iconW, iconH));
    
    CGContextClip(context);
    
    [image drawInRect:CGRectMake(iconX, iconY, iconW, iconH)];
    
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return iconImage;
}


@end
