//
//  UITextField+XMGExtension.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/11.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "UITextField+XMGExtension.h"
static NSString *const XMGPlaceholderColorKey = @"placeholderLabel.textColor";
@implementation UITextField (XMGExtension)

-(void)setPlaceholderColor:(UIColor *)placeholderColor {

    self.placeholder = @"";
    [self setValue:placeholderColor forKeyPath:XMGPlaceholderColorKey];
}

-(UIColor *)placeholderColor {

   return [self valueForKey:XMGPlaceholderColorKey];
}
@end
