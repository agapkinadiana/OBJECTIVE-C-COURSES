//
//  DemoNSURL.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSURL.h"
#import "UIKit/UIKit.h"

@implementation DemoNSURL

+ (void)localPath {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"txt"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
}

+ (void)usualUrl{
    NSURL *url = [NSURL URLWithString:@"https://google.com"];
    NSData *data = [NSData dataWithContentsOfURL:url];

}

+ (void)tel {
    NSURL *url = [NSURL URLWithString:@"tel://15415551234"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}
@end
