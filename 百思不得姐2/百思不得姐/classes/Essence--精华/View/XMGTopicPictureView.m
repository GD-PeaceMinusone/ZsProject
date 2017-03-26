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
#import <DALabeledCircularProgressView.h>
#import "XMGSeeBigPictureViewController.h"

@interface XMGTopicPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *placehoderImageView;

@end

@implementation XMGTopicPictureView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progressView.roundedCorners = 5;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
    
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(seeBigPicture)]];

}

-(void)seeBigPicture {
    
    XMGSeeBigPictureViewController *vc = [[XMGSeeBigPictureViewController alloc]init];
    vc.topic = self.topic;
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
}
- (IBAction)seeBigPicture:(id)sender {
    XMGSeeBigPictureViewController *vc = [[XMGSeeBigPictureViewController alloc]init];
    vc.topic = self.topic;
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
}


- (void)setTopic:(XMGTopic *)topic {
    
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        CGFloat progress = receivedSize * 1.0 / expectedSize;
        
        self.progressView.progress = progress;
        
        self.progressView.hidden = NO;
        
        self.placehoderImageView.hidden = NO; 
        
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.progressView.hidden = YES;
        self.placehoderImageView.hidden = YES;
        
        if (topic.bigPicture) {
            
            CGFloat imageW = topic.contentF.size.width;
            CGFloat imageH = imageW * topic.height / topic.width;
            
            UIGraphicsBeginImageContext(CGSizeMake(imageW,imageH));
            [image drawInRect:CGRectMake(0, 0, imageW, imageH)];
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        
    }];
    
    //gif
    self.gifView.hidden = !topic.is_gif;
    
    //查看大图
    
    if (topic.bigPicture) {
        
        self.seeBigButton.hidden = NO;
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
        
    }else {
    
        self.seeBigButton.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
        
    }
    
    
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
