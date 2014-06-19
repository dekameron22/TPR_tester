//
//  ATRegistrationViewController.m
//  TPR_Tester
//
//  Created by Artem Tkachuk on 16.06.14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "ATRegistrationViewController.h"
#import "ATTestViewController.h"

@interface ATRegistrationViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *groupsSegmentControll;

- (IBAction)registrationButtonClicked:(id)sender;

@property (strong, nonatomic) NSString *nicknameText;
@property (strong, nonatomic) NSString *passwordText;
@property (strong, nonatomic) NSString *fullNameText;
@property (strong, nonatomic) NSString *selectedGroup;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation ATRegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem setTitle:@"Registration"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nickNameTextField setDelegate:self];
    [self.passwordTextField setDelegate:self];
    [self.fullNameTextField setDelegate:self];
    
    [self.groupsSegmentControll addTarget:self action:@selector(groupChanged:) forControlEvents:UIControlEventValueChanged];
    
}

-(void) groupChanged:(UISegmentedControl *)paramSender
{
    if ([paramSender isEqual:self.groupsSegmentControll])
    {
        NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
        self.selectedGroup = [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
    }

}

#pragma mark - text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnywhere:)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

- (void)tapAnywhere:(UIGestureRecognizer *)gesture
{
    [self.view removeGestureRecognizer:gesture];
    
    [self.nickNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.fullNameTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registrationButtonClicked:(id)sender
{
    if (self.nickNameTextField.text.length > 0 && self.passwordTextField.text.length > 0 && self.fullNameTextField.text.length > 0)
    {

        self.nicknameText = self.nickNameTextField.text;
        self.passwordText = self.passwordTextField.text;
        self.fullNameText = self.fullNameTextField.text;
        
        [self performSegueWithIdentifier:@"fromRegistration" sender:self];
    }
    else
    {
        UIAlertView *alertLogin = [[UIAlertView alloc] initWithTitle:@"Some of required fields are empty" message:@"Check your input data" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alertLogin show];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"fromRegistration"])
    {
        ATTestViewController *destVC = [segue destinationViewController];
        
        [destVC setUserName:self.nicknameText];
    }
}
@end
