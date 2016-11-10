//
//  ContactData.h
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "BasicData.h"

@interface ContactLogData : BasicData <NSCoding>
@property NSDate* callStartTime;
@property NSInteger callDuration;
@end

