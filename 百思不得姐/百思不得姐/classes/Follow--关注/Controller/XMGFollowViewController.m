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
    
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(100, 100, 200, 200);
//    [self.view addSubview:label];
//    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]init];
//    
//    NSAttributedString *text1 = [[NSAttributedString alloc]initWithString:@"你好"];
//    [attributedText appendAttributedString:text1];
//    
//    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
//    attachment.image = [UIImage imageNamed:@"header_cry_icon"];
//    CGFloat lineHeight = label.font.lineHeight;
//    attachment.bounds = CGRectMake(0, -(25-lineHeight)*0.5, lineHeight, lineHeight);
//    NSAttributedString *text2 = [NSAttributedString attributedStringWithAttachment:attachment];
//    [attributedText appendAttributedString:text2];
//    
//    NSAttributedString *text3 =[[NSAttributedString alloc]initWithString:@"哈哈哈"];
//    [attributedText appendAttributedString:text3];
//    label.attributedText = attributedText;
    
//    UILabel *label = [[UILabel alloc]init];
//    NSString *text = @"你好\n哈哈哈";
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:text];
//    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, text.length)];
//    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(3, 3)];
////    [string addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, 3)];
////    [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
//    label.attributedText = string;
//    label.numberOfLines = 0;
//    label.textAlignment = NSTextAlignmentCenter;
//    label.frame = CGRectMake(0, 0, 100, 100);
//    self.navigationItem.titleView = label;
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
