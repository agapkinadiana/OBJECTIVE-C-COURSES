//
//  DemoNSCharacterSet.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSCharacterSet.h"

@implementation DemoNSCharacterSet

+ (BOOL)hasForbiddenSymbols:(NSString *)password {
    BOOL hasForbiddenSymbols = NO;
    NSRange range = [password rangeOfCharacterFromSet:[DemoNSCharacterSet forbiddenCharacterSet]];

    if (range.location != NSNotFound) {
        hasForbiddenSymbols = YES;
        NSLog(@"This string contains illegal characters");
    }
    return hasForbiddenSymbols;
}

+ (NSMutableCharacterSet *)requiredCharacterSet {
    NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.lowercaseLetterCharacterSet];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.uppercaseLetterCharacterSet];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.decimalDigitCharacterSet];
    [characterSet addCharactersInString:@"!@#$%&"];
    return characterSet;
}

+ (NSMutableCharacterSet *)forbiddenCharacterSet {
    NSMutableCharacterSet *characterSet = [DemoNSCharacterSet requiredCharacterSet];
    [characterSet invert];
    return characterSet;
}

+ (NSString *)trimWhiteSpaces:(NSString *)password {
    NSString *newPassword = [password stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    return newPassword;
}



@end
