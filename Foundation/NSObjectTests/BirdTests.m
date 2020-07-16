//
//  BirdTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 2/29/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Penguin.h"
#import "Bird.h"

@interface BirdTests : XCTestCase

@end

@implementation BirdTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testIsMembervsIsKind {
    Penguin *penguin = [[Penguin alloc] init];
    Penguin *new = [penguin self];
    
    XCTAssertTrue([penguin isMemberOfClass:[Penguin class]]);  //true
    XCTAssertTrue([penguin isMemberOfClass:[Bird class]]);  //false
    XCTAssertTrue([penguin isKindOfClass:[Bird class]]);  //true
    XCTAssertTrue([penguin isKindOfClass:[NSObject class]]); //false
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
