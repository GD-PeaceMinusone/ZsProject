//
//  XMGSeeBigPictureViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/22.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGSeeBigPictureViewController.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import <Photos/Photos.h>

@interface XMGSeeBigPictureViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation XMGSeeBigPictureViewController

static NSString *XMGAssetCollectionTtile = @"王妍";

-(void)viewDidLoad {

    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = [UIScreen mainScreen].bounds;
//    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back:)]];
    [self.view insertSubview:scrollView atIndex:0];
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.xmg_width = scrollView.xmg_width;
    self.imageView.xmg_height = self.imageView.xmg_width * self.topic.height / self.topic.width;
    self.imageView.xmg_x = 0;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(!image) return;
        self.saveButton.enabled = YES;
    }];
    
    if (self.imageView.xmg_height >= [UIScreen mainScreen].bounds.size.height) {
        
        self.imageView.xmg_y = 0;
        scrollView.contentSize = CGSizeMake(0, self.imageView.xmg_height);
        
    }else {
    
        self.imageView.xmg_centerY = scrollView.xmg_height / 2;
    }
    
    [scrollView addSubview:self.imageView];
    
    //图片缩放
    
    CGFloat maxScale = self.topic.height / self.imageView.xmg_height;
    
    if (maxScale > 1.0) {
        
        scrollView.maximumZoomScale = maxScale;
    }
    
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)save:(id)sender {
    
    /**
     PHAuthorizationStatusNotDetermined = 0, // User has not yet made a choice with regards to this application
     PHAuthorizationStatusRestricted,        // This application is not authorized to access photo data.
     // The user cannot change this application’s status, possibly due to active restrictions
     //   such as parental controls being in place.
     PHAuthorizationStatusDenied,            // User has explicitly denied this application access to photos data.
     PHAuthorizationStatusAuthorized
     
     */
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    switch (status) {
            
        case PHAuthorizationStatusRestricted:
            [SVProgressHUD showErrorWithStatus:@"因为系统原因 无法访问相册"];
            break;
            
        case PHAuthorizationStatusDenied://用户拒绝当前应用访问相册
            [SVProgressHUD showErrorWithStatus:@"保存图片失败"];
            break;
            
        case PHAuthorizationStatusAuthorized:
            [self saveImage];
            break;
            
        case PHAuthorizationStatusNotDetermined://用户还没做出选择

            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                
                if (status == PHAuthorizationStatusAuthorized) {
                    
                    [self saveImage];
                }
            }];
            break;
    }
    
}

-(void)saveImage {
    
    /*
     PHAsset: 一个资源 一张图片或一个video 
     PHAssetCollection: 一个相簿
     如果想对相册进行修改 修改代码必须放在block里
     */
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        
         //1.保存图片到"相机胶卷"中
        //创建图片请求
        [PHAssetCreationRequest creationRequestForAssetFromImage:self.imageView.image];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        
        if (success == NO) {
        
            return;
        }
        
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
          //2.创建自定义"相簿"
            [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:XMGAssetCollectionTtile];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            
            if (success == NO) {
                
                return;
            }
            
            //3.添加"相机胶卷"中的图片到自定义"相簿"中
            
        }];
        
        
    }];
    
    

    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {

    if (error) {
        
        [SVProgressHUD showErrorWithStatus:@"图片保存失败"];
    }else {
    
        [SVProgressHUD showSuccessWithStatus:@"图片保存成功"];
   }
    
}

@end
