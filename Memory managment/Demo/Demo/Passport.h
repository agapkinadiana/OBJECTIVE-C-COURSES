//
//  Passport.h
//  Demo
//
//  Created by Diana Agapkina on 3/4/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Person;

@interface Passport : NSObject

@property (nonatomic, retain) Person *person;

@end

NS_ASSUME_NONNULL_END
