//
//  ShoppingItem.h
//  UITableView, UITableViewController
//
//  Created by Diana Agapkina on 4/29/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL completed;

- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
