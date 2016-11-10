//
//  ContactData.m
//  ios_homework_app
//
//  Created by Admin on 06/11/2016.
//  Copyright © 2016 vashamporov. All rights reserved.
//

#import "ContactData.h"

@implementation ContactData

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [encoder encodeObject:self.imagePath forKey:@"imagePath"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self.firstName=[decoder decodeObjectForKey:@"firstName"];
    self.lastName=[decoder decodeObjectForKey:@"lastName"];
    self.phoneNumber=[decoder decodeObjectForKey:@"phoneNumber"];
    self.imagePath=[decoder decodeObjectForKey:@"imagePath"];
    return self;
}
@end
