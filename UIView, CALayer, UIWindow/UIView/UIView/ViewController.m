//
//  ViewController.m
//  UIView
//
//  Created by Diana Agapkina on 3/20/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"
#import "RSView.h"

@interface ViewController ()

@property (nonatomic, strong) RSView *blueView;
@property (nonatomic, strong) RSView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.blueView = [[RSView alloc]initWithFrame:CGRectMake(30.0, 150.0, 100.0, 100.0) andColor:[UIColor blueColor]];
    self.yellowView = [[RSView alloc]initWithFrame:CGRectMake(40.0, 200.0, 200.0, 200.0) andColor:[UIColor yellowColor]];
    
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.yellowView];
    
    [self.view bringSubviewToFront:self.blueView];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 20.0, 60.0, 60.0)];
//        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120.0, -60.0, 60.0, 60.0)];
    [button setTitle:@"Tap" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapHandle) forControlEvents:UIControlEventTouchUpInside];
    
    [self.blueView addSubview:button];
    
    NSLog(@"Frame: %@", NSStringFromCGRect(self.blueView.frame));
    NSLog(@"Bounds: %@", NSStringFromCGRect(self.blueView.bounds));
}

- (void)tapHandle {
    NSLog(@"Tap");
    
//    [UIView animateWithDuration:1.0 animations:^{
//        self.blueView.transform = CGAffineTransformRotate(self.blueView.transform, M_PI/6);
//    }];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.blueView.transform = CGAffineTransformRotate(self.blueView.transform, M_PI/6);
    } completion:^(BOOL finished) {
        NSLog(@"---Values after animation");
        NSLog(@"Frame: %@", NSStringFromCGRect(self.blueView.frame));
        NSLog(@"Bounds: %@", NSStringFromCGRect(self.blueView.bounds));
    }];
}


@end
