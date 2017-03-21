//
//  XMGTopicPictureView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/21.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicPictureView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"
#import <AFNetworking.h>

@interface XMGTopicPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@end

@implementation XMGTopicPictureView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(XMGTopic *)topic {
    
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    self.gifView.hidden = !topic.is_gif;
    
    
    /**
      
    AFNetworkReachabilityStatus status  = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    
    //在真机上进行网络判断
    
   
    if (status == AFNetworkReachabilityStatusReachableViaWiFi) {

        [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
        
    }else if(status == AFNetworkReachabilityStatusReachableViaWWAN) {
    
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.middle_image]];
    }else {
    
        self.imageView.image = nil;
    }
     
    **/
    
   
    /**
     
    if (topic.is_gif) {
        
        self.gifView.hidden = NO;
        
    }else {
    
        self.gifView.hidden = YES;
    }
     
    **/
    
}

@end
