//
//  IconViewController.m
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "IconViewController.h"
#import "IconView.h"
#import "ConfigurationViewController.h"

int const ICON_SIZE = 100;
int const BUTTON_WIDTH = 80;
int const BUTTON_HEIGHT = 20;

@interface IconViewController ()

@property (nonatomic, strong) IconView  *iconView;
@property (nonatomic, strong) UIButton *changeButton;
@property (nonatomic, strong) ConfigurationViewController *configurationVC;

@end

@implementation IconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupIconView];
    [self setupChangeButton];
}

- (void)setupIconView {
    self.iconView = [[IconView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - ICON_SIZE / 2, 150, ICON_SIZE, ICON_SIZE)];
    self.iconView.backgroundColor = UIColor.systemGray5Color;
    [self.view addSubview:self.iconView];
}

- (void)setupChangeButton {
    self.changeButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.iconView.frame) - BUTTON_WIDTH / 2, CGRectGetMaxY(self.iconView.frame) + 16, BUTTON_WIDTH, BUTTON_HEIGHT)];
    
    [self.changeButton setTitle:@"Change" forState:UIControlStateNormal];
    [self.changeButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [self.changeButton addTarget:self action:@selector(changeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.changeButton];
}

- (void)changeButtonDidTap:(UIButton *)button {
    if (self.configurationVC == nil) {
        [self showConfigurationViewController];
        [self.changeButton setTitle:@"Close" forState:UIControlStateNormal];
    } else {
        [self hideConfigurationViewController];
        [self.changeButton setTitle:@"Change" forState:UIControlStateNormal];
    }
}

- (void)showConfigurationViewController {
    self.configurationVC = [[ConfigurationViewController alloc] init];
    
    __weak typeof (self) weakSelf = self;
    
    self.configurationVC.buttonHandler = ^(ButtonType buttonType) {
        __strong typeof (self) strongSelf = weakSelf;
        IconViewType iconViewType;
        
        switch (buttonType) {
            case ButtonTypeCheckMark:
                iconViewType = IconViewTypeCheckMark;
                break;
            case ButtonTypeHeart:
                iconViewType = IconViewTypeHeart;
                break;
            case ButtonTypeWork:
                iconViewType = IconViewTypeWork;
                break;
            case ButtonTypeHome:
                iconViewType = IconViewTypeHome;
                break;
        }
        
        strongSelf.iconView.type = iconViewType;
    };
    
    [self addChildViewController:self.configurationVC];
    self.configurationVC.view.frame = CGRectMake(0, self.view.bounds.size.height / 3 * 2, self.view.bounds.size.width, self.view.bounds.size.height / 3);
    [self.view addSubview:self.configurationVC.view];
    [self.configurationVC didMoveToParentViewController:self];
}

- (void)hideConfigurationViewController {
    [self.configurationVC willMoveToParentViewController:nil];
    [self.configurationVC.view removeFromSuperview];
    [self.configurationVC removeFromParentViewController];
    
    self.configurationVC = nil;
}

@end
