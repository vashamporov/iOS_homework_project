//
//  ExistingContactView.h
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactData.h"

@interface ExistingContactViewController : UIViewController
//@property (weak, nonatomic) IBOutlet UITextField *firstNameOutlet;
//@property (weak, nonatomic) IBOutlet UITextField *lastNameOutlet;
//@property (weak, nonatomic) IBOutlet UITextField *phoneNumberOutlet;
@property (strong, nonatomic) ContactData* contact;
@property (weak, nonatomic) NSString* foo;
@end
