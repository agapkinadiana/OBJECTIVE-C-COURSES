//
//  DemoNSNumber.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSNumber.h"

typedef NS_ENUM(NSInteger, Screen) {
    Welcome = 0,
    Main,
    Settings
};

@implementation DemoNSNumber

+ (void)number {
    NSNumber *number = [[NSNumber alloc] initWithInt:2];
    NSArray *numbers = @[@(1), @(3), @(2)];

    NSArray *screens = @[@(Welcome), @(Main), @(Settings)];

}

+ (void)numberStringValue {
    float x = 10.7434;
    NSNumber *number = [[NSNumber alloc] initWithFloat:x];
    NSString *string = number.stringValue;
    NSInteger intValue = number.intValue;
}

@end
