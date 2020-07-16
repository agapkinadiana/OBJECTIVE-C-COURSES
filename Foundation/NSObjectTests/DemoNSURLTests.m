//
//  DemoNSURLTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DemoNSURL.h"

@interface DemoNSURLTests : XCTestCase

@end

@implementation DemoNSURLTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLocalPath {
    [DemoNSURL localPath];
}

- (void)testuUsualUrl {
    [DemoNSURL usualUrl];
}



@end
