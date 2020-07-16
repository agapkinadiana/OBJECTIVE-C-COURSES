#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Node;

@interface BalancedTree: NSObject

+ (instancetype)treeWithArray:(NSArray<NSNumber *> *)numbers;
- (instancetype)initWihArray:(NSArray<NSNumber *> *)numbers NS_DESIGNATED_INITIALIZER;

- (void)addNumber:(NSNumber *)number;

- (NSUInteger)nodesCount;
- (NSUInteger)height;
- (Node *)nodeAtIndex:(NSUInteger)index;

- (BOOL)isBST;

@end

NS_ASSUME_NONNULL_END
