//
//  RSView.m
//  UIView
//
//  Created by Diana Agapkina on 3/20/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "RSView.h"

@implementation RSView

- (instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

@end
