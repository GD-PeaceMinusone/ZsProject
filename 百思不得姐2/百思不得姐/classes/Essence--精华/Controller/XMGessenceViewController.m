//
//  XMGessenceViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGessenceViewController.h"
#import "XMGTitleButton.h"
#import "XMGAllTableViewController.h"
#import "XMGVideoTableViewController.h"
#import "XMGVoiceTableViewController.h"
#import "XMGPictureTableViewController.h"
#import "XMGWordTableViewController.h"

@interface XMGessenceViewController () <UIScrollViewDelegate>
@property(nonatomic,strong)XMGTitleButton *selectedTitleButton;
@property(nonatomic,strong)UIView *indicatorView;
@property(nonatomic,weak)UIScrollView *scrollView;
@property(nonatomic,weak)UIView *titleView;
@end

@implementation XMGessenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    [self setupChildViewControllers];
    [self setupScrollView];
    [self setupTitleView];
    
    //第一次来到界面便显示"全部"标签内容
    [self addChildVc];
}

-(void)setupChildViewControllers {

    XMGAllTableViewController *all = [[XMGAllTableViewController alloc]init];
    [self addChildViewController:all];
    
    XMGVideoTableViewController *video = [[XMGVideoTableViewController alloc]init];
    [self addChildViewController:video];
    
    XMGVoiceTableViewController *voice = [[XMGVoiceTableViewController alloc]init];
    [self addChildViewController:voice];
    
    XMGPictureTableViewController *picture = [[XMGPictureTableViewController alloc]init];
    [self addChildViewController:picture];
    
    XMGWordTableViewController *word = [[XMGWordTableViewController alloc]init];
    [self addChildViewController:word];
}

-(void)setupNavigation {
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" action:@selector(tagClick) target:self];
}

-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.automaticallyAdjustsScrollViewInsets =NO;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.xmg_width, 0);
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
//    NSInteger count = self.childViewControllers.count;
//    for (NSInteger i =0; i<count; i++) {
//        UITableView *view = (UITableView*)self.childViewControllers[i].view;
//        view.xmg_x = i * view.xmg_width;
//        //view 的y默认为20 将其赋值为0
//        view.xmg_y = 0;
//        view.xmg_height = scrollView.xmg_height;
//        view.backgroundColor = XMGRandomColor;
//        [scrollView addSubview:view];
//        
//        //设置tableView 的内边距
//        view.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        view.scrollIndicatorInsets = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//    }
    
}

-(void)setupTitleView {
    //标题栏
    UIView *titleView = [[UIView alloc]init];
    self.titleView = titleView;
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    titleView.frame = CGRectMake(0, 64, self.view.xmg_width, 35);
    [self.view addSubview:titleView];
    
    NSArray *titles = @[@"全部",@"视频",@"音乐",@"图片",@"段子"];
    NSInteger count = titles.count;
    CGFloat buttonW = titleView.xmg_width / count;
    CGFloat buttonH = titleView.xmg_height;
    //创建按钮
    for (NSInteger i = 0; i<count; i++) {
        XMGTitleButton *button = [XMGTitleButton buttonWithType:UIButtonTypeCustom];
        //设置按钮
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        button.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
        [titleView addSubview:button];
    }
    //取出按钮
    XMGTitleButton *button = titleView.subviews.firstObject;
   //创建指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [button titleColorForState:UIControlStateSelected];
    indicatorView.xmg_height = 1;
    indicatorView.xmg_y = titleView.xmg_height - indicatorView.xmg_height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    //让titleLabel的宽度提前计算好 防止indicator加载失败
    [button.titleLabel sizeToFit];
    self.indicatorView.xmg_width = button.titleLabel.xmg_width;
    self.indicatorView.xmg_centerX = button.xmg_centerX;
    
    //默认选中第一个按钮
    button.selected = YES;
    self.selectedTitleButton = button;
}
#pragma mark - 监听点击

-(void)titleClick: (XMGTitleButton*)button {
    self.selectedTitleButton.selected = NO;
    button.selected = YES;
    self.selectedTitleButton = button;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indicatorView.xmg_width = button.titleLabel.xmg_width;
        self.indicatorView.xmg_centerX = button.xmg_centerX;
        
    }];
    
    //点击时让scrollView 滚动到相应位置
    /*最好先拿出scrollView 的contentOffset*/
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.xmg_width;
    [self.scrollView setContentOffset:offset animated:YES];
}
-(void)tagClick {

    
}

#pragma mark - 添加子控制器
-(void)addChildVc {
    NSInteger index =self.scrollView.contentOffset.x / self.scrollView.xmg_width;
    UIViewController *childVc = self.childViewControllers[index];
    if(childVc.view.superview) return;
    /**
     *  子控制器的frame 和父控制器尺寸间的不同表达形式
     */
//    childVc.view.xmg_x = index * self.scrollView.xmg_width;
//    childVc.view.xmg_y = 0;
//    childVc.view.xmg_width = self.scrollView.xmg_width;
//    childVc.view.xmg_height = self.scrollView.xmg_height;
    
//    childVc.view.xmg_x = self.scrollView.contentOffset.x;
//    childVc.view.xmg_y = self.scrollView.contentOffset.y;
    
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
    
}

#pragma mark - <UIScrollViewDelegate>

/**
 * 调用setContenInset 方法时
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    [self addChildVc];
}

/**
 *  人为拖动scrollView
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //选中点击对应的按钮
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.xmg_width;
    XMGTitleButton *button = self.titleView.subviews[index];
    [self titleClick:button];
    
    //添加子控制器
    [self addChildVc];
}
@end
