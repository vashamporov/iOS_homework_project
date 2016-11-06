//
//  ExistingContactView.m
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "ExistingContactViewController.h"


@implementation ExistingContactViewController
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
@synthesize contact;
@synthesize ExistingContactTitle;

- (void)viewDidLoad
{
    [super viewDidLoad];
    ExistingContactTitle.title=[NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    firstNameOutlet.text=contact.firstName;
    lastNameOutlet.text=contact.lastName;
    phoneNumberOutlet.text=contact.phoneNumber;
    firstNameOutlet.enabled=NO;
    lastNameOutlet.enabled=NO;
    phoneNumberOutlet.enabled=NO;
    
}
@end
