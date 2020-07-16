//
//  Person.m
//  Demo
//
//  Created by Diana Agapkina on 3/4/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "Person.h"
#import "Passport.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"%@ is being deallocated", self);
    [_passport release];
    [super dealloc];
}

@end
