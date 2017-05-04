//
//  UIViewController+Extension.m
//  心愿很忙
//
//  Created by Jackeylove on 2017/4/25.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "REFrostedViewController.h"

@implementation UIViewController (Extension)

+(UINavigationController *)getNavi {

    REFrostedViewController *vc = (REFrostedViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    UITabBarController *tabBarVc =(UITabBarController*)vc.contentViewController;
    
    UINavigationController *navi = tabBarVc.selectedViewController;
    
    return navi;
}

@end
