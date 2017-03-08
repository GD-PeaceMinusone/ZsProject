//
//  XMGTabBarController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/4.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGTabBar.h"
#import "XMGessenceViewController.h"
#import "XMGMeViewController.h"
#import "XMGFollowViewController.h"
#import "XMGNewViewController.h"
#import "XMGNavigationController.h"

@interface XMGTabBarController ()
//@property(nonatomic,strong)UIButton *publishButton;
@end

@implementation XMGTabBarController
//#pragma mark 懒加载
//- (UIButton *)publishButton {
//
////    if (!_publishButton) {
////        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
////        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"]forState:UIControlStateNormal];
////        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
////        // [publishButton sizeToFit];
////        _publishButton.backgroundColor = XMGRandomColor;
////        _publishButton.frame = CGRectMake(0, 0, self.tabBar.frame.size.width/5, self.tabBar.frame.size.height);
////        _publishButton.center = CGPointMake(self.tabBar.frame.size.width*0.5, self.tabBar.frame.size.height*0.5);
////        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _publishButton;
//}

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupItemTitleTextAttributes];
    /**添加子控制器**/
    [self setupChildViewControllers];
    /**更换默认tabBar**/
    [self setValue:[[XMGTabBar alloc]init] forKey:@"tabBar"];
    
}

-(void)setupItemTitleTextAttributes {

    UITabBarItem *item = [UITabBarItem appearance];
    //普通
    NSMutableDictionary *normalDict = [NSMutableDictionary dictionary];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    
    //选中
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
}

-(void)setupChildViewControllers {
    	
     [self setupChildViewController:[[XMGNavigationController alloc]initWithRootViewController:[[XMGFollowViewController alloc]init]]title:@"关注" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"];

    [self setupChildViewController:[[XMGNavigationController alloc]initWithRootViewController:[[XMGessenceViewController alloc]init]] title:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[XMGNavigationController alloc]initWithRootViewController:[[XMGNewViewController alloc]init]] title:@"新帖" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
    
    //    [self setupChildViewController:[[UIViewController alloc]init] title:nil imageName:nil selectedImageName:nil];
    
    [self setupChildViewController:[[XMGNavigationController alloc]initWithRootViewController:[[XMGMeViewController alloc]init]] title:@"我" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
}


-(void)setupChildViewController:(UIViewController*)vc title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName {
    
    //    CGFloat red = arc4random_uniform(255)/255.0;
    //    CGFloat green = arc4random_uniform(255)/255.0;
    //    CGFloat blue = arc4random_uniform(255)/255.0;
    
    if (imageName.length) {
        vc.tabBarItem.image = [UIImage imageNamed:imageName];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    }
    vc.tabBarItem.title = title;
    [self addChildViewController:vc];
    
    
}
#pragma mark - 监听

-(void)publishClick {
    
    XMGLogFunc;
}

@end
