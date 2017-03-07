//
//  XMGMeViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGMeViewController.h"
#import "XMGSettingViewController.h"
@interface XMGMeViewController ()

@end

@implementation XMGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = XMGCommonBgColor;
     self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" action:@selector(settingClick) target: self];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" action:@selector(moonClick) target: self];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

-(void)settingClick {
    XMGSettingViewController *vc = [[XMGSettingViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)moonClick {

}
@end
