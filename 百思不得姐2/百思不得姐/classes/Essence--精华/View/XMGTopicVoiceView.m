//
//  XMGTopicVoiceView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/21.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicVoiceView.h"
#import "XMGTopic.h"
#import <UIImageView+WebCache.h>

@interface XMGTopicVoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;

@end

@implementation XMGTopicVoiceView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setTopic:(XMGTopic *)topic {
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    
    
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}

@end
