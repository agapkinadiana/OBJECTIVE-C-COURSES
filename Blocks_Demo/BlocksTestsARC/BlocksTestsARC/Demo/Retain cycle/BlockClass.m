//
//  BlockClass.m
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2019 Aliaksei Piatyha. All rights reserved.
//

#import "BlockClass.h"

@implementation BlockClass

- (void)dealloc {
    NSLog(@"%@ IS DEALLOCATING", self);
}

@end
