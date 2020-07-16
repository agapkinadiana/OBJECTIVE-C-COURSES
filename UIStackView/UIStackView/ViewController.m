//
//  ViewController.m
//  UIStackView
//
//  Created by Diana Agapkina on 5/7/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)ButtonDidTap:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        [self.stackView.arrangedSubviews.firstObject setHidden:!self.stackView.arrangedSubviews.firstObject.isHidden];
    }];
}

@end
