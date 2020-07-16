//
//  ShoppingItem.m
//  UITableView, UITableViewController
//
//  Created by Diana Agapkina on 4/29/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ShoppingItem.h"

@implementation ShoppingItem

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
        _completed = NO;
    }
    return self;
}

@end
