//
//  ConfigurationViewController.h
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSUInteger, ButtonType) {
    ButtonTypeCheckMark = 0,
    ButtonTypeHeart = 1,
    ButtonTypeWork = 2,
    ButtonTypeHome = 3
};

NS_ASSUME_NONNULL_BEGIN

@interface ConfigurationViewController : UIViewController

@property(nonatomic, copy) void(^buttonHandler)(ButtonType);

@end

NS_ASSUME_NONNULL_END
