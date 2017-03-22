//
//  NSDate+XMGExtension.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/19.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "NSDate+XMGExtension.h"

@implementation NSDate (XMGExtension)
- (BOOL)isThisYear {

    NSCalendar *calendar = [NSCalendar calendar];
    
    NSInteger creatYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger currentYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return creatYear == currentYear;
}

-(BOOL)isToday {

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *createdString = [fmt stringFromDate:self];
    NSString *currentString = [fmt stringFromDate:[NSDate date]];
    
    return [createdString isEqualToString:currentString];
    
}

- (BOOL)isYesterday {

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *createdString = [fmt stringFromDate:self];
    NSString *currentString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *createdDate = [fmt dateFromString:createdString];
    NSDate *currentDate = [fmt dateFromString:currentString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    /**
     NSCalendarUnitYear               = kCFCalendarUnitYear,
     NSCalendarUnitMonth              = kCFCalendarUnitMonth,
     NSCalendarUnitDay                = kCFCalendarUnitDay,
     **/
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar components:unit fromDate:createdDate toDate:currentDate options:0];
    
    return cmp.year == 0 && cmp.month && cmp.day == 1;
}

-(BOOL)isTomorrow {

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *createdString = [fmt stringFromDate:self];
    NSString *currentString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *createdDate = [fmt dateFromString:createdString];
    NSDate *currentDate = [fmt dateFromString:currentString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    /**
     NSCalendarUnitYear               = kCFCalendarUnitYear,
     NSCalendarUnitMonth              = kCFCalendarUnitMonth,
     NSCalendarUnitDay                = kCFCalendarUnitDay,
     **/
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar components:unit fromDate:createdDate toDate:currentDate options:0];
    
    return cmp.year == 0 && cmp.month && cmp.day == -1;
    
}


@end
