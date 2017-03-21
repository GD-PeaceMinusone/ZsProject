//
//  XMGTopicVoiceView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/21.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicVoiceView.h"

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

@end
