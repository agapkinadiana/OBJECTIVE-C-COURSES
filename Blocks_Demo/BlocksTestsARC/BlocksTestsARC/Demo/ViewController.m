//
//  ViewController.m
//  BlocksTestsARC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2019 Aliaksei Piatyha. All rights reserved.
//

#import "ViewController.h"
#import "BlockClass.h"
#import "SomeClass.h"

typedef void(^VoidBlock)(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self demo1];
    [self demo2];
    [self demo3];
}

// MARK: - Demo #1 Test block types

- (void)demo1 {
    [self testGlobalBlock];
    [self testStackBlock];
    [self testMallocBlock];
}

- (void)testGlobalBlock {
    NSString* (^globalBlock)(int) = ^(int num) {
        return [[NSString alloc] initWithFormat:@"%d", num];
    };

    NSLog(@"GlobalBlock type: %@", globalBlock);

    globalBlock(5);
}

- (void)testStackBlock {
    int multiplier = 10;

    NSString* (^stackBlock)(int) = ^(int num) {
        return [[NSString alloc] initWithFormat:@"%d", num * multiplier];
    };

    NSLog(@"StackBlock type: %@", stackBlock);
    //malloc тк неявно вызвался copy (ARC)
    stackBlock(5);
}

- (void)testMallocBlock {
    int multiplier = 10;

    NSString* (^stackBlock)(int) = ^(int num) {
        return [[NSString alloc] initWithFormat:@"%d", num * multiplier];
    };

    NSString* (^mallocBlock)(int) = [stackBlock copy];

    NSLog(@"StackBlock type: %@", stackBlock);
    NSLog(@"MallocBlock type: %@", mallocBlock);

    mallocBlock(5);
}

// MARK: - Demo #2

- (void)demo2 {
    SomeClass *obj = [[SomeClass alloc] init];
    obj.someInfo = @"Info 1";

    SomeClass *obj2 = [[SomeClass alloc] init];
    obj2.someInfo = @"Info 2";

    NSString* (^myBlock)(void) = ^{
        obj.someInfo = @"Info 2";

        return [[NSString alloc] initWithFormat:@"Obj Info = %@", obj.someInfo];
    };

    NSLog(@"Block with object: %@", myBlock());
}

// MARK: - Demo #3

- (void)demo3 {
    [self doSomeWorkWithNum:@10 withCompletion:^(bool success) {
        if (success) {
            NSLog(@"Operation has been completed :)");
        } else {
            NSLog(@"Operation has been failed");
        }
    }];
}

- (void)doSomeWorkWithNum: (NSNumber *) num withCompletion: (void (^)(bool success)) completion {
    // Do some hard work

    if (num.intValue == 10) {
        completion(true);
    } else {
        completion(false);
    }
}

// MARK: - Retain cycle demo

- (IBAction)makeRetainCycleButtonDidTap:(UIButton *)sender {
    [self retainCycleDemo];
}

- (void)retainCycleDemo {
    BlockClass *objWithBlock = [[BlockClass alloc] init];

    __weak BlockClass *weakObj = objWithBlock;

    objWithBlock.block = ^{
        NSLog(@"Object with block description: %@", weakObj);
    };

    objWithBlock.block();
}

@end
