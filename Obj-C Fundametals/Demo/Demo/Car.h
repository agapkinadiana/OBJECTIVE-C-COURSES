//
//  Car.h
//  Demo
//
//  Created by Diana Agapkina on 2/26/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Vehicle <NSObject>

- (void)ride:(double)distance;

@optional
- (void)toggleEngine:(BOOL) turnOn;

@end

@interface Car : NSObject <Vehicle>
//{
//    double _power;
//    NSString *_model;
//}

@property (nonatomic, assign) double power;
@property (nonatomic, assign) NSString *model;
@property (nonatomic, assign, readonly) double distance;

- (id)initWithModel:(NSString *)model andPower:(double)power;
- (NSString *)info;
+ (void)printCount;

@end

NS_ASSUME_NONNULL_END
