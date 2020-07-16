//
//  Person.h
//  NSObject
//
//  Created by Yauheni Bararanouski on 2/29/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;

-(instancetype)initWithName:(NSString *) name;
-(void)run;
//-(void)standUp;
@end

NS_ASSUME_NONNULL_END
