//
//  IconView.h
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM(NSInteger, IconViewType) {
    IconViewTypeCheckMark = 0,
    IconViewTypeHeart = 1,
    IconViewTypeHome = 2,
    IconViewTypeWork = 3
};

@interface IconView : UIView

@property (nonatomic, assign) IconViewType type;

@end

NS_ASSUME_NONNULL_END
