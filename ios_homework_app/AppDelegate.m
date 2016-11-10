//
//  AppDelegate.m
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactData.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize CallLogArr;
@synthesize ContactDataArrBase;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self loadData];
    return YES;
}


-(void) logCall: (ContactLogData*) logEntry;
{
    [CallLogArr insertObject:logEntry atIndex:0];
 
}

-(void) saveData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"Data.dat"];
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:CallLogArr forKey:@"CallLog"];
    [archiver encodeObject:ContactDataArrBase forKey:@"ContactDataArrBase"];
    [archiver finishEncoding];
    
    BOOL success=[data writeToFile:dataFilePath atomically:YES];
    
}

-(void) loadData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"Data.dat"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataFilePath])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:dataFilePath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        ContactDataArrBase = [unarchiver decodeObjectForKey:@"ContactDataArrBase"];
        CallLogArr = [unarchiver decodeObjectForKey:@"CallLogArr"];
        [unarchiver finishDecoding];
    }
    if (!CallLogArr) CallLogArr=[[NSMutableArray alloc] init];
    if (!ContactDataArrBase) ContactDataArrBase = [[NSMutableArray alloc] init];
    
}

-(void) outgoingCall: (BasicData*) basicContact atController : (UIViewController*) viewController
{
    ContactLogData* logEntry=[[ContactLogData alloc] init];
    logEntry.firstName=basicContact.firstName;
    logEntry.lastName=basicContact.lastName;
    logEntry.phoneNumber=basicContact.phoneNumber;
    logEntry.callStartTime=[[NSDate alloc] init];
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Outgoing Call"                                                                   message:[NSString stringWithFormat:@"Calling %@ %@...\n%@", basicContact.firstName, basicContact.lastName, basicContact.phoneNumber]                                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                    {
                                        logEntry.callDuration= - [logEntry.callStartTime timeIntervalSinceNow];
                                        [self logCall:logEntry];
                                        [viewController viewWillAppear:NO];
                                    }];
                                    
    [alert addAction:defaultAction];
    [viewController presentViewController:alert animated:YES completion:nil];
                                    
}
                                    


                                    
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [self saveData];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


@end
