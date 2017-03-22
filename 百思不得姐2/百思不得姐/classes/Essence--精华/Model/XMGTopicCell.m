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
#import "XMGComment.h"
#import "XMGUser.h"
#import "XMGTopicVideoView.h"
#import "XMGTopicVoiceView.h"
#import "XMGTopicPictureView.h"

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

/**视频控件*/
@property(nonatomic,weak)XMGTopicVideoView *videoView;
/**图片控件*/
@property(nonatomic,weak)XMGTopicPictureView *pictureView;
/**音频控件*/
@property(nonatomic,weak)XMGTopicVoiceView *voiceView;

@end

@implementation XMGTopicCell

#pragma mark - 懒加载

- (XMGTopicVideoView *)videoView {

    if (!_videoView) {
        
        XMGTopicVideoView *videoView = [XMGTopicVideoView viewFromXib];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    
    return _videoView;
}

-(XMGTopicVoiceView *)voiceView {

    if (!_voiceView) {
        
        XMGTopicVoiceView *voiceView = [XMGTopicVoiceView viewFromXib];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
        
    }
    
    return _voiceView;
}

- (XMGTopicPictureView *)pictureView {

    if (!_pictureView) {
        
        XMGTopicPictureView *pictureView = [XMGTopicPictureView viewFromXib];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
        
    }
    
    return _pictureView;
}

#pragma mark - 初始化
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
    
    if (topic.top_cmt) {
        
        self.topCmtView.hidden = NO;
        
        NSString *userName = topic.top_cmt.user.username;
        NSString *content = topic.top_cmt.content;
        
        self.topCmtContentLabel.text = [NSString stringWithFormat:@"%@ : %@",userName,content];
    }else {
    
        self.topCmtView.hidden = YES;
    }
    
#pragma mark - 根据XMGTopic帖子的类型决定中间添加的控件类型
    
    switch (topic.type) {
            
        case XMGTopicTypeWord:
            
            self.pictureView.hidden = YES;
            self.videoView.hidden = YES;
            self.voiceView.hidden = YES;
            
        
            break;
            
        case XMGTopicTypeVideo:
            
            [self.contentView addSubview:self.videoView];
            self.videoView.hidden = NO;
            self.pictureView.hidden = YES;
            self.voiceView.hidden = YES;
            self.videoView.frame = topic.contentF;
            self.videoView.topic = topic;
            
            break;
            
        case XMGTopicTypeVoice:
            
            [self.contentView addSubview:self.voiceView];
            self.voiceView.hidden = NO;
            self.videoView.hidden = YES;
            self.pictureView.hidden = YES;
            self.voiceView.frame = topic.contentF;
            self.voiceView.topic = topic;
            
            break;
            
        case XMGTopicTypePicture:
            
            [self.contentView addSubview:self.pictureView];
            self.pictureView.hidden = NO;
            self.videoView.hidden = YES;
            self.voiceView.hidden = YES;
            self.pictureView.frame = topic.contentF;
            self.pictureView.topic = topic;
            
            break;
            
        default:
            break;
    }
    
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
