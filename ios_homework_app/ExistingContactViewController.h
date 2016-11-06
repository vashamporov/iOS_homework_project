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
@property (weak, nonatomic) IBOutlet UITextField *firstNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *lastNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberOutlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveEditButtonLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *ExistingContactTitle;
@property (strong, nonatomic) NSMutableArray* ContactArrRef;
@property (strong, nonatomic) ContactData* contact;
@property NSInteger index;
@property (weak, nonatomic) IBOutlet UIImageView *contactImageOutlet;
@property (weak, nonatomic) IBOutlet UIButton *editImageButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteContactButton;
@property BOOL editMode;
@end
