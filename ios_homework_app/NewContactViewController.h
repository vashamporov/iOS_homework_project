//
//  NewContactView.h
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactData.h"

@protocol NewContactDelegate <NSObject>
@required
- (void) newContactData: (ContactData*) contact;
@end

@interface NewContactViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) id<NewContactDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *NewContactSaveButton;

@property (weak, nonatomic) IBOutlet UITextField *firstNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *lastNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *contactImageOutlet;


@end
