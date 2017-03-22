//
//  UIBarButtonItem+XMGExtension.h
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/7.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XMGExtension)
+(instancetype)itemWithImage: (NSString*)image highImage: (NSString*)highImage action: (SEL)action target: (id)target;
@end
