//
//  AppDelegate.h
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactLogData.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
-(void) logCall: (ContactLogData*) logEntry;
-(void) outgoingCall: (BasicData*) basicContact atController : (UIViewController*) viewController;
@property (strong, nonatomic) UIWindow *window;
@property (strong) NSMutableArray* CallLogArr;
@property (strong) NSMutableArray* ContactDataArrBase;


@end

