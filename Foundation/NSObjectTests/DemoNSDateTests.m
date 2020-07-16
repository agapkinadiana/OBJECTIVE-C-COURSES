//
//  DemoNSDateTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DemoNSDate.h"

@interface DemoNSDateTests : XCTestCase

@end

@implementation DemoNSDateTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDateString {
    NSString *date = [DemoNSDate dateString];
    NSLog(date);
}

- (void)testDateStringCustomFormat {
    NSString *date = [DemoNSDate dateStringCustomFormat];
    NSLog(date);
}

- (void)testDateFromString {
    NSString *date = [DemoNSDate dateFromString];
    //NSLog(date);
}

@end
