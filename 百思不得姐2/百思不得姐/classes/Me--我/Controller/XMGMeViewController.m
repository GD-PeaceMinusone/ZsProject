//
//  XMGMeViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGMeViewController.h"
#import "XMGSettingViewController.h"
#import "XMGMeCell.h"
#import "XMGMeFooterView.h"
@interface XMGMeViewController ()

@end

@implementation XMGMeViewController

-(instancetype)init {

    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupNavigation];
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
  
}

-(void)setupTableView{

    self.tableView.backgroundColor = XMGCommonBgColor;
    self.navigationItem.title = @"我的";
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = XMGMargin;
    self.tableView.contentInset =UIEdgeInsetsMake(XMGMargin-35, 0, 0, 0) ;

    self.tableView.tableFooterView =[[XMGMeFooterView alloc]init];
}

-(void)setupNavigation {
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" action:@selector(settingClick) target: self];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" action:@selector(moonClick) target: self];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
}
-(void)settingClick {
    XMGSettingViewController *vc = [[XMGSettingViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)moonClick {

}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"me";
    XMGMeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XMGMeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }
    else {
    
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    return cell;
}

#pragma mark - delegate

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (indexPath.section == 2) {
//        return 200;
//    }
//    return 44;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    XMGLog(@"%@", NSStringFromCGRect(cell.frame));
//}

@end
