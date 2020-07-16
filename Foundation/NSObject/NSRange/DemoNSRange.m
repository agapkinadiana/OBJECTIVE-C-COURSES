//
//  DemoNSRange.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSRange.h"

@implementation DemoNSRange

+ (void)rangeOfString {
//    NSString *string = @"Let me speak from my heart";
//    NSRange range = [string rangeOfString:@"heart"];
//
//    NSLog(@"%@", [NSString stringWithFormat:@"range.location = %@, range.length = %@", range.location, range.length]);
}


+ (void)substring {
    NSString *string = @"Let me speak from my heart";
    NSRange range = NSMakeRange(0, 3);

    NSString *substring = [string substringWithRange:range];
    NSLog(substring);
}

+ (void)rangeOfStringNotFound {
    NSString *string = @"Let me speak from my heart";
    NSString *substring = @"head";
    NSRange range = [string rangeOfString:substring];

    if (range.location == NSNotFound) {
        NSLog(@"Can't fount string");
    }
}

+ (void)badRange {
    NSString *string = @"Let";
    NSRange range = NSMakeRange(0, 6);

    NSString *substring = [string substringWithRange:range];
    //Be carefull with range

}


@end
