//
//  XMGAllTableViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGAllTableViewController.h"
#import <AFNetworking.h>
#import "XMGTopic.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "XMGRefreshHeader.h"
@interface XMGAllTableViewController ()
@property(nonatomic,strong)NSMutableArray<XMGTopic*> *topics;
@property(nonatomic,strong)UILabel *label;
/**用来加载下一页数据*/
@property(nonatomic,copy)NSString *maxtime;
@end

@implementation XMGAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    [self setupRefresh];
}

-(void)setupRefresh {

    self.tableView.mj_header = [XMGRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

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
    
    NSDictionary *parameters = @{
                                        @"a":@"list",
                                        @"c":@"data"
                                        };

    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
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

    NSDictionary *parameters = @{
                                 @"a":@"list",
                                 @"c":@"data",
                                 @"maxtime":self.maxtime
                                 };
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
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
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    XMGTopic *topic = self.topics[indexPath.row];
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
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
