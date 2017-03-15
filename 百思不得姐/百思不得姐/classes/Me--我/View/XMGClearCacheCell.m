//
//  XMGClearCacheCell.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/15.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGClearCacheCell.h"
#import <SDImageCache.h>

@implementation XMGClearCacheCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activity startAnimating];
        self.accessoryView = activity;
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        //获取缓存大小(耗时操作放入子线程执行)
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //        unsigned long long size =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"].fileSize;
            unsigned long long size = @"/Users/jackeylove/Desktop/百思不得姐 4.5.4".fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            NSString *cacheText = nil;
//            1000*1000*1000 = pow(10,9)
            if (size > 1000*1000*1000) {
                
                cacheText = [NSString stringWithFormat:@"%.2fG",size/1000/1000/1000.0];
                
            }else if(size > 1000*1000){
                
                cacheText = [NSString stringWithFormat:@"%.2fM",size/1000/1000.0];
            
            }else if(size > 1000){
                
                cacheText = [NSString stringWithFormat:@"%.2fK",size/1000.0];
            
            }else {
                cacheText =[NSString stringWithFormat:@"%.2f",size*1.0];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存%@",cacheText];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textLabel.text = text;
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            });
        });
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}
@end
