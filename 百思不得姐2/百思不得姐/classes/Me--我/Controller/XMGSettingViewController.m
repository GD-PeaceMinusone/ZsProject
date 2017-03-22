//
//  XMGSettingViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/7.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGSettingViewController.h"
#import <SDImageCache.h>
#import "XMGClearCacheCell.h"
#import "XMGSettingCell.h"
#import "XMGPravicyCell.h"
@interface XMGSettingViewController ()

@end

static NSString * const XMGClearCacheCellID = @"clear_cache";
static NSString * const XMGSettingCellID = @"setting";
static NSString * const XMGPravicyCellID = @"privacy";

@implementation XMGSettingViewController

-(instancetype)init {
    
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.title = @"设置";
    //注册ID为const 常量的cell
    [self.tableView registerClass:[XMGClearCacheCell class] forCellReuseIdentifier:XMGClearCacheCellID];
    //注册其他类型的cell
    [self.tableView registerClass:[XMGSettingCell class] forCellReuseIdentifier:XMGSettingCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGPravicyCell class]) bundle:nil] forCellReuseIdentifier:XMGPravicyCellID];
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
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 5;
    }else {
    
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if(indexPath.section == 0){
    if (indexPath.row == 0) {
        
        return [tableView dequeueReusableCellWithIdentifier:XMGClearCacheCellID];
        
    }else {
    
        XMGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:XMGSettingCellID];
        if (indexPath.row == 1) {
            cell.textLabel.text = @"检查更新";
            
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"给我们评分";
        
        }else if(indexPath.row == 3){
            cell.textLabel.text = @"推送设置";
        
        }else{
            cell.textLabel.text = @"关于我们";
        }
        return cell;
    }
    }else {
    
        return [tableView dequeueReusableCellWithIdentifier:XMGPravicyCellID];
    }
    
}

@end
