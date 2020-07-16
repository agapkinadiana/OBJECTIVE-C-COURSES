//
//  IconView.m
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "IconView.h"

@implementation IconView

- (void)setType:(IconViewType)type {
    _type = type;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {  
    switch (self.type) {
        case IconViewTypeCheckMark:
            [self drawCheckMark:rect];
            break;
        case IconViewTypeHeart:
            [self drawHeart:rect];
            break;
        case IconViewTypeHome:
            [self drawHome:rect];
            break;
        case IconViewTypeWork:
            [self drawWork:rect];
            break;
    }
}

- (void)drawCheckMark:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 0.03 * rect.size.width);
    
    CGFloat height = rect.size.height / 2;
    
    CGContextMoveToPoint(context, rect.size.width / 2 - rect.size.width * 0.34 / 2, height);
    CGContextAddLineToPoint(context, rect.size.width / 2 - rect.size.width * 0.34 / 2 + rect.size.width * 0.12, height + rect.size.width * 0.12);
    CGContextAddLineToPoint(context, rect.size.width / 2 - rect.size.width * 0.34 / 2 + 3 * rect.size.width * 0.12, height - rect.size.width * 0.12);
    CGContextStrokePath(context);
}

- (void)drawHeart:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 0.03 * rect.size.width);
    
    CGFloat multiplier = rect.size.width / 15;
    
    CGContextMoveToPoint(context, rect.size.width / 2 + 0.1 * multiplier, rect.size.height / 2 + 3 * multiplier);
    CGContextAddCurveToPoint(context, rect.size.width / 2 - 5 * multiplier, rect.size.height / 2 - 1.5 * multiplier, rect.size.width / 2 - 2 * multiplier, rect.size.height / 2 - 4 * multiplier, rect.size.width / 2 + 0.1 * multiplier, rect.size.height / 2 - 2 * multiplier);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, rect.size.width / 2 - 0.1 * multiplier, rect.size.height / 2 + 3 * multiplier);
    CGContextAddCurveToPoint(context, rect.size.width / 2 + 5 * multiplier, rect.size.height / 2 - 1.5 * multiplier, rect.size.width / 2 + 2 * multiplier, rect.size.height / 2 - 4 * multiplier, rect.size.width / 2 - 0.1 * multiplier, rect.size.height / 2 - 2 * multiplier);
    CGContextStrokePath(context);
}

- (void)drawHome:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 0.03 * rect.size.width);
    
    CGFloat houseWidth = 0.3 * rect.size.width;
    CGFloat multiplier = houseWidth / 6;
    
    CGContextMoveToPoint(context, rect.size.width / 2 + houseWidth / 2, rect.size.height / 2);
    CGContextAddLineToPoint(context, rect.size.width / 2 + houseWidth / 2, rect.size.height / 2 + houseWidth * 0.6);
    CGContextAddLineToPoint(context, rect.size.width / 2 - houseWidth / 2, rect.size.height / 2 + houseWidth * 0.6);
    CGContextAddLineToPoint(context, rect.size.width / 2 - houseWidth / 2, rect.size.height / 2);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, rect.size.width / 2 + multiplier, rect.size.height / 2 + houseWidth * 0.6);
    CGContextAddLineToPoint(context, rect.size.width / 2 + multiplier, rect.size.height / 2);
    CGContextAddLineToPoint(context, rect.size.width / 2 - multiplier, rect.size.height / 2);
    CGContextAddLineToPoint(context, rect.size.width / 2 - multiplier, rect.size.height / 2 + houseWidth * 0.6);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, rect.size.width / 2 - houseWidth / 2 - multiplier, rect.size.height / 2 + multiplier);
    CGContextAddLineToPoint(context, rect.size.width / 2, rect.size.height / 2 - houseWidth / 2);
    CGContextAddLineToPoint(context, rect.size.width / 2 + houseWidth / 2 + multiplier, rect.size.height / 2 + multiplier);
    CGContextStrokePath(context);
}

- (void)drawWork:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 0.03 * rect.size.width);
    
    CGFloat width = 0.35 * rect.size.width;
    CGFloat height = 0.25 * rect.size.height;
    
    CGContextMoveToPoint(context, rect.size.width / 2 - width / 2, rect.size.height / 2 - height / 2 + height / 5);
    CGContextAddLineToPoint(context, rect.size.width / 2 + width / 2, rect.size.height / 2 - height / 2 + height / 5);
    CGContextAddLineToPoint(context, rect.size.width / 2 + width / 2, rect.size.height / 2 + height / 2 + height / 5);
    CGContextAddLineToPoint(context, rect.size.width / 2 - width / 2, rect.size.height / 2 + height / 2 + height / 5);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, rect.size.width / 2 - width / 2, rect.size.height / 2 - height / 2 + height / 5);
    CGContextAddQuadCurveToPoint(context, rect.size.width / 2, rect.size.height / 2 - height / 1.2, rect.size.width / 2 + width / 4, rect.size.height / 2 - height / 2 + height / 5);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, rect.size.width / 2 - width / 10, rect.size.height / 2);
    CGContextAddLineToPoint(context, rect.size.width / 2 + width / 10, rect.size.height / 2);
    CGContextStrokePath(context);
}

@end
