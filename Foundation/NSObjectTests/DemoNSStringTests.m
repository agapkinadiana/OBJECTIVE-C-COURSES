//
//  DemoNSStringTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DemoNSString.h"

@interface DemoNSStringTests : XCTestCase

@end

@implementation DemoNSStringTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    DemoNSString *demo = [DemoNSString new];
    NSLog([DemoNSString initWithFormat]);
    NSLog([DemoNSString specifiers]);
    NSLog([DemoNSString specifiersFloat]);
    NSLog([DemoNSString position]);
    //NSLog([DemoNSString description]);
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testMutable {
    [DemoNSString createMutableString];
}

- (void)testBool {
    [DemoNSString boolState];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
