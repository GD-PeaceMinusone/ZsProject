//
//  XMGSettingViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/7.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGSettingViewController.h"
#import <SDImageCache.h>
@interface XMGSettingViewController ()

@end

@implementation XMGSettingViewController

-(instancetype)init {
    
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.title = @"设置";
    [self getCacheSize];
    [self getCacheSize2];
    XMGLog(@"%zd", @"/Users/jackeylove/Desktop/简书 3.3.0".fileSize);
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"自定义" style:UIBarButtonSystemItemDone target:self action:nil];
  }

-(void)getCacheSize2 {

    unsigned long long size = 0;
    
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dirPath = [caches stringByAppendingPathComponent:@"default"];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:dirPath];
    for (NSString *subPath in enumerator) {
        NSString *fullPath = [dirPath stringByAppendingPathComponent:subPath];
       size += [[manager attributesOfItemAtPath:fullPath error:nil] fileSize];
    }
}

-(void)getCacheSize {
    unsigned long long size = 0;
     //获取缓存文件夹路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dirPath = [caches stringByAppendingPathComponent:@"MP3"];
    XMGLog(@"%@", dirPath);
    //创建文件管理者
    NSFileManager *manager =[NSFileManager defaultManager];
    //获取指定文件夹下文件的总大小
    NSArray *subPaths =[manager subpathsAtPath:dirPath];
    for (NSString *subPath in subPaths) {
        NSString *fullSubPath = [dirPath stringByAppendingPathComponent:subPath];
         size += [[manager attributesOfItemAtPath:fullSubPath error:nil] fileSize];
//        size += [dict[NSFileSize] unsignedIntegerValue];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    [[SDImageCache sharedImageCache] getSize];
    cell.textLabel.text = @"清除缓存";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    XMGLog(@"%@", NSHomeDirectory());
    return cell;
}

@end
