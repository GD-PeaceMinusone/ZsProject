//
//  XMGFollowViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGFollowViewController.h"
#import "XMGRecomendFollowViewController.h"
#import "XMGLoginRegisterViewController.h"
@interface XMGFollowViewController ()

@end

@implementation XMGFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" action:@selector(followClick) target:self];
}
- (IBAction)loginRegister {
    XMGLoginRegisterViewController *vc = [[XMGLoginRegisterViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)followClick {
    
    XMGLogFunc
    XMGRecomendFollowViewController *vc = [[XMGRecomendFollowViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
