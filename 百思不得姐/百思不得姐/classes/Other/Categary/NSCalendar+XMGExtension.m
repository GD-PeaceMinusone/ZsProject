//
//  NSCalendar+XMGExtension.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/19.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "NSCalendar+XMGExtension.h"

@implementation NSCalendar (XMGExtension)
+ (instancetype)calendar {

    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else {
        
        return [NSCalendar currentCalendar];
    }
}
@end
