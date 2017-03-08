//
//  XMGLoginRegisterViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/8.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGLoginRegisterViewController.h"

@interface XMGLoginRegisterViewController ()

@end

@implementation XMGLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
}

- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
