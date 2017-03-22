//
//  XMGWebViewController.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/14.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGWebViewController.h"

@interface XMGWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation XMGWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

-(IBAction)reload {
    [self.webView reload];
}

-(IBAction)forward {
    [self.webView goForward];
}

-(IBAction)back {
    [self.webView goBack];

}

#pragma mark - delegate

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    self.forwardItem.enabled = [webView canGoForward];
    self.backItem.enabled = [webView canGoBack];
}


@end
