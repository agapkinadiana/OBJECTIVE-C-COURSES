//
//  ViewController.m
//  Demo
//
//  Created by Diana Agapkina on 3/4/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Passport.h"

@interface MyOwnObject : NSObject

@end

@implementation MyOwnObject

- (void)dealloc
{
    NSLog(@"%@ is being deallocated", self);
    [super dealloc];
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testMRCWithAllocInit];
//    [self testMRCWithRetain];
    [self testRetainCycle];
}

- (void)testMRCWithAllocInit {
    MyOwnObject *moObj = [[MyOwnObject alloc] init];
    NSLog(@"Retain count after alloc-init: 1");
    
    [moObj retain];
    NSLog(@"Retain count after retain: 2");
    
    [moObj release];
    NSLog(@"Retain count after release: 1");
    
    [moObj release];
    NSLog(@"Retain count after release: 0");
}

- (void)testMRCWithRetain {
    MyOwnObject *moObj = [[MyOwnObject alloc] init];
    NSLog(@"Retain count after alloc-init: 1");
    
    [self performSomeWorkWithObject:moObj];
    
    [moObj release];
    NSLog(@"Retain count after release: 0");
}

- (void)performSomeWorkWithObject:(MyOwnObject *)ownObject {
    [ownObject retain];
    NSLog(@"Retain count after retain: 2");
    
    // some work
    
    [ownObject release];
    NSLog(@"Retain count after release: 1");
}

- (void)testRetainCycle {
    Person *person = [[Person alloc] init];
    NSLog(@"%@ has been created", person);

    Passport *passport = [[Passport alloc] init];
    NSLog(@"%@ has been created", passport);

    person.passport = passport;
    
    NSMutableString *name = [[NSMutableString alloc] initWithString:@"Diana"];
    person.name = name;
    
    [name appendString: @"Di"];
    
    NSLog(@"Name: %@", person.name);  //осталось Diana, т.к атрибут copy; если был бы retain - DianaDi
    
    passport.person = person;

    [person release];
    [passport release];
}


@end
