//
//  main.m
//  Demo
//
//  Created by Diana Agapkina on 2/26/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Car+SoundSystem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *car1 = [[Car alloc] initWithModel:@"BMW" andPower:333];
        NSString *car1Info = [car1 info];
        NSLog(@"Info about car1: %@", car1Info);
        
        if ([Car conformsToProtocol:@protocol(Vehicle)]) {
            [car1 ride:100];
            
            if ([car1 respondsToSelector:@selector(toggleEngine:)]) {
                [car1 toggleEngine:YES];
                [car1 toggleEngine:NO];
            }
        }
        
        [car1 playAudio];
        
        NSLog(@"Distance: %lf", car1.distance);
        
//        Car *car2 = [[Car alloc] initWithModel:@"Audi" andPower:249];
//        NSString *car2Info = [car2 info];
//        NSLog(@"Info about car2: %@", car2Info);
//
//        [Car printCount];
    }
    return 0;
}
