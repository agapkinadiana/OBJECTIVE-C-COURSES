//
//  ConfigurationViewController.m
//  Demo2
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "CircleButton.h"

int const BUTTON_COUNT = 4;
int const BUTTON_SPACING = 20;

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.systemGray6Color;
    
    [self setupButtons];
}

- (void)setupButtons {
    NSArray *colors = [[NSArray alloc] initWithObjects:UIColor.redColor, UIColor.orangeColor, UIColor.purpleColor, UIColor.blueColor, nil];
    NSArray *titles = [[NSArray alloc] initWithObjects:@"Heart", @"Home", @"Work", @"Mark", nil];
    
    CGFloat buttonSize = (self.view.bounds.size.width - BUTTON_SPACING * (BUTTON_COUNT + 1)) / BUTTON_COUNT;
    
    for (int i = 0; i < BUTTON_COUNT; i++) {
        CircleButton *button = [[CircleButton alloc] initWithFrame:CGRectMake(i * (BUTTON_SPACING + buttonSize) + BUTTON_SPACING, 95, buttonSize, buttonSize)];
        
        button.tag = i;
        button.backgroundColor = colors[i];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonDidTap: ) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.cornerRadius = button.bounds.size.width / 2;
        button.layer.masksToBounds = true;
        
        [self.view addSubview:button];
    }
}

- (void)buttonDidTap:(UIButton *)button {
    ButtonType buttonType;
    
    switch (button.tag) {
        case 0:
            buttonType = ButtonTypeHeart;
            break;
        case 1:
            buttonType = ButtonTypeHome;
            break;
        case 2:
            buttonType = ButtonTypeWork;
            break;
        case 3:
            buttonType = ButtonTypeCheckMark ;
            break;
        default:
            return;
    }
    
    self.buttonHandler(buttonType);
}

@end
