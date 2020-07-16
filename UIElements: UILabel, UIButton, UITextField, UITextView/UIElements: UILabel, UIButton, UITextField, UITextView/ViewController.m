//
//  ViewController.m
//  UIElements: UILabel, UIButton, UITextField, UITextView
//
//  Created by Diana Agapkina on 3/29/20.
//  Copyright © 2020 Diana Agapkina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saveButtonBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;


@end

// MARK: - Keyboard category
@interface ViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopConstraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //register for keyboard notifications
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];
    
    // setup textView
    self.commentTextView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.commentTextView.layer.borderWidth = 1.0;
    self.commentTextView.layer.cornerRadius = 5.0;
    self.commentTextView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    //button
    self.saveButton.backgroundColor = UIColor.blackColor;
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.saveButton.layer.cornerRadius = self.saveButton.frame.size.height / 2;
    
    //button actions
    [self.saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // text field
    UIImage * image = [UIImage imageNamed:@"user-90px"];
    UIImageView * imgView = [[UIImageView alloc] initWithImage:image];
    self.usernameTextField.leftView = imgView;
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameTextField.clipsToBounds = true;
    
    self.usernameTextField.delegate = self;
    self.commentTextView.delegate = self;
    
}

- (void)saveButtonTapped: (UIButton *)sender {
    NSString * text = self.usernameTextField.text;
    if (text.length >= 1) {
        self.usernameLabel.text = text;
    }
    NSLog(@"Save tapped");
}

// UITextField delegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [self.commentTextView becomeFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return ![text containsString:@"a"];
}

@end

// MARK: - Keyboard category

@implementation ViewController (KeyboardHandling)

- (void)subscribeOnKeyboardEvents {
    // keyboard will show
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // keyboard will hide
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    
    [self.view addGestureRecognizer:gesture];
}

- (void)hide {
    [self.view endEditing:true];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self updateTopConstraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [self updateTopConstraintWith:200.0 andBottom:0.0];
}

- (void)updateTopConstraintWith:(CGFloat)constant andBottom:(CGFloat)bottomConstant {
    self.topConstraint.constant = constant;
    self.saveButtonBottomConstraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
