//
//  XMGHTTPSessionManager.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/17.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGHTTPSessionManager.h"

@implementation XMGHTTPSessionManager

-(instancetype)initWithBaseURL:(NSURL *)url {

    if (self = [super initWithBaseURL:url]) {
        
        self.securityPolicy.validatesDomainName = NO;
//        self.requestSerializer = nil;
//        self.responseSerializer = nil;
    }
    return self;
}
@end
