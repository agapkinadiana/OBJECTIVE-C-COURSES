//
//  CircleButton.m
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint centerPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat distance = [self distanceFromPoint :centerPoint to:point];
    
    if (distance > self.bounds.size.height / 2) {
        return false;
    }
    
    return [super pointInside: point withEvent: event];
}

- (CGFloat)distanceFromPoint:(CGPoint)startPoint to:(CGPoint)endPoint {
    CGFloat distance = sqrt(pow(endPoint.x - startPoint.x, 2) + pow(endPoint.y - startPoint.y, 2));
    
    return distance;
}

@end
