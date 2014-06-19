//
//  ATViewController.m
//  TPR_Tester
//
//  Created by Artem Tkachuk on 11.06.14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "ATViewController.h"
#import "ATTestViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ATViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) NSString *loginText;
@property (strong, nonatomic) NSString *passwordText;
@property (strong, nonatomic) NSString *emailText;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

- (IBAction)loginButtonClicked:(id)sender;

- (IBAction)registerButtonClicked:(id)sender;

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.loginTextField setDelegate:self];
    [self.passwordTextField setDelegate:self];
    [self.emailTextField setDelegate:self];
    
    [self.navigationItem setTitle:@"Welcome, guest!"];
    
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClicked:(id)sender
{
    if (self.loginTextField.text.length > 0 && self.passwordTextField.text.length > 0)
    {
        [self performSegueWithIdentifier:@"toTestView" sender:self];
    }
    else
    {
        UIAlertView *alertLogin = [[UIAlertView alloc] initWithTitle:@"Some of required fields are empty" message:@"Check your input data" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alertLogin show];
    }
}

- (IBAction)registerButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"toRgister" sender:self];
}

#pragma mark - text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnywhere:)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:self.loginTextField])
    {
        self.loginText = self.loginTextField.text;
    }
    if ([textField isEqual:self.passwordTextField])
    {
        self.passwordText = self.passwordTextField.text;
    }
    if ([textField isEqual:self.emailText])
    {
        self.emailText = self.emailTextField.text;
    }
}

- (void)tapAnywhere:(UIGestureRecognizer *)gesture
{
    [self.view removeGestureRecognizer:gesture];
    
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toTestView"])
    {
        ATTestViewController *destVC = [segue destinationViewController];
        
        [destVC setUserName:self.loginText];
    }
}

@end
