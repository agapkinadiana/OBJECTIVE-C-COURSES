//
//  NavigationDemoViewController.m
//  Container View Controllers
//
//  Created by Diana Agapkina on 4/16/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "NavigationDemoViewController.h"

@interface NavigationDemoViewController ()

@end

@implementation NavigationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setUpNavigationItems];
}

- (void)setUpNavigationItems {
    self.navigationItem.title = [NSString stringWithFormat:@"%lu", self.navigationController.viewControllers.count];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"arrow.right.circle.fill"] style:UIBarButtonItemStylePlain target:self action:@selector(nextTapped:)];
    
    UIBarButtonItem *backToRoot = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"xmark.circle.fill"] style:UIBarButtonItemStylePlain target:self action:@selector(backToRootTapped:)];
    
    self.navigationItem.rightBarButtonItems = @[next, backToRoot];
}

- (void)nextTapped:(id)sender {
    NavigationDemoViewController *viewController = [NavigationDemoViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)backToRootTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
