//
//  DemoNSNumberTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DemoNSNumber.h"

@interface DemoNSNumberTests : XCTestCase

@end

@implementation DemoNSNumberTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testNumbers {
    [DemoNSNumber number];
}

- (void)testNumberStringValue {
    [DemoNSNumber numberStringValue];
}

@end
