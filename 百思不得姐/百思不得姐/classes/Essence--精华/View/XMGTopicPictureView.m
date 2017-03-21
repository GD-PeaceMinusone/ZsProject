//
//  XMGTopicPictureView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/21.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopicPictureView.h"

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

@end
