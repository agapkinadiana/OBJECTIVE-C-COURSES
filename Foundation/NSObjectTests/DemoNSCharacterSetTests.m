//
//  DemoNSCharacterSetTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DemoNSCharacterSet.h"

@interface DemoNSCharacterSetTests : XCTestCase

@end

@implementation DemoNSCharacterSetTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testTrimWhiteSpaces {
    NSString *password = @"   p@ssword    ";
    NSString *newPassword = [DemoNSCharacterSet trimWhiteSpaces:password];
    NSLog(newPassword);
}

- (void)testHasForbiddenSymbols {
    NSString *password = @"p#ssword";
    BOOL hasForbiddenSymbols = [DemoNSCharacterSet hasForbiddenSymbols:password];
    //NSString *boolState1 = [NSString stringWithFormat:@"BOOL state with text: %@", hasForbiddenSymbols ? @"true":@"false"];
    //NSLog(boolState1);
}

@end
