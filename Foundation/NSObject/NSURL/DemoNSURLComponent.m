//
//  DemoNSURLComponent.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSURLComponent.h"

@implementation DemoNSURLComponent

+(void)components{

    NSURLComponents *components = [[NSURLComponents alloc] init];
    components.scheme = @"http";
    components.host = @"www.api.twitter.com";
    components.path = @"/1.1/statuses/user_timeline.json";
    components.query = @"screen_name=joemasilotti&include_rts=true";
    //components.user
    //components.password
    //components.queryItems = [DemoNSURLComponent queryItems];

    NSURL *url = components.URL;

}


+ (NSArray <NSURLQueryItem *> *)queryItems {
    NSURLQueryItem *screenNameItem = [NSURLQueryItem queryItemWithName:@"screen_name" value:@"joemasilotti"];
    NSURLQueryItem *includeRTsItem = [NSURLQueryItem queryItemWithName:@"include_rts" value:@"true"];
    return @[screenNameItem, includeRTsItem];
}
@end
