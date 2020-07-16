//
//  RSViewController.m
//  LCViewController
//
//  Created by Diana Agapkina on 4/2/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "RSViewController.h"

@interface RSViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.button addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)ButtonAction:(id)sender {
    NSLog(@"Button1 Tap");
}

- (void)button2Action {
    NSLog(@"Button2 Tap");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
