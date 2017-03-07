//
//  XMGessenceViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGessenceViewController.h"

@interface XMGessenceViewController ()

@end

@implementation XMGessenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(tagClick) forControlEvents:UIControlEventTouchUpInside];
    button.xmg_size = button.currentImage.size;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

-(void)tagClick {

    XMGLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
