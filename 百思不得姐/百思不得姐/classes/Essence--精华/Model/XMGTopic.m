//
//  XMGTopic.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopic.h"
#import <MJExtension.h>
#import "XMGComment.h"

@implementation XMGTopic

static NSDateFormatter * fmt_;
static NSCalendar *calendar_;

#pragma mark - other

//在第一次使用该类的时候调用 确保对象只创建一次
+ (void)initialize
{
    if (self == [super class]) {
        
        fmt_ = [[NSDateFormatter alloc]init];
        
        //获取calendar 对象
        calendar_ = [NSCalendar calendar];
    }
}

-(NSString*)created_at {

    /*显示时间格式: @"刚刚" - @"10分钟前" - @"5小时前" - @"昨天 09:10:05" - @"11-20 09:10:05"
     @"2015-11-20 09:10:05"
     */
    
    // 发帖时间
    fmt_.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    
    NSDate *creatAtDate = [fmt_ dateFromString:_created_at];
    
    if (creatAtDate.isThisYear) {// 今年
        
        if (creatAtDate.isToday) {//今天
            
            //此刻的时间
            NSDate *currentDate = [NSDate date];
            
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            
            NSDateComponents *cmp = [calendar_ components:unit fromDate:creatAtDate toDate:currentDate options:0];
            
            if (cmp.hour >= 1) {
                
                return [NSString stringWithFormat:@"%zd小时前",cmp.hour];
            }else if(cmp.minute >= 1) {
            
                return [NSString stringWithFormat:@"%zd分钟前",cmp.minute];
            }else {
            
                return @"刚刚";
            }
            
            
        }else if(creatAtDate.isYesterday) {//昨天
        
            fmt_.dateFormat = @"昨天 HH:mm";
            return [fmt_ stringFromDate:creatAtDate];
            
        }else {//其他
        
            fmt_.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt_ stringFromDate:creatAtDate];
        }
        
        
    }else {//非今年
        
        return _created_at;
    }
    
    return _created_at;
    
}

- (CGFloat)cellHeight
{
    // 如果cell的高度已经计算过, 就直接返回
    if (_cellHeight) return _cellHeight;
    
    // 1.头像
    _cellHeight = 55;
    
    // 2.文字
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * XMGMargin;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    // CGSize textSize = [self.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:textMaxSize];
    CGSize textSize = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + XMGMargin;
    
    // 3.中间的内容
    if (self.type != XMGTopicTypeWord) { // 如果是图片\声音\视频帖子, 才需要计算中间内容的高度
        // 中间内容的高度 == 中间内容的宽度 * 图片的真实高度 / 图片的真实宽度
        CGFloat contentH = textMaxW * self.height / self.width;
        self.contentF = CGRectMake(XMGMargin, _cellHeight, textMaxW, contentH);
        
        _cellHeight += contentH + XMGMargin;
    }
    
    // 4.最热评论
    if (self.top_cmt) { // 如果有最热评论
        // 最热评论-标题
        _cellHeight += 20;
        // 最热评论-内容
        NSString *topCmtContent = [NSString stringWithFormat:@"%@ : %@", self.top_cmt.user.username, self.top_cmt.content];
        // CGSize topCmtContentSize = [topCmtContent sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:textMaxSize];
        CGSize topCmtContentSize = [topCmtContent boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
        _cellHeight += topCmtContentSize.height + XMGMargin;
    }
    
    // 5.底部 - 工具条
    _cellHeight += 35 + XMGMargin;
    
    return _cellHeight;
}

@end
