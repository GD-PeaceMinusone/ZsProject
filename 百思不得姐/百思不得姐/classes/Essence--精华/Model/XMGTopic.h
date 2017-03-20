//
//  XMGTopic.h
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMGComment;

@interface XMGTopic : NSObject
/** 用户的名字*/
@property (nonatomic,copy)NSString *name;
/** 用户的头像*/
@property (nonatomic,copy)NSString *profile_image;
/** 帖子的文字内容*/
@property (nonatomic,copy)NSString *text;
/** 帖子审核通过的时间*/
@property (nonatomic,copy)NSString *created_at;
/** 赞的数字*/
@property (nonatomic,assign)NSInteger ding;
/** 踩的数字*/
@property (nonatomic,assign)NSInteger cai;
/** 转发/分享数*/
@property (nonatomic,assign)NSInteger repost;
/** 评论数量*/
@property (nonatomic,assign)NSInteger comment;
/**最热评论**/
@property(nonatomic,strong)NSArray *top_cmt;
@end
