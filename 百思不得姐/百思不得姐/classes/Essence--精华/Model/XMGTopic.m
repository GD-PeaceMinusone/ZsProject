//
//  XMGTopic.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/16.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGTopic.h"

@implementation XMGTopic

-(NSString*)created_at {

    /*显示时间格式: @"刚刚" - @"10分钟前" - @"5小时前" - @"昨天 09:10:05" - @"11-20 09:10:05"
     @"2015-11-20 09:10:05"
     */
    
    //获取calendar 对象
    NSCalendar *calendar = [NSCalendar calendar];
    
    // 发帖时间
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    
    fmt.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    
    NSDate *creatAtDate = [fmt dateFromString:_created_at];
    
    if (creatAtDate.isThisYear) {// 今年
        
        if ([calendar isDateInToday:creatAtDate]) {//今天
            
            //此刻的时间
            NSDate *currentDate = [NSDate date];
            
            NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
            
            NSDateComponents *cmp = [calendar components:unit fromDate:creatAtDate toDate:currentDate options:0];
            
            if (cmp.hour >= 1) {
                
                return [NSString stringWithFormat:@"%zd小时前",cmp.hour];
            }else if(cmp.minute >= 1) {
            
                return [NSString stringWithFormat:@"%zd分钟前",cmp.minute];
            }else {
            
                return @"刚刚";
            }
            
            
        }else if([calendar isDateInYesterday:creatAtDate]) {//昨天
        
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:creatAtDate];
            
        }else {//其他
        
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:creatAtDate];
        }
        
        
    }else {//非今年
        
        return _created_at;
    }
    
    return _created_at;
    
}

@end
