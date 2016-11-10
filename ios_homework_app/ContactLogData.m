//
//  ContactData.m
//  ios_homework_app
//
//  Created by Admin on 05/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "ContactLogData.h"

@implementation ContactLogData
@synthesize callStartTime;
@synthesize callDuration;


- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [encoder encodeObject:self.callStartTime forKey:@"callStartTime"];
    [encoder encodeInteger:self.callDuration forKey:@"callDuration"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self.firstName=[decoder decodeObjectForKey:@"firstName"];
    self.lastName=[decoder decodeObjectForKey:@"lastName"];
    self.phoneNumber=[decoder decodeObjectForKey:@"phoneNumber"];
    self.callStartTime=[decoder decodeObjectForKey:@"callStartTime"];
    self.callDuration=[decoder decodeIntegerForKey:@"callDuration"];
    return self;
}

@end
