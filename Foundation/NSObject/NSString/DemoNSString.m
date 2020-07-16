//
//  DemoNSString.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSString.h"

@implementation DemoNSString
+ (NSString *)initWithFormat {
    return [[NSString alloc] initWithFormat:@"%@", [self class]];
}

+ (NSString *)specifiers {
    int m = -150004021;
    uint n = 150004021U;
    return [NSString stringWithFormat:@"d:%d i:%i o:%o u:%u x:%x X:%X", m, m, n, n, n, n];
    // "d:-150004021 i:-150004021 o:1074160465 u:150004021 x:8f0e135 X:8F0E135"
}

+ (NSString *)specifiersFloat {
    float m = 2342.723990091;
    return [NSString stringWithFormat:@"\n f:%f\n 2f:%.02f\n 0f:%.0f" , m, m, m];
}

+ (NSString *)position {
     return [NSString stringWithFormat:@"%2$@ %1$@", @"1st", @"2nd"];
    // "2nd 1st"
}

+ (void)boolState {
    NSUUID *ddd = [NSUUID UUID];
    BOOL myBool1 = YES;
    NSString *boolState1 = [NSString stringWithFormat:@"BOOL state with text: %@", myBool1 ? @"true":@"false"];

    NSLog(boolState1);//logs "true"

    BOOL myBool2 = YES;
    NSString *boolState2 = [NSString stringWithFormat:@"BOOL state with binary: %i", myBool2];

    NSLog(boolState2);//logs "1" (binary)
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n>>>>>>>>\n %@ \n>>>>>>>>\n", [self class]];
}

+ (NSMutableString *)createMutableString {
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"RSSchool"];
    [str appendString:@" iOS course"];
    return str;
}


@end
