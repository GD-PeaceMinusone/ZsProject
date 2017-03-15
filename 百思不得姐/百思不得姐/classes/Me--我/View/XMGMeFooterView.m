//
//  XMGMeFooterView.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/12.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGMeFooterView.h"
#import <AFNetworking.h>
#import "XMGMeSquare.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "XMGMeSquareButton.h"
#import "XMGWebViewController.h"
#import <SafariServices/SafariServices.h>
#define maxColsCount 4

@interface XMGMeFooterView ()
@property(nonatomic,strong)NSMutableArray *squares;
//@property(nonatomic,strong)NSMutableDictionary<NSString*,XMGMeSquare*> *allSquare;
@end

@implementation XMGMeFooterView

//-(NSMutableDictionary<NSString *,XMGMeSquare *> *)allSquare {
//
//    if (!_allSquare) {
//        _allSquare = [NSMutableDictionary dictionary];
//    }
//    return _allSquare;
//}

-(instancetype)initWithFrame:(CGRect)frame {

    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.xmg_height = 20;
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"square";
        parameters[@"c"] = @"topic";
    
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
           self.squares = [XMGMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self creatSquare:self.squares];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
        }];
        
    }
    return self;
}


//NSMutableArray *squares = [XMGMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
//NSMutableArray *newSquares = [NSMutableArray array];
//for (NSDictionary *dict in squares) {
//    for (NSInteger i =1; i<squares.count; i++) {
//        
//        NSDictionary *oldDict = squares[i];
//        if (![dict[@"name"] isEqualToString:oldDict[@"name"]]) {
//            [newSquares addObject:dict];
////        }
////    }
////}
//
//[self creatSquare:newSquares];
-(void)creatSquare:(NSMutableArray*)squares {

    //方块个数
    NSUInteger count = squares.count;
    //方块尺寸
    CGFloat buttonW = self.xmg_width / maxColsCount;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i =0; i < count; i++) {
//        self.allSquare[square.name] = square;
        //创建按钮
        XMGMeSquareButton *button = [XMGMeSquareButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        //设置frame
        button.xmg_x = (i % maxColsCount) * buttonW;
        button.xmg_y= (i / maxColsCount) * buttonH;
        button.xmg_width = buttonW;
        button.xmg_height= buttonH;
        //设置数据
//        button.backgroundColor = XMGRandomColor;
        button.square = squares[i];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
//        [button setImage:[UIImage imageNamed:@"setup-head-default"] forState:UIControlStateNormal];
////        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:square.icon] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
////            
////            [button setImage:image forState:UIControlStateNormal];
////        }];
        
    }
    
    self.xmg_height = self.subviews.lastObject.xmg_bottom;
    UITableView *tableView =(UITableView*)self.superview;
    tableView.tableFooterView = self;
}

-(void)click:(XMGMeSquareButton *)button {
   XMGMeSquare *square= button.square;

    if ([square.url hasPrefix:@"http"]) {

         SFSafariViewController *webView = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:square.url]];
         webView.navigationItem.title = square.name;
        //XMGWebViewController *webView = [[XMGWebViewController alloc]init];
//        webView.url = square.url;
        //获取"Me"模块对应的导航控制器
        UITabBarController *tabBarVc =(UITabBarController*)[UIApplication sharedApplication].keyWindow.rootViewController;
        [tabBarVc presentViewController:webView animated:YES completion:nil];
//        UINavigationController *vc = tabBarVc.selectedViewController;
//        [vc pushViewController:webView animated:YES];
        
    }else if([square.url hasPrefix:@"mod"]) {
        if ([square.url hasSuffix:@"BDJ_To_Check"]) {
            XMGLog(@"跳转到[审帖]界面");
        }else if([square.url hasSuffix:@"BDJ_To_RecentHot" ]){
            XMGLog(@"跳转到[每日排行]界面");
        }else {
            XMGLog(@"跳转到其他界面");
        }
    
    }else {
        XMGLog(@"不是http 或mod协议");
    }
    
}









@end
