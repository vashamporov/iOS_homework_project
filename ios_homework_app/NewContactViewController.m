//
//  NewContactView.m
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "NewContactViewController.h"

@implementation NewContactViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize firstNameOutlet;
@synthesize lastNameOutlet;
@synthesize phoneNumberOutlet;
@synthesize delegate;

- (IBAction)pressedSaveButton:(UIBarButtonItem *)sender {
    ContactData* contact= [[ContactData alloc] init];
    contact.firstName=firstNameOutlet.text;
    contact.lastName=lastNameOutlet.text;
    contact.phoneNumber=phoneNumberOutlet.text;
    [delegate newContactData:contact];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    firstNameOutlet.text=nil;
    lastNameOutlet.text=nil;
    phoneNumberOutlet.text=nil;
    
}

@end
