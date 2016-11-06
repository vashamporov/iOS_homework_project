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
@synthesize contactImage;

- (IBAction)pressedSaveButton:(UIBarButtonItem *)sender {
    ContactData* contact= [[ContactData alloc] init];
    contact.firstName=firstNameOutlet.text;
    contact.lastName=lastNameOutlet.text;
    contact.phoneNumber=phoneNumberOutlet.text;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"photo_%@%@%@.png",contact.firstName, contact.lastName, contact.phoneNumber]];
    
    [UIImagePNGRepresentation(contactImage.image) writeToFile:filePath atomically:YES];
    
    contact.imagePath=filePath;
    
    [delegate newContactData:contact];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addImageButtonPressed:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.contactImage.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
