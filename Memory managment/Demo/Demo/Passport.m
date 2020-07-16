//
//  Passport.m
//  Demo
//
//  Created by Diana Agapkina on 3/4/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "Passport.h"
#include "Person.h"

@implementation Passport

- (void)dealloc
{
    NSLog(@"%@ is being deallocated", self);
    [_person release];
    [super dealloc];
}

@end
