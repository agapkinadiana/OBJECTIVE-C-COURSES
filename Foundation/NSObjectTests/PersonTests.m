//
//  NSObjectTests.m
//  NSObjectTests
//
//  Created by Yauheni Bararanouski on 2/29/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    Person *jonny1 = [[Person alloc] initWithName:@"Jonny"];
    Person *jonny2 = [[Person alloc] initWithName:@"Jonny"];

    [jonny2 run];
    
    //XCTAssertTrue([jonny1 isEqual:jonny2]);

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testKVC {
    Person *jonny1 = [[Person alloc] initWithName:@"Jonny"];

    [jonny1 setValue:@"AB123456" forKey:@"passport"];

    NSString *passport = [jonny1 valueForKey:@"passport"];
}

- (void)testKVCcrash {
    Person *jonny1 = [[Person alloc] initWithName:@"Jonny"];

    [jonny1 setValue:@"AB123456" forKey:@"pasport"];
    //crash: wrong property name
}

@end
