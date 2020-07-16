//
//  DemoNSDate.h
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoNSDate : NSObject

+ (NSString *)dateString;
+ (NSString *)dateStringCustomFormat;
+ (NSDate *)dateFromString;

@end

NS_ASSUME_NONNULL_END
