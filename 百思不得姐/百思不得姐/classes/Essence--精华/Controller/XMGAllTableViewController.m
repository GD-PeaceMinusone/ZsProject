//
//  XMGAllTableViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGAllTableViewController.h"
#import "XMGHTTPSessionManager.h"
#import "XMGTopic.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "XMGRefreshHeader.h"
#import "XMGRefreshFooter.h"
#import "XMGTopicCell.h"

@interface XMGAllTableViewController ()
@property(nonatomic,strong)NSMutableArray<XMGTopic*> *topics;
@property(nonatomic,strong)UILabel *label;
/**用来加载下一页数据*/
@property(nonatomic,copy)NSString *maxtime;
/**task 管理者**/
@property(nonatomic,strong)XMGHTTPSessionManager *manager;
@end

@implementation XMGAllTableViewController

static NSString * const XMGTopicCellID = @"topic";
#pragma mark - 初始化

- (XMGHTTPSessionManager *)manager {

    if (!_manager) {
        _manager = [XMGHTTPSessionManager manager];
    }
    return _manager;
}

#pragma mark - lazyloading

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupTableView];
    
    [self setupRefresh];
}

-(void)setupTableView {

    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = XMGCommonBgColor;
    self.tableView.rowHeight = 200;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTopicCell class]) bundle:nil] forCellReuseIdentifier:XMGTopicCellID];
    
}

-(void)setupRefresh {

    self.tableView.mj_header = [XMGRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XMGRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

}

//-(void)setupRefresh {
//
//    UIView *headerView = [[UIView alloc]init];
//    headerView.xmg_y = -50;
//    headerView.xmg_width = self.tableView.xmg_width;
//    headerView.xmg_height = 50;
//    headerView.backgroundColor = XMGRandomColor;
//    [self.tableView addSubview:headerView];
//    
//    UILabel *label = [[UILabel alloc]init];
//    self.label = label;
//    label.text = @"下拉立即刷新";
//    [label sizeToFit];
//    label.center = CGPointMake(headerView.xmg_width / 2, headerView.xmg_height / 2);
//    [headerView addSubview:label];
//    
//}

#pragma mark - 数据加载
-(void)loadNewTopics {
    //取消所有任务
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSDictionary *parameters = @{
                                        @"a":@"list",
                                        @"c":@"data"
                                        };

    [self.manager GET:XMGCommanURL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
        self.maxtime = responseObject[@"info"][@"maxtime"];
        //字典数组 -> 模型数组
        self.topics = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //刷新表格
        [self.tableView reloadData];
        
        //结束刷新
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self.tableView.mj_header endRefreshing];

    }];
}

-(void)loadMoreTopics {
    //取消所有任务
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];

    NSDictionary *parameters = @{
                                 @"a":@"list",
                                 @"c":@"data",
                                 @"maxtime":self.maxtime
                                 };
    
    [self.manager GET:XMGCommanURL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
        XMGWriteToPlist(responseObject, @"moreTopics");
        //存储这一页的maxtime 保证数据的时效性
        self.maxtime = responseObject[@"info"][@"maxtime"];
        //字典数组 -> 模型数组
        NSArray<XMGTopic*> *topics = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:topics];
        //刷新表格
        [self.tableView reloadData];
        //结束刷新
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self.tableView.mj_footer endRefreshing];
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGTopicCell *cell =[tableView dequeueReusableCellWithIdentifier:XMGTopicCellID];
    cell.topic = self.topics[indexPath.row];
    return cell;
}

//#pragma mark - UIScrollView Methods
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if(scrollView.contentInset.top == 149.0) return;
//    
//    if (scrollView.contentOffset.y <= -149.0) {
//        self.label.text = @"松开立即刷新";
//    }else {
//    
//        self.label.text = @"下拉可以刷新";
//    }
//}
//
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//
//    if (scrollView.contentOffset.y <= -149.0) {
//        self.label.text = @"正在刷新";
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            UIEdgeInsets contentInset = scrollView.contentInset;
//            contentInset.top = 149;
//            scrollView.contentInset = contentInset;
//        }];
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            [UIView animateWithDuration:0.5 animations:^{
//                
//                UIEdgeInsets contentInset = scrollView.contentInset;
//                contentInset.top = 99;
//                scrollView.contentInset = contentInset;
//            }];
//            
//        });
////      }
//}

@end
