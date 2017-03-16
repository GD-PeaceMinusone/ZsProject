//
//  XMGessenceViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/6.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGessenceViewController.h"
#import "XMGTitleButton.h"

@interface XMGessenceViewController ()
@property(nonatomic,strong)XMGTitleButton *selectedTitleButton;
@property(nonatomic,strong)UIView *indicatorView;
@end

@implementation XMGessenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    [self setupScrollView];
    [self setupTitleView];
}

-(void)setupNavigation {
    self.view.backgroundColor = XMGCommonBgColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" action:@selector(tagClick) target:self];
}

-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
//    scrollView.backgroundColor = XMGRandomColor;
    [self.view addSubview:scrollView];
}

-(void)setupTitleView {
    //标题栏
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2 ];
    titleView.frame = CGRectMake(0, 64, self.view.xmg_width, 35);
    [self.view addSubview:titleView];
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSInteger count = titles.count;
    CGFloat buttonW = titleView.xmg_width / count;
    CGFloat buttonH = titleView.xmg_height;
    //创建按钮
    for (NSInteger i = 0; i<count; i++) {
        XMGTitleButton *button = [XMGTitleButton buttonWithType:UIButtonTypeCustom];
        //设置按钮
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
        [titleView addSubview:button];
    }
    //取出按钮
    XMGTitleButton *button = titleView.subviews.lastObject;
   //创建指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [button titleColorForState:UIControlStateSelected];
    indicatorView.xmg_height = 1;
    indicatorView.xmg_y = titleView.xmg_height - indicatorView.xmg_height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
}
#pragma mark - 监听点击

-(void)titleClick: (XMGTitleButton*)button {
    self.selectedTitleButton.selected = NO;
    button.selected = YES;
    self.selectedTitleButton = button;
    
    [UIView animateWithDuration:0.25 animations:^{
//        self.indicatorView.xmg_width =[button.currentTitle sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}].width;
        self.indicatorView.xmg_width = button.titleLabel.xmg_width;
        self.indicatorView.xmg_centerX = button.xmg_centerX;
        
    }];
}
-(void)tagClick {

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
