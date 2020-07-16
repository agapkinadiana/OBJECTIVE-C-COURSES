#import "BalancedTree.h"
#import "Node.h"

@interface BalancedTree ()
@property (nonatomic, retain) Node *root;
@property (nonatomic, retain) NSMutableArray<Node *> *allNodes;
@end

@implementation BalancedTree

+ (instancetype)treeWithArray:(NSArray<NSNumber *> *)numbers {
    return [[[self alloc] initWihArray:numbers] autorelease];
}

- (instancetype)initWihArray:(NSArray<NSNumber *> *)numbers {
    self = [super init];
    if (self) {
        _allNodes = [[NSMutableArray arrayWithCapacity:numbers.count] retain];
        for (NSNumber *number in numbers) {
            [self addNumber:number];
        }
    }
    return self;
}

- (instancetype)init {
    return [self initWihArray:@[]];
}

- (void)dealloc {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, self);

    [_root release];
    _root = nil;

    [_allNodes release];
    _allNodes = nil;
    [super dealloc];
    [NSString stringWithFormat:@"%d", 1];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"BalancedTree with %lu nodes", (unsigned long)self.allNodes.count];
}

- (void)addNumber:(NSNumber *)number {
    Node *node = [Node nodeWithNumber:number];
    [self addNode:node];
    [self.allNodes addObject:node];
}

- (void)addNode:(Node *)node {
    if (self.root == nil) {
        self.root = node;
    } else if (self.root.left == nil) {
        self.root.left = node;
    } else if (self.root.right == nil) {
        self.root.right = node;
    } else {
        BOOL added = NO;
        NSArray<Node *> *children = self.root.children;

        while (added == NO) {
            added = [self addNode:node toChildren:children];
            if (added == NO) {
                NSMutableArray *newChildren = [NSMutableArray arrayWithCapacity:children.count*2];
                for (Node *child in children) {
                    [newChildren addObjectsFromArray:child.children];
                }
                children = newChildren;
            }
        }
    }
}

- (BOOL)addNode:(Node *)node toChildren:(NSArray<Node *> *)children {
    for (Node *enumeratedNode in children) {
        if (enumeratedNode.left == nil) {
            enumeratedNode.left = node;
            return YES;
        } else if (enumeratedNode.right == nil) {
            enumeratedNode.right = node;
            return YES;
        }
    }
    return NO;
}

- (NSUInteger)nodesCount {
    return self.allNodes.count;
}

- (NSUInteger)height {
    NSUInteger height = 0;
    NSUInteger count = [self nodesCount];
    while (pow(2, height) < count) {
        height += 1;
    }
    return height;
}

- (Node *)nodeAtIndex:(NSUInteger)index {
    if (index < self.allNodes.count) {
        return self.allNodes[index];
    } else {
        return nil;
    }
}

- (BOOL)isBST {
    return [self.root isBSTForMin:nil max:nil];
}

@end
