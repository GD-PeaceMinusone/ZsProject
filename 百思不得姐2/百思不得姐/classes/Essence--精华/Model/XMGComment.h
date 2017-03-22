//
//  XMGComment.h
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/19.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMGUser.h"

@interface XMGComment : NSObject
/**热评内容*/
@property(nonatomic,copy)NSString *content;
/**用户(发表评论的人)*/
@property(nonatomic,strong)XMGUser *user;
@end
