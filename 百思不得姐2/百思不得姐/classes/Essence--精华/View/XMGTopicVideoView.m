//
//  XMGTopicVideoView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/20.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicVideoView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"

@interface XMGTopicVideoView ()
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation XMGTopicVideoView

- (void)awakeFromNib {

    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setTopic:(XMGTopic *)topic {

    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    
    
    NSInteger minute = topic.videotime / 60;
    NSInteger second = topic.videotime % 60;
    self.videoTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}
@end
