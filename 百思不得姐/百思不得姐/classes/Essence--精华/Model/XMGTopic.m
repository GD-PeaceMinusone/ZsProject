//
//  XMGTopic.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopic.h"

@implementation XMGTopic

static NSDateFormatter * fmt_;
static NSCalendar *calendar_;

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

@end
