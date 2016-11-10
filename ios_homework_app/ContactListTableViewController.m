//
//  ContListTableView.m
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "ContactData.h"
#import "ExistingContactViewController.h"
#import "AppDelegate.h"
@implementation ContactListTableViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize ContactDataArr;
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate* appDelegate=(AppDelegate*) [[UIApplication sharedApplication] delegate];
    if (!ContactDataArr) ContactDataArr=[appDelegate ContactDataArrBase];

}
- (void) viewWillAppear:(BOOL)animated
{
    [ContactDataArr sortUsingComparator:^NSComparisonResult(ContactData* a, ContactData* b)
     {
         NSString* first=[a lastName];
         NSString* second=[b lastName];
         return [first compare:second];
     }];
    [self.tableView reloadData];
}
-(void) newContactData:(ContactData *)contact
{
    [ContactDataArr addObject:contact];
    
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ContactDataArr count];
}
- (UITableViewCell*) tableView: (UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier: @"ContactCell"];
    UILabel *contactName=(UILabel*) [cell viewWithTag:101];
    NSString* text=nil;
    NSString* fname=[[ContactDataArr objectAtIndex:[indexPath row]] firstName];
    NSString* lname=[[ContactDataArr objectAtIndex:[indexPath row]] lastName];
    if (fname.length==0) text=lname;
    else if (lname.length==0) text=fname;
    else text=[NSString stringWithFormat:@"%@, %@", lname, fname];
    [contactName setText:text];
    UILabel *contactPhone=(UILabel*) [cell viewWithTag:200];
    [contactPhone setText:[[ContactDataArr objectAtIndex:[indexPath row]] phoneNumber]];
    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowContactDetailsSegue"])
    {
        NSIndexPath* indexPath=[self.tableView indexPathForSelectedRow];
        ExistingContactViewController* dest=segue.destinationViewController;
        dest.ContactArrRef=ContactDataArr;
        dest.index=indexPath.row;
    }
    if ([segue.identifier isEqualToString:@"NewContactSegue"])
    {
        NewContactViewController* dest=segue.destinationViewController;
        dest.delegate=self;
    }
}

- (IBAction)CallButtonPressed:(id)sender {
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    ContactLogData* CallContact=[ContactDataArr objectAtIndex:indexPath.row];
    
    AppDelegate* appDelegate=(AppDelegate*) [[UIApplication sharedApplication] delegate];
    [appDelegate outgoingCall:CallContact atController:self];
    
}


@end
