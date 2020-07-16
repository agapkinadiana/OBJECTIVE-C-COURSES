//
//  DemoNSCharacterSet.h
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoNSCharacterSet : NSObject
+ (BOOL)hasForbiddenSymbols:(NSString *)password;
+ (NSString *)trimWhiteSpaces:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
