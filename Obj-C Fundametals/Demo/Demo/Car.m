//
//  Car.m
//  Demo
//
//  Created by Diana Agapkina on 2/26/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "Car.h"

static int count = 0;

@interface Car ()
{
    double _horsePowers;
}

@property (nonatomic, assign) double distance;
@property (nonatomic, copy) NSString *test;

- (void)startEngine;
- (void)stopEngine;

@end

@implementation Car

//@synthesize power = _power;
@synthesize power = _horsePowers;
@dynamic test;

- (id)initWithModel:(NSString *)model andPower:(double)power
{
    self = [super init];
    if (self) {
        _model = model;
        _horsePowers = power;
        count += 1;
    }
    return self;
}

//- (double)power
//{
//    return _power;  //сгенерирована
//}
//
//- (void)setPower:(double)power
//{
//    _power = power;
//}

- (NSString *)info
{
    NSString *strInfo = [NSString  stringWithFormat:@"Model: %@; power: %lf", self.model, self.power ];
    //self.test;  //error - потому что dynamic
    return strInfo;
}

+ (void)printCount
{
    NSLog(@"Cars count = %d", count);
}

- (void)ride:(double)distance
{
    self.distance += distance;
}

- (void)toggleEngine:(BOOL)turnOn
{
    turnOn ? [self startEngine] : [self stopEngine];
}

- (void)startEngine
{
    NSLog(@"Very difficult operations to start the engine");
}

- (void)stopEngine
{
    NSLog(@"Very difficult operations to stop the engine");
}

@end
