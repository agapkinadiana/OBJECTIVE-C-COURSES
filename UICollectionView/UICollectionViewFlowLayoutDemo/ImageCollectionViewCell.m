#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
    }
    return self;
}

- (void) setupImageView {
    self.imageView = [UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.imageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

@end
