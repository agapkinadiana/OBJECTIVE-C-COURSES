#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node: NSObject

+ (instancetype)nodeWithNumber:(NSNumber *)number;
- (instancetype)initWithNumber:(NSNumber *)number;

@property (nonatomic, retain) NSNumber *number;

@property (nonatomic, retain) Node *left;
@property (nonatomic, retain) Node *right;

- (NSArray<Node *> *)children;
- (BOOL)isFull;

- (BOOL)isBSTForMin:(nullable NSNumber *)min max:(nullable NSNumber *)max;

@end

NS_ASSUME_NONNULL_END
