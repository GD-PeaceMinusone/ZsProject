//
//  XMGTopicCell.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/17.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicCell.h"
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"

@interface XMGTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;
@end
@implementation XMGTopicCell

- (IBAction)more {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [controller addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel  handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
}

-(void)awakeFromNib {

    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}
-(void)setTopic: (XMGTopic *)topic {

    _topic = topic;
    
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.creatAtLabel.text = topic.created_at;
    self.text_Label.text = topic.text;
    
    /**
    NSCalendar *calendar = nil;
    if (ios(8.0)) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else {
    
        calendar = [NSCalendar currentCalendar];
    }
    **/
    

    [self setupButton:self.dingButton number:topic.ding placeHolder:@"赞"];
    [self setupButton:self.caiButton number:topic.cai placeHolder:@"不赞"];
    [self setupButton:self.repostButton number:topic.repost placeHolder:@"转发"];
    [self setupButton:self.commentButton number:topic.comment placeHolder:@"评论"];
    
}

-(void)setupButton: (UIButton*)button number: (NSInteger)number placeHolder: (NSString*)placeHolder {

    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    }else if(number > 0 && number < 10000){
        
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    }else {
        
        [button setTitle:placeHolder forState:UIControlStateNormal];
    }
    
}
/**
  * 重写这个方法的目的:能够拦截所有设置cell frame的操作
  **/
- (void)setFrame:(CGRect)frame {
    
    frame.size.height -= XMGMargin;
    frame.origin.y += XMGMargin;
    [super setFrame:frame];
}

@end
