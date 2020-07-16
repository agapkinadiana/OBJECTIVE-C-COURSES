#import "Node.h"

@implementation Node

+ (instancetype)nodeWithNumber:(NSNumber *)number {
    return [[[self alloc] initWithNumber:number] autorelease];
}

- (instancetype)initWithNumber:(NSNumber *)number {
    self = [super init];
    if (self) {
        _number = [number retain];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, self);

    [_number release];
    _number = nil;

    [_left release];
    _left = nil;
    [_right release];
    _right = nil;
    
    [super dealloc];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Node: (%d)", self.number.intValue];
}

- (NSArray<Node *> *)children {
    NSMutableArray<Node *> *result = [[@[] mutableCopy] autorelease];
    if (self.left != nil) {
        [result addObject:self.left];
    }

    if (self.right != nil) {
        [result addObject:self.right];
    }
    return [[result copy] autorelease];
}

- (BOOL)isFull {
    return (self.left != nil && self.right != nil);
}

- (BOOL)isBSTForMin:(nullable NSNumber *)min max:(nullable NSNumber *)max {
    if (self.left.number != nil && self.right.number != nil) {
        return [self.left isBSTForMin:min max:self.number] && [self.right isBSTForMin:self.number max:max];
    } else if (self.left.number != nil) {
        return [self.left isBSTForMin:min max:self.number];
    } else if (self.right.number != nil) {
        return [self.right isBSTForMin:self.number max:max];
    } else {
        if (min != nil && max != nil) {
            return (self.number.intValue > min.intValue && self.number.intValue < max.intValue);
        } else if (min != nil) {
            return self.number.intValue > min.intValue;
        } else if (max != nil) {
            return self.number.intValue < max.intValue;
        } else {
            return YES;
        }
    }
}

@end
