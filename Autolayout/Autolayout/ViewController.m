//
//  ViewController.m
//  Autolayout
//
//  Created by Diana Agapkina on 4/17/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewVerticalSpacingConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.containerView.translatesAutoresizingMaskIntoConstraints = false;
    //[self.containerView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.containerView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.containerView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.containerView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.containerView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        [self.viewVerticalSpacingConstraint setConstant:100];
    } else {
        [self.viewVerticalSpacingConstraint setConstant:0];
    }
}

@end
