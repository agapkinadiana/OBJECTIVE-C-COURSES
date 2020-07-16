//
//  ViewController.m
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2019 Aliaksei Piatyha. All rights reserved.
//

#import "ViewController.h"
#import "BlockClass.h"
#import "SomeClass.h"

typedef NSString* (^StringBlockWithInt)(int);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self demo1];
    [self demo2];
//    [self demo3];
}

// MARK: - Demo #1 Test block types

- (void)demo1 {
    [self testGlobalBlock];
    [self testStackBlock];
    [self testMallocBlock];
}

- (void)testGlobalBlock {
    NSString* (^globalBlock)(int) = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num] autorelease];
    };

    NSLog(@"GlobalBlock type: %@", globalBlock);

    globalBlock(5);
}

- (void)testStackBlock {
    int multiplier = 10;

    NSString* (^stackBlock)(int) = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num * multiplier] autorelease];
    };

    NSLog(@"StackBlock type: %@", stackBlock);

    stackBlock(5);
}

- (void)testMallocBlock {
    int multiplier = 10;

    NSString* (^stackBlock)(int) = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num * multiplier] autorelease];
    };

    NSString* (^mallocBlock)(int) = [stackBlock copy];

    NSLog(@"StackBlock type: %@", stackBlock);
    NSLog(@"MallocBlock type: %@", mallocBlock);

    mallocBlock(5);

    [mallocBlock release];
}

// MARK: - Demo #2

- (void)demo2 {
    SomeClass *obj = [[SomeClass alloc] init];
    obj.someInfo = @"Info 1";

    SomeClass *obj2 = [[SomeClass alloc] init];
    obj2.someInfo = @"Info 2";

    NSString* (^myBlock)(void) = ^{
        obj.someInfo = @"Info 2";

        return [[[NSString alloc] initWithFormat:@"Obj Info = %@", obj.someInfo] autorelease];
    };

    NSLog(@"Block with object: %@", myBlock());

    [obj release];
    [obj2 release];
}

// MARK: - Retain cycle demo

- (IBAction)makeRetainCycleButtonDidTap:(UIButton *)sender {
    [self retainCycleDemo];
}

- (void)retainCycleDemo {
    BlockClass *objWithBlock = [[BlockClass alloc] init];

    NSLog(@"%@ has been created", objWithBlock);

    __block BlockClass *weakObj = objWithBlock;

    objWithBlock.block = ^{
        NSLog(@"Object with block description: %@", weakObj);
    };

    objWithBlock.block();

    [objWithBlock release];
}

@end
