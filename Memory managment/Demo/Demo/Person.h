//
//  Person.h
//  Demo
//
//  Created by Diana Agapkina on 3/4/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Passport;

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) Passport *passport; //assign чтобы починить retain cycle
//в ARC поменять strong на weak или unsafe_unretained

@end

NS_ASSUME_NONNULL_END
