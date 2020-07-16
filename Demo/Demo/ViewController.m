//
//  ViewController.m
//  Demo
//
//  Created by Diana Agapkina on 2/19/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SecondViewController method];
    // Do any additional setup after loading the view.
}

- (void)paintLabels {
    self.label1.textColor = [UIColor orangeColor];
    self.label2.textColor = [UIColor greenColor];
}

- (IBAction)sayHello:(UIButton *)button {
    [self paintLabels];
    
    [button setTitle:@"🐰🐰🐰" forState:UIControlStateNormal];
    [button sizeToFit];
    
    for (UILabel *label in self.labels) {
        label.text = self.textField.text;
        [label sizeToFit];
    }
}

@end
