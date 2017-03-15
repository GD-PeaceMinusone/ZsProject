//
//  NSString+XMGExtension.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/15.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "NSString+XMGExtension.h"

@implementation NSString (XMGExtension)
-(unsigned long long)fileSize {

    unsigned long long size = 0;
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDictionary *dict = [manager attributesOfItemAtPath:self error:nil];
    if ([dict.fileType isEqualToString:NSFileTypeDirectory]) {
        
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
    for (NSString *subPath in enumerator) {
        NSString *fullPath = [self stringByAppendingPathComponent:subPath];
        size += [[manager attributesOfItemAtPath:fullPath error:nil] fileSize];
    }
    }else {
        size = dict.fileSize;
    }
    
    return size;
}
@end
