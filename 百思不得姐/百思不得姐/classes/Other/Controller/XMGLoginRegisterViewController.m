//
//  XMGLoginRegisterViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/8.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGLoginRegisterViewController.h"

@interface XMGLoginRegisterViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@end

@implementation XMGLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.loginButton setValue:@5 forKeyPath:@"layer.cornerRadius"];
//    [self.loginButton setValue:@YES forKeyPath:@"layer.masksToBounds"];
//    
}
- (IBAction)showLoginOrRegister:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) {
        self.leftMargin.constant = 0;
        [button setTitle:@"注册账号" forState:UIControlStateNormal];
        
    }else {
    
        self.leftMargin.constant = -self.view.xmg_width;
        [button setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
    }];
    

}


-(UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
}

- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
}


@end
