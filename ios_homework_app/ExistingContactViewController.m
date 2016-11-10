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
@synthesize ContactArrRef;
@synthesize index;
@synthesize contact;
@synthesize ExistingContactTitle;
@synthesize saveEditButtonLabel;
@synthesize editMode;
@synthesize editImageButton;
@synthesize deleteContactButton;
@synthesize contactImageOutlet;

- (IBAction)EditButtonPressed:(UIBarButtonItem *)sender {
    if (!editMode)
    {
        editMode=YES;
        saveEditButtonLabel.title=@"Save";
        firstNameOutlet.enabled=YES;
        lastNameOutlet.enabled=YES;
        phoneNumberOutlet.enabled=YES;
        editImageButton.hidden=NO;
        editImageButton.userInteractionEnabled=YES;
        deleteContactButton.hidden=NO;
        deleteContactButton.userInteractionEnabled=YES;
        
    }
    else if (editMode)
    {
        editMode=NO;
        saveEditButtonLabel.title=@"Edit";
        firstNameOutlet.enabled=NO;
        lastNameOutlet.enabled=NO;
        phoneNumberOutlet.enabled=NO;
        editImageButton.hidden=YES;
        editImageButton.userInteractionEnabled=NO;
        deleteContactButton.hidden=YES;
        deleteContactButton.userInteractionEnabled=NO;
        
        [self replaceImage:contactImageOutlet.image forContact:contact];
        contact.firstName=firstNameOutlet.text;
        contact.lastName=lastNameOutlet.text;
        contact.phoneNumber=phoneNumberOutlet.text;
        ExistingContactTitle.title=[NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
        
    }

}
- (IBAction)deleteContactButtonPressed:(UIButton *)sender {
    [self deleteImage:[[ContactArrRef objectAtIndex:index] imagePath]];
    [ContactArrRef removeObjectAtIndex:index];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)editImageButtonPressed:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.contactImageOutlet.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (BOOL) deleteImage:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success=NO;
    NSError* err;
    if ([fileManager fileExistsAtPath:path])
        success = [fileManager removeItemAtPath:path error:&err];
    return success;
}

- (BOOL) replaceImage: (UIImage*) image forContact: (ContactData*) cont
{
    BOOL success=[self deleteImage:cont.imagePath];
    
    if (success) cont.imagePath=nil;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"photo_%@%@%@.png",cont.firstName, cont.lastName, cont.phoneNumber]];
    
    success=success & [UIImagePNGRepresentation(image) writeToFile:cont.imagePath atomically:YES];
    
    if (success) cont.imagePath=filePath;
    return success;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    editMode=NO;
    contact=[ContactArrRef objectAtIndex:index];
    ExistingContactTitle.title=[NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    firstNameOutlet.text=contact.firstName;
    lastNameOutlet.text=contact.lastName;
    phoneNumberOutlet.text=contact.phoneNumber;
    firstNameOutlet.enabled=NO;
    lastNameOutlet.enabled=NO;
    phoneNumberOutlet.enabled=NO;
    contactImageOutlet.image=[UIImage imageWithContentsOfFile:contact.imagePath];
    
    
}
@end
