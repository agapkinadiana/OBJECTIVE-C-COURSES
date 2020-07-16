//
//  DemoNSString.h
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoNSString : NSObject
+ (NSString *)initWithFormat;
+ (NSString *)specifiers;
+ (NSString *)specifiersFloat;
+ (NSString *)position;
+ (NSMutableString *)createMutableString;
+ (void)boolState;
@end

NS_ASSUME_NONNULL_END
