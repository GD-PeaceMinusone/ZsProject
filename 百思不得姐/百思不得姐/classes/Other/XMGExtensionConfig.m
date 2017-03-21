//
//  XMGExtensionConfig.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/20.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGExtensionConfig.h"
#import <MJExtension.h>
#import "XMGTopic.h"
#import "XMGComment.h"

@implementation XMGExtensionConfig

/**在新建类中对字典转模型进行配置*/

+(void)load {

    [XMGTopic mj_setupObjectClassInArray:^NSDictionary *{
        
        return @{
                 @"top_cmt" : [XMGComment class]
                 };
    }];
    
    [XMGTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 @"top_cmt":@"top_cmt[0]",
                 @"small_image":@"image0",
                 @"midlle_image2":@"image2",
                 @"large_image":@"image1"
                 };
    }];
}
@end
