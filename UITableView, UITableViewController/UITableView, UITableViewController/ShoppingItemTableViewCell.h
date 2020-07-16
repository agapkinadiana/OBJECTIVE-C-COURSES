//
//  ShoppingItemTableViewCell.h
//  UITableView, UITableViewController
//
//  Created by Diana Agapkina on 4/29/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ShoppingItem;

@interface ShoppingItemTableViewCell : UITableViewCell

- (void)configureWithShoppingItem:(ShoppingItem *)shoppingItem;

@end

NS_ASSUME_NONNULL_END
