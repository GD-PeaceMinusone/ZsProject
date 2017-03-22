//
//  XMGSeeBigPictureViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/22.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGSeeBigPictureViewController.h"
#import <UIImageView+WebCache.h>

@interface XMGSeeBigPictureViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@end

@implementation XMGSeeBigPictureViewController

-(void)viewDidLoad {

    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = [UIScreen mainScreen].bounds;
//    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back:)]];
    [self.view insertSubview:scrollView atIndex:0];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.xmg_width = scrollView.xmg_width;
    imageView.xmg_height = imageView.xmg_width * self.topic.height / self.topic.width;
    imageView.xmg_x = 0;
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(!image) return;
        self.saveButton.enabled = YES;
    }];
    
    if (imageView.xmg_height >= [UIScreen mainScreen].bounds.size.height) {
        
        imageView.xmg_y = 0;
        scrollView.contentSize = CGSizeMake(0, imageView.xmg_height);
        
    }else {
    
        imageView.xmg_centerY = scrollView.xmg_height / 2;
    }
    
    [scrollView addSubview:imageView];
    
    //图片缩放
    
    CGFloat maxScale = self.topic.height / imageView.xmg_height;
    
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
}


@end
