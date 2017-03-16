//
//  XMGClearCacheCell.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/15.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGClearCacheCell.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>
#define XMGCachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]

@implementation XMGClearCacheCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建活动监视器
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activity startAnimating];
        self.accessoryView = activity;
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        //计算缓存时禁止用户点击cell
        self.userInteractionEnabled = NO;
        __weak typeof(self) weakSelf = self;
        //获取缓存大小(耗时操作放入子线程执行)
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:5.0];
            
            unsigned long long size =[XMGCachesPath fileSize];
//            unsigned long long size = @"/Users/jackeylove/Desktop/百思不得姐 4.5.4".fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            if(weakSelf == nil) return;
            NSString *cacheText = nil;
//            1000*1000*1000 = pow(10,9)
            if (size > 1000*1000*1000) {
                
                cacheText = [NSString stringWithFormat:@"%.2fG",size/1000/1000/1000.0];
                
            }else if(size > 1000*1000){
                
                cacheText = [NSString stringWithFormat:@"%.2fM",size/1000/1000.0];
            
            }else if(size > 1000){
                
                cacheText = [NSString stringWithFormat:@"%.2fKB",size/1000.0];
            
            }else {
                cacheText =[NSString stringWithFormat:@"%.2fKB",size*1.0];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存 %@",cacheText];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.textLabel.text = text;
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:weakSelf action:@selector(clearCache)]];
                //此时允许用户点击cell
                weakSelf.userInteractionEnabled = YES;
            });
        });
        weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

-(void)clearCache {
    XMGLog(@"%@", XMGCachesPath);
   //弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //清除SDWebImage 缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        
      //清除自定义缓存
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSFileManager *manager = [NSFileManager defaultManager];
            [manager removeItemAtPath:XMGCachesPath error:nil];
            [manager createDirectoryAtPath:XMGCachesPath withIntermediateDirectories:YES attributes:nil error:nil];

            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                self.textLabel.text = @"缓存清除完毕";
            });
        });
    }];
}


-(void)layoutSubviews {
    [super layoutSubviews];
    
    UIActivityIndicatorView *activity = (UIActivityIndicatorView*)self.accessoryView;
    [activity startAnimating];
}


@end
