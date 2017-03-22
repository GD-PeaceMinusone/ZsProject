//
//  XMGTopic.h
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,XMGTopicType) {
    /**全部*/
    XMGTopicTypeAll = 1,
    /** 图片 */
    XMGTopicTypePicture = 10,
    /** 段子 */
    XMGTopicTypeWord = 29,
    /** 音频 */
    XMGTopicTypeVoice = 31,
    /** 视频 */
    XMGTopicTypeVideo = 41,
};

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
/**小图*/
@property (nonatomic,copy)NSString *small_image;
/**大图*/
@property (nonatomic,copy)NSString *large_image;
/**中等图*/
@property (nonatomic,copy)NSString *middle_image;
/** 最热评论 */
@property(nonatomic,strong)XMGComment *top_cmt;
/** 帖子类型 */
@property (nonatomic,assign) NSInteger type;
/**是否为gif图片*/
@property (nonatomic,assign) BOOL is_gif;
/**音频时长*/
@property (nonatomic,assign) NSInteger voicetime;
/**视频时长*/
@property (nonatomic,assign) NSInteger videotime;
/**音频/视频播放次数*/
@property (nonatomic,assign) NSInteger playcount;
/** 帖子中间内容的真实高度 */
@property (nonatomic,assign) NSInteger height;
/** 帖子中间内容的真实宽度 */
@property (nonatomic,assign) NSInteger width;


/**** 额外增加的属性 方便开发 ****/
@property (nonatomic,assign) CGFloat cellHeight;
/**中间内容的Frame*/
@property (nonatomic,assign) CGRect contentF;
/**是否为超长图片*/
@property (nonatomic,assign) BOOL bigPicture;
@end
