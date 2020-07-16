//
//  Person.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 2/29/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, copy) NSString *passport;

@end

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        NSLog(@"_init: %@", self);
        self.name = name;
    }
    return self;
}

- (void)run {
    SEL noParameterSelector = NSSelectorFromString(@"standUp");
    //SEL noParameterSelector = @selector(standUp);
    [self performSelector:noParameterSelector];
    NSLog(@"Run");
}

- (void)standUp {
    NSLog(@"StandUp");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"This is famous %@", self.name];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"This is debug %@", self.name];
}

@end
